defmodule TextTalk do
  use Application

  def start(_type, _args) do
    IO.puts "* * * * * * * * *"
    IO.puts "* W E L C O M E *"
    IO.puts "* * * * * * * * *\n"
    TextTalk.Speech.get_input
  end
end
