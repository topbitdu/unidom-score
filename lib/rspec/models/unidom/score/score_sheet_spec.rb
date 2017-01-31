describe Unidom::Score::ScoreSheet, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      template_id:        SecureRandom.uuid,
      scorer_id:          SecureRandom.uuid,
      scorer_type:        'Unidom::Score::Scorer::Mock',
      score_keeper_id:    SecureRandom.uuid,
      score_keeper_type:  'Unidom::Score::ScoreKeeper::Mock',
      name:               'Some Name',
      score:              95.00,
      scored_on:          Date.current
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
