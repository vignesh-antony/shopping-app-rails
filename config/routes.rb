Rails.application.routes.draw do
    root to: "main#index"

    defaults format: :json do
        resources :customer, except: %i[new edit]
        resources :product, except: %i[new edit]
    end
end
