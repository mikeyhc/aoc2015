-module(no_math).
-export([wrapping_paper/1, ribbon/1]).

wrapping_paper(Boxes) ->
    Fn = fun({L, W, H}) ->
                 Paper = [L * W, W * H, H * L],
                 lists:min(Paper) + 2 * lists:sum(Paper)
         end,
    lists:sum(lists:map(Fn, Boxes)).

ribbon(Boxes) ->
    Fn = fun({L, W, H}) ->
                 [A, B, _] = lists:sort([L, W, H]),
                 A + A + B + B + L * W * H
         end,
    lists:sum(lists:map(Fn, Boxes)).
