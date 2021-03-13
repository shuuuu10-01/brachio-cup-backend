class User < ApplicationRecord
    has_many :subscriptions
    has_many :channels, through: :subscriptions
    has_many :watched_videos, through: :histories, class_name: 'Video'

    def update_subscribed_channels
        client = Youtube::Client.new(self.google_access_token)

        begin
            channels = client.get_subscribe_channels
            channels.each do |channel|
                puts channel
                channel_record = Channel.first_or_create(channel)
                channel_record.save
                subscription_record = self.subscriptions.first_or_create(user: self, channel_id: channel_record.id)
                subscription_record.save
            end
        rescue => e
            raise 'error occured at Channels updating'
            puts e
        end
    end
end
