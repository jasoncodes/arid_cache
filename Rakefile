require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "arid_cache"
    gem.summary = %Q{Automates efficient caching of your ActiveRecord collections, gives you counts for free and supports pagination.}
    gem.description = <<-END.gsub(/^\s+/, '')
      ARID Cache makes caching easy and effective.  ARID cache supports caching on all your model named scopes, class methods and instance methods right out of the box.  ARID cache prevents caching logic from cluttering your models and clarifies your logic by making explicit calls to cached result sets.
      
      ARID Cache is designed for handling large, expensive ActiveRecord collections but is equally useful for caching anything else as well.
    END
    gem.email = "kjvarga@gmail.com"
    gem.homepage = "http://github.com/kjvarga/arid_cache"
    gem.authors = ["Karl Varga"]
    gem.add_dependency "will_paginate"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "will_paginate"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "arid_cache #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
