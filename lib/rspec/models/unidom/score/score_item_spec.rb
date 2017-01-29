describe Unidom::Score::ScoreItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      sheet_id:    SecureRandom.uuid,
      template_id: SecureRandom.uuid,
      scorer_id:   SecureRandom.uuid,
      scorer_type: 'Unidom::Score::Scorer::Mock',
      title:       'Some Title',
      score:       95.00,
      scored_on:   Date.current
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
