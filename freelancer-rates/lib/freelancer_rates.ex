defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    discounted_rate = daily_rate(hourly_rate) |> apply_discount(discount)
    discounted_rate * 22 |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    days = budget / (daily_rate(hourly_rate) |> apply_discount(discount))
    Float.floor(days, 1)
  end
end
