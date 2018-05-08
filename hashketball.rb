# Write your code here!
require 'pry'

def game_hash
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 1  
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12, 
        :blocks => 12,
        :slam_dunks => 7  
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3, 
        :blocks => 1,
        :slam_dunks => 15 
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3, 
        :blocks => 8,
        :slam_dunks => 5 
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4, 
        :blocks => 11,
        :slam_dunks => 1  
      }
      
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2, 
        :blocks => 7,
        :slam_dunks => 2  
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7, 
        :blocks => 15,
        :slam_dunks => 10 
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4, 
        :blocks => 5,
        :slam_dunks => 5 
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1, 
        :blocks => 1,
        :slam_dunks => 0  
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22, 
        :blocks => 5,
        :slam_dunks => 12 
      }
    }
  }
  
}
end

def num_points_scored(player_name)
  points = nil
  game_hash.each do |location, team_data|
    if team_data[:players].keys.include?(player_name)
    return  points = team_data[:players][player_name][:points]
    end
  end
  return "#{player_name} is not on either team." if points == nil
end

def shoe_size(player_name)
  shoe_size = nil
  game_hash.each do |location, team_data|
    if team_data[:players].keys.include?(player_name)
    return  shoe_size = team_data[:players][player_name][:shoe]
    end
  end
  return "#{player_name} is not on either team." if points == nil

end

def team_colors(team_name)
  team_colors = nil
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_colors = team_data[:colors]
    end
  end
    return "#{team_name} are not playing today." if team_colors == nil
end

def team_names
  game_hash.collect {|location, team_data| team_data[:team_name]}
end

def player_numbers(team_name)
  jersey = nil
  game_hash.collect do |location, team_data|
    if team_data[:team_name] == team_name
     jersey =  team_data[:players].collect do |players, stats|
        stats[:number]
      end
    end
  end
  return jersey
end

def player_stats(player_name)
  player_hash = nil
  game_hash.each do |location, team_data|
    if team_data[:players].keys.include?(player_name)
      return  player_hash = team_data[:players][player_name]
    end
  end
  return "#{player_name} is not on either team." if player_hash == nil
end

def big_shoe_rebounds
  max_shoe = nil
  bigfoot_player = nil
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if max_shoe == nil || max_shoe < stats[:shoe]
        max_shoe = stats[:shoe]
        bigfoot_player = player_name
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

#Bonus rounds 

def most_points_scored
  max_points = nil
  max_point_player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if max_points == nil || max_points < stats[:points]
        max_points = stats[:points]
        max_point_player = player_name
      end
    end
  end
  return "#{max_point_player} is the highest scorer with #{max_points} points."
end

def winning_team
  team_results = {}
  game_hash.each do |location, team_data|
    total_points = 0
    team_data[:players].each_value {|stats| total_points += stats[:points]}
    team_results[team_data[:team_name]] = total_points
  end
  most_points = nil
  winning_team = nil
  team_results.each do |team, score|
    if most_points == nil || most_points < score
      most_points = score
      winning_team = team
    end
  end
  puts "Scoreboard:"
  team_results.each {|team, score| puts "  #{team}: #{score}"}
  return "#{winning_team} won with #{most_points} points."
end

def player_with_longest_name
  player_name_lengths =  {}
  game_hash.each do |location, team_data|
    team_data[:players].each_key {|name| player_name_lengths[name] = name.length}
  end
  longest_name = nil
  length = nil
  player_name_lengths.each do |player, name_length|
    if length == nil || length < name_length
      length = name_length
      longest_name = player
    end
  end
  return longest_name
end

def player_with_most_steals
  max_steals = nil
  max_steals_player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, stats|
      if max_steals == nil || max_steals < stats[:steals]
        max_steals = stats[:steals]
        max_steals_player = player_name
      end
    end
  end
  return max_steals_player
end

def long_name_steals_a_ton?
  player_with_longest_name == player_with_most_steals
end

