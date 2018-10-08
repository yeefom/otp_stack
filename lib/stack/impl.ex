defmodule Stack.Impl do
  def pop(stack) do
    List.pop_at(stack, 0)
  end

  def push(stack, item) do
    [ item | stack ]
  end
end
