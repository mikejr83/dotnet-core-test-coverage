# Placing the code within the test image
FROM mikejr83/dotnet-core-test-coverage:latest
WORKDIR /src
COPY . .