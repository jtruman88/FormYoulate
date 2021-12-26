class FormsController < ApplicationController
  before_action :logged_in_user
  before_action :already_submitted_form, only: [:show]

  def index
    @forms = Form.all_except_users(current_user)
  end

  def show
    @form = Form.find(params[:id])
    @submission = Submission.new
  end

  def new
    @form = Form.new
  end

  def create
    Form.create_from_form(form_params, field_params, current_user)
    redirect_to user_path(current_user)
  end

  private

  def form_params
    params.require(:form).permit(:name, :description)
  end

  def field_params
    params.require(:fields).map { |field| field.permit(:type, :label, { options: [] }) }
  end

  def already_submitted_form
    submission = current_user.submissions.find_by(form_id: params[:id])
    redirect_to submission_path(submission) if submission.present?
  end
end
