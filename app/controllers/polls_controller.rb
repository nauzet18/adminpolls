class PollsController < InheritedResources::Base
  def create
    create! do |success, _failure|
      success.html do
        redirect_to polls_path(page: params[:page]), notice: I18n.t(:saved)
      end
    end
  end

  def update
    update! do |success, _failure|
      success.html do
        redirect_to polls_path(page: params[:page]), notice: I18n.t(:saved)
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
    @contents =
      if param_sizes(search_text: :present?)
        end_of_association_chain
          .where("name ilike ?", "%#{params[:search_text]}%")
      else
        end_of_association_chain
      end.order(:id).page(params[:page])
  end

  def poll_params
    params.require(:poll)
      .permit(:name, :description, groups_attributes: %i{[id name _destroy})
  end
end
