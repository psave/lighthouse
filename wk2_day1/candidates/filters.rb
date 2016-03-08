# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
# require 'active_support/all'

def find(id)
  raise '@candidates must be an Array' if @candidates.nil?
  @candidates.find { |candidate| candidate[:id] == id}
  #candidates = @candidates.find { |candidate| candidate[:id] == id}
  #binding.pry
end


def experienced?(candidate, years)
  unless candidate.has_key?(:years_of_experience)
    raise ArgumentError, 'candidate must have a :years_of_experience key'
  end
  if candidate[:years_of_experience] >= years
    true
  else
    false
  end
end

def experienced_candidates(years)
  return_list = []
  @candidates.each do |candidate|
    return_list << candidate if experienced?(candidate, years)
  end
  return return_list
end

# More methods will go below
def github_points(candidate, points)
  if candidate[:github_points] >= points
    true
  else
    false
  end
end

def knows_required_languages(candidate, language1, language2)
  if candidate[:languages].include?(language1) || candidate[:languages].include?(language2)
    true
  else
    false
  end
end

def applied_recently?(candidate, applied_within_days)
  if (Date.today - candidate[:date_applied] ).to_i <= applied_within_days
    true
  else
    false
  end
end

def old_enough?(candidate, age_at_least)
  if candidate[:age] >= age_at_least
    true
  else
    false
  end
end

def qualified_candidates(candidates)
  candidates.find_all {|candidate| 
    experienced?(candidate, @years) && 
    github_points(candidate, @points) && 
    knows_required_languages(candidate, @language1, @language2) &&
    applied_recently?(candidate, @applied_within_days) &&
    old_enough?(candidate, @age_at_least)
  }
end

def ordered_by_qualifications(candidates)
  # first_sort = qualified_candidates(candidates).sort { |candidate1, candidate2| candidate2[:years_of_experience] <=> candidate1[:years_of_experience]}
  # second_sort = first_sort.sort { |candidate1, candidate2| candidate2[:github_points] <=> candidate1[:github_points]}
  # return second_sort
  return qualified_candidates(candidates).sort_by{ |candidate| [-candidate[:years_of_experience], -candidate[:github_points]]}
end

#p qualified_candidates(years, points, language1, language2, applied_within_days, age_at_least)
#p qualified_candidates(2, 200, 'Python', 'Ruby', 15, 18)
# def qualified_candidates(years, points, language1, language2, applied_within_days, age_at_least)
#   # years = 2
#   # points = 200
#   # language1 = 'Python'
#   # language2 = 'Ruby'
#   # applied_within_days = 15
#   # age_at_least = 18
#   @candidates.find_all {|candidate| 
#     experienced?(candidate, years) && 
#     github_points(candidate, points) && 
#     knows_required_languages(candidate, language1, language2) &&
#     applied_recently?(candidate, applied_within_days) &&
#     old_enough?(candidate, age_at_least)
#   }
# end





