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
    url = "http://uk.soccerway.com/a/block_competition_matches?block_id=page_competition_1_block_competition_matches_5&callback_params=%7B%22page%22%3A%22-11%22%2C%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_178981%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22competition_matches_block_competitionmatches%22%2C%22round_id%22%3A%2225191%22%2C%22outgroup%22%3A%22%22%2C%22view%22%3A%222%22%7D&action=changePage&params=%7B%22page%22%3A-12%7D"
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
      record = Record.where("hscore < ?",10)
      ar = record.where(home_id: home_id, away_id: away_id)
      gd1 = ar.sum(:hscore) - ar.sum(:ascore)
      gd2 = ar.count
      gd3 = gd1 / gd2
      ra = Match.where(home_id: home_id, away_id: away_id)
      ratio = ra.first.ratio
      result = gd3.to_f - ratio
      per = 0
      if result == 0
        per = 50
      elsif result > 0 and result < 0.30
        per = 55
      elsif result >= 0.30 and result <= 0.5  
        per = 58

      elsif result > 0.5 and result <= 0.75
        per = 60

      elsif result > 0.75 and result < 1
        per = 65
      elsif result >= 1
        per = 68
      elsif result <= -0.25
        per = 45
      elsif result <= -0.5
        per = 40
      elsif result <= -0.75
        per = 35
      else
        per = 30
      end

      return per     


          
            

  end

end


# http://uk.soccerway.com/a/block_competition_matches?block_id=page_competition_1_block_competition_matches_5&callback_params=%7B%22page%22%3A0%2C%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_178981%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22competition_matches_block_competitionmatches%22%2C%22round_id%22%3A31553%2C%22outgroup%22%3Afalse%2C%22view%22%3A2%7D&action=changePage&params=%7B%22page%22%3A-1%7D