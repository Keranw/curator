class DashboardController < ApplicationController
  def dashboard
    if params["keyword"]
      @result = Course.search_course(params["keyword"])
    end
  end


end
