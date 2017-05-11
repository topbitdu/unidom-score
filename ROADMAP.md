# Unidom Score Roadmap 评分领域模型引擎路线图

## v0.1
1. Score Sheet model & migration (20060111000000)

## v0.2
1. Score Item model & migration (20060112000000)
2. Improve the Score Sheet model to add the ``has_many :items, class_name: 'Unidom::Score::ScoreItem', foreign_key: :sheet_id`` macro
3. Improve the Score Sheet model to add the ``template_is`` scope, the ``scored_by`` scope, & the ``score_kept_by`` scope

## v0.3
1. Score Sheet Template model & migration (20060101000000)
2. Improve the Score Sheet model to add the association to the Score Sheet Template

## v0.4
1. Score Item Template model & migration (20060102000000)
2. Improve the Score Item model to add the association to the Score Item Template model
3. Improve the Score Sheet Template model to add the association to the Score Item Template model

## v0.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v1.0
1. Improve the Score Sheet Template model & migration to rename the #``total_score`` attribute to the #``score`` attribute
2. Improve the Score Sheet Template model for the validation of the #``score`` attribute could be negative
3. Improve the Score Item Template model for the validation of the #``score`` attribute could be negative
4. Improve the Score Sheet model for the validation of the #``score`` attribute could be negative
5. Improve the Score Item model for the validation of the #``score`` attribute could be negative

## v1.0.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension

## v1.0.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v1.1
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.1.1
1. Improve the Score Sheet spec for the validations on the #name attribute, & the #score attribute
2. Improve the Score Item spec for the validations on the #title attribute, & the #score attribute

## v1.1.2
1. Improve the Score Item Template spec for the ``belongs_to :sheet, class_name: 'Unidom::Score::ScoreSheetTemplate'`` macro
2. Improve the Score Item spec for the ``belongs_to :sheet, class_name: 'Unidom::Score::ScoreSheet', foreign_key: :sheet_id`` macro

## v1.1.3
1. Improve the Score Item spec for the ``belongs_to :template, class_name: 'Unidom::Score::ScoreItemTemplate', foreign_key: :template_id`` macro
2. Improve the Score Sheet spec for the ``belongs_to :template, class_name: 'Unidom::Score::ScoreSheetTemplate', foreign_key: :template_id`` macro

## v1.1.4
1. Improve the Score Item spec for the validations on the #title attribute
2. Improve the Score Item Template spec for the validations on the #title attribute

## v1.1.5
1. Improve the Score Sheet spec for the validations on the #name attribute, & the #score attribute
2. Improve the Score Sheet Template spec for the validations on the #name attribute, & the #score attribute

## v1.1.6
1. Improve the Score Item spec for the validations on the #score attribute
2. Improve the Score Item Template spec for the validations on the #score attribute

## v1.1.7
1. Improve the Score Item spec for the sheet_is scope
2. Improve the Score Item Template spec for the sheet_is scope

## v1.1.8
1. Improve the Ruby Gem Specification to depend on unidom-common v1.10
2. Improve the Score Sheet Template migration, the Score Item Template migration, the Score Sheet migration, & the Score Item migration for the #opened_at column, & the #closed_at column
