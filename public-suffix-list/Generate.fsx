open System
open System.IO

let publicSuffixListPath = fsi.CommandLineArgs.[1]

let isComment (line : string) =
  line.TrimStart().StartsWith("//")

task {
  use reader = new StreamReader(publicSuffixListPath)
  use writer = new StreamWriter("./Generated.fs")

  do! writer.WriteLineAsync "module PublicSuffixList"
  do! writer.WriteLineAsync ""
  do! writer.WriteLineAsync "let publicSuffixes = "
  do! writer.WriteLineAsync "  [|"

  while reader.Peek () > 0 do
    let! line = reader.ReadLineAsync ()

    if not (String.IsNullOrWhiteSpace line || isComment line) then
      printfn $"{line}"

      let outputLine = $"    \"{line}\""

      do! writer.WriteLineAsync outputLine

  do! writer.WriteLineAsync "  |]"
  do! writer.WriteLineAsync ""

  do! writer.FlushAsync ()
}
|> fun t -> t.Wait()
