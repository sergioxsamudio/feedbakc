Rails.application.routes.draw do
  devise_for :admins
  resources :feedbacks do
    collection do
      
      get :export_to_excel
    end
  end
authenticated :admin do
    root to: "feedbacks#index", as: :admin_root
  end
  
  root "feedbacks#new"
end