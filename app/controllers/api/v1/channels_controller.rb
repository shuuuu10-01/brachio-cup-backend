class Api::V1::ChannelsController < ApplicationController
    def index
        client = Youtube::Client.new(@current_user.google_access_token)
        @channels = client.get_subscribe_channels
        # puts client.get_uploads_from_channel_id(@channels[0]['snippet']['channelId'])
        render json: @channels
    end
end
