# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{arid_cache}
  s.version = "1.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karl Varga"]
  s.date = %q{2011-04-14}
  s.description = %q{AridCache makes caching easy and effective.  AridCache supports caching on all your model named scopes, class methods and instance methods right out of the box.  AridCache prevents caching logic from cluttering your models and clarifies your logic by making explicit calls to cached result sets.
AridCache is designed for handling large, expensive ActiveRecord collections but is equally useful for caching anything else as well.
}
  s.email = %q{kjvarga@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "arid_cache.gemspec",
     "init.rb",
     "lib/arid_cache.rb",
     "lib/arid_cache/active_record.rb",
     "lib/arid_cache/cache_proxy.rb",
     "lib/arid_cache/cache_proxy/options.rb",
     "lib/arid_cache/cache_proxy/result_processor.rb",
     "lib/arid_cache/cache_proxy/utilities.rb",
     "lib/arid_cache/helpers.rb",
     "lib/arid_cache/inflector.rb",
     "lib/arid_cache/inflector/inflections.rb",
     "lib/arid_cache/railtie.rb",
     "lib/arid_cache/store.rb",
     "rails/init.rb",
     "spec/arid_cache/active_record_spec.rb",
     "spec/arid_cache/arid_cache_spec.rb",
     "spec/arid_cache/cache_proxy/cached_result_spec.rb",
     "spec/arid_cache/cache_proxy/options_spec.rb",
     "spec/arid_cache/cache_proxy/result_processor_spec.rb",
     "spec/arid_cache/cache_proxy/utilities_spec.rb",
     "spec/arid_cache/cache_proxy_spec.rb",
     "spec/arid_cache/helpers_spec.rb",
     "spec/arid_cache/store_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/support/ar_query.rb",
     "spec/support/custom_methods.rb",
     "spec/support/matchers.rb",
     "test/arid_cache_test.rb",
     "test/console",
     "test/lib/add_query_counting_to_active_record.rb",
     "test/lib/blueprint.rb",
     "test/lib/db_prepare.rb",
     "test/lib/fix_active_support_file_store_expires_in.rb",
     "test/lib/mock_rails.rb",
     "test/lib/models/company.rb",
     "test/lib/models/empty_user_relation.rb",
     "test/lib/models/user.rb",
     "test/log/.gitignore",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/kjvarga/arid_cache}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Automates efficient caching of your ActiveRecord collections, gives you counts for free and supports pagination.}
  s.test_files = [
    "spec/arid_cache/active_record_spec.rb",
     "spec/arid_cache/arid_cache_spec.rb",
     "spec/arid_cache/cache_proxy/cached_result_spec.rb",
     "spec/arid_cache/cache_proxy/options_spec.rb",
     "spec/arid_cache/cache_proxy/result_processor_spec.rb",
     "spec/arid_cache/cache_proxy/utilities_spec.rb",
     "spec/arid_cache/cache_proxy_spec.rb",
     "spec/arid_cache/helpers_spec.rb",
     "spec/arid_cache/store_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/ar_query.rb",
     "spec/support/custom_methods.rb",
     "spec/support/matchers.rb",
     "test/arid_cache_test.rb",
     "test/lib/add_query_counting_to_active_record.rb",
     "test/lib/blueprint.rb",
     "test/lib/db_prepare.rb",
     "test/lib/fix_active_support_file_store_expires_in.rb",
     "test/lib/mock_rails.rb",
     "test/lib/models/company.rb",
     "test/lib/models/empty_user_relation.rb",
     "test/lib/models/user.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
      s.add_development_dependency(%q<will_paginate>, [">= 0"])
      s.add_development_dependency(%q<faker>, [">= 0"])
      s.add_development_dependency(%q<machinist>, [">= 0"])
    else
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<faker>, [">= 0"])
      s.add_dependency(%q<machinist>, [">= 0"])
    end
  else
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<faker>, [">= 0"])
    s.add_dependency(%q<machinist>, [">= 0"])
  end
end

