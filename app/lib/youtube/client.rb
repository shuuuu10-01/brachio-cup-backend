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
            puts res_body
            if res_body['error'] != nil
                puts res_body['error']
                raise res_body['error']['message']
            else
                return res_body['items'].map do |item|
                    {
                        youtube_channel_id: item['snippet']['resourceId']['channelId'],
                        name: item['snippet']['title'],
                        avatar: item['snippet']['thumbnails']['default']['url']
                    }
                end
            end
        end

        def get_uploads_from_channel_id(channel_id)
            res = @connection.get 'search', {'Accept': 'application/json'} do |req|    
                req.params[:part] = 'snippet'
                req.params[:forContentOwner] = 'false'
                req.params[:channelId] = channel_id
                req.params[:type] = 'video'
                req.params[:videoEmbeddable] = 'true'
                req.params[:maxResults] = '50'
            end

            res_body = res.body
            if res_body[:error] != nil
                puts res_body[:error]
                raise res_body[:error]
            else
                return res_body['items']
            end
        end
    end
end