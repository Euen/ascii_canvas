defmodule Canvas.RenderTest do
  use Canvas.DataCase

  import Canvas.RectanglesFixtures

  alias Canvas.Rectangles.Rectangle
  alias Canvas.Render

  test "render a series of rectangles previously stored" do
    r1 = rectangle_fixture(%{x: 0, y: 0, width: 5, height: 5, outline_char: "@", fill_char: "."})
    r2 = rectangle_fixture(%{x: 2, y: 0, width: 3, height: 3, outline_char: nil, fill_char: "X"})
    r3 = rectangle_fixture(%{x: 0, y: 2, width: 4, height: 3, outline_char: "+", fill_char: "#"})
    rectangles = [r1, r2, r3]

    assert Render.rectangles(rectangles) =~
             "@@XXX\n" <>
               "@.XXX\n" <>
               "++++X\n" <>
               "+##+@\n" <>
               "++++@\n"
  end
end
