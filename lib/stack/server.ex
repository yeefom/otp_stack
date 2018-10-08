defmodule Stack.Server do
  use GenServer

  def init(stack \\ []) do
    { :ok, stack }
  end

  def handle_call(:pop, _from, stack) do
    { popped, new_stack } = List.pop_at(stack, 0)
    { :reply, popped, new_stack }
  end

  def handle_cast({ :push, item }, stack) do
    { :noreply, [ item | stack ] }
  end
end
