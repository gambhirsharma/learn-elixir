defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}

  # def population_mean(nums), do: Mean.population_mean(nums)
  defdelegate population_mean(nums), to: Mean # this line does same thing as the above code does.

  defdelegate sample_mean(nums), to: Mean

  defdelegate median(num_list), to: Median

  defdelegate mode(num_list), to: Mode
end
