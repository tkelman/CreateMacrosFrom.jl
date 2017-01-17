using CreateMacrosFrom
using Base.Test
import Documenter

# write your own tests here
# @test 1 == 2

# run doctests
Documenter.makedocs(
    modules = [CreateMacrosFrom],
    format = :html,
    sitename = "CreateMacrosFrom.jl",
    pages = Any["Home" => "index.md"],
    root = joinpath(dirname(dirname(@__FILE__)), "docs"),
    strict = true
)
