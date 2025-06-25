Rails.application.routes.draw do
  scope :api do
    # broadcasters
    resources :broadcasters, only: %i[index create]

    # clips
    resources :clips, only: %i[show update]
  end
end
