class AddInitialFieldTypes < ActiveRecord::Migration[7.0]
  def up
    FieldType.create(id: 1, name: 'Text', view: 'fieldTypes/text')
    FieldType.create(id: 2, name: 'Single Select', view: 'fieldTypes/single_select')
    FieldType.create(id: 3, name: 'Multi Select', view: 'fieldTypes/multi_select')
  end
  
  def down
    FieldType.delete_all
  end
end
