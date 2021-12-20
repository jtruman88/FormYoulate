class AddInitialFieldTypes < ActiveRecord::Migration[7.0]
  def up
    FieldType.create(name: 'text')
    FieldType.create(name: 'single-select')
    FieldType.create(name: 'multi-select')
  end
  
  def down
    FieldType.delete_all
  end
end
