class Channel < ApplicationRecord
    has_many :videos, through: :uploadeds
    validates :youtube_channel_id, uniqueness: true
end
