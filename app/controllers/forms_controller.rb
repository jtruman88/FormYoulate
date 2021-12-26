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
    Form.create_from_form(form_params, field_params)
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
