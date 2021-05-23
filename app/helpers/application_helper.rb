module ApplicationHelper

  def current_school
    @current_school ||= School.find(params[:school_id]) if params[:school_id]
  end

end
