Rails.application.routes.draw do
  devise_for :admins
  resources :feedbacks do
    collection do
      # Esta línea es opcional si ya manejas la exportación con format: :xlsx
      get :export_to_excel
    end
  end

  # ¡Esta es la línea que necesitas!
  root "feedbacks#new"
end