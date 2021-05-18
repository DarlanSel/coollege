class SchoolsController < ApplicationController
  before_action :set_school, except: %w[create index]

  load_and_authorize_resource

  def index
    @schools = current_user.schools
  end


  def new
  end

  def edit
  end

  def show
  end

  def create
    @school = current_user.schools.build(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to root_path }
      else
        flash[:error] = @school.errors.full_messages
        format.html { redirect_to new_school_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school }
      else
        flash[:error] = @school.errors.full_messages
        format.html { render edit }
      end
    end
  end

  def destroy
    @school.destroy

    redirect_to root_path
  end

  private

  def set_school
    if params[:id].present?
      @school = School.find(params[:id])
    else
      @school = School.new
    end
  end


  def school_params
    params.require(:school).permit(:name, :slug)
  end

end
