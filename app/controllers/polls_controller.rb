class PollsController < InheritedResources::Base
  def create
    create! do |success, failure|

      success.html do
        redirect_to polls_path, notice: I18n.t( :saved )
      end

    end
  end

  def update
    update! do |success, failure|

      success.html do
        redirect_to polls_path, notice: I18n.t( :saved )
      end

    end
  end

  def generate_json
    #Un ejemplo de llamadas son:
    #http://localhost:3000/poll_generate_json/4.json
    
    @poll = Poll.find_by_id( params[:id] )

  end

  private

  def collection
    @contents = end_of_association_chain.order(:id).page( params[:page] )
  end

  def poll_params
    params.require(:poll).permit(:name, :description, groups_attributes: [:id, :name, :_destroy])
  end
end
