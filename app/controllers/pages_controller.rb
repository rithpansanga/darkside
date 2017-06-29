class PagesController < ApplicationController

  def main
  end

  def home
    @Teams = Team.all
    @Homes = Home.all
    @Aways = Away.all
    @Matches = Match.all
  end

  def dark
    @scoretables =Scoretable.all
    @matches = Match.all
    @teams = Team.select("teams.id, teams.name, SUM(scoretables.point) AS total_points").joins(:scoretables).group("teams.id").order("total_points DESC")
    @matchcount = Match.where(home_id:[:id]).count 
  end

end
