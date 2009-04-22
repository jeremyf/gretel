module Gretel
  module ModelExtractor  
    def self.extract_from_path(path)
      return nil unless path.split('?')[0].match(/\/\d+$/) # There is no singular object at this location
      return nil unless options = ActionController::Routing::Routes.recognize_path(path, :method => :get)

      model_name = begin
        options[:controller].split('/').last.singularize.camelize.constantize
      rescue 
        return nil unless controller = extract_controller_class_from(options)
        return nil unless controller.respond_to?(:model_name)
        controller.model_name
      end
      model_name.find_by_id(options[:id])
    rescue ActionController::RoutingError, ActiveRecord::RecordNotFound => e
      return nil
    end

    protected
      def self.extract_controller_class_from(options)
        "#{options[:controller].camelize}Controller".constantize
      rescue
        nil
      end
  end
end