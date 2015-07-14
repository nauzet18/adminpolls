class QuestionsController < InheritedResources::Base
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

  def collection
    @contents = end_of_association_chain.order(:id).page( params[:page] )
  end

  def question_params
    params.require(:question).permit(:name, :group_id)
  end
end
