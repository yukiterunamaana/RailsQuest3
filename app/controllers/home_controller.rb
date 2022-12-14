class HomeController < ApplicationController

def index
  @team1 = Character.where(team: 1)
  pp Character.all
  @team2 = Character.where(team: 2)
end
  
end