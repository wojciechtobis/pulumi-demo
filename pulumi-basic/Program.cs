using System.Threading.Tasks;
using Pulumi;

internal class Program
{
    private static Task<int> Main() => Deployment.RunAsync<MyStack>();
}