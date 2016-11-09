# Unidom Score 评分领域模型引擎

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
scorer       = Unidom::Party::Person.create! name: 'Tim'
score_keeper = Unidom::Party::Shop.create!   name: 'WalMart'
score_sheet  = Unidom::Score::ScoreSheet.score! scorer: scorer, score_keeper: score_keeper, template: nil, name: nil, score: 98, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil
```
