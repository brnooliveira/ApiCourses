Rails.application.routes.draw do
  
  
  namespace :api do
    namespace :v1 do
      resources :course
      resources :user
      resources :test
      resources :courseenrollment
      resources :testresult
      resources :welcome
    end
  end
  
end
