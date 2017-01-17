# CreateMacrosFrom.jl

```@index
```

Sometimes it's easier to have macros in their underlying function form
(functions which take and return code). These functions can be reused in
functional programming (map, reduce, filter) to build more complicated macros.
This package automatically generates macros based on underlying functions. This
strategy is parallel to the system of non-standard evaluation used in the
Hadley-verse.

```@autodocs
Modules = [CreateMacrosFrom]
```
