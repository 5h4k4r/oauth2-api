FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS publish
WORKDIR /src
COPY "TestApi" .

RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS final
ENV ASPNETCORE_URLS=http://*:8080
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "TestApi.dll"]
