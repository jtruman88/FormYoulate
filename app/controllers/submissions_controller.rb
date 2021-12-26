class SubmissionsController < ApplicationController
  def show
    @submission = Submission.find(params[:id])
  end

  def create
    submission = Submission.create_from_form(submission_params, answer_params)
    redirect_to form_path(submission.form)
  end

  private

  def submission_params
    params.require(:submission).permit(:form_id)
  end

  def answer_params
    params.require(:answers).map { |answer| answer.permit(:text, :field_id, { options: [] }) }
  end
end
