module TodoApi 
  class V1 < Grape::API
    version '1', using: 'path'
    format :json

    mount TodoApi::API
  end
end
