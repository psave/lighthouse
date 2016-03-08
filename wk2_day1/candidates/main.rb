# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'active_support/all'

require 'pry'
require './candidates'
require './filters'



#User factors for sorting
@years = 2
@points = 200
@language1 = 'Ruby'
@language2 = 'Python'
@applied_within_days = 15
@age_at_least = 18


#puts " ~~~~~~~~~~ Items used for Testing ~~~~~~~~~~~~"
## Your test code can go here
# test_candidate =   {
#     id: 5,
#     years_of_experience: 4,
#     github_points: 293,
#     languages: ['C', 'Ruby', 'Python', 'Clojure'],
#     date_applied: 5.days.ago.to_date,
#     age: 26
# }
# p ordered_by_qualifications(@candidates)

#p qualified_candidates(years, points, language1, language2, applied_within_days, age_at_least)
#p qualified_candidates(2, 200, 'Python', 'Ruby', 15, 18)

# p (Date.today - 5.days.ago.to_date).to_i
# p (Date.today - test_candidate[:date_applied]).to_i
# p Date.today
#binding.pry
#pp qualified_candidates
#pp @candidates
# ~~~~~~~~~~~~~~~~~ Testing portion ended ~~~~~~~~~~~~~~

######## Adjust Shakil so that it words for this exercise

def finding_candidates(command)
    flag = true #Sets the flag as true to keep runing through the if statements until it turns false.
    if /find/.match(command)
      puts " Here is a test "
      user_id = /\d+/.match(command)[0].to_i
      puts find(user_id)
    elsif command == "all"
      ########### Get this to work!!!! & put one each on a new line
      output_candidate_collection(experienced_candidates(0))
    elsif command == "qualified"
      ########## Put each candidate on a new line
      output_candidate_collection(ordered_by_qualifications(@candidates))
    elsif command == "quit"
      flag = false
      return false
    end
    if flag == true #Checks to see if the flag is still true in which case it asks the same question again to go through the same set of if statements.
      puts "Enter one of the following commands: "
      puts "\n" + "(1) 'find # : if you enter 'find 1' it returns user with ID = 1"
      puts "(2) 'all' = this returns all the candidates"
      puts "(3) 'qualified' = this returns all the qualified candidates"
      puts "(4) 'quit' = this quits the program"
      puts "\n" + "Enter command: " 
      reply = gets.chomp
      finding_candidates(reply)
    end
    #return false #if I take this one out then I get an infinite loop
end

def output_candidate_collection(candidates)
  candidates.each do |candidate|
    puts prettify_candidate_output(candidate)
  end
end

def prettify_candidate_output(candidate)
  "ID: #{candidate[:id]} - Years Experience: #{candidate[:years_of_experience]} - GitHub Points: #{candidate[:github_points]} - Languages: #{candidate[:languages]} - Date Applied: #{candidate[:date_applied]} - Age: #{candidate[:age]}"
end

puts "Enter one of the following commands: "
puts "\n" + "(1) 'find # : if you enter 'find 1' it returns user with ID = 1"
puts "(2) 'all' = this returns all the candidates"
puts "(3) 'qualified' = this returns all the qualified candidates"
puts "(4) 'quit' = this quits the program"
puts "\n" + "Enter command: " 

reply = gets.chomp

# Run our method
finding_candidates(reply)


# puts "Enter one of the following commands: "
# puts "'find # : if you enter 'find 1' it returns user with ID = 1"
# puts "'all' = this returns all the candidates"
# puts "'qualified' = this returns all the qualified candidates"
# puts "'quit' = this quits the program"
# gets.chomp = user_answer

