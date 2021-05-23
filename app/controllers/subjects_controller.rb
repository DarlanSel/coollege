class SubjectsController < ApplicationController

  before_action :set_subject, only: %i[edit update destroy]

  def index
    @subjects = current_school.subjects
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = current_school.subjects.build(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to school_subjects_path(current_school) }
      else
        flash[:error] = @subject.errors.full_messages
        format.html { redirect_to new_school_subject_path(current_school) }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to school_subjects_path(current_school) }
      else
        flash[:error] = @subject.errors.full_messages
        format.html { redirect_to new_school_subject_path(current_school) }
      end
    end
  end

  def destroy
    @subject.destroy

    redirect_to school_subjects_path(current_school)
  end


  private

    def set_subject
      @subject = current_school.subjects.find(params[:id])
    end


    def subject_params
      params.require(:subject).permit(:name)
    end
end
