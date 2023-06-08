module Restful
  module Jsonapi
    class Railtie < Rails::Railtie
      initializer "restful-jsonapi.action_controller" do
        ActiveSupport.on_load(:action_controller) do
          include Restful::Jsonapi::RestifyParam
          include Restful::Jsonapi::SerializableErrors
        end
      end

      initializer "restful-jsonapi.active_model_serializer" do
        ActiveModel::Serializers.class_eval do
          include Restful::Jsonapi::ActiveModelSerializer
        end
      end if defined? ActiveModel::Serializer
    end
  end
end
