module LouXewTey
  class Client   
    ####################################################################
    def initialize( api_key=nil,auth_key=nil )
      @api_key, @auth_key = api_key,auth_key
      connect( @api_key, @auth_key )
    end    
    ####################################################################
    def create_event( event={} )
      return "c'est fait"
    end
    ####################################################################    
    def get_list_of( args = {} )      
      return nil unless args[:resource]      
      resource = args[:resource].downcase
      format   = args[:format].nil? ? "xml" : args[:format].to_s
      type     = args[:type].nil? ? "" : "?type=#{args[:type].to_s}"
      type = "?genre=#{args[:resource]}" if args[:resource].downcase == "hotels"
      if %w(evenements hotels).include?( resource )
        RestClient.get("#{SERVEUR}/#{resource}.#{format}#{type}")do |response,request|
          return response.body if response.code.to_i == 200
        end
      end
      nil      
    end      
    ####################################################################
    private 
    def connect( api_key, auth_key )
      @client = {}
      return @client
    end
    ####################################################################
  end
end