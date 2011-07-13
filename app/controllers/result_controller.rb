class ResultController < ApplicationController
  def result
    @results = Result.all
  end
end
