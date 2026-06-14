defmodule Username do
  def sanitize(username) do
    username
    # 1. Start with an empty charlist (~c""), NOT a string ("")
    |> Enum.reduce(~c"", fn char, acc ->
      case char do
        # Use standard comparison guards for ranges
        c when c in ?a..?z -> [c | acc]
        ?_ -> [?_ | acc]
        ?ä -> ~c"ea" ++ acc
        ?ö -> ~c"eo" ++ acc
        ?ü -> ~c"eu" ++ acc
        ?ß -> ~c"ss" ++ acc
        _ -> acc
      end
    end)
    # 2. Reverse it at the end to correct the order
    |> Enum.reverse()
  end
end
