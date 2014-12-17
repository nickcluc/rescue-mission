class QuestionsController < ApplicationController
  before_filter :authenticate!, :except => [:index, :show]

  def index
    @questions = Question.order("id DESC").all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to "/questions/#{@question.id}"
    else
      render :edit
    end
  end

  def show
    @question = Question.find( params[:id] )
    unless @question.best_answer == nil
      @best_answer = Answer.find(@question.best_answer)
    end
    @answers = @question.answers.order("created_at DESC")
    @answer = Answer.new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to '/questions'
    else
      @question = question
      render action: 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to questions_path, :notice => "Your question has been deleted successfully."
    else

    end
  end

  private
  helper QuestionsHelper

  def question_params
    params.require(:question).permit(:user_id, :title, :description, :best_answer)
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def authenticate!
    unless signed_in?
      redirect_to questions_path, :notice => 'You need to sign in if you want to do that!'
    end
  end

end
