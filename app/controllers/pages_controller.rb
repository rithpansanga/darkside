class PagesController < ApplicationController

  helper_method :calper
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
   def calper(home_id,away_id)
      ar = Record.where(home_id: home_id, away_id: away_id)
      ch = Record.where(home_id: away_id, away_id: home_id)
      result = ar.count + ch.count
      rar = ar.where(result: "W")
      rrar = rar.count
      rch = ch.where(result: "L")
      rrch = rch.count
      result2 = rrar.to_f + rrch.to_f
      result3 = (result2/result)*100
      return result3

  end

end
