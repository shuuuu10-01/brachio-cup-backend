Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get "user/index" => "users#index"
      post "user/create" => "users#create"
    end
  end
end
