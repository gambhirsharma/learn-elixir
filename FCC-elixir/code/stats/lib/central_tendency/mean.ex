defmodule Stats.CentralTendency.Mean do
  # sum (sigma) / count
  alias Stats.{Error, Validators}

  # same as:
  # alias Stats.Error
  # alias Stats.Validators
  # as both are written in a single line

  @spec population_mean([number()]) :: number() | {:atom, String.t()}
  def population_mean([]), do: Error.invalid_data_type()
  def population_mean(nums) when is_list(nums) do
    nums
    |> Validators.validate_num()
    |> cal_population_mean()
  end
  def population_mean(_), do: Error.invalid_data_type()


  # =============================================================

  @spec sample_mean([number()]) :: number() | {:atom, String.t()}
  def sample_mean(nums), do: population_mean(nums)

  # =============================================================

  # @spec validate_num([number()]) :: {boolean(), [number()]}
  # def validate_num(nums) do
  #   # {false, nums}
  #   {Enum.all?(nums, fn el -> is_number(el) end)}
  # end

  # @spec cal_population_mean({boolean(), [number()]}) :: {} | number()

  # =============================================================

  defp cal_population_mean({false, _num}), do: Error.invalid_data_type()
  defp cal_population_mean({true, num}) do
    num
    |> Enum.sum()
    |> mean(Enum.count(num))
  end
  defp mean(sum, count), do: sum / count


end
