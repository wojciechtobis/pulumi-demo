using System.Reflection;
using Pulumi.Automation;

const string stackName = "local";

var executingDir = new DirectoryInfo(Assembly.GetExecutingAssembly().Location).Parent!.FullName;
var workingDir = Path.Combine(executingDir, "..", "..", "..", "..", "pulumi-basic");

var stackArgs = new LocalProgramArgs(stackName, workingDir);
var stack = await LocalWorkspace.SelectStackAsync(stackArgs);

while (true)
{
    await stack.RefreshAsync(new RefreshOptions
    {
        Color = "always",
        OnStandardOutput = Console.WriteLine,
        OnStandardError = Console.WriteLine
    });

    await stack.UpAsync(new UpOptions()
    {
        Color = "always",
        OnStandardOutput = Console.WriteLine,
        OnStandardError = Console.WriteLine
    });

    await Task.Delay(TimeSpan.FromSeconds(30));
}