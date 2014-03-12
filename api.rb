require 'grape'
require './models'

class API < Grape::API
  format :json

  rescue_from Mongoid::Errors::DocumentNotFound do |error|
    rack_response({"error" => {"message" => "We didn't find what we were looking for"}}.to_json, 404)
  end

  version :v1 do 
    namespace 'programmes' do 

      get '/' do 
	Programme.all
      end

      get '/:id' do 
	Programme.where(daad_id: params[:id])
      end

    end
  end
end
