class Api::V1::ChannelsController < ApplicationController
    def index
        # client = Youtube::Client.new(@current_user.google_access_token)
        # @channels = client.get_subscribe_channels
        # puts client.get_uploads_from_channel_id(@channels[0]['snippet']['channelId'])
        begin
            @current_user.update_subscribed_channels
            render json: @current_user.channels
        rescue => e
            render json: e, status: 500
        end
    end
end
