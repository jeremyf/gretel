GEM = "rails-breadcrumb-trail"
VERSION = "0.4.0"
AUTHOR = "Jeremy Friesen"
EMAIL = "jeremyf@lightsky.com"
HOMEPAGE = "http://github.com/jeremyf/rails-breadcrumb-trail"
SUMMARY = "A rather simple gem for generating breadcrumbs"

GEM_SPECIFICATION = Gem::Specification.new do |s|
  s.name = GEM
  s.version = VERSION
  s.date = "2008-09-15"
  s.summary = SUMMARY
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.description = %(A rather simple gem for generating breadcrumbs in a Rails project)
  s.has_rdoc = true
  s.authors = [AUTHOR]
  
  lib = ["lib/rails_breadcrumb_trail/builder.rb", "lib/rails_breadcrumb_trail/model_extractor.rb", "lib/rails_breadcrumb_trail.rb"]
  bin = []
  test = ["test/test_harvixture_active_record_extension.rb", "test/test_harvixture_model.rb", "test/test_helper.rb"]
  
  s.files =  lib + bin + test
  s.files += ['README', 'License.txt']
  s.test_files = test
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_dependency('rails', [">= 2.1.0"])
end