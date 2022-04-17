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
        height: 3,
        outline_char: "X",
        width: 3,
        x: 0,
        y: 0
      })
      |> Canvas.Rectangles.create_rectangle()

    rectangle
  end
end
