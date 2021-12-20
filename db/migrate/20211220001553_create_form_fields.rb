class CreateFormFields < ActiveRecord::Migration[7.0]
  def change
    create_table :form_fields do |t|
      t.references :form, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
