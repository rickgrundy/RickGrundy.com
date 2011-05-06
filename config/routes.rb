RickGrundy::Application.routes.draw do  
  root :to => 'albums#index'
  
  match 'photo/:id/:camelized_title' => 'photos#show', :as => 'photo'
  match ':name' => 'albums#show_by_name'
end