describe Unidom::Score::ScoreSheetTemplate, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      subject_id:    SecureRandom.uuid,
      subject_type:  'Unidom::Score::Subject::Mock',
      name:          'Some Name',
      score:         100.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
