
testOk(Msg) :-
    write(Msg),
    write(': OK\n'),
    true.

testFail(Msg) :-
    write(Msg),
    write(': Failed\n'),
    fail.

test(TestPredicate) :-
    (call(TestPredicate) ->
        testOk(TestPredicate);
        testFail(TestPredicate)
    ), !.

