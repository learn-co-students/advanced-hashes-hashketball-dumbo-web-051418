require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  if game_hash[:home][:players].has_key?(name)
    puts points = game_hash[:home][:players][name][:points]
      return points
else
    puts points = game_hash[:away][:players][name][:points]
      return points
  end
end

def shoe_size(name)
  if game_hash[:home][:players].has_key?(name)
    puts size = game_hash[:home][:players][name][:shoe]
      return size
else
    puts size = game_hash[:away][:players][name][:shoe]
      return size
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    puts color = game_hash[:home][:colors]
    return color
  else
    puts color = game_hash[:away][:colors]
    return color
  end
end

def team_names
  both_names = []
  both_names << game_hash[:home][:team_name]
  both_names << game_hash[:away][:team_name]
  return both_names
end

def player_numbers(team)

  game_hash.each do |team_location, team_stats|
    if team_stats[:team_name] == team
      return jerseys = team_stats[:players].collect do |name, data|
          data[:number]

    end
   end
  end
end


def player_stats(name)
  if game_hash[:home][:players].has_key?(name)
      game_hash[:home][:players][name]
    else
      game_hash[:away][:players][name]
    end
end

def big_shoe_rebounds
  biggest_shoe = nil
  most_rebounds = nil

  game_hash.each do |team_location, team_stats|
    team_stats[:players].each do |name, player_hash|

    if biggest_shoe == nil || player_hash[:shoe] < biggest_shoe
      most_rebounds = player_hash[:rebounds]
      biggest_shoe = player_hash[:shoe]
      end
    end
  end
  most_rebounds
end
