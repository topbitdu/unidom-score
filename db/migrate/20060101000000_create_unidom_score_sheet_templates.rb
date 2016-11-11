class CreateUnidomScoreSheetTemplates < ActiveRecord::Migration

  def change

    create_table :unidom_score_sheet_templates, id: :uuid do |t|

      t.references :subject, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.string  :name,        null: true,  default: nil, limit:     200
      t.decimal :total_score, null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_score_sheets, :subject_id

  end

end
