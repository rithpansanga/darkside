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
      ch = record.where(home_id: away_id, away_id: home_id)
      gd = 1
      gd1 = ar.sum(:hscore) - ar.sum(:ascore)
      gd2 = ar.count + gd
      gdd2 = gd2.to_f
      gdd1 = gd1.to_f
      gd3 = gdd1 / gdd2
      ra = Match.where(home_id: home_id, away_id: away_id)
      ratio = ra.first.ratio
      result = ratio + gd3.to_f 
      per = 0
      if result == 0
        per = 50
      elsif result > 0 and result < 0.30
        per = 52
      elsif result >= 0.30 and result <= 0.5  
        per = 54

      elsif result > 0.5 and result <= 0.75
        per = 56
      elsif result > 0.75 and result < 1
        per = 58
      elsif result >= 1
        per = 60
      elsif result < 0 and result >= -0.25 
        per = 48
      elsif result < -0.25 and result >= -0.5
        per = 46
      elsif result < -0.52 and  result >= -0.7
        per = 44
      else
        per = 40
      end
      mt = ar.count + ch.count
      aw = ar.where(result: "W")
      cw = ch.where(result: "L")
      wt = aw.count + cw.count
      matchtotal = mt.to_f
      wintotal = wt.to_f
      winrate = wintotal / matchtotal
      if winrate >= 50 and winrate < 55
        winrate = 1
      elsif winrate >= 55 and winrate < 60
        winrate = 2
      elsif winrate >= 60 and winrate < 65 
        winrate = 3
      elsif winrate >= 65
        winrate = 4
        
      elsif winrate < 50 and winrate >= 45
        winrate = -1
      elsif winrate < 45  and winrate >= 40
        winrate = -2
      elsif winrate < 40 and winrate >= 35 
        winrate = -3
      elsif winrate < 35
        winrate = -4
      end
        
        
      per = per 

      return per    


          
            

  end

end


# http://uk.soccerway.com/a/block_competition_matches?block_id=page_competition_1_block_competition_matches_5&callback_params=%7B%22page%22%3A0%2C%22bookmaker_urls%22%3A%7B%2213%22%3A%5B%7B%22link%22%3A%22http%3A%2F%2Fwww.bet365.com%2Fhome%2F%3Faffiliate%3D365_178981%22%2C%22name%22%3A%22Bet%20365%22%7D%5D%7D%2C%22block_service_id%22%3A%22competition_matches_block_competitionmatches%22%2C%22round_id%22%3A31553%2C%22outgroup%22%3Afalse%2C%22view%22%3A2%7D&action=changePage&params=%7B%22page%22%3A-1%7D