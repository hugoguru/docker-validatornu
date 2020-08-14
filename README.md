# validator

This is a docker image packaging the [The Nu Html Checker (v.Nu)](https://github.com/validator/validator) project primarily for use as part of CI tasks.


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