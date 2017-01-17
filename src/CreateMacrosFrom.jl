module CreateMacrosFrom

# function_call = :binary_function
create_macro_from(function_call::Symbol) = begin
    macro_symbol = Symbol("@" * string(function_call) )
    macro_quote = Expr(:quote, Expr(:macrocall, macro_symbol))
    doc_string = "See documentation of [`$function_call`](@ref)"
    quote
        macro $function_call(args...)
            esc($function_call(args...) )
        end
        @doc $doc_string $macro_quote
    end
end

export create_macros_from
"""
    @create_macros_from(functions...)

Will create a macro for each of the `functions`.

Each function should take and return code. The new macro will have the same
name.

# examples
```jldoctest
julia> using CreateMacrosFrom

julia> binary_function(a, b, c) = Expr(:call, b, a, c);

julia> reverse_binary(a, b, c) = Expr(:call, b, c, a);

julia> @create_macros_from binary_function reverse_binary;

julia> vcat(1, 2) == @binary_function 1 vcat 2
true

julia> vcat(2, 1) == @reverse_binary 1 vcat 2
true
```

There is no scrubbing for hygeine, so be careful.

```jldoctest
julia> using CreateMacrosFrom

julia> set_a_to_one() = :(a = 1);

julia> @create_macros_from set_a_to_one;

julia> a = 2;

julia> @set_a_to_one;

julia> a
1
```

Will write a docstring for the macro pointing to the documentation
of the original function.

```jldoctest
julia> using CreateMacrosFrom

julia> "A macro to parse any function as a binary operator"
       binary_function(a, b, c) = Expr(:call, b, a, c);

julia> @create_macros_from binary_function;

julia> @doc :(@binary_function)
See documentation of [`binary_function`](@ref)
```
"""
create_macros_from(function_calls...) =
    Expr(:block, map(create_macro_from, function_calls)...)

export @create_macros_from
eval(create_macros_from(:create_macros_from))

end # module
