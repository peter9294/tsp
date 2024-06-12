[Setup steps]
1. install tsp compiler/CLI
npm install -g @typespec/compiler

2. run tsp install

3. run tsp compile .

4. install vscode extension
https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode

[How to name things]
you can read the style guide here.
https://typespec.io/docs/handbook/style-guide

[Naming Service]
backend requires operationId as {tag}_{operationName}. OpenAPI emitter auto generate the operationId for us by using the "interface" name and "operation" name combine with _ as {interface}_{operation}

1. File name should be {name}service.tsp (must be kebab-case).
2. Route name NEEDS to be PascalCase.
3. Interface name NEEDS to match the tag name. no need to as service after (PascalCase).
4. Operation name may start with basic operation then follow by the url(@route/@path) pattern (PascalCase) no serious restriction.

```tsp
    // example
    @tag("Users")
    interface Users {
        @post
        op CreateUsers() ...

        @get
        @route("/List")
        op GetUsersList() ...
    }
```
