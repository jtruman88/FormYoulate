class Submission < ApplicationRecord
  belongs_to :form
  belongs_to :user
  has_many :answers

  # Creates a new Submission along with the associated Answers and FieldOptionAnswers
  #
  # @param submission_params [ActionController::Parameters] the Submission data from the form submission form
  # @param answer_params [Array<ActionController::Parameters>] array of Answer data from the form submission form
  # @param user [User] The user submitting the form
  # @return [Submission] the Submission created
  def self.create_from_form(submission_params, answer_params, user)
    submission = user.submissions.build(submission_params)
    submission.save
    answer_params.each do |answer|
      new_answer = Answer.create(submission: submission, field_id: answer[:field_id], text: answer[:text])
      if answer[:options].present?
        answer[:options].each do |option|
          FieldOptionAnswer.create(field_option_id: option, answer: new_answer)
        end
      end
    end

    submission
  end
end
