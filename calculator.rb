# Simple Calculator
# Daniel Boyle

# Functions
def prompt(msg)
  puts "=> #{msg}"
end

def get_num
  prompt "Please enter a number"
  num = gets.chomp
end

# Calculator
loop do
  # Get user input
  num1 = get_num
  prompt "1) add 2) subtract 3) multiply 4) divide"
  operation = gets.chomp
  num2 = get_num
  # Perform calculation
  case operation
  when "1", "add", "plus", "+"
    result = num1.to_i + num2.to_i
    prompt "#{num1} + #{num2} = #{result}"

  when "2", "subtract", "minus", "-"
    result = num1.to_i - num2.to_i
    prompt "#{num1} - #{num2} = #{result}"

  when "3", "multiply", "times", "*"
    result = num1.to_i * num2.to_i
    prompt "#{num1} * #{num2} = #{result}"

  when "4", "divide", "divided by", "/"
    result = num1.to_f / num2.to_f
    prompt "#{num1} / #{num2} = #{result}"
    if num2 == "0"
      prompt "ERROR. Cannot divide by 0."
    end

  else
    prompt "ERROR. Please try again"
  end
  # Prompt user to calculate again
  prompt "Would you like to calculate again, Y or N ?"
  calculate_again = gets.chomp
  break if calculate_again.downcase == "n"

end