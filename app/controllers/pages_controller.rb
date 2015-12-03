class PagesController < ApplicationController
  def about
  	@profile = Profile.all.order("created_at DESC").paginate(:page => params[:page], :per_page =>12)
  end

  def contact
  end
end
