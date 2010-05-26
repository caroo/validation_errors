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
        options.symbolize_keys!
        attribute = [attribute].flatten
        errors = errors_for_path(object, attribute)
        error_messages = if !options[:translate_attribute].nil? && options[:translate_attribute] == false
          errors
        else
          errors.map do |error|
            "#{t(attribute.last, :scope => [:activerecord, :attributes, attribute.size == 1 ?  object.class.name.underscore : attribute[-2]])} #{error}"
          end
        end
        container_html_options = {
          :class => [options[:class], attribute.last].compact.join(" "),
        }
        container_html_options.merge!(:style => "display:none") if error_messages.blank?
        return error_container(container_html_options) do
          error_messages.map do |error_message|
            content_tag('li') do
              content_tag('label', {:class => 'error', :generated => true, :style => "display:block;", :for => ("#{object.class.name.underscore}_#{options[:for] ? options[:for] : attribute.join('_')}")}) do
                error_message
              end
            end
          end.to_s
        end
      end
      
      private
        # Generates an error container for error messages
        # The output of this method is <ul class="validation_error_messages"></ul>
        def error_container(options = {}, &block)
          class_attr = "#{(options[:class].nil? ? "" : options[:class])} validation_error_messages".strip
          content_tag("ul", options.merge({:class => class_attr}), &block)
        end
      
        def errors_for_path(object, path)
          errors = []
          path.each do |attr|
            if attr == path.last
              errors = object.errors.on(attr) || []
            else
              object = object.send(attr)
            end
          end
          errors
        end
      
    end
  end
end