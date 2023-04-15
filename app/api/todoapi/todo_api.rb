module TodoApi
  class API < Grape::API
    version '1', using: :path
    format :json

    namespace :tasks do
      desc 'Get all tasks'
      get do
        Task.all
      end

      desc 'Get task by id'
      params do
        requires :id, type: Integer, desc: 'Task Id'
      end
      route_param :id do
        get do
         task = Task.find(params[:id])
         http_not_found unless task
        end
      end
    end
  end

  class V1 < Grape::API
    version '1', using: :path
    format :json

    mount TodoApi::API
  end
end
