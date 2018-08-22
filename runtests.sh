#!/bin/sh

nginx &

cd /src

# Coverage reports will be placed here...
COVERAGE_DIR="coverage-reports/"

if [ -d "$COVERAGE_DIR" ]; then
  rm -rf "$COVERAGE_DIR"
fi

mkdir $COVERAGE_DIR

cp /tester/pretest.html "$COVERAGE_DIR"


# Build the solution so that the test command does not
echo "Cleaning..."
dotnet clean

echo "Restoring..."
dotnet restore

echo "Building..."
dotnet build

if [ ! "$?" = "0" ]; then
    exit 1
fi

# Create the directory for coverage reports because we don't want to
# assume that the command won't bomb if it isn't there.
mkdir -p "$COVERAGE_DIR"

# All the assemblies in the solution 
ASSEMBLIES=$(ls */*.csproj | xargs -L1 dirname | sed -r 's/\.Tests//g')

# Go through each test project and run the test command with coverage.

for proj in *Tests/*.csproj; do
	echo "Running Test Coverage for Project: $proj"
	cd `dirname $proj`
	CURRENT_NAME="`dirname $proj`"
	DLL_NAME=$(echo $CURRENT_NAME | sed -r 's/\.Tests//g')

	# EXCLUDES_PARAMS=$(echo ASSEMBLIES | sed -r 's/'"${DLL_NAME//./\\.}"'//g' | sed -r 's/^\s?/\/p:Exclude=\"\[/g' | sed -r 's/(\s+$)|$/\]*\"/g' | sed -r 's/\s+/\]*\" \/p:Exclude=\"\[/g')
	# EXCLUDES_COMMA=$(echo ASSEMBLIES | sed -r 's/'"${DLL_NAME//./\\.}"'//g' | sed -r 's/(^\s?)/\[/g' | sed -r 's/\s+?$/\]*/g' | sed -r 's/\s+/]*,\[/g')
	
	eval "MSYS_NO_PATHCONV=1 dotnet test --no-build /p:CollectCoverage=true /p:CoverletOutputFormat=\"opencover\" /p:CoverletOutput=\"../$COVERAGE_DIR/$CURRENT_NAME.xml\""

	cd ..
done


/root/.dotnet/tools/reportgenerator "-reports:coverage-reports/*Tests.xml" "-targetdir:coverage-reports"

trap 'exit 0' SIGTERM
tail -f /dev/null & wait ${!}