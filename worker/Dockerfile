# --- Build stage ---
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src

COPY Worker.csproj ./

RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o /app/publish

# --- Runtime stage ---
FROM mcr.microsoft.com/dotnet/runtime:7.0 AS final

WORKDIR /app

RUN groupadd -r worker && useradd -r -g worker worker

COPY --from=build /app/publish .

RUN chown -R worker:worker /app

USER worker

ENTRYPOINT ["dotnet", "Worker.dll"]
