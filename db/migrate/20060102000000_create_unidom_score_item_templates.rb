class CreateUnidomScoreItemTemplates < ActiveRecord::Migration

  def change

    create_table :unidom_score_item_templates, id: :uuid do |t|

      t.references :sheet, type: :uuid, null: false

      t.string  :title, null: false, default: '',  limit:     200
      t.decimal :score, null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_score_item_templates, :sheet_id

  end

end
