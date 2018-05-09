require 'pry'

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

def num_points_scored(name)
  if game_hash[:home][:players].include?(name)
    puts points = game_hash[:home][:players][name][:points]
    return points
  elsif game_hash[:away][:players].include?(name)
    puts  points = game_hash[:away][:players][name][:points]
     return points
  end
end

def shoe_size(name)
  if game_hash[:home][:players].include?(name)
    puts size = game_hash[:home][:players][name][:shoe]
    return size
  elsif game_hash[:away][:players].include?(name)
    puts  size = game_hash[:away][:players][name][:shoe]
     return size
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    puts colors = game_hash[:home][:colors]
    return colors
  elsif game_hash[:away][:team_name] == team
    puts colors = game_hash[:away][:colors]
    return colors
  end
end

def team_names
  teams = []
  teams << "#{game_hash[:home][:team_name]}"
  teams << "#{game_hash[:away][:team_name]}"
end

def player_numbers(team)
  brooklyn = []
  charlotte = []
  if team == "Brooklyn Nets"
    game_hash[:home][:players].each do |name, stats|
      stats.each do |item, num|
        if item == :number
          brooklyn << game_hash[:home][:players][name][:number]
        end
      end
    end
    brooklyn
  elsif team == "Charlotte Hornets"
    game_hash[:away][:players].each do |name, stats|
      stats.each do |item, num|
        if item == :number
          charlotte << game_hash[:away][:players][name][:number]
        end
      end
    end
    charlotte
  end
end

def player_stats(name)
  if game_hash[:home][:players].include?(name)
     game_hash[:home][:players][name]
  elsif game_hash[:away][:players].include?(name)
  game_hash[:away][:players][name]
end
end

def big_shoe_rebounds
  shoe_rebounds = {:size => [], :bounds => []}

  brooklyn = (game_hash[:home][:players].each do |name, stats|
   stats.each do |item, num|
     if item == :shoe
       shoe_rebounds[:size].push(game_hash[:home][:players][name][:shoe])
     end
   end
 end)

   charlotte = (game_hash[:away][:players].each do |name, stats|
    stats.each do |item, num|
      if item == :shoe
        shoe_rebounds[:size].push(game_hash[:away][:players][name][:shoe])
      end
    end
  end)

  brooklyn_bounds = (game_hash[:home][:players].each do |name, stats|
   stats.each do |item, num|
     if item == :rebounds
       shoe_rebounds[:bounds].push(game_hash[:home][:players][name][:rebounds])
     end
   end
 end)

  charlotte_bounds = (game_hash[:away][:players].each do |name, stats|
   stats.each do |item, num|
     if item == :rebounds
        shoe_rebounds[:bounds].push(game_hash[:away][:players][name][:rebounds])
     end
   end
 end)
 shoe_rebounds[:bounds][(shoe_rebounds[:size].index(shoe_rebounds[:size].max))]
end
