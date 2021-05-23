class SubjectClassesController < ApplicationController
  before_action :set_subject_class, only: [:edit, :update, :show, :destroy]

  def index
    @subj_classes = SubjectClass.from_school(current_school)
  end

  def new
    @subj_class = SubjectClass.new

    @subjects = current_school.subjects
    @teachers = current_school.teachers
    @grades = current_school.grades
  end

  def show
  end

  def edit
    @subjects = current_school.subjects
    @teachers = current_school.teachers
    @grades = current_school.grades
  end

  def create
    @subj_class = SubjectClass.new(subject_class_params)

    respond_to do |format|
      if @subj_class.save
        format.html { redirect_to school_subject_classes_path(current_school) }
      else
        flash[:error] = @subj_class.errors.full_messages
        format.html { redirect_to new_school_subject_class_path(current_school) }
      end
    end
  end

  def update
    respond_to do |format|
      if @subj_class.update(subject_class_params)
        format.html { redirect_to school_subject_classes_path(current_school) }
      else
        flash[:error] = @subj_class.errors.full_messages
        format.html { redirect_to edit_school_subject_class_path(current_school) }
      end
    end
  end

  def destroy
    @subj_class.destroy

    redirect_to school_subject_classes_path(current_school)
  end

  private

    def set_subject_class
      @subj_class = SubjectClass.find(params[:id])
    end


    def subject_class_params
      params.require(:subject_class).permit(
        :start_date, :end_date, :subject_id, :grade_id, :teacher_id)
    end

end
