class PagesController < ApplicationController
  def about
  	@user = User.all
  end

  def contact
  end
end
