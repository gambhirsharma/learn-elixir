defmodule Example do
  use Application
  # alias UUID
  # @x 20

  def start(_type, _args) do
    # using UUID
    # IO.puts(UUID.uuid4)

    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Gambhir"
    status = Enum.random([:gold, :silver, :bronze])

    if status === :gold do
      IO.puts("Welcome to the fancy lounge, #{name}")
    else
      IO.puts("you lose")
    end
  end
end
