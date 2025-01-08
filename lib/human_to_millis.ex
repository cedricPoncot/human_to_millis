defmodule HumanToMillis do
  @moduledoc """
  A module to parse human-readable time intervals into milliseconds.
  """

  @units %{
    "second" => 1_000,
    "minute" => 60_000,
    "hour" => 3_600_000,
    "day" => 86_400_000,
    "week" => 604_800_000,
    "month" => 2_592_000_000,
    "year" => 31_536_000_000
  }

  @doc """
  Parses a human-readable time interval and converts it into milliseconds.

  ## Examples

      iex> HumanToMillis.parse("1.5 minutes")
      90000

      iex> HumanToMillis.parse("3 days and 4 hours")
      273600000

      iex> HumanToMillis.parse("3 days, 4 hours and 36 seconds")
      273636000

      iex> HumanToMillis.parse("4 months, 3 days, 5 hours and forty-five seconds")
      ** (ArgumentError) Invalid format: "forty-five seconds"
  """
  @spec parse(String.t()) :: integer()
  def parse(input) do
    input
    |> String.downcase()
    |> String.replace(~r/[,\s]+and[,\s]+/, " and ")
    |> String.replace(~r/,\s*/, ", ")
    |> String.split([", ", " and "], trim: true)
    |> Enum.map(&parse_component/1)
    |> Enum.sum()
  end

  defp parse_component(component) do
    case Regex.run(~r/^([\d\.]+)\s*([a-z]+)$/i, component) do
      [_, value, unit] ->
        unit = String.trim_trailing(unit, "s")

        case Map.get(@units, unit) do
          nil -> raise ArgumentError, "Unknown unit: \"#{unit}\""
          multiplier ->
            case Float.parse(value) do
              {f, _} -> trunc(f * multiplier)
              :error -> raise ArgumentError, "Invalid value: \"#{value}\""
            end
        end

      _ ->
        raise ArgumentError, "Invalid format: \"#{component}\""
    end
  end
end
