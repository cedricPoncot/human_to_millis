defmodule HumanToMillisTest do
  use ExUnit.Case

  alias HumanToMillis

  test "parses single unit intervals" do
    assert HumanToMillis.parse("1.5 minutes") == 90_000
    assert HumanToMillis.parse("2 hours") == 7_200_000
    assert HumanToMillis.parse("3 days") == 259_200_000
  end

  test "parses combined intervals" do
    assert HumanToMillis.parse("3 days and 4 hours") == 273_600_000
    assert HumanToMillis.parse("3 days, 4 hours and 36 seconds") == 273_636_000
    assert HumanToMillis.parse("1 week, 2 days and 3 hours") == 788_400_000
  end

  test "raises errors for invalid formats" do
    assert_raise ArgumentError, ~r/Invalid format/, fn ->
      HumanToMillis.parse("five minutes")
    end

    assert_raise ArgumentError, ~r/Unknown unit/, fn ->
      HumanToMillis.parse("3 cats")
    end

    assert_raise ArgumentError, ~r/Invalid format/, fn ->
      HumanToMillis.parse("4 months and forty-five seconds")
    end
  end
end
