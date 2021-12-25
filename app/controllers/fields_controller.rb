class FieldsController < ApplicationController
  def add
    @fieldTypes = FieldType.all
    render 'add', layout: false
  end
  
  def updateType
    @type = params[:type].to_i
    view = (@type == FieldType::TEXT ? 'text' : 'option_select')
    render partial: view, layout: false
  end
  
  def addOption
    @type = params[:type].to_i
    render partial: 'option_input', layout: false
  end
end
