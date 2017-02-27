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

    name_max_length = described_class.columns_hash['name'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :score,
      {                            } => 0,
      { score: nil                 } => 2,
      { score: ''                  } => 2,
      { score: '1'                 } => 0,
      { score: 1                   } => 0,
      { score: 'A'                 } => 1,
      { score: '0.00'              } => 0,
      { score: 0.00                } => 0,
      { score: '-999_999_999.99'   } => 0,
      { score: -999_999_999.99     } => 0,
      { score: '-1_000_000_000'    } => 0,
      { score: -1_000_000_000      } => 0,
      { score: '-1_000_000_000.01' } => 1,
      { score: -1_000_000_000.01   } => 1,
      { score: '999_999_999.99'    } => 0,
      { score: 999_999_999.99      } => 0,
      { score: '1_000_000_000'     } => 0,
      { score: 1_000_000_000       } => 0,
      { score: '1_000_000_000.01'  } => 1,
      { score: 1_000_000_000.01    } => 1

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 0,
      { name: ''    } => 0,
      { name: 'A'   } => 1,
      { name: 'AA'  } => 0,
      { name: 'AAA' } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: 'A'*(name_max_length+1) } => 1

  end

end
