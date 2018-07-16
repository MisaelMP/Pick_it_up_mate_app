# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        pages#home
#                   contact GET    /contact(.:format)                                                                       pages#contact
#                       faq GET    /faq(.:format)                                                                           pages#faq
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                     items POST   /items(.:format)                                                                         items#create
#                  new_item GET    /items/new(.:format)                                                                     items#new
#                     login GET    /login(.:format)                                                                         session#new
#                           POST   /login(.:format)                                                                         session#create
#                           DELETE /login(.:format)                                                                         session#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/contact' => 'pages#contact'
  get '/faq' => 'pages#faq'
  resources :users, :only => [:new, :create, :index, :edit]
  resources :items, :only => [:new, :create, :post]
  get '/login' => 'session#new' # login form
  post '/login' => 'session#create' # perform a login
  delete '/login' => 'session#destroy' # perform a log out
end
