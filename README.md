# validator

This is a docker image packaging the [validator/validator](https://github.com/validator/validator) project.


Some highlights:

* Supports running as non-root user (unpriveledged)
* `entrypoint` is set to `validator`
* `workdir` is set to `/work`


Example usage:

```shell
docker run --rm -i \
    -v $(pwd)/website:/work \
    -u $(id -u) \
    hugoguru/validator:edge \
    --skip-non-html /work \
```