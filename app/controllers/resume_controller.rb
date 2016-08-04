class ResumeController < ApplicationController
  def index

    @educations = Education.all.order("period_end DESC")
    @experiences = Experience.all.order("period_end DESC")

  end
end
