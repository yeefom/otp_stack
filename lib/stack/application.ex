defmodule Stack.Application do
  use Application

  def start(_type, stack) do
    children = [
      { Stack.Server, stack }
    ]

    options = [strategy: :one_for_one, name: Stack.Supervisor]

    Supervisor.start_link(children, options)
  end
end
