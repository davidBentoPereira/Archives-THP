class FrontController < ApplicationController
  include ApplicationHelper

  # View Team page
  def team
  end

  # View Contact page
  def contact
  end

  # View Welcome page displaying User's first name
  def welcome
    @first_name = params[:first_name]
  end
end
