# Unidom Score Change Log 评分领域模型引擎变更日志

## v0.1
1. Score Sheet model & migration (20060111000000)

## v0.2
1. Score Item model & migration (20060112000000)
2. Improved the Score Sheet model to add the ``has_many :items, class_name: 'Unidom::Score::ScoreItem', foreign_key: :sheet_id`` macro
3. Improved the Score Sheet model to add the :template_is scope, the :scored_by scope, & the :score_kept_by scope

## v0.3
1. Score Sheet Template model & migration (20060101000000)
2. Improve the Score Sheet model to add the association to the Score Sheet Template

## v0.4
1. Score Item Template model & migration (20060102000000)
2. Improve the Score Item model to add the association to the Score Item Template model
3. Improve the Score Sheet Template model to add the association to the Score Item Template model

## v0.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1
