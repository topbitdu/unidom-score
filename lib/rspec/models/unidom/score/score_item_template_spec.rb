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

    score_sheet_template_attributes = {
      subject_id:    SecureRandom.uuid,
      subject_type:  'Unidom::Score::Subject::Mock',
      name:          'Some Name',
      score:         100.00
    }

    it_behaves_like 'belongs_to', model_attributes, :sheet, Unidom::Score::ScoreSheetTemplate, score_sheet_template_attributes

  end

end
