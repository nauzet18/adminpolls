class PollsController < ApplicationController
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

  private

  def poll_params
    params.require(:poll).permit(:name)
  end
end
