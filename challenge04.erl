-module(challenge04).
-export([startCalculator/1, calcu/1, add/1, substract/1, multiply/1, divide/1, getResult/0]).

% Carlos Alejandro Pérez Barrientos
% A01282288
% Challenge 04

calcu(X) ->
	receive
	    {add, Y} -> io:format("~p\n", [{"+", Y}]), calcu(X+Y);
	    {substract, Y} -> io:format("~p\n", [{"-", Y}]), calcu(X-Y);
	    {multiply, Y} -> io:format("~p\n", [{"*", Y}]), calcu(X*Y);
	    {divide, Y} -> io:format("~p\n", [{"/", Y}]), calcu(X/Y);
	    {getResult} -> io:format("The result is ~p\n", [X])
  end.

add(Y) -> calc ! {add, Y}.

substract(Y) -> calc ! {substract, Y}.

multiply(Y) -> calc ! {multiply, Y}.

divide(Y) -> calc ! {divide, Y}.

getResult() -> calc ! {getResult}.

startCalculator(X) ->
	Pid = spawn(challenge04, calcu, [X]),
	register(calc, Pid).
