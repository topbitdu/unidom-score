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

  end

end
