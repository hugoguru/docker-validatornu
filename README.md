# validatornu

This is a docker image packaging [The Nu Html Checker (v.Nu)](https://github.com/validator/validator) project primarily for use as part of CI tasks.

Latest version: 20.6.30


Highlights:

* Supports running as non-root user (unprivileged)
* `entrypoint` is set to `validator`
* `workdir` is set to `/work`


Example usage:

```shell
docker run --rm -i \
    -v $(pwd)/website:/work \
    -u $(id -u) \
    quay.io/hugoguru/validatornu:20.6.30 \
    --skip-non-html /work \
```
