public class Interpreter
{
    private string Source = "";
    private List<Token> Tokens;
    private int Pos = 1024;
    private List<int> mem;
    public Interpreter(string source)
    {
        mem = new();
        for (int i = 0; i < 1024 * 1024; ++i)
        {
            mem.Add(0);
        }
        Source = source;
        Tokens = new();
        Tokenizer t = new(source);
        Tokens = t.Tokens;
    }
    public void Interpret()
    {
        int i = 0;
        Stack<int> stack = new();
        while (i < Tokens.Count)
        {
            switch (Tokens[i].Type)
            {
                case "+":
                    {
                        mem[Pos] += Tokens[i].Repititions;
                        ++i;
                    }
                    break;
                case "-":
                    {
                        mem[Pos] -= Tokens[i].Repititions;
                        ++i;
                    }
                    break;
                case ">":
                    {
                        Pos += Tokens[i].Repititions;
                        ++i;
                    }
                    break;
                case "<":
                    {
                        Pos -= Tokens[i].Repititions;
                        ++i;
                    }
                    break;
                case "[":
                    {
                        stack.Push(i);
                        ++i;
                    }
                    break;
                case "]":
                    {
                        if (mem[Pos] == 0)
                        {
                            stack.Pop();
                            ++i;
                        }
                        else
                        {
                            i = stack.Peek();
                            ++i;
                        }
                    }
                    break;
                case ".":
                    {
                        Console.Write((char)mem[Pos]);
                        ++i;
                    }
                    break;
                case ",":
                    {
                        char c = (char)Console.Read();
                        mem[Pos] = (int)c;
                        ++i;
                    }
                    break;
            }
        }
    }
}
