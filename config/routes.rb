Homeland::Note::Engine.routes.draw do
  resources :notes do
    collection do
      post :preview
    end
  end
end
