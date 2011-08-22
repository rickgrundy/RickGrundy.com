RickGrundy::Application.routes.draw do  
  root :to => 'albums#index'  
  
  resource :import
  
  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
  
  match 'photo/:id/:camelized_title' => 'photos#show', :as => 'photo'
  match ':name' => 'albums#show_by_name'
end