defmodule TextTalk.Speech do
  @doc """
  Takes an input from the user and sends to process. An input without
  a second argument specified (via `|`) will use the default voice of
  Junior when spoken through private method `speak/2`. An input of
  `exit` (case insensitive) will exit the program.
  """
  def get_input do
    IO.puts "Note: To specify a voice, pass it as a second argument after '|'"
    IO.puts "For example, 'hello | Boing' would say hello in the Boing voice.\n\n"
    line = IO.gets "What would you like me to repeat ('exit' to quit)?\n"
    process_input(line)
  end

  defp process_input(input) do
    line = String.split(input, "|")
           |> Enum.map(fn(x) -> String.trim(x) end)

    if String.downcase(hd(line)) == "exit" do
      exit_program
    end

    send_to_speech(line)
  end

  defp send_to_speech(line) when length(line) < 2 do
    speak(hd(line))
    get_input
  end

  defp send_to_speech(line) do
    speak(hd(line), tl(line))
    get_input
  end

  defp speak(line, voice \\ "Junior") do
    System.cmd "say", ["-v#{voice}", line]
    {:ok, voice, line}
  end

  defp exit_program do
    IO.puts "Goodbye!"
    System.halt(0)
  end
end
