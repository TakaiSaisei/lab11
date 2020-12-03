Rails.application.routes.draw do
  root 'logic#input'
  get 'logic/input'
  get 'logic/view'
  get 'logic/dbview'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
