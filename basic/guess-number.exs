defmodule GuessNumberGame do
  def start do
    IO.puts("Welcome to the Number Guessing Game!")
    secret_number = :rand.uniform(9)
    IO.puts("the secret number is: #{secret_number}")
    guess(secret_number, 0)
  end

  defp guess(secret_number, attempts) do
    IO.puts("Guess a number between 1 and 9:")
    input = IO.gets("> ")

    case Integer.parse(String.trim(input)) do
      {guess, ""} when guess in 1..9 ->
        attempts = attempts + 1
        check_guess(secret_number, guess, attempts)

      _ ->
        IO.puts("Invalid input. Please enter a number between 1 and 9.")
        guess(secret_number, attempts)
    end
  end

  defp check_guess(secret_number, guess, attempts) do
    if guess == secret_number do
      IO.puts("You, Won!! #{guess} is the correct answer. You gussed in #{attempts} attempts")
    else
      IO.puts("Wrong, try again, It's your #{attempts} try")
      guess(secret_number, attempts)
    end
  end
end

GuessNumberGame.start()
