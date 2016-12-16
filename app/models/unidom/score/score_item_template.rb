# Score Item Tempalte 是评分项模版。
# #sheet 是评分表模版。
# #scorings 是评分项。

class Unidom::Score::ScoreItemTemplate < Unidom::Score::ApplicationRecord

  self.table_name = 'unidom_score_item_templates'

  include Unidom::Common::Concerns::ModelExtension

  validates :title, presence: true, length: { in: 2..columns_hash['title'].limit }
  validates :score, presence: true, numericality: { greater_than_or_equal_to: -1_000_000_000, less_than_or_equal_to: 1_000_000_000 }

  belongs_to :sheet, class_name: 'Unidom::Score::ScoreSheetTemplate'

  has_many :scorings, class_name: 'Unidom::Score::ScoreItem', foreign_key: :template_id

  scope :sheet_is, ->(sheet) { where sheet_id: to_id(sheet) }

end
