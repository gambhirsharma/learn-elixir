
There are two file extension for elixir: 
- `ex` use for most of the time. Used in production
- `exs` is script file. Most used for dev don't go to production

---
There are mainly two way to execute `exs` elixir script files: 

- `elixir`
- `iex`


### elixir

This will compile and execute the file.`exs` file without creating the compiled file.

```hello.exs
defmodule Hello do
  def world do
    IO.puts("Hello, World!") 
  end
end
```
```terminal
elixir hello.exs
```
> This is will only compile the file not execute it. 
You need to call the function to execute it. Shown below

```hello.exs
...
Hello.world()
...
```

- elixirc

This command will compile the `exs` file and create a `Elixir.Hello.beam` file. 
`Elixir.<file-name>.beam`


### iex

`iex` is elixir in interactive shell. We mostly use it to execute elixir code.

```terminal
iex> c "hello.exs" 
[Hello]
```
compile elixir code similar to `elixirc`

```terminal
iex> r "hello.exs" 
```
recompile elixir code
