class SubmissionsController < ApplicationController
  before_action :logged_in_user

  def show
    @submission = Submission.find(params[:id])
  end

  def create
    submission = Submission.create_from_form(submission_params, answer_params, current_user)
    redirect_to forms_path
  end

  private

  def submission_params
    params.require(:submission).permit(:form_id)
  end

  def answer_params
    params.require(:answers).map { |answer| answer.permit(:text, :field_id, { options: [] }) }
  end
end
