-module(HW10_A01282288).
-export([sumFirst/1, nestedSum/1, removeNestedLists/1, cleanString/1, evaluate/2, binaryAux/1, toBinaryString/1, zip/2, tuplesToList/1]).

% Complete the following functions and submit your file to Canvas.

% ========= IMPORTANT ==========
% Change the name of the file so that it contains your student ID or name.
% Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
% Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
% Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
% If your file cannot be loaded by the Erlang compiler, your grade will be zero. Then, submit only code that works.


% Sum of first n positive integers
sumFirst(0) -> 0;
sumFirst(N) when N > 0 -> N + sumFirst(N-1) .

% Calculates the sum of the elements in a list (ignores nested lists).
nestedSum([]) -> 0;
nestedSum([X|Y]) when is_list(X) -> nestedSum(X) + nestedSum(Y);
nestedSum([X|Y]) -> X + nestedSum(Y).

% Removes nested lists in the argument and returns all the elements as one single plain list.
removeNestedLists([]) -> [];
removeNestedLists([X|Y]) when is_list(X) -> removeNestedLists(X) ++ removeNestedLists(Y);
removeNestedLists([X|Y]) -> [X] ++ removeNestedLists(Y) .

% Cleans a string. Given a string, return recursively a 'cleaned' string where adjacent chars that are the same have been reduced to a single char. So "yyzzza" yields "yza".
cleanString("") -> "";
cleanString([X|Y]) when X == hd(Y) -> cleanString(Y);
cleanString([X|Y]) -> [X | cleanString(Y)] .

% Evaluation of polynomials
evaluate([], _) -> 0.0;
evaluate([A|Y], X) -> (A * (math:pow(X, length(Y)))) + evaluate(Y, X) .

% Converts a number to a binary string.
binaryStrAux(0) -> "";
binaryStrAux(N) -> if
  (N rem 2) == 0 -> binaryStrAux(N div 2) ++ "0";
  true -> binaryStrAux(N div 2) ++ "1"
end .

toBinaryString(0) -> "0";
toBinaryString(X) -> binaryStrAux(X) .

% Zipping two lists
zip([], _) -> [];
zip(_, []) -> [];
zip([A1|A2], [B1|B2]) -> [{A1, B1}] ++ zip(A2, B2) .

% Lists of tuples
tuplesToList([]) -> [];
tuplesToList([{A, B}|Rest]) -> [A] ++ tuplesToList(Rest) ++ [B] .
