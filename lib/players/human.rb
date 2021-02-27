module Players
  # class Human inherits from class Player
  class Human < Player

    def move(user_input)
      user_input = gets.strip
    end
  end
end
