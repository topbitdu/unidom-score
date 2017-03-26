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

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit

    it_behaves_like 'validates numericality', model_attributes, :score,
      range: -1_000_000_000..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true, only_integer: false

    score_sheet_template_attributes = {
      subject_id:   SecureRandom.uuid,
      subject_type: 'Unidom::Score::Subject::Mock',
      name:         'Some Name',
      score:        100.00
    }

    it_behaves_like 'belongs_to', model_attributes, :template, Unidom::Score::ScoreSheetTemplate, score_sheet_template_attributes

  end

end
