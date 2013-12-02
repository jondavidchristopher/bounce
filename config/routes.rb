Bounce::Application.routes.draw do

  # Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

end
