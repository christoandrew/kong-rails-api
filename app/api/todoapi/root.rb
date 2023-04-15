module TodoApi
  class Root < Grape::API
    mount TodoApi::V1
  end
end
