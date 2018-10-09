defmodule Stack.Server do
  use GenServer
  alias Stack.Impl

  @server __MODULE__

  def start_link(stack \\ []) do
    GenServer.start_link(@server, stack, name: @server)
  end

  def pop() do
    GenServer.call(@server, :pop)
  end

  def push(item) do
    GenServer.cast(@server, { :push, item })
  end

  # server implementation

  def init(stack) do
    { :ok, stack }
  end

  def handle_call(:pop, _from, stack) do
    { popped, new_stack } = Impl.pop(stack)
    { :reply, popped, new_stack }
  end

  def handle_cast({ :push, item }, stack) do
    { :noreply, Impl.push(stack, item) }
  end

  def terminate(reason, _stack) do
    { :reply, reason }
  end
end
