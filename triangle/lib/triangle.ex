defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a + b + c <= 0, do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) when a < 0 or b < 0 or c < 0, do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) when a + b < c, do: {:error, "side lengths violate triangle inequality"}
  def kind(a, b, c) when b + c < a, do: {:error, "side lengths violate triangle inequality"}
  def kind(a, b, c) when a + c < b, do: {:error, "side lengths violate triangle inequality"}
  def kind(a, b, c) do
    case {a, b, c} do
      {a, a, a} -> {:ok, :equilateral}
      {x, x, _y} -> {:ok, :isosceles}
      {_y, x, x} -> {:ok, :isosceles}
      {x, _y, x} -> {:ok, :isosceles}
      {_a, _b, _c} -> {:ok, :scalene}
    end
  end
end
