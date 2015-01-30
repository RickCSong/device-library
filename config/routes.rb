Rails.application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  root 'static#index'
  mount Sq::SSO::Engine => '/'

  resources :users, only: [:index, :show], constraints: FormatTest.new(:json)
  resources :categories, only: [:index, :show, :create, :update, :destroy], constraints: FormatTest.new(:json)
  resources :devices, only: [:index, :show, :create, :update, :destroy], constraints: FormatTest.new(:json) do
    collection do
      post 'checkout'
      post 'return'
    end
  end

  # This needs to be at the bottom.
  get '/*path' => 'static#index', constraints: FormatTest.new(:html)
  get '/' => 'static#index', constraints: FormatTest.new(:html)
end
