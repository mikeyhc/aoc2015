-module(houses_in_a_vacuum_tests).

-include_lib("eunit/include/eunit.hrl").

basic_sample_test() ->
    TestData0 = format_data(load_test_data("3-sample-0.txt")),
    ?assertEqual(4, houses_in_a_vacuum:santa_present(TestData0)),
    TestData1 = format_data(load_test_data("3-sample-1.txt")),
    ?assertEqual(2, houses_in_a_vacuum:santa_present(TestData1)).

basic_test() ->
    TestData = format_data(load_test_data("3.txt")),
    ?assertEqual(2565, houses_in_a_vacuum:santa_present(TestData)).

advanced_sample_test() ->
    TestData0 = format_data(load_test_data("3-sample-0.txt")),
    ?assertEqual(3, houses_in_a_vacuum:robo_present(TestData0)),
    TestData1 = format_data(load_test_data("3-sample-1.txt")),
    ?assertEqual(11, houses_in_a_vacuum:robo_present(TestData1)).

advanced_test() ->
    TestData = format_data(load_test_data("3.txt")),
    ?assertEqual(2639, houses_in_a_vacuum:robo_present(TestData)).

load_test_data(File) ->
    Path = code:priv_dir(aoc2015) ++ "/test-data/" ++ File,
    {ok, Data} = file:read_file(Path),
    Data.

format_data(Input) ->
    InputString = binary_to_list(Input),
    [Line] = lists:filter(fun(L) -> length(L) > 0 end,
                          string:split(InputString, "\n", all)),
    Line.
