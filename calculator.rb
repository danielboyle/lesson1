def prompt(msg)
  puts "=> #{msg}"
end

loop do
  prompt "Please enter your first number"
  num1 = gets.chomp

  prompt "Please enter your second number"
  num2 = gets.chomp

  prompt "1) add 2) subtract 3) multiply 4) divide"
  operation = gets.chomp

  case operation
  when "1", "add" 
    result = num1.to_i + num2.to_i
    prompt "#{num1} + #{num2} = #{result}"
  when "2", "subtract"
    result = num1.to_i - num2.to_i
    prompt "#{num1} - #{num2} = #{result}"
  when "3", "multiply"
    result = num1.to_i * num2.to_i
    prompt "#{num1} * #{num2} = #{result}"
  when "4", "divide"
    result = num1.to_f / num2.to_f
    prompt "#{num1} / #{num2} = #{result}"
  else
    prompt "ERROR. Please try again"
  end

  prompt "Would you like to calculate again, Y or N ?"
  calculate_again = gets.chomp
  break if calculate_again.downcase == "n"

end