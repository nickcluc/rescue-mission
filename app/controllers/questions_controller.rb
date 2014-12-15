class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new

  end

  def create
    question = Question.new(question_params)
    question.save!
    redirect_to '/questions'
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :title, :description)
  end

end
