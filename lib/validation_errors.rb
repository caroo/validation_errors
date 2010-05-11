$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
File.join(File.dirname(__FILE__), *%w[.. validation_errors helpers validation_error_helper])

module ValidationErrors
  VERSION = '0.1.1'
end