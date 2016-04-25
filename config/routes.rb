Rails.application.routes.draw do

    devise_for :users
    root 'home#index', constraints: { subdomain: /.+|^/ }

    if Rails.env.development?
        mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

    scope '/fo', module: :front_office, as: 'fo' do
        resources :ideas
    end

end
