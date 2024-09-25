# Stage 1: Base (shared across dev and build)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS base
WORKDIR /app
COPY . .

# Stage 2: Development environment
FROM base AS dev
WORKDIR /app
EXPOSE 5858
# Use the `dotnet watch` for live reloading during development
CMD ["dotnet", "watch", "run", "--project", "Fruitop.Api/Fruitop.Api.csproj", "--urls", "http://0.0.0.0:5858"]

# Stage 3: Build for Production
FROM base AS build
WORKDIR /app
RUN dotnet restore ./Fruitop.Api/Fruitop.Api.csproj
RUN dotnet publish ./Fruitop.Api/Fruitop.Api.csproj -c Release -o /out

# Stage 4: Production runtime environment
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS prod
WORKDIR /app
COPY --from=build /out .
EXPOSE 5858
ENTRYPOINT ["dotnet", "Fruitop.Api.dll"]
