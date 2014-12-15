class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new

  end

  def create
    question = Question.new(params)
  end
end
