class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:category].blank?
      @subjects = Subject.where(user_id: current_user.id).order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @subjects = Subject.where(category_id: @category_id).order('created_at  DESC')
    end
  end

  def show
    # @lab = Lab.find(params[:id])
    @fire_labs = @subject.labs.fire_lab_scope
    if @subject.labs.blank?
      @average_lab = 0
    else
      @average_lab = @subject.labs.average(:complexity).round(2)
    end
  end

  def new
    @subject = current_user.subjects.build
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def create
    @subject = current_user.subjects.build(subject_params)
    @subject.category_id = params[:category_id]

    if @subject.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def update
    @subject.category_id = params[:category_id]
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end

  def destroy
    @subject.destroy
    redirect_to root_path
  end

  private

  def subject_params
    params.require(:subject).permit(:title, :description, :teacher, :category_id, :subject_img)
  end

  def find_subject
    @subject = Subject.find(params[:id])
  end

end
