defmodule Stack.Application do
  use Application

  def start(_type, stack) do
    children = [
      { Stack.Stash, stack },
      { Stack.Server, nil }
    ]

    options = [strategy: :rest_for_one, name: Stack.Supervisor]

    Supervisor.start_link(children, options)
  end
end
