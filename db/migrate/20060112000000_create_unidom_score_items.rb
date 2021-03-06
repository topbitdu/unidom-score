class CreateUnidomScoreItems < ActiveRecord::Migration

  def change

    create_table :unidom_score_items, id: :uuid do |t|

      t.references :sheet,    type: :uuid, null: false
      t.references :template, type: :uuid, null: true
      t.references :scorer,   type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string  :title,     null: true,  default: nil, limit:     200
      t.decimal :score,     null: false, default: 0.0, precision: 12, scale: 2
      t.date    :scored_on, null: false

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_score_items, :sheet_id
    add_index :unidom_score_items, :template_id
    add_index :unidom_score_items, :scorer_id

  end

end
