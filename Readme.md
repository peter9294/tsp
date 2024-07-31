[Setup steps]
1. install tsp compiler/CLI
npm install -g @typespec/compiler

2. run tsp install

4. install vscode extension
https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode

4. run bun compile

[How to name things]
you can read the style guide here.
https://typespec.io/docs/handbook/style-guide

[Naming Service]
backend requires operationId as {tag}_{operationName}. OpenAPI emitter auto generate the operationId for us by using the "interface" name and "operation" name combine with _ as {interface}_{operation}

[[kebab-case]]
- File name ({name}-service.tsp)

[[PascalCase]]
- Route name
- Interface name (match tag name and don't end with 'service')
- Operation name (basic operation + url(@route/@path))

```tsp
    // example
    @tag("Users")
    interface Users {
        @post
        op CreateUsers() ...

        @get
        @route("/List")
        op GetUsersList() ...

        @get
        op GetUsersId(@path id:string) ...
    }
```

[Caution]

- Enum field shouldn't union with null.
- Model field shouldn't union with null unless it is array.
- Decorating @doc at the enum field will generate "allOf" instead of normal "$ref". decorate @doc at enum instead.

```tsp
    // example
    @doc("foo enum description") // correct
    enum FooEnum {
        FOO: "FOO",
        BAR: "BAR",
    }

    model Example {
        @doc("foo enum description") // wrong
        key: FooEnum;
    }
```