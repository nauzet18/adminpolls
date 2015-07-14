class GroupsController < InheritedResources::Base
  def create
    create! do |success, failure|

      success.html do
        redirect_to groups_path, notice: I18n.t( :saved )
      end

    end
  end

  def update
    update! do |success, failure|

      success.html do
        redirect_to groups_path, notice: I18n.t( :saved )
      end

    end
  end

  private

  def collection
    @contents = end_of_association_chain.order(:id).page( params[:page] )
  end

  def group_params
    params.require(:group).permit(:name, :poll_id)
  end
end
