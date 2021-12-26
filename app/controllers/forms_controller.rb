class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
    @submission = Submission.new
  end

  def new
    @form = Form.new
  end

  def create
    form = Form.create(form_params)
    field_params.each do |field|
      new_field = Field.create(form: form, field_type_id: field[:type], label: field[:label])
      if field[:options].present?
        field[:options].each do |option|
          FieldOption.create(name: option, field: new_field)
        end
      end
    end

    redirect_to root_path
  end

  private

  def form_params
    params.require(:form).permit(:name, :description)
  end

  def field_params
    params.require(:fields).map { |field| field.permit(:type, :label, { options: [] }) }
  end
end
