public class Tokenizer
{
    public List<Token> Tokens;
    public Tokenizer(string Src)
    {
        Tokens = new List<Token>();
        int i = 0;
        while (i < Src.Length)
        {
            switch (Src[i])
            {
                case '+':
                    {
                        int start = i;
                        while (i < Src.Length && Src[i] == '+')
                        {
                            ++i;
                        }
                        int rep = i - start;
                        Tokens.Add(new("+", rep));
                    }
                    break;
                case '-':
                    {
                        int start = i;
                        while (i < Src.Length && Src[i] == '-')
                        {
                            ++i;
                        }
                        int rep = i - start;
                        Tokens.Add(new("-", rep));
                    }
                    break;
                case '>':
                    {
                        int start = i;
                        while (i < Src.Length && Src[i] == '>')
                        {
                            ++i;
                        }
                        int rep = i - start;
                        Tokens.Add(new(">", rep));
                    }
                    break;
                case '<':
                    {
                        int start = i;
                        while (i < Src.Length && Src[i] == '<')
                        {
                            ++i;
                        }
                        int rep = i - start;
                        Tokens.Add(new("<", rep));
                    }
                    break;
                case '[':
                    {
                        ++i;
                        Tokens.Add(new("[", 1));
                    }
                    break;
                case ']':
                    {
                        ++i;
                        Tokens.Add(new("]", 1));
                    }
                    break;
                case '.':
                    {
                        ++i;
                        Tokens.Add(new(".", 1));
                    }
                    break;
                case ',':
                    {
                        ++i;
                        Tokens.Add(new(",", 1));
                    }
                    break;
                default: i++; break;
            }
        }
    }
}
