-module(stocking_stuffer_tests).

-include_lib("eunit/include/eunit.hrl").

basic_sample_test() ->
    TestData0 = format_data(load_test_data("4-sample-0.txt")),
    ?assertEqual(609043, stocking_stuffer:advent_coins(TestData0, 5)),
    TestData1 = format_data(load_test_data("4-sample-1.txt")),
    ?assertEqual(1048970, stocking_stuffer:advent_coins(TestData1, 5)).

basic_test() ->
    TestData0 = format_data(load_test_data("4.txt")),
    ?assertEqual(117946, stocking_stuffer:advent_coins(TestData0, 5)).

advanced_test_() ->
    {timeout, 10,
     fun() ->
             TestData0 = format_data(load_test_data("4.txt")),
             ?assertEqual(3938038, stocking_stuffer:advent_coins(TestData0, 6))
     end}.

load_test_data(File) ->
    Path = code:priv_dir(aoc2015) ++ "/test-data/" ++ File,
    {ok, Data} = file:read_file(Path),
    Data.

format_data(Input) ->
    InputString = binary_to_list(Input),
    [Line] = lists:filter(fun(L) -> length(L) > 0 end,
                          string:split(InputString, "\n", all)),
    Line.
