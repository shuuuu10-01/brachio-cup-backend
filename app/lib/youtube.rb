module Youtube
    @api_base_url = 'https://www.googleapis.com/youtube/v3'

    class << self
        attr_reader :api_base_url
    end
end