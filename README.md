# html5validator

This is a docker image packaging the cli-tool [html5validator](https://github.com/svenkreiss/html5validator).


Some highlights:

* Supports running as non-root user (unpriveledged)
* `entrypoint` is set to `html5validator`
* `workdir` is set to `/work`


Example usage:

```shell
docker run --rm -i \
    -v $(pwd)/website:/work \
    -u $(id -u) \
    hugoguru/html5validator:edge \
    --also-check-css \
    --format text
```