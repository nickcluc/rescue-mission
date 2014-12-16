class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to @answer.question, notice: 'Answer was posted successfully.'
    else
      binding.pry
      @question = @answer.question
      @answers = @question.answers.order("created_at DESC")
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :description)
  end


end
