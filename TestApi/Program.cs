var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", (HttpContext context) => new
{
    headers = context.Request.Headers.ToDictionary(x => x.Key, x => x.Value)
});
app.MapGet("/auth/v1/users/self", (HttpContext context) => new
{
    headers = context.Request.Headers.ToDictionary(x => x.Key, x => x.Value)
});

app.Run();
