# .NET Core Test Coverage

A Docker image used as a base for running code coverage and generating the associated reports for .NET Core solutions.

This image is designed to setup an environment and script to run unit tests in a given solution.

Create a `test.Dockerfile` for your solution that is similar to this:

```Dockerfile
# Placing the code within the test image
FROM mikejr83/dotnet-core-test-coverage
WORKDIR /src
COPY . .
```

Build the image:

```Bash
docker build -t my-test -f test.Dockerfile .
```

And then run the tests:

```Bash
docker run -it -p 8080:80 --name my-test-run my-test
```

You can get the log output by running:

```Bash
docker logs -f my-test-run
```

Open a browser to `http://localhost:8080`. When tests are complete the HTML report will be hosted for viewing.

## Why isn't a volume used instead of creating a dependent image?

I ran into issues trying to mount the solution in the docker container so that the tests could be run within a container using the base image. This appears to be an issue with bind mounting in Windows. Please submit a pull request so we can fix that!

## TODO

* Make the solution cleaner so that it isn't necessary to create another image utilizing this one. *See the note above.*
* Show the log output on the HTML page that is shown until the reports generation is complete.
* Come up with a better way to do the Nginx startup and script "blocking".