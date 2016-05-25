Rails.application.routes.draw do

    devise_for :users
    root 'home#index', constraints: { subdomain: /.+|^/ }

    if Rails.env.development?
        mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

    scope '/fo', module: :front_office, as: 'fo' do
        resources :ideas
    end

    resources :users do
        post 'follow',   to: 'socializations#follow'
        post 'unfollow', to: 'socializations#unfollow'
        post 'toggle_follow', to: 'socializations#toggle_follow'
    end

end
