Firebase::Auth::IDTokenKeeper.configure do |config|
    config.firebase_project_id = ENV.fetch('PROJECT_ID')
end