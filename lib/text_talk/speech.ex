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
    IO.gets("What would you like me to say ('exit' to quit)?\n")
      |> process_input
    get_input
  end

  defp process_input(input) do
    input
      |> String.downcase
      |> String.split("|")
      |> Enum.map(&String.trim/1)
      |> send_to_speech
  end

  defp send_to_speech(["exit" | _]), do: exit_program

  defp send_to_speech([text]), do: speak(text)

  defp send_to_speech([text, voice | _]), do: speak(text, voice)

  defp speak(line, voice \\ "Junior") do
    System.cmd "say", ["-v#{voice}", line]
    {:ok, voice, line}
  end

  defp exit_program do
    IO.puts "Goodbye!"
    System.halt(0)
  end
end
