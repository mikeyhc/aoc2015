-module(houses_in_a_vacuum).
-export([santa_present/1, robo_present/1]).

santa_present(Directions) ->
    Fn = fun($<, {{X, Y}, Map}) -> {{X - 1, Y}, Map#{{X - 1, Y} => true}};
            ($>, {{X, Y}, Map}) -> {{X + 1, Y}, Map#{{X + 1, Y} => true}};
            ($^, {{X, Y}, Map}) -> {{X, Y - 1}, Map#{{X, Y - 1} => true}};
            ($v, {{X, Y}, Map}) -> {{X, Y + 1}, Map#{{X, Y + 1} => true}}
         end,
    {_Pos, Map} = lists:foldl(Fn, {{0, 0}, #{{0, 0} => true}}, Directions),
    length(maps:keys(Map)).

robo_present(Directions) ->
    Fn = fun($<, {{X, Y}, Alt, Map}) ->
                 {Alt, {X - 1, Y}, Map#{{X - 1, Y} => true}};
            ($>, {{X, Y}, Alt, Map}) ->
                 {Alt, {X + 1, Y}, Map#{{X + 1, Y} => true}};
            ($^, {{X, Y}, Alt, Map}) ->
                 {Alt, {X, Y - 1}, Map#{{X, Y - 1} => true}};
            ($v, {{X, Y}, Alt, Map}) ->
                 {Alt, {X, Y + 1}, Map#{{X, Y + 1} => true}}
         end,
    {_, _, Map} = lists:foldl(Fn, {{0, 0}, {0, 0}, #{{0, 0} => true}},
                              Directions),
    length(maps:keys(Map)).
