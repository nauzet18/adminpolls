class QuestionsController < InheritedResources::Base
  def create
    create! do |success, _failure|
      success.html do
        redirect_to questions_path(page: params[:page], search_select: params[:search_select], search_text: params[:search_text]), notice: I18n.t(:saved)
      end
    end
  end

  def update
    update! do |success, _failure|
      success.html do
        redirect_to questions_path(page: params[:page], search_select: params[:search_select], search_text: params[:search_text]), notice: I18n.t(:saved)
      end
    end
  end

  private

  def collection
    @contents =
      if param_sizes(search_text: :present?, search_select: :present?)
        end_of_association_chain
          .where("name ilike ? AND group_id = ?", "%#{params[:search_text]}%", params[:search_select].to_i)
      elsif param_sizes(search_text: :empty?, search_select: :present?)
        end_of_association_chain
          .where("group_id = ?", params[:search_select].to_i)
      elsif param_sizes(search_text: :present?, search_select: :empty?)
        end_of_association_chain
          .where("name ilike ?", "%#{params[:search_text]}%")
      else
        end_of_association_chain
      end.order(:id).page( params[:page])
  end

  def question_params
    params.require(:question).permit(:name, :group_id, answers_attributes: [:id, :name, :correct, :_destroy])
  end
end
