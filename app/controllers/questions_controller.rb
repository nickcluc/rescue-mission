class QuestionsController < ApplicationController

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

  def question_params
    params.require(:question).permit(:user_id, :title, :description)
  end

end
