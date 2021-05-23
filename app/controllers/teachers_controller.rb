class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  def index
    @teachers = Teacher.all
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
    @teacher.user = current_user
    @teacher.school = current_school
    @teacher.personable = Teacher.new

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to school_teacher_path(current_school.id, @teacher.personable.id), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_teacher
      @teacher = Teacher.find(params[:id]).person
    end

    def person_params
      params.require(:person).permit(:name)
    end

    def invite_params
      params.require(:invite).permit(:email)
    end

end
