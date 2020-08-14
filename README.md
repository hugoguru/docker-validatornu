# html5validator

This is a docker image packaging the [validator/validator](https://github.com/validator/validator) project.


Some highlights:

* Supports running as non-root user (unpriveledged)
* `entrypoint` is set to `java -jar /dist/vnu.jar`
* `workdir` is set to `/work`


Example usage:

```shell
docker run --rm -i \
    -v $(pwd)/website:/work \
    -u $(id -u) \
    hugoguru/html5validator:edge \
    --skip-non-html /work \
```