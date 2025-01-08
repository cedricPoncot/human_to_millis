# HumanToMillis

HumanToMillis is a simple Elixir library designed to improve code readability by converting human-readable time intervals into milliseconds. It ensures clean, readable code while handling complex time intervals with ease.

## Installation

Add `:human_to_millis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:human_to_millis, "~> 1.0.0"}
  ]
end
```

Then run:

```bash
mix deps.get
```

## Usage

HumanToMillis provides a `parse/1` function that accepts human-readable time intervals and converts them to milliseconds. This is useful for scheduling, time calculations, and other tasks requiring precise time measurements.

### Examples

#### Basic Usage

```elixir
iex> "1.5 minutes" |> HumanToMillis.parse
90000

iex> "3 days and 4 hours" |> HumanToMillis.parse
277200000

iex> HumanToMillis.parse("3 days, 4 hours and 36 seconds")
277236000

iex> HumanToMillis.parse("4 months, 3 days, 5 hours and forty-five seconds")
11027345000
```

### Error Handling

Invalid inputs will raise a descriptive error, ensuring you can quickly identify and correct syntax issues:

```elixir
iex> HumanToMillis.parse("invalid input")
** (RuntimeError) Invalid format: "invalid input"
```


The latter is much easier to read and understand at a glance.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to enhance the functionality of HumanToMillis.

## License

HumanToMillis is released under the [MIT License](LICENSE).

