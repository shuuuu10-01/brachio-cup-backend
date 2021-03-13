class Uploaded < ApplicationRecord
  belongs_to :channel
  belongs_to :video
end
