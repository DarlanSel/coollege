module ApplicationHelper

  def current_school
    @current_school ||= School.find_by(slug: params[:slug])
  end

end
