# Canvas

## API
### clear_canvas/0
`@spec clear_canvas() :: :ok`

  Used to erase all the drawings and leave an empy canvas.
  
### draw_rectangle/1 
` @spec draw_rectangle(map) :: {:ok, Rectangle.t()} | {:error, Ecto.Changeset.t()}`

  It create and store a new `Rectangle` in the DB which will be rendered on the next page load.

  **Attributes**
  - `x` :integer, the horizontal position of the top right corner of the rectangle, **Required**
  - `y` :integer, the vertical position of the top right corner of the rectangle, **Required**
  - `width` :integer, the width of the rectangle, **Required**
  - `height` :integer, the height of the rectangle, **Required**
  - `fill_char` :string, the character to fill the rectangle with
  - `outline_char` :string, the character to draw the outline of the rectangle

  **Note:** Either `fill_char` or `outline_char` should be specifyed.

    ## Examples

      iex> Canvas.draw_rectangle(%{x: 2, y: 0, width: 3, height: 5, fill_char: ".", outline_char: "X"})


## Sample Usage
To generate the next canvas follow the next steps:

![Screenshot from 2022-04-17 03-20-45](https://user-images.githubusercontent.com/1340695/163703208-b6b6bf78-e88e-428e-a69b-c49e0c68d072.png)


1. Start the server in interactive mode `iex -S mix phx.server`
2. visit [`localhost:4000`](http://localhost:4000) to see an empty canvas
3. to create the first `Rectangle`s go back to the terminal and run the following commands.
```
iex> Canvas.draw_rectangle(%{x: 0, y: 10, width: 8, height: 4, outline_char: "O"})
{:ok, %Canvas.Rectangles.Rectangle{ ... }}

iex> Canvas.draw_rectangle(%{x: 5, y: 12, width: 5, height: 3, fill_char: "X", outline_char: "X" })   
{:ok, %Canvas.Rectangles.Rectangle{ ... }}

iex> Canvas.draw_rectangle(%{x: 15, y: 3, width: 7, height: 6, fill_char: "." })                    
{:ok, %Canvas.Rectangles.Rectangle{ ... }}
```
4. reload the page and the `Rectangles` should be rendered in the canvas.

## Docs

To generate the API documentation files:
```
> mix deps.get
...

> mix docs
```
Later you can acces to your doc/Canvas.html 
