defmodule SpaceAge do
  @earth_year 31557600
  @planets %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """

  def age_on(planet, seconds) do
    case Map.get(@planets, planet) do
      nil -> {:error, "not a planet"}
      ratio ->
        earth_age = seconds / @earth_year
        {:ok, earth_age / ratio |> Float.round(2)}
    end
  end

end
