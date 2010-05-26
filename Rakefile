require 'rubygems' unless ENV['NO_RUBYGEMS']
%w[rake rake/clean fileutils hoe].each { |f| require f }
require File.dirname(__FILE__) + '/lib/validation_errors'

Hoe.plugin :newgem
Hoe.plugins.delete :rubyforge

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec('validation_errors') do
  developer('pkw.de dev team', 'dev@pkw.de')
  changes              = paragraphs_of("History.txt", 0..1).join("\n\n")
  post_install_message = 'PostInstall.txt' # TODO remove if post-install message not required
  p.extra_deps         = [
    ['activesupport','>= 2.3.5'],
    ['actionpack','>= 2.3.5'],
  ]
  extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]
  
  clean_globs |= %w[**/.DS_Store tmp *.log .rake_tasks~]
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# task :default => [:spec, :features]
