module ValidationErrors
  module Helpers
    module ValidationErrorsHelper
      
      # Generates an error message for a attribute.
      # Nested attributes are also supported
      # parameter:
      #   object => object to collect the error messages from
      #   attribute => attribute to be checked for error messages. Arrays are also supported i.e. [:address, :email]
      #   options:
      #     * :translate_attribute => should we translate the message or is it already translated
      #     * :for => 'for'-label attribute appendix
      
      def error_message_for_attribute(object, attribute, options = {})
        return "" if object.blank?
        attribute = [attribute].flatten
        error = error_for_path(object, attribute)
        if error.blank?
          return ""
        else
          error_message = if !options[:translate_attribute].nil? && options[:translate_attribute] == false
            error
          else
            "#{t(attribute.last, :scope => [:activerecord, :attributes, attribute.size == 1 ?  object.class.name.underscore : attribute[-2]])} #{error}"
          end

          return content_tag('li') do
            content_tag('label', :class => 'error', :generated => true, :style => "display:block;", :for => "#{object.class.name.underscore}_#{options[:for] ? options[:for] : attribute.join('_')}") do
              error_message
            end
          end
        end
      end
      
      # Generates an error container for error messages
      # The output of this method is <ul class="validation_error_messages"></ul>
      def error_container(options = {}, &block)
        class_attr = "#{(options[:class].nil? ? "" : options[:class])} validation_error_messages".strip
        content_tag("ul", options.merge({:class => class_attr}), &block)
      end
      
      def error_for_path(object, path)
        error = nil
        last_attribute = nil
        path.each do |attr|
          if attr == path.last
            error = object.errors[attr]
            last_attribute = attr
          else
            object = object.send(attr)
          end
        end
        error
      end
      private :error_for_path
      
    end
  end
end