class FormsController < ApplicationController
  def index
    @form = Form.first
  end
end
