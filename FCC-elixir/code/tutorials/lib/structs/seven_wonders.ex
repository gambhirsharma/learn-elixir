defmodule Tutorials.Structs.SevenWonders do
  defstruct name: "", country: ""

  alias Tutorials.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all() :: [t()]

  # ------------------------ all ------------------------
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Great Wall of China", country: "China"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"}
    ]
  end
  # ------------------------ all ------------------------

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    wonders
    |> Enum.each(fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do 
    wonders
    |> Enum.filter(fn %{country: country_name} -> country_name == country end)
  end

  @spec in_countries_starting_with_i([t()]) :: [t()]
  def in_countries_starting_with_i(wonders) do
    wonders
    |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  def sort_by_country_length(wonders) do
    wonders
    |> Enum.sort(fn x,y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list wonders do
    #TODO: [["Taj Mahal", "India"], ["Colosseum", "Italy"]....]
    wonders
    # doing it using into()
    |> Enum.map(fn %{name: monument_name, country: country_name} -> [monument_name, country_name] end)
    |> Enum.into([])

    # doing it using reduce()
    # |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
    # |> Enum.reverse()
  end

  def country_name_keyword_list(wonders) do
    # TODO: [India: "Taj Mahal", China: "Great Wall of China", ...]
    wonders 
    # |> Enum.map(fn %{name: name, country: country} -> {String.to_atom(country), name} end)
    # |> Enum.into([])

    # [{:a, 1}] = [a: 1]
    
    |> Enum.reduce([], fn wonder, acc -> [{String.to_atom(wonder.country), wonder.name} | acc] end)


    
  end

  # -------
  def all_names(wonders) do
    #   Enum.map(wonders, fn wonder -> wonders.name end)

    #   Enum.map(wonders, &(&1.name))

    for %{name: name} <- wonders, do: name
  end
end
