defmodule NameBadge do
  def print(id, name, department) do
    badge = if id == nil, do: "#{name}", else: "[#{id}] - #{name}"
    badge <> if department == nil, do: " - OWNER", else: " - #{String.upcase(department)}"
  end
end
