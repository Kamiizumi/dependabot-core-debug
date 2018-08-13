# dependabot-core-debug

A Docker container for debugging [Dependabot](https://github.com/dependabot/dependabot-core).

## Build

Build using the usual Docker syntax:
`docker build -t dependabot-core-debug:latest .`

## Test

The `TestContainer.sh` script can test to ensure the image is working as expected. A Travis CI job runs on each created pull request to ensure the image works correctly. The job runs the following steps, which can also be manually run locally to test the image.

1. Check out a known working commit of [dependabot-core](https://github.com/dependabot/dependabot-core). The repository needs to be checked out into a folder called `dependabot-core` within this repository.

    ``` bash
    git clone https://github.com/dependabot/dependabot-core.git
    cd dependabot-core
    git checkout tags/v0.66.8
    ```

1. Run the built Docker image, mounting this repository to /src and running the `TestContainer.sh` script.

    `docker run --rm -v ABSOLUTE_PATH_TO_THIS_REPOSITORY:/src dependabot-core-debug:latest /src/TestContainer.sh`
