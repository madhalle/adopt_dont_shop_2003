Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "shelters#index"
  get "/pets", to: "pets#index"
  delete "/pets/:id", to: "pets#destroy"
  get "/pets/:id", to: "pets#show"
  patch "/pets/:id", to: "pets#update"
  get "/pets/:id/edit", to: "pets#edit"

  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: "shelters#update"
  delete "/shelters/:id", to: "shelters#destroy"

  get "/shelters/:id/pets", to: "shelter_pets#index"
  get "/shelters/:id/pets/new", to: "shelter_pets#new"

  post "/shelters/:id/pets", to: "shelter_pets#create"
end
