defmodule Utils do
  # @fileName "input/input1.txt"

  # @spec read_file(String) :: String
  # def read_file(input) do
  #   input
  #   # |> File.read()
  #   |> case do
  #     {:ok, content} -> content
  #       |> String.trim()
  #     {:error, _err_ess} -> 
  #       IO.puts("Error reading file")
  #       nil
  #   end
  # end

  @spec process(String) :: :error | :ok
  def process(content) do
    # case read_file(input) do
    #   nil ->  :error
      # content  
        [first | rest] = String.split(content, "\n")
        [_n, _m] = String.split(first, " ")
        [banned_word | data] =  rest
        
        Enum.each(data, fn x -> 
          if String.contains?(x, banned_word) do
            IO.puts("Banned")
          else
            IO.puts("SAFE")
          end
        end )
    # end
  end

end

input = IO.read(:stdio, :all)
# IO.puts("this input is: #{input}")
# Utils.read_file(input)
Utils.process(input)
# Utils.read_file()
