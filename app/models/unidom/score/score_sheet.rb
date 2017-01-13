##
# Score Sheet 是评分表。
# #template 是评分表模版。
# #scorer 是评分者。
# #score_keeper 是得分者。
# #items 是评分项。

class Unidom::Score::ScoreSheet < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_sheets'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,  allow_blank: true, length: { in: 2..columns_hash['name'].limit }
  validates :score, presence:    true, numericality: { greater_than_or_equal_to: -1_000_000_000, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :template,     class_name:  'Unidom::Score::ScoreSheetTemplate', foreign_key: :template_id
  belongs_to :scorer,       polymorphic: true
  belongs_to :score_keeper, polymorphic: true

  has_many :items, class_name: 'Unidom::Score::ScoreItem', foreign_key: :sheet_id

  scope :template_is,   ->(template)     { where template_id:  to_id(template) }
  scope :scored_by,     ->(scorer)       { where scorer:       scorer          }
  scope :score_kept_by, ->(score_keeper) { where score_keeper: score_keeper    }

  ##
  # 评分员 scorer 以 template 为模版（可以为空），对得分者 score_keeper 评分。评分表的名称为 name ，缺省为模版的名称。
  # 得分为 score ，缺省为 0 。得分日期为 scored_on ，缺省为当天。记录时间为 opened_at ，缺省为当前时间。
  # 另有适用于己方的备注 description 和适用于对方的备注 instruction。如：
  # Unidom::Score::ScoreSheet.score! scorer: officer, score_keeper: shop, template: score_sheet_template, score: 100
  def self.score!(scorer: nil, score_keeper: nil, template: nil, name: template.try(:name), score: 0, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil)
    create! scorer: scorer, score_keeper: score_keeper, template: template, name: name, score: score, scored_on: scored_on, opened_at: opened_at, description: description, instruction: instruction
  end

end
