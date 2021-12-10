-module(stocking_stuffer).
-export([advent_coins/2]).

advent_coins(Prefix, Zeros) ->
    ZeroStr = lists:duplicate(Zeros, $0),
    find_suffix(Prefix, ZeroStr, 0).

find_suffix(Prefix, Zeros, Suffix) ->
    Coin = Prefix ++ integer_to_list(Suffix),
    MD5Bin = crypto:hash(md5, Coin),
    Hex = fun(V0) ->
                  V1 = integer_to_list(V0, 16),
                  if length(V1) < 2 -> [$0|V1];
                     true -> V1
                  end
          end,
    MD5Hex = lists:flatten(lists:map(Hex, binary_to_list(MD5Bin))),
    case lists:prefix(Zeros, MD5Hex) of
        true -> Suffix;
        false -> find_suffix(Prefix, Zeros, Suffix + 1)
    end.
