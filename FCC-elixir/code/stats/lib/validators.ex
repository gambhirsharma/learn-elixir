defmodule Stats.Validators do
alias Stats.Error

  @spec validate_num([number()]) :: {boolean(), [number()]} | {atom(), String.t()}
  def validate_num(nums) when is_list(nums) do
    # {false, nums}
    {Enum.all?(nums, fn el -> is_number(el) end), nums}
  end

  def validate_num(_), do: Error.invalid_data_type()
end
