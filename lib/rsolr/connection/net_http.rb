require 'net/http'
require 'hmac-sha1'

#
# Connection for standard HTTP Solr server
#
class RSolr::Connection::NetHttp
  
  include RSolr::Connection::Requestable
  
  def connection
    @connection ||= Net::HTTP.new(@uri.host, @uri.port)
  end
  
  def get path, params={}
    url = self.build_url path, params
    net_http_response = self.connection.get url
    create_http_context net_http_response, url, path, params
  end
  
  def post path, data, params={}, headers={}
    add_signature("POST", path, params)
    
    url = self.build_url path, params
    net_http_response = self.connection.post url, data, headers
    create_http_context net_http_response, url, path, params, data, headers
  end
  
  def create_http_context net_http_response, url, path, params, data=nil, headers={}
    full_url = "#{@uri.scheme}://#{@uri.host}"
    full_url += @uri.port ? ":#{@uri.port}" : ''
    full_url += url
    {
      :status_code=>net_http_response.code.to_i,
      :url=>full_url,
      :body=> encode_utf8(net_http_response.body),
      :path=>path,
      :params=>params,
      :data=>data,
      :headers=>headers,
      :message => net_http_response.message
    }
  end
  
  # accepts a path/string and optional hash of query params
  def build_url path, params={}
    full_path = @uri.path + path
    super full_path, params, @uri.query
  end
  
  def normalize_params(params)
    return_string = ""
    params.keys.sort{|x,y| x.to_s <=> y.to_s}.each do |k|
      v = params[k]
      if v.class == Array
        v.sort.each {|v| return_string.concat("#{k.to_s}=#{v}&")}
      else
        return_string.concat("#{k.to_s}=#{v}&")
      end 
    end
    if !return_string.blank?
      return_string.chop!
    end
    return_string
  end
  
  def create_base_string(method, path, params)
    url = "#{@uri.scheme}://#{@uri.host}"
    port = @uri.port.to_s
    if !port.blank?
      if port != "80"
        url += ":#{port}"
      end
    end  
    url += @uri.path + path
    signature_base = method.upcase
    signature_base.concat("&")
    signature_base.concat(CGI::escape(url))
    signature_base.concat("&")
    signature_base.concat(CGI::escape(normalize_params(params)))
  end
  
  def create_signature(base_string, consumer_secret, token_secret="")
    secret = "#{escape(consumer_secret)}&#{escape(token_secret)}" 
    Base64.encode64(HMAC::SHA1.digest(secret, base_string)).chomp.gsub(/\n/,'') 
  end  
  
  def escape(value)
    CGI.escape(value.to_s).gsub("%7E", '~').gsub("+", "%20")
  end
  
  def add_signature(http_method, path, params) 
    base_string = create_base_string(http_method, path, params)
    signature = create_signature(base_string, ENV["oauth_secret"])
    params.merge!("oauth_signature" => signature)
  end
  
end