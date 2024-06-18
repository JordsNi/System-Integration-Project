Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/home", to: "lost#index"
  get "/all_records", to: "lost#all_records"

  get "/admin_login", to: "lost#admin_login"
  post "/admin_log", to: "lost#admin_log"

  get "/admin_dash", to: "lost#admin_dashboard"

  get "/item_reg", to: "lost#item_reg"
  post "/item", to: "lost#item"

  get "/view", to: "lost#view"
  get "/approve/:id", to: "lost#approve", as: :approve_record
  get "/claim", to: "lost#claim"
end
