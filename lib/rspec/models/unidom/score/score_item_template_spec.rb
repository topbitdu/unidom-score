describe Unidom::Score::ScoreItemTemplate, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      sheet_id: SecureRandom.uuid,
      title:    'Some Title',
      score:    100.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates text', model_attributes, :title,
      length: 2..described_class.columns_hash['title'].limit

    it_behaves_like 'validates numericality', model_attributes, :score,
      range: -1_000_000_000..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    score_sheet_template_attributes = {
      subject_id:    SecureRandom.uuid,
      subject_type:  'Unidom::Score::Subject::Mock',
      name:          'Some Name',
      score:         100.00
    }

    it_behaves_like 'belongs_to', model_attributes, :sheet, Unidom::Score::ScoreSheetTemplate, score_sheet_template_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :sheet_is, :sheet

  end

end
