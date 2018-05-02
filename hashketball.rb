require "pry"

def game_hash
game_hash = {
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
      },
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
        "DeSagna Diop" => {:number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {:number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {:number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      },
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      return data[:points] if player_name == name
       end
    end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      return data[:shoe] if player_name == name
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team
  end
end

def team_names
  team_names = game_hash.collect do |location, team_data|
    team_data[:team_name]
 end
end

def player_numbers(team)
   game_hash.each do |location, team_data|
    if team_data[:team_name] == team
    return jerseys = team_data[:players].collect do |name, data|
       data[:number]
     end
   end
 end
end

def player_stats(player_name)
  game_hash.each do |team, team_data|
    if team_data[:players].key?(player_name)
      return team_data[:players][player_name]
    end
  end
end


def big_shoe_rebounds
  big_shoe = 0
  big_rebounds = 0
  player = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      shoe = shoe_size(name)
      rebounds = player_stats(name)[:rebounds]
       if shoe > big_shoe
         big_shoe = shoe
         big_rebounds = rebounds
         player = name
  end
 end
 end
 big_rebounds
end

def most_points_scored
  points = 0
  player = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
     indi_points = num_points_scored(name)
     if indi_points > points
       points = indi_points
       player = name
     end
   end
 end
 player
end

def player_scores(team)
   game_hash.each do |location, team_data|
    if team_data[:team_name] == team
    return scores = team_data[:players].collect do |name, data|
       data[:points]
     end
   end
 end
end

def sum(arr)
  return arr.reduce(:+)
end

def winning_team
  home_scores = player_scores(game_hash[:home][:team_name])
  away_scores = player_scores(game_hash[:away][:team_name])
  sum(away_scores) > sum(home_scores)? game_hash[:away][:team_name] : game_hash[:home][:team_name]
 end

def player_with_longest_name
  name_max = 0
  player = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
     if name.size > name_max
       player = name
       name_max = name.size
     end
   end
 end
 player
end

def num_steals(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      return data[:steals] if player_name == name
       end
    end
end

def long_name_steals_a_ton?
  max_steal = 0
  thief_name = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if num_steals(name) > max_steal
        max_steal = num_steals(name)
        thief_name = name
      end
  end
 end
 thief_name == player_with_longest_name
end
