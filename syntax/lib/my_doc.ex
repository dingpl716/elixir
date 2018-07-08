defmodule My.Doc do
  @moduledoc """
    This is a sample moudle document.
  """

  @doc """
    This method calculates the sum of two numbers.
    This is a sample method document.
    This is also a sample doctest.

  ## Examples

      iex> My.Doc.sum(1, 2)
      3

  """
  def sum(a, b), do: a + b
end
