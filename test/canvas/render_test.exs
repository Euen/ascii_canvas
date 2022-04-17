defmodule Canvas.RenderTest do
  use Canvas.DataCase

  import Canvas.RectanglesFixtures

  alias Canvas.Rectangles.Rectangle
  alias Canvas.Render

  test "render a series of rectangles previously stored" do
    r1 = rectangle_fixture(%{x: 0, y: 0, width: 6, height: 6, outline_char: "@"})
    r2 = rectangle_fixture(%{x: 2, y: 2, width: 3, height: 3, fill_char: "X"})
    # r3 = rectangle_fixture(%{x: 2, y: 2, width: 4, height: 3, outline_char: ".", fill_char: "#"})
    rectangles = [r1, r2]

    assert Render.rectangles(rectangles) =~
             "@@@@@@\n" <>
             "@XXX@@@\n" <>
             "@X....@@\n" <>
             "@X.##.@@\n" <>
             "@@....@\n"
  end
end
