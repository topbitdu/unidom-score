# Score Sheet 是评分表。
# #template 是评分表模版。
# #scorer 是评分者。
# #score_keeper 是得分者。

class Unidom::Score::ScoreSheet < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_sheets'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,  allow_blank: true, length: { in: 2..columns_hash['name'].limit }
  validates :score, presence:    true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :template,     class_name:  'Unidom::Score::ScoreSheetTemplate', foreign_key: :score_sheet_template_id
  belongs_to :scorer,       polymorphic: true
  belongs_to :score_keeper, polymorphic: true

  has_many :items, class_name: 'Unidom::Score::ScoreItem'

  scope :template_is,   ->(template)     { where template_id:  to_id(template) }
  scope :scored_by,     ->(scorer)       { where scorer:       scorer          }
  scope :score_kept_by, ->(score_keeper) { where score_keeper: score_keeper    }

  def self.score!(scorer: nil, score_keeper: nil, template: nil, name: template.try(:name), score: 0, scored_on: Date.current, opened_at: Time.now, description: nil, instruction: nil)
    create! scorer: scorer, score_keeper: score_keeper, template: template, name: name, score: score, scored_on: scored_on, opened_at: opened_at, description: description, instruction: instruction
  end

end
