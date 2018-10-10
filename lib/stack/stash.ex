defmodule Stack.Stash do
  use GenServer

  @server __MODULE__

  def start_link(init_data \\ []) do
    GenServer.start_link(@server, init_data, name: @server)
  end

  def get do
    GenServer.call(@server, :get)
  end

  def update(data) do
    GenServer.cast(@server, { :update, data })
  end

  # GenServer implementation

  def init(init_data) do
    { :ok, init_data }
  end

  def handle_call(:get, _from, current_stash) do
    { :reply, current_stash, current_stash }
  end

  def handle_cast({ :update, new_stash }, _current_stash) do
    { :noreply, new_stash }
  end
end
