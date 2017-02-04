# Unidom Score 评分领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-score/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-score.svg)](https://badge.fury.io/rb/unidom-score)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-score.svg)](https://gemnasium.com/github.com/topbitdu/unidom-score)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Score domain model engine includes the Score Sheet, the Score Sheet Item, the Score Sheet Template, and the Score Sheet Template Item.
Unidom (统一领域对象模型)是一系列的领域模型引擎。评分领域模型引擎包括评分表、评分项、评分表模版和评分项模版模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-score'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200601.



## Call the Model

```ruby
company  = Unidom::Party::Company.create! name: 'Xerox'
sheet_template = Unidom::Score::ScoreSheetTemplate.create! subject: company, name: 'Survey 2003', score: 100

item_template_1 = Unidom::Score::ScoreItemTemplate.create! sheet: sheet_template, title: 'Q1: What is your name?', score: 60
item_template_2 = Unidom::Score::ScoreItemTemplate.create! sheet: sheet_template, title: 'Q2: How old are you?', score: 40

scorer       = Unidom::Party::Person.create! name: 'Tim'
score_keeper = Unidom::Party::Shop.create!   name: 'WalMart'
score_sheet  = Unidom::Score::ScoreSheet.score! scorer: scorer, score_keeper: score_keeper, template: sheet_template, name: nil, score: 98, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil
# The template could be nil

item_1 = Unidom::Score::ScoreItem.score! sheet: score_sheet, scorer: score_sheet.try(:scorer), template: item_template_1, title: item_template_1.try(:title), score: 59, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil
item_2 = Unidom::Score::ScoreItem.score! sheet: score_sheet, scorer: score_sheet.try(:scorer), template: item_template_2, title: item_template_2.try(:title), score: 39, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil
# The template could be nil
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Score
  }

end
```



## RSpec examples

```ruby
# spec/models/unidom_spec.rb
require 'unidom/score/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/score/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/score/validators_rspec'
```
