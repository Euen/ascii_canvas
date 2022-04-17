# Canvas

## API
- **clear_canvas/0**: Used to erase all the drawings and leave an empy canvas.
- **draw_rectangle/1**: It create and store a new `Rectangle` in the DB which will be rendered on the next page load.

More info about the API and examples can be found [here](doc/Canvas.html)

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


