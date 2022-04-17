defmodule Canvas.Render do
  alias Canvas.Rectangles.Rectangle

  @doc """
  It takes a list of `Rectangle` and draws them on a canvas of fixed size.
  The last Rectangles are going to appear over the first ones if they overlap.
  """
  @spec rectangles([Rectangle.t()]) :: binary
  def rectangles(rectangles) do
    empty_canvas = new_canvas()

    canvas =
      Enum.reduce(rectangles, empty_canvas, fn rectangle, canvas ->
        rectangle
        |> render_rectangle()
        |> put_in_canvas(rectangle, canvas)
      end)

    Enum.join(canvas)
  end

  defp new_canvas() do
    max_width = Canvas.config([:canvas_max_width])
    max_height = Canvas.config([:canvas_max_height]) - 1

    Enum.reduce(0..max_height, [], fn _, canvas ->
      [List.duplicate("&nbsp;", max_width) ++ ["\n"] | canvas]
    end)
  end

  defp render_rectangle(rectangle) do
    outline_char = outline_char(rectangle)
    fill_char = fill_char(rectangle)
    height = rectangle.height - 1
    width = rectangle.width

    Enum.reduce(0..height, [], fn row, rectangle ->
      case row do
        0 ->
          [List.duplicate(outline_char, width) | rectangle]

        ^height ->
          [List.duplicate(outline_char, width) | rectangle]

        _ ->
          content_row =
            [outline_char] ++
              List.duplicate(fill_char, width - 2) ++
              ["#{outline_char}"]

          [content_row | rectangle]
      end
    end)
  end

  defp put_in_canvas(rectangle_draw, rectangle, canvas) do
    # Every time we involve width or height to calculate an index position
    # we need to substract one since the indexes start from cero.
    start_draw_row = rectangle.y
    end_draw_row = start_draw_row + rectangle.height - 1
    start_draw_col = rectangle.x
    end_draw_col = start_draw_col + rectangle.width - 1
    end_canvas_col = Canvas.config([:canvas_max_width]) - 1

    Enum.with_index(canvas)
    |> Enum.reduce({[], 0}, fn {canvas_row, canvas_row_index}, {new_canvas, rectangle_row} ->
      case canvas_row_index do
        row when row >= start_draw_row and row <= end_draw_row ->
          new_canvas_row =
            Enum.slice(canvas_row, 0, start_draw_col) ++
              Enum.at(rectangle_draw, rectangle_row) ++
              Enum.slice(canvas_row, end_draw_col + 1, end_canvas_col)

          {[new_canvas_row | new_canvas], rectangle_row + 1}

        _ ->
          {[canvas_row | new_canvas], rectangle_row}
      end
    end)
    |> elem(0)
    |> Enum.reverse()
  end

  defp outline_char(%{outline_char: char}) when char != nil, do: char
  defp outline_char(%{fill_char: char}), do: char

  defp fill_char(%{fill_char: char}) when char != nil, do: char
  defp fill_char(_), do: "&nbsp;"
end
