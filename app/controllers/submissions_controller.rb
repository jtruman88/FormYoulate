class SubmissionsController < ApplicationController
  def show
    @submission = Submission.find(params[:id])
  end

  def create
    submission = Submission.create(submission_params)
    answer_params.each do |answer|
      new_answer = Answer.create(submission: submission, field_id: answer[:field_id], text: answer[:text])
      if answer[:options].present?
        answer[:options].each do |option|
          FieldOptionAnswer.create(field_option_id: option, answer: new_answer)
        end
      end
    end

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
