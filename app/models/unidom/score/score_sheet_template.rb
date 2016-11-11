# Score Sheet Tempalte 是评分表模版。
# #template 是评分表模版。
# #scorer 是评分者。
# #score_keeper 是得分者。

class Unidom::Score::ScoreSheetTemplate < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_sheet_templates'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,        allow_blank: true, length: { in: 2..columns_hash['name'].limit }
  validates :total_score, presence:    true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :subject, polymorphic: true

  has_many :sheets, class_name: 'Unidom::Score::ScoreSheet'

  scope :subject_is, ->(subject) { where subject: subject }

end
