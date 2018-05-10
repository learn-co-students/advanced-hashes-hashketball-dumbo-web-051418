# Write your code here!
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson":{
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Brook Lopez":{
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Reggie Evans":{
          :number =>30,
          :shoe =>14,
          :points =>12,
          :rebounds =>12,
          :assists =>12,
          :steals =>12,
          :blocks =>12,
          :slam_dunks =>7
        },
        "Mason Plumlee":{
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry":{
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
        "Jeff Adrien":{
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo":{
          :number => 0,
          :shoe =>16,
          :points =>12,
          :rebounds =>4,
          :assists =>7,
          :steals =>7,
          :blocks =>15,
          :slam_dunks =>10
        },
        "DeSagna Diop":{
          :number =>2,
          :shoe =>14,
          :points =>24,
          :rebounds =>12,
          :assists =>12,
          :steals =>4,
          :blocks =>5,
          :slam_dunks =>5
        },
        "Ben Gordon":{
          :number =>8,
          :shoe =>15,
          :points =>33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks =>1,
          :slam_dunks =>0
        },
        "Brendan Haywood":{
          :number =>33,
          :shoe =>15,
          :points =>6,
          :rebounds =>12,
          :assists =>12,
          :steals =>22,
          :blocks =>5,
          :slam_dunks =>12
        }
      }
    }
  }
  game
end

def num_points_scored(players_name)
  num_points = 0
  hash = game_hash
  hash.each do |team, val|
    if val[:players].has_key?(players_name.to_sym)
      num_points = val[:players][players_name.to_sym][:points]
    end
  end
  num_points
end

def shoe_size(players_name)
  shoe_size = 0
  hash = game_hash
  hash.each do |team, val|
    if val[:players].has_key?(players_name.to_sym)
      shoe_size = val[:players][players_name.to_sym][:shoe]
    end
  end
  shoe_size
end

def team_colors(team_name)
  hash = game_hash
  team_colors = []
  hash.each do |team, val|
    if val[:team_name] == team_name
      team_colors = val[:colors]
    end
  end
  team_colors
end

def team_names
  team_names = []
  hash = game_hash
  hash.values.each do |val|
    team_names << val[:team_name]
  end
  team_names
end

def player_numbers(team_name)
  player_nums = []
  hash = game_hash
  hash.values.each do |val|
    if val[:team_name] == team_name
      val[:players].values.each do |player|
        player_nums << player[:number]
      end
    end
  end
  player_nums
end

def player_stats(player_name)
  stats = {}
  hash = game_hash
  hash.each do |team, val|
    if val[:players].has_key?(player_name.to_sym)
      stats = val[:players][player_name.to_sym]
    end
  end
  stats
end

def big_shoe_rebounds
  lrg_shoe_size = 0
  rebounds = 0
  hash = game_hash
  hash.values.each do |val|
    val[:players].values.each do |player_stat|
      if player_stat[:shoe] > lrg_shoe_size
        lrg_shoe_size = player_stat[:shoe]
        rebounds = player_stat[:rebounds]
      end
    end
  end
  rebounds
end