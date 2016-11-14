# Score Item 是评分项。
# #sheet 是评分表。
# #template 是评分项模版。
# #scorer 是评分者。

class Unidom::Score::ScoreItem < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_items'

  include Unidom::Common::Concerns::ModelExtension

  validates :title, allow_blank: true, length: { in: 2..columns_hash['title'].limit }
  validates :score, presence:    true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :sheet,    class_name:  'Unidom::Score::ScoreSheet',        foreign_key: :sheet_id
  belongs_to :template, class_name:  'Unidom::Score::ScoreItemTemplate', foreign_key: :template_id
  belongs_to :scorer,   polymorphic: true

  scope :sheet_is,    ->(sheet)    { where sheet_id:    to_id(sheet)    }
  scope :template_is, ->(template) { where template_id: to_id(template) }
  scope :scored_by,   ->(scorer)   { where scorer:      scorer          }

  def self.score!(sheet: nil, scorer: sheet.try(:scorer), template: nil, title: template.try(:title), score: 0, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil)
    create! sheet: sheet, scorer: scorer, template: template, title: title, score: score, scored_on: scored_on, opened_at: opened_at, description: description, instruction: instruction
  end

end
