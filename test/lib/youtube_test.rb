require 'test_helper'

class YoutubeTest < ActionDispatch::IntegrationTest
    def setup
        ENV['TEST_YOUTUBE_ACCESS_TOKEN']
    end
end