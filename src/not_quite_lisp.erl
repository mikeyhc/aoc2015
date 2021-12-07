-module(not_quite_lisp).
-export([final_floor/1, first_basement/1]).

final_floor(Steps) ->
    Fn = fun($(, Acc) -> Acc + 1;
            ($), Acc) -> Acc - 1
         end,
    lists:foldl(Fn, 0, Steps).

first_basement(Steps) ->
    first_basement(Steps, 0, 1).

first_basement([], _, _) -> false;
first_basement([$(|T], Floor, I) ->
    first_basement(T, Floor + 1, I + 1);
first_basement([$)|T], Floor0, I) ->
    Floor1 = Floor0 - 1,
    if Floor1 < 0 -> I;
       true ->
           first_basement(T, Floor1, I + 1)
    end.
