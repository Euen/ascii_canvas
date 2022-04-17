defmodule CanvasWeb.RectangleController do
  use CanvasWeb, :controller

  alias Canvas.Rectangles
  # alias Canvas.Rectangles.Rectangle
  alias Canvas.Render

  def index(conn, _params) do
    rectangles = Rectangles.list_rectangles()
    render = Render.rectangles(rectangles)
    render(conn, "index.html", canvas: %{id: 1, render: render})
  end
end
