module Youtube
    class Client

        def initialize(access_token)
            @access_token ||= access_token
            @connection = Faraday::Connection.new(url: Youtube.api_base_url, headers: {
                'Authorization': "Bearer #{@access_token}"
            }) do |builder|
                builder.response :json
            end
        end
            
        def get_subscribe_channels
            res = @connection.get 'subscriptions', {'Accept': 'application/json'} do |req|    
                req.params[:part] = 'snippet'
                req.params[:mine] = 'true'
                req.params[:maxResults] = '50'
            end

            res_body = res.body
            if res_body[:error] != nil
                return nil
            else
                return res_body['items']
            end

        end
    end
end