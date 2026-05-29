defmodule ResistorColorTrio do
  @ohm_mapping %{
    black: 0, brown: 1, red: 2, orange: 3, yellow: 4,
    green: 5, blue: 6, violet: 7, grey: 8, white: 9
  }
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3 | _tail]) do
    ohms_base = String.to_integer("#{@ohm_mapping[c1]}#{@ohm_mapping[c2]}")
    ohm_tail = Integer.pow(10, @ohm_mapping[c3])
    ohms = to_string(ohms_base) <> cond do
      ohm_tail >= 10 -> Enum.reduce(1..length(to_charlist(ohm_tail))-1,"", fn _char, acc -> acc <> "0" end)
      true -> ""
    end |> String.to_integer()
    format(ohms)
  end

  defp format(ohms) when ohms >= 1_000_000_000, do: {div(ohms, 1_000_000_000), :gigaohms}
  defp format(ohms) when ohms >= 1_000_000, do: {div(ohms, 1_000_000), :megaohms}
  defp format(ohms) when ohms >= 1_000, do: {div(ohms, 1_000), :kiloohms}
  defp format(ohms), do: {ohms, :ohms}
end
