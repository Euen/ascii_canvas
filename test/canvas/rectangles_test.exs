defmodule Canvas.RectanglesTest do
  use Canvas.DataCase

  alias Canvas.Rectangles

  describe "rectangles" do
    alias Canvas.Rectangles.Rectangle

    import Canvas.RectanglesFixtures

    test "list_rectangles/0 returns all rectangles" do
      rectangle = rectangle_fixture()
      assert Rectangles.list_rectangles() == [rectangle]
    end

    test "create_rectangle/1 with valid data creates a rectangle" do
      valid_attrs = %{fill_char: "@", height: 3, outline_char: "X", width: 3, x: 0, y: 0}

      assert {:ok, %Rectangle{} = rectangle} = Rectangles.create_rectangle(valid_attrs)
      assert rectangle.fill_char == "@"
      assert rectangle.height == 3
      assert rectangle.outline_char == "X"
      assert rectangle.width == 3
      assert rectangle.x == 0
      assert rectangle.y == 0
    end

    test "create_rectangle/1 with valid data but fill_char missing creates a rectangle" do
      valid_attrs = %{height: 3, outline_char: "X", width: 3, x: 0, y: 0}

      assert {:ok, %Rectangle{} = rectangle} = Rectangles.create_rectangle(valid_attrs)
      assert rectangle.fill_char == nil
      assert rectangle.height == 3
      assert rectangle.outline_char == "X"
      assert rectangle.width == 3
      assert rectangle.x == 0
      assert rectangle.y == 0
    end

    test "create_rectangle/1 with valid data but outline_char missing creates a rectangle" do
      valid_attrs = %{height: 3, fill_char: "X", width: 3, x: 0, y: 0}

      assert {:ok, %Rectangle{} = rectangle} = Rectangles.create_rectangle(valid_attrs)
      assert rectangle.fill_char == "X"
      assert rectangle.height == 3
      assert rectangle.outline_char == nil
      assert rectangle.width == 3
      assert rectangle.x == 0
      assert rectangle.y == 0
    end

    test "create_rectangle/1 with invalid data returns error changeset" do
      max_width = Canvas.config([:canvas_max_width])
      max_height = Canvas.config([:canvas_max_height])
      invalid_convinations = [
        %{fill_char: "12", height: 3, outline_char: "X", width: 3, x: 3, y: 3},
        %{fill_char: "@", height: max_height + 1, outline_char: "X", width: 3, x: 3, y: 3},
        %{fill_char: "@", height: 3, outline_char: "12", width: 3, x: 3, y: 3},
        %{fill_char: "@", height: 3, outline_char: "X", width: max_width + 1, x: 3, y: 3},
        %{fill_char: "@", height: 3, outline_char: "X", width: 3, x: max_width + 1, y: 3},
        %{fill_char: "@", height: 3, outline_char: "X", width: 3, x: 3, y: max_height + 1},
        %{height: 3, width: 3, x: 3, y: 3},
        # Drawing rectangles outside the canvas
        %{fill_char: ".", height: 3, width: 3, x: 3, y: max_height - 2},
        %{fill_char: ".", height: 3, width: 3, x: max_width - 2, y: 3},
        %{fill_char: ".", height: 3, width: 6, x: max_width - 4, y: 3},
        %{fill_char: ".", height: 6, width: 3, x: 3, y: max_height - 4}
      ]
      Enum.each(invalid_convinations, fn invalid_attrs ->
        assert {:error, %Ecto.Changeset{}} = Rectangles.create_rectangle(invalid_attrs)
      end)
    end
  end
end
