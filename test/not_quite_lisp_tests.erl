-module(not_quite_lisp_tests).

-include_lib("eunit/include/eunit.hrl").

basic_sample_test() ->
    TestData = format_data(load_test_data("1-sample-0.txt")),
    ?assertEqual(-3, not_quite_lisp:final_floor(TestData)).

basic_test() ->
    TestData = format_data(load_test_data("1.txt")),
    ?assertEqual(280, not_quite_lisp:final_floor(TestData)).

advanced_sample_test() ->
    TestData = format_data(load_test_data("1-sample-0.txt")),
    ?assertEqual(1, not_quite_lisp:first_basement(TestData)).

advanced_test() ->
    TestData = format_data(load_test_data("1.txt")),
    ?assertEqual(1797, not_quite_lisp:first_basement(TestData)).

load_test_data(File) ->
    Path = code:priv_dir(aoc2015) ++ "/test-data/" ++ File,
    {ok, Data} = file:read_file(Path),
    Data.

format_data(Input) ->
    InputString = binary_to_list(Input),
    [Line] = lists:filter(fun(L) -> length(L) > 0 end,
                         string:split(InputString, "\n", all)),
    Line.
