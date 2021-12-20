class CreateFieldOptionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :field_option_answers do |t|
      t.references :field_option, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
