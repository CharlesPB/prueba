-module(act7).
-export([remove/2, transpose/1, table/1, sort/1, getDegree/1, sum/1]).

%1 Removing the first n elements from a list
%act7:remove(-1, [1, 2, [3, 4]]).

remove(_, []) -> [];
remove(-1, Lst) -> Lst;
remove(X, [_ | T]) when X > 0 -> remove(X - 1, T);
remove(0, Lst) -> Lst.

%2 Summing all the elements in a list
%act7:sum([1, [2, 3], [4, 5, 6], 7]).

sum([]) -> 0;
sum([H | T]) when is_list(H) -> sum(T);
sum([H | T]) -> H + sum(T).

%3 Calculating the transpose of a matrix
%act7:transpose([[1,2,3],[4,5,6]]).

transpose([[] | _]) -> [];
transpose(N) -> [lists:map(fun(X) -> hd(X) end, N)] ++ transpose(lists:map(fun(X) -> tl(X) end, N)).

%4 Sorting the elements in a list
%act7:sort([4,12,34,1,9,10]).

sort([]) -> [];
sort([H|T]) -> sort([ X || X <- T, X < H]) ++ [H] ++ sort([ X || X <- T, X >= H]).

%5 Obtaining the degrees of a node
%act7:getDegree([[a, b, c], [b, a, c, d], [c, a, b], [d, b]]).

getDegree([]) -> [];
getDegree([H|T]) -> [length(H) - 1] ++ degree (T).

%6 Table summarization
%act7:table([["Male",178],["Female",165],["Female",158],["Female",182],["Male",161],["Male",175],["Female",182],["Male",188],["Male",169],["Female",156]]).

table(Tbl) ->
  ListMales = lists:filter(fun(X) -> hd (X) == "Male" end, Tbl),
  ListFemales = lists:filter(fun(X) -> hd (X) == "Female" end, Tbl),
  SumaMales = sum(lists:map(fun(X) -> hd(tl (X)) end, ListMales)),
  SumaFemales = sum(lists:map(fun(X) -> hd(tl (X)) end, ListFemales)),
  [["Male",SumaMales/length(ListMales)],["Female",SumaFemales/length(ListFemales)]].
