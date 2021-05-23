class GradesController < ApplicationController
  def index
    @grades = Grade.from_school(current_school)
  end

  def new
    @grade = Grade.new
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = current_school.grades.build(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to school_grades_path(current_school) }
      else
        flash[:error] = @grade.errors.full_messages
        format.html { redirect_to new_school_grade_path(current_school) }
      end
    end
  end

  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to school_grades_path(current_school) }
      else
        flash[:error] = @grade.errors.full_messages
        format.html { redirect_to new_school_grade_path(current_school) }
      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])

    @grade.destroy

    redirect_to school_grades_path(current_school)
  end

  private

    def grade_params
      params.require(:grade).permit(:name)
    end

end
