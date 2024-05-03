public class Compiler
{
    public List<Token> Tokens;
    public string Out = "";
    public Compiler(string Src)
    {
        Tokens = new List<Token>();
        Tokenizer tokenizer = new Tokenizer(Src);
        Tokens = tokenizer.Tokens;
        Compile();
    }
    public void Compile()
    {
        string output = "";
        string start = "format ELF executable\n" +
        "entry start\n" + "segment readable writeable\n" +
        "\tmem rb 1024 * 1024\n" +
        "\tpos dd 0\n" + "segment executable\n" +
        "start:\n";
        string dat = "";
        string end = "";
        Dictionary<string, string> CompileStuff = new Dictionary<string, string>();
        CompileStuff.Add("+", ";ADD\nmov eax, mem\nmov ebx, [pos]\nadd eax, ebx\nmov ebx, REP\nadd [eax], ebx\n");
        CompileStuff.Add("-", ";SUB\nmov eax, mem\nmov ebx, [pos]\nadd eax, ebx\nmov ebx, REP\nsub [eax], ebx\n");
        CompileStuff.Add(">", ";RIGHT\nmov eax, pos\nmov ebx, REP\nadd [eax], ebx\n");
        CompileStuff.Add("<", ";LEFT\nmov eax, pos\nmov ebx, REP\nsub [eax], ebx\n");
        CompileStuff.Add("[", ";loop\nlabelLN:\n");
        CompileStuff.Add("]", ";endloop\nmov ebx, [pos]\nmov eax, mem\nadd eax, ebx\nmov ebx, [eax]\ncmp ebx, 0\njg labelLN\n");
        CompileStuff.Add(".", ";print\nmov eax, mem\nmov ebx, [pos]\nadd eax, ebx\nmov ebx, [eax]\npush ebx\nmov eax, 4\nmov ebx, 1\nmov ecx, esp\nmov edx, 1\nint 0x80\nadd esp, 4\n");
        int ln = 0;
        Stack<string> labels = new();
        foreach (var t in Tokens)
        {
            if (t.Type == "[")
            {
                string lab = ln + "_" + new Random().Next(1, 100000).ToString("");
                labels.Push(lab);
                ++ln;
            }
            if (CompileStuff.ContainsKey(t.Type))
            {
                string currRnd = new Random().Next(1000, 1000000).ToString();
                dat += CompileStuff[t.Type].Replace("REP", t.Repititions.ToString()).Replace("LN", (labels.Count != 0) ? labels.Peek() : "").Replace("RND", currRnd);
            }
            if (t.Type == "]")
            {
                labels.Pop();
                --ln;
            }

        }
        end = "mov eax, 1\n" + "mov ebx, 0\n" + "int 0x80\n";
        output = start + dat + end;
        Out = output;
    }
}
