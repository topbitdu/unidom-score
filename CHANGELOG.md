# Unidom Score Change Log 评分领域模型引擎变更日志

## v0.1
1. Score Sheet model & migration (20060111000000)

## v0.2
1. Score Item model & migration (20060112000000)
2. Improved the Score Sheet model to add the ``has_many :items, class_name: 'Unidom::Score::ScoreItem', foreign_key: :sheet_id`` macro
3. Improved the Score Sheet model to add the :template_is scope, the :scored_by scope, & the :score_kept_by scope

## v0.3
1. Score Sheet Template model & migration (20060101000000)
2. Improved the Score Sheet model to add the association to the Score Sheet Template

## v0.4
1. Score Item Template model & migration (20060102000000)
2. Improved the Score Item model to add the association to the Score Item Template model
3. Improved the Score Sheet Template model to add the association to the Score Item Template model

## v0.4.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.0
1. Improved the Score Sheet Template model & migration to rename the #``total_score`` attribute to the #``score`` attribute
2. Improved the Score Sheet Template model for the validation of the #``score`` attribute could be negative
3. Improved the Score Item Template model for the validation of the #score attribute could be negative
4. Improved the Score Sheet model for the validation of the #score attribute could be negative
5. Improved the Score Item model for the validation of the #score attribute could be negative

## v1.0.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension

## v1.0.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.1
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest
