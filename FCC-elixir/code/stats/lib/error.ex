defmodule Stats.Error do
  @spec invalid_data_type() :: {atom(), String.t()}
  def invalid_data_type(), do: {:error, "Invalid Data Type"}
end
