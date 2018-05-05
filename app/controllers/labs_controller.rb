class LabsController < ApplicationController
  before_action :find_subject
  before_action :find_lab, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @lab = Lab.new
  end

  def create
    @lab = Lab.new(lab_params)
    @lab.subject_id = @subject.id
    @lab.user_id = current_user.id
    @lab.status = 0
    @lab.deadline = Date.civil(deadline_params[:year].to_i, deadline_params[:month].to_i,
                               deadline_params[:day].to_i)

    if @lab.save
      redirect_to subject_path(@subject)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @lab.update(lab_params)
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

  def destroy
    @lab.destroy
    redirect_to subject_path(@subject)
  end

  private

  def lab_params
    params.require(:lab).permit(:state_event, :complexity, :comment)
  end

  def deadline_params
    params.require(:deadline).permit(:year, :month, :day)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def find_lab
    @lab = Lab.find(params[:id])
  end
end
