-module(no_math_tests).

-include_lib("eunit/include/eunit.hrl").

basic_sample_test() ->
    TestData = format_data(load_test_data("2-sample-0.txt")),
    ?assertEqual(101, no_math:wrapping_paper(TestData)).

basic_test() ->
    TestData = format_data(load_test_data("2.txt")),
    ?assertEqual(1588178, no_math:wrapping_paper(TestData)).

advanced_sample_test() ->
    TestData = format_data(load_test_data("2-sample-0.txt")),
    ?assertEqual(48, no_math:ribbon(TestData)).

advanced_test() ->
    TestData = format_data(load_test_data("2.txt")),
    ?assertEqual(3783758, no_math:ribbon(TestData)).

load_test_data(File) ->
    Path = code:priv_dir(aoc2015) ++ "/test-data/" ++ File,
    {ok, Data} = file:read_file(Path),
    Data.

format_data(Input) ->
    InputString = binary_to_list(Input),
    Lines = lists:filter(fun(L) -> length(L) > 0 end,
                         string:split(InputString, "\n", all)),
    Fn = fun(Line) ->
                 [L, W, H] = lists:map(fun list_to_integer/1,
                                       string:split(Line, "x", all)),
                 {L, W, H}
         end,
    lists:map(Fn, Lines).
