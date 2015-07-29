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

    if params[:search_text] and params[:search_text].size > 0 and params[:search_select] and params[:search_select].size > 0
      @contents = end_of_association_chain.where("name ilike ? AND group_id = ?", "%#{params[:search_text]}%", Integer(params[:search_select]) ).order(:id).page( params[:page] )
    elsif params[:search_text] and params[:search_text].size == 0 and params[:search_select] and params[:search_select].size > 0
      @contents = end_of_association_chain.where("group_id = ?", Integer(params[:search_select]) ).order(:id).page( params[:page] )
    elsif params[:search_text] and params[:search_text].size > 0 and params[:search_select] and params[:search_select].size == 0
      @contents = end_of_association_chain.where("name ilike ?", "%#{params[:search_text]}%").order(:id).page( params[:page] )
    else
      @contents = end_of_association_chain.order(:id).page( params[:page] )
    end

  end

  def question_params
    params.require(:question).permit(:page, :name, :group_id, answers_attributes: [:id, :name, :correct, :_destroy]).tap do |whitelisted|
      whitelisted[:page] = params[:page]
    end
  end
end
