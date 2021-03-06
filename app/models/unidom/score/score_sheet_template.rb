##
# Score Sheet Tempalte 是评分表模版。
# #subject 是主题。
# #items 是评分项模版。
# #scorings 是评分表。

class Unidom::Score::ScoreSheetTemplate < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_sheet_templates'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,  allow_blank: true, length: { in: 2..columns_hash['name'].limit }
  validates :score, presence:    true, numericality: { greater_than_or_equal_to: -1_000_000_000, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :subject, polymorphic: true

  has_many :items,    class_name: 'Unidom::Score::ScoreItemTemplate', foreign_key: :sheet_id
  has_many :scorings, class_name: 'Unidom::Score::ScoreSheet',        foreign_key: :template_id

  scope :subject_is, ->(subject) { where subject: subject }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Score::ScoreSheetTemplate'
