class CreateUnidomScoreItems < ActiveRecord::Migration

  def change

    create_table :unidom_score_items, id: :uuid do |t|

      t.references :score_sheet,         type: :uuid, null: false
      t.references :score_item_template, type: :uuid, null: true
      t.references :scorer,              type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string  :title,     null: true,  default: nil, limit:     200
      t.decimal :score,     null: false, default: 0.0, precision: 12, scale: 2
      t.date    :scored_on, null: false

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_score_items, :score_sheet_id
    add_index :unidom_score_items, :score_item_template_id
    add_index :unidom_score_items, :scorer_id

  end

end