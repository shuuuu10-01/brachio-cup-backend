class History < ApplicationRecord
  belongs_to :user_id
  belongs_to :video_id
end
