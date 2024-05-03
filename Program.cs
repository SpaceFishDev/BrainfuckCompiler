public static class Program
{
    public static string help_message = "HELP:\t(Not case sensitive)\nUSAGE:\tCMD\t[ARGS]\n\nHELP:\tprints this help message\nHELP\n\nCOMP:\tCompiles given file\nCOMP\t[FILE]\t[OUTPUT]\n\nINT:\tInterprets given file\nINT\t[FILE]\n";
    public static void Help()
    {
        Console.WriteLine(help_message);
    }
    public static void HandleArgs(string[] args)
    {
        if (args.Length == 0)
        {
            Help();
            return;
        }
        args.Select(a => a.ToLower());
        switch (args[0])
        {
            case "help":
                {
                    Help();
                    return;
                }
            case "comp":
                {
                    if (args.Length < 3)
                    {
                        Console.WriteLine("NOT ENOUGH ARGS.\n~~~~~~~~~~~~~~~~~~~~~~~\n");
                        Help();
                        return;
                    }
                    if (!File.Exists(args[1]))
                    {
                        Console.WriteLine($"File '{args[1]}' does not exist.");
                        return;
                    }
                    string src = File.ReadAllText(args[1]);
                    Compiler comp = new(src);
                    File.WriteAllText("out.asm", comp.Out);
                    Console.WriteLine("Compiled to Assembly! Now fasm will do the rest.");
                    System.Diagnostics.Process.Start("fasm", "out.asm");
                    Thread.Sleep(400);
                    FileInfo f = new("out");
                    if (!File.Exists(args[2]))
                    {
                        f.MoveTo(args[2]);
                    }
                    else
                    {
                        FileInfo f2 = new(args[2]);
                        f2.Delete();
                        f.MoveTo(args[2]);
                    }
                    System.Diagnostics.Process.Start("chmod", $"+x {args[2]}");
                    return;
                }
            case "int":
                {
                    if (args.Length < 2)
                    {
                        Console.WriteLine("NOT ENOUGH ARGS.\n~~~~~~~~~~~~~~~~~~~~~~~\n");
                        Help();
                        return;
                    }
                    if (!File.Exists(args[1]))
                    {
                        Console.WriteLine($"File '{args[1]}' does not exist.");
                        return;
                    }
                    string src = File.ReadAllText(args[1]);
                    Interpreter interpreter = new(src);
                    interpreter.Interpret();
                    return;
                }
            default:
                {
                    Help();
                    return;
                }
        }

    }
    public static void Main(string[] args)
    {
        HandleArgs(args);
    }
}