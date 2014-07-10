Rails.application.routes.draw do
  require "monban/constraints/signed_in"
  require "monban/constraints/signed_out"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]



  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
    resources :greetings, only: [:create]
  end

  constraints Monban::Constraints::SignedOut.new do
    root "landings#show"
  end

end
