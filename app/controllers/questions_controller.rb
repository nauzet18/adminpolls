class QuestionsController < InheritedResources::Base
  def create
    create! do |success, _failure|
      success.html do
        redirect_to questions_path, notice: I18n.t(:saved)
      end
    end
  end

  def update
    update! do |success, _failure|
      success.html do
        redirect_to questions_path, notice: I18n.t(:saved)
      end
    end
  end

  private

  def collection
    @contents =
      if param_sizes(search_text: :nonzero?, search_select: :nonzero?)
        end_of_association_chain
          .where("name ilike ? AND group_id = ?", "%#{params[:search_text]}%", params[:search_select].to_i)
      elsif param_sizes(search_text: :zero?, search_select: :nonzero?)
        end_of_association_chain
          .where("group_id = ?", params[:search_select].to_i)
      elsif param_sizes(search_text: :nonzero?, search_select: :zero?)
        end_of_association_chain
          .where("name ilike ?", "%#{params[:search_text]}%")
      else
        end_of_association_chain
      end.order(:id).page( params[:page])
  end

  def param_sizes(**fields)
    fields.map do |key, proc|
      params[key].try(proc)
    end.all?
  end

  def question_params
    params.require(:question).permit(
      :page,
      :name,
      :group_id,
      answers_attributes: %i{id name correct _destroy}
    ).tap do |whitelisted|
      whitelisted[:page] = params[:page]
    end
  end
end
