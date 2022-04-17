defmodule CanvasWeb.RectangleControllerTest do
  use CanvasWeb.ConnCase

  import Canvas.RectanglesFixtures

  describe "index" do
    test "render all the rectangles", %{conn: conn} do
      conn = get(conn, Routes.rectangle_path(conn, :index))
      assert html_response(conn, 200) =~ "Canvas"
      rectangle_fixture(%{fill_char: "@", height: 3, outline_char: "X", width: 3, x: 0, y: 0})
      conn = get(conn, Routes.rectangle_path(conn, :index))

      assert html_response(conn, 200) =~
               "<div id=\"1\">\n" <>
                 "XXX&nbsp;&nbsp;&nbsp;\n" <>
                 "X@X&nbsp;&nbsp;&nbsp;\n" <>
                 "XXX&nbsp;&nbsp;&nbsp;\n" <>
                 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" <>
                 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\n  " <>
                 "</div>"
    end
  end
end
