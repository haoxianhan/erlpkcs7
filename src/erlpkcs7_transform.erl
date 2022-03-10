-module(erlpkcs7_transform).

-export([parse_transform/2]).

-export([parse_gen_padding_fun/5]).

parse_transform(AST, _Options) ->
    walk_ast([], AST).

walk_ast(Acc, []) ->
    lists:reverse(Acc);
walk_ast(Acc, [{function, Line, Name, Arity, Clauses} | T]) ->
    walk_ast([{function, Line, Name, Arity, walk_clauses([], Clauses)} | Acc], T);
walk_ast(Acc, [H | L]) ->
    walk_ast([H | Acc], L).

walk_clauses(Acc, []) ->
    lists:reverse(Acc);
walk_clauses(Acc, [
    {clause, Line, Arguments, Guards, [
        {tuple, _, [
            {atom, _, parse_gen},
            {atom, _, ParseFun},
            Argus
        ]}
    ]}
    | T
]) ->
    %% re-loop for excute walk_body
    AddClause = ?MODULE:ParseFun(clause, Line, Arguments, Guards, Argus),
    walk_clauses(Acc, AddClause ++ T);
walk_clauses(Acc, [{clause, Line, Arguments, Guards, Body} | T]) ->
    walk_clauses([{clause, Line, Arguments, Guards, walk_body([], Body)} | Acc], T).

walk_body(Acc, []) ->
    lists:reverse(Acc);
walk_body(Acc, [H | T]) ->
    walk_body([transform_statement(H) | Acc], T).

transform_statement(Stmt) when is_tuple(Stmt) ->
    list_to_tuple(transform_statement(tuple_to_list(Stmt)));
transform_statement(Stmt) when is_list(Stmt) ->
    [transform_statement(S) || S <- Stmt];
transform_statement(Stmt) ->
    Stmt.

parse_gen_padding_fun(clause, Line, _Arguments, _Guards, {tuple, _, [{integer, _, PaddingAmount}]}) ->
    [
        {clause, Line, [{integer, Line, X}], [], [
            {bin, Line,
                lists:duplicate(X, {bin_element, Line, {integer, Line, X}, default, default})}
        ]}
     || X <- lists:seq(1, PaddingAmount)
    ].
