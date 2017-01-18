var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#CreateMacrosFrom.create_macros_from-Tuple",
    "page": "Home",
    "title": "CreateMacrosFrom.create_macros_from",
    "category": "Method",
    "text": "@create_macros_from(functions...)\n\nWill create a macro for each of the functions.\n\nEach function should take and return code. The new macro will have the same name.\n\nexamples\n\njulia> using CreateMacrosFrom\n\njulia> binary_function(a, b, c) = Expr(:call, b, a, c);\n\njulia> reverse_binary(a, b, c) = Expr(:call, b, c, a);\n\njulia> @create_macros_from binary_function reverse_binary;\n\njulia> vcat(1, 2) == @binary_function 1 vcat 2\ntrue\n\njulia> vcat(2, 1) == @reverse_binary 1 vcat 2\ntrue\n\nThere is no scrubbing for hygeine, so be careful. Interpolate in local functions, and don't create local variables unless you mean it.\n\njulia> using CreateMacrosFrom\n\njulia> set_a_to_one() = :(a = 1);\n\njulia> @create_macros_from set_a_to_one;\n\njulia> a = 2;\n\njulia> @set_a_to_one;\n\njulia> a\n1\n\nWill write a docstring for the macro pointing to the documentation of the original function.\n\njulia> using CreateMacrosFrom\n\njulia> \"A macro to parse any function as a binary operator\"\n       binary_function(a, b, c) = Expr(:call, b, a, c);\n\njulia> @create_macros_from binary_function;\n\njulia> @doc :(@binary_function)\nSee documentation of [`binary_function`](@ref)\n\n\n\n"
},

{
    "location": "index.html#CreateMacrosFrom.@create_macros_from",
    "page": "Home",
    "title": "CreateMacrosFrom.@create_macros_from",
    "category": "Macro",
    "text": "See documentation of create_macros_from\n\n\n\n"
},

{
    "location": "index.html#CreateMacrosFrom.jl-1",
    "page": "Home",
    "title": "CreateMacrosFrom.jl",
    "category": "section",
    "text": "Sometimes it's easier to have macros in their underlying function form (functions which take and return code). These functions can be reused in functional programming (map, reduce, filter) to build more complicated macros. This package automatically generates macros based on underlying functions. This strategy is parallel to the system of non-standard evaluation used in the Hadley-verse.Modules = [CreateMacrosFrom]"
},

]}
