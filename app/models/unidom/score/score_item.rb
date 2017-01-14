##
# Score Item 是评分项。
# #sheet 是评分表。
# #template 是评分项模版。
# #scorer 是评分者。

class Unidom::Score::ScoreItem < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :title, allow_blank: true, length: { in: 2..columns_hash['title'].limit }
  validates :score, presence:    true, numericality: { greater_than_or_equal_to: -1_000_000_000, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :sheet,    class_name:  'Unidom::Score::ScoreSheet',        foreign_key: :sheet_id
  belongs_to :template, class_name:  'Unidom::Score::ScoreItemTemplate', foreign_key: :template_id
  belongs_to :scorer,   polymorphic: true

  scope :sheet_is,    ->(sheet)    { where sheet_id:    to_id(sheet)    }
  scope :template_is, ->(template) { where template_id: to_id(template) }
  scope :scored_by,   ->(scorer)   { where scorer:      scorer          }

  ##
  # 评分员 scorer (缺省为评分表的评分员) 以 template 为模版（可以为空）在评分表 sheet 上评分。评分项的标题为 title ，缺省为评分项模版的标题。
  # 得分为 score ，缺省为 0 。得分日期为 scored_on ，缺省为当天。记录时间为 opened_at ，缺省为当前时间。
  # 另有适用于己方的备注 description 和适用于对方的备注 instruction。如：
  # Unidom::Score::ScoreItem.score! sheet: score_sheet, template: score_item_template, score: 20
  def self.score!(sheet: nil, scorer: sheet.try(:scorer), template: nil, title: template.try(:title), score: 0, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil)
    create! sheet: sheet, scorer: scorer, template: template, title: title, score: score, scored_on: scored_on, opened_at: opened_at, description: description, instruction: instruction
  end

end
