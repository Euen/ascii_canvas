defmodule CanvasWeb.RectangleControllerTest do
  use CanvasWeb.ConnCase

  import Canvas.RectanglesFixtures

  describe "index" do
    test "render all the rectangles", %{conn: conn} do
      Canvas.clear_canvas()
      conn = get(conn, Routes.rectangle_path(conn, :index))
      assert html_response(conn, 200) =~ "Canvas"
      rectangle_fixture(%{fill_char: ".", outline_char: ".", height: 5, width: 5, x: 0, y: 0})
      rectangle_fixture(%{fill_char: "@", outline_char: "X", height: 3, width: 3, x: 0, y: 0})
      conn = get(conn, Routes.rectangle_path(conn, :index))

      assert html_response(conn, 200) =~
               "XXX..\n" <>
                 "X@X..\n" <>
                 "XXX..\n" <>
                 ".....\n" <>
                 "....."
    end
  end
end
