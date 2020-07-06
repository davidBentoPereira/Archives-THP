class CitiesController < ApplicationController
  include ApplicationHelper

  def show
    @city = City.find(params[:id])
    @gossips = []

    City.all.each do |city|
      city.users.where(city_id: params[:id]).each do |user|
        user.gossips.each do |gossip|
          @gossips << gossip
        end
      end
    end
  end
end
