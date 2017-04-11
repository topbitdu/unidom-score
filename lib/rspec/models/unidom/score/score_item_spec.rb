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

    it_behaves_like 'validates text', model_attributes, :title,
      length: 2..described_class.columns_hash['title'].limit, allow_blank: true

    it_behaves_like 'validates numericality', model_attributes, :score,
      range: -1_000_000_000..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    score_sheet_attributes = {
      template_id:        SecureRandom.uuid,
      scorer_id:          SecureRandom.uuid,
      scorer_type:        'Unidom::Score::Scorer::Mock',
      score_keeper_id:    SecureRandom.uuid,
      score_keeper_type:  'Unidom::Score::ScoreKeeper::Mock',
      name:               'Some Name',
      score:              95.00,
      scored_on:          Date.current
    }

    it_behaves_like 'belongs_to', model_attributes, :sheet, Unidom::Score::ScoreSheet, score_sheet_attributes

    score_item_template_attributes = {
      sheet_id: SecureRandom.uuid,
      title:    'Some Title',
      score:    100.00
    }

    it_behaves_like 'belongs_to', model_attributes, :template, Unidom::Score::ScoreItemTemplate, score_item_template_attributes

  end

end
