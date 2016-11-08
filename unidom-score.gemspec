$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/score/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-score'
  spec.version     = Unidom::Score::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-score'
  spec.summary     = 'Unidom Score Domain Model Engine 评分领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Score domain model engine includes the Score Sheet, the Score Sheet Item, the Score Sheet Template, and the Score Sheet Template Item. Unidom (统一领域对象模型)是一系列的领域模型引擎。评分领域模型引擎包括评分表、评分项、评分表模版和评分项模版模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '>= 1.7'

end
