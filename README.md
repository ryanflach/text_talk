# TextTalk

A simple Elixir command line REPL that takes user input and outputs speech.

The program will default to the voice of 'Junior'. A different voice can be specified by separating the text to speak with `|`.

Example use of default voice:
```
> What would you like me to repeat ('exit' to quit)?
hello
```

Example use of specified voice:
```
> What would you like me to repeat ('exit' to quit)?
hello | boing
```

Please see below for a full list of available voices.

The program can be exited at any time with `exit` or `control + C` twice.

## Usage

Clone the application
```
$ git clone git@github.com:ryanflach/text_talk.git
```
`cd` into the directory and compile
```
$ cd text_talk
$ mix compile
```
Launch the application
```
$ mix run
```

### Available voices
Female Voices
- Agnes
- Kathy
- Princess
- Vicki
- Victoria

Male Voices
- Alex
- Bruce
- Fred
- Junior
- Ralph

Novelty Voices
- Albert
- Bad News
- Bahh
- Bells
- Boing
- Bubbles
- Cellos
- Deranged
- Good News
- Hysterical
- Pipe Organ
- Trinoids
- Whisper
- Zarvox
