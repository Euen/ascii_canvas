defmodule Canvas.CanvasTest do
  use Canvas.DataCase

  alias Canvas.Rectangles.Rectangle

  test "draw a new rectangle with valid parameters" do
    valid_params = [
      %{x: 2, y: 3, width: 20, height: 5, fill: "X"},
      %{x: 2, y: 3, width: 20, height: 5, line: "@"}
    ]

    Enum.each(valid_params, fn params ->
      assert {:ok, %Rectangle{}} = Canvas.draw_rectangle(params)
    end)
  end
end
