defmodule ResistorColorDuo do

  def color(:black), do: 0
  def color(:brown), do: 1
  def color(:red), do: 2
  def color(:orange), do: 3
  def color(:yellow), do: 4
  def color(:green), do: 5
  def color(:blue), do: 6
  def color(:violet), do: 7
  def color(:grey), do: 8
  def color(:white), do: 9

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([c1, c2 | _rest]) do
    color(c1) * 10 + color(c2)
  end
end
