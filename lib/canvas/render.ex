defmodule Canvas.Render do
  def rectangles(rectangles) do
    IO.inspect(rectangles)
    new_canvas()
    # Enum.reduce(rectangles, empty_canvas, fn rectangle, canvas->
    #   rectangle
    #   render_rectangle()
    #   put_in_canvas(canvas)
    # end)
  end

  defp new_canvas() do
    max_width = Canvas.config([:canvas_max_width])
    max_height = Canvas.config([:canvas_max_height])
    horizontal_delimiter = String.duplicate("_", max_width) <> "\n"
    canvas_content = Enum.reduce(0..max_height, "", fn _, canvas ->
      canvas <> String.duplicate(" ", max_width) <> "\n"
    end)

    horizontal_delimiter <> canvas_content <> horizontal_delimiter
  end
end
