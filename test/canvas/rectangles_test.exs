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

    test "get_rectangle!/1 returns the rectangle with given id" do
      rectangle = rectangle_fixture()
      assert Rectangles.get_rectangle!(rectangle.id) == rectangle
    end

    test "create_rectangle/1 with valid data creates a rectangle" do
      valid_attrs = %{fill_char: "@", height: 42, outline_char: "X", width: 42, x: 42, y: 42}

      assert {:ok, %Rectangle{} = rectangle} = Rectangles.create_rectangle(valid_attrs)
      assert rectangle.fill_char == "@"
      assert rectangle.height == 42
      assert rectangle.outline_char == "X"
      assert rectangle.width == 42
      assert rectangle.x == 42
      assert rectangle.y == 42
    end

    test "create_rectangle/1 with invalid data returns error changeset" do
      max_width = Canvas.config([:canvas_max_width])
      max_height = Canvas.config([:canvas_max_height])
      invalid_convinations = [
        %{fill_char: " ", height: 42, outline_char: "X", width: 42, x: 42, y: 42},
        %{fill_char: "@", height: max_height + 1, outline_char: "X", width: 42, x: 42, y: 42},
        %{fill_char: "@", height: 42, outline_char: " ", width: 42, x: 42, y: 42},
        %{fill_char: "@", height: 42, outline_char: "X", width: max_width + 1, x: 42, y: 42},
        %{fill_char: "@", height: 42, outline_char: "X", width: 42, x: max_width + 1, y: 42},
        %{fill_char: "@", height: 42, outline_char: "X", width: 42, x: 42, y: max_height + 1}
      ]
      Enum.each(invalid_convinations, fn invalid_attrs ->
        assert {:error, %Ecto.Changeset{}} = Rectangles.create_rectangle(invalid_attrs)
      end)
    end

    test "change_rectangle/1 returns a Rectangle changeset" do
      rectangle = rectangle_fixture()
      assert %Ecto.Changeset{} = Rectangles.change_rectangle(rectangle)
    end
  end
end
