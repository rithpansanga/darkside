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

  def test
    url = "http://uk.soccerway.com/a/block_team_matches_summary?block_id=page_team_1_block_team_matches_summary_6&callback_params=%7B%22page%22%3A%220%22%2C%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_178963%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22team_summary_block_teammatchessummary%22%2C%22team_id%22%3A%222147%22%2C%22competition_id%22%3A%220%22%2C%22filter%22%3A%22home%22%2C%22new_design%22%3A%22%22%7D&action=filterMatches&params=%7B%22filter%22%3A%22away%22%7D"
    res = RestClient.get(url)
    content = JSON.parse(res.body)
    @html_body = content["commands"][0]["parameters"]["content"]
    @web = @html_body.html_safe

  end


  def dark
    @scoretables =Scoretable.all
    
    @matches = Match.all
    @teams = Team.select("teams.id, teams.name, SUM(scoretables.point) AS total_points").joins(:scoretables).group("teams.id").order("total_points DESC")
    @matchcount = Match.where(home_id:[:id]).count 
  end
   def calper(home_id,away_id)
      record = Record.all
      home = record.where(home_id: home_id)
      away = record.where(away_id: away_id)
      hgsum = home.sum(:hscore)
      hlgsum = home.sum(:ascore) 
      agsum = away.sum(:ascore)
      algsum = away.sum(:hscore)
      avghg = hgsum.to_f / hlgsum.to_f
      avgag = agsum.to_f / algsum.to_f
      total = avghg / (avghg + avgag)
      #total = total + Match.where(home_id: home_id, away_id: away_id).first.ratio
      
      return total*100

  end

end


# http://uk.soccerway.com/a/block_competition_matches?block_id=page_competition_1_block_competition_matches_5&callback_params=%7B%22page%22%3A0%2C%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_178981%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22competition_matches_block_competitionmatches%22%2C%22round_id%22%3A31553%2C%22outgroup%22%3Afalse%2C%22view%22%3A2%7D&action=changePage&params=%7B%22page%22%3A-1%7D