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
    def get_list_of( resource="", format="xml" )
      if %w(evenements hotels).include?( resource )
        RestClient.get("#{SERVEUR}/#{resource}.#{format}")do |response,request|
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