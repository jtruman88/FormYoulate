class SubmissionsController < ApplicationController
  before_action :logged_in_user
  before_action :user_owns_form_or_submission, only: [:show]

  def show
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

  def user_owns_form_or_submission
    @submission = Submission.find(params[:id])
    redirect_to forms_path unless current_user == @submission.user || current_user.owns_form?(@submission.form)
  end
end
