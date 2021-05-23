class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit update destroy ]

  def index
    @students = Person.from_school(current_school).students
  end

  def new
    @student = Person.new
    @grades = Grade.from_school(current_school)
  end

  def edit
    @grades = Grade.from_school(current_school)
  end

  def create
    @student = current_school.people.build(person_params)
    @student.personable = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to school_students_path(current_school) }
      else
        flash[:error] = @student.errors.full_messages
        format.html { redirect_to new_school_student_path(current_school) }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(person_params) && @student.personable.update(student_params)
        format.html { redirect_to school_students_path(current_school) }
      else
        flash[:error] = @student.errors.full_messages
        flash[:error] += @student.personable.errors.full_messages
        format.html { redirect_to edit_school_student_path(current_school, @student) }
      end
    end
  end

  def destroy
    @student.personable.destroy

    redirect_to school_students_path(current_school)
  end

  private
    def set_student
      @student = Student.find(params[:id]).person
    end

    def person_params
      params.require(:person).permit :name
    end

    def student_params
      params.require(:student).permit :grade_id
    end
end
