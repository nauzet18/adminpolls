class GroupsController < InheritedResources::Base
  def create
    create! do |success, failure|

      success.html do
        redirect_to groups_path(page: params[:page]), notice: I18n.t( :saved )
      end

    end
  end

  def update
    update! do |success, failure|

      success.html do
        redirect_to groups_path(page: params[:page]), notice: I18n.t( :saved )
      end

    end
  end

  private

  def collection
    @contents =
      if param_sizes(search_text: :nonzero?, search_select: :nonzero?)
        end_of_association_chain
          .where("name ilike ? AND poll_id = ?", "%#{params[:search_text]}%", params[:search_select].to_i)
      elsif param_sizes(search_text: :zero?, search_select: :nonzero?)
        end_of_association_chain
          .where("poll_id = ?", params[:search_select].to_i)
      elsif param_sizes(search_text: :nonzero?, search_select: :zero?)
        end_of_association_chain
          .where("name ilike ?", "%#{params[:search_text]}%")
      else
        end_of_association_chain
      end.order(:id).page( params[:page])
  end

  def group_params
    params.require(:group).permit(:name, :poll_id, questions_attributes: [:id, :name, :_destroy])
  end
end
