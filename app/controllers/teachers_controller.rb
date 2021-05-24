class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  def index
    @teachers = Person.from_school(current_school).teachers
  end

  def show
  end

  def new
    @teacher = Person.new(personable: Teacher.new)
  end

  def edit
  end

  def create
    @teacher = Person.new(person_params)
    @teacher.school = current_school
    @teacher.personable = Teacher.new

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to school_teacher_path(current_school, @teacher) }
        format.json { render :show, status: :created, location: @teacher }
      else
        flash[:error] = @teacher.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(person_params)
        format.html { redirect_to school_teacher_path(current_school, @teacher) }
        format.json { render :show, status: :ok, location: @teacher }
      else
        flash[:error] = @teacher.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to school_teachers_url(current_school) }
      format.json { head :no_content }
    end
  end

  private

    def set_teacher
      @teacher = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name)
    end
end
