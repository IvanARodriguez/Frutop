## Create environment variables for production

```env
BACKEND_STAGE=prod
BACKEND_COMMAND="dotnet Fruitop.Backend.dll"
CLIENT_STAGE=prod
CLIENT_COMMAND=pnpm run build
POSTGRES_DB="{DATABASE}"
POSTGRES_USER="{USER}"
POSTGRES_PASSWORD="{PASSWORD}"
ASPNETCORE_ENVIRONMENT=Production

```
