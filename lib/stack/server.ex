defmodule Stack.Server do
  use GenServer
  alias Stack.Impl

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
