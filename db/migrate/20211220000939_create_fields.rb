class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :label
      t.references :field_type, null: false, foreign_key: true
      t.boolean :required

      t.timestamps
    end
  end
end
