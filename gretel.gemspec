GEM = "gretel"
VERSION = "0.4.2"
AUTHOR = "Jeremy Friesen"
EMAIL = "jeremyf@lightsky.com"
HOMEPAGE = "http://github.com/jeremyf/gretel"
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
  
  lib = ["lib/gretel/builder.rb", "lib/gretel/model_extractor.rb", "lib/gretel.rb"]
  bin = []
  test = []
  
  s.files =  lib + bin + test
  s.files += ['README', 'License.txt']
  s.test_files = test
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_dependency('rails', [">= 2.1.0"])
  s.add_dependency('rspec', [">= 1.1.4"])
  
end