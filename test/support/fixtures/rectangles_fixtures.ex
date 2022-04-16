defmodule Canvas.RectanglesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Canvas.Rectangles` context.
  """

  @doc """
  Generate a Rectangle.
  """
  def rectangle_fixture(attrs \\ %{}) do
    {:ok, rectangle} =
      attrs
      |> Enum.into(%{
        fill_char: "@",
        height: 42,
        outline_char: "X",
        width: 42,
        x: 42,
        y: 42
      })
      |> Canvas.Rectangles.create_rectangle()

    rectangle
  end
end
