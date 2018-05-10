#require 'pry'

def game_hash
 nba = {
      :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4,
                            :shoe => 18,
                            :points => 10,
                            :rebounds => 1,
                            :assists => 1,
                            :steals => 2,
                            :blocks => 7,
                            :slam_dunks => 2
                          },
        "Bismak Biyombo" => {:number => 0,
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

                  }
             },
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {"Jason Terry" =>
                         {:number => 31,
                          :shoe => 15,
                          :points => 19,
                          :rebounds => 2,
                          :assists => 2,
                          :steals => 4,
                          :blocks => 11,
                          :slam_dunks => 1
                         },

                         "Mason Plumlee" =>
                         {:number => 1,
                          :shoe => 19,
                          :points => 26,
                          :rebounds => 12,
                          :assists => 6,
                          :steals => 3,
                          :blocks => 8,
                          :slam_dunks => 5
                         },

                  "Brook Lopez" =>
                         {:number => 11,
                          :shoe => 17,
                          :points => 17,
                          :rebounds => 19,
                          :assists => 10,
                          :steals => 3,
                          :blocks => 1,
                          :slam_dunks => 15
                         },

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
                        }

                  }
             }
      }
end



# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#               end
#     end
#   end
# end

def num_points_scored(name)
    if game_hash[:away][:players].has_key?(name)
      game_hash[:away][:players][name][:points]
    else
      game_hash[:home][:players][name][:points]
    end
end

def shoe_size(name)
    if game_hash[:away][:players].has_key?(name)
      game_hash[:away][:players][name][:shoe]
    else
      game_hash[:home][:players][name][:shoe]
    end
end

def team_colors(team)
    if game_hash[:away][:team_name] == team
      game_hash[:away][:colors]
    else
      game_hash[:home][:colors]
    end
end

def player_stats(name)
    if game_hash[:away][:players].has_key?(name)
      game_hash[:away][:players][name]
    else
      game_hash[:home][:players][name]
    end
end

def team_names
  game_hash.values.map do |category|
    category[:team_name]
    end
end

def player_numbers(team)
  jerseys = []
  if game_hash[:away][:team_name] == team
    game_hash[:away][:players].each { |player, category|
      jerseys << category[:number] }
  else
    game_hash[:home][:players].each { |player, category|
      jerseys << category[:number] }
  end
  jerseys
end

def big_shoe_rebounds
  rebound = nil
  sneaker_size = nil

  [:home, :away].each do |division|
  game_hash[division][:players].each do |player, category|
    if sneaker_size == nil || category[:shoe] > sneaker_size
      sneaker_size = category[:shoe]
      rebound = category[:rebounds]
    end
  end
  end
  rebound
end
