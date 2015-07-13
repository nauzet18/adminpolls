class QuestionsController < ApplicationController
  def create
    create! do |success, failure|

      success.html do
        redirect_to questions_path, notice: I18n.t( :saved )
      end

    end
  end

  def update
    update! do |success, failure|

      success.html do
        redirect_to questions_path, notice: I18n.t( :saved )
      end

    end
  end
  
  private

  def question_params
    params.require(:question).permit(:name, :group_id)
  end
end
