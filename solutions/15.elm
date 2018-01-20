More Examples HereCompileLights

++ repeatElements c
1
import Html 
2
import List
3
​
4
​
5
repeatElements : Int -> List a -> List a
6
repeatElements count list =
7
    case (list, count) of
8
        ([], _) ->
9
            []
10
        (_, 0) ->
11
            []
12
        (x::xs, c) ->
13
            List.repeat c x ++ repeatElements c xs
14
​
15
main : Html.Html a
16
main =
17
    Html.text
18
        <| case test of
19
            0 ->
20
                "Your implementation passed all tests."
21
​
22
            1 ->
23
                "Your implementation failed one test."
24
​
25
            x ->
26
                "Your implementation failed " ++ (toString x) ++ " tests."
27
​
28
​
29
test : Int
30
test =
31
    List.length
32
        <| List.filter ((==) False)
33
            [ repeatElements 2 [ 1, 2, 5, 5, 2, 1 ] == [ 1, 1, 2, 2, 5, 5, 5, 5, 2, 2, 1, 1 ]
34
            , repeatElements 4 [ 1, 2 ] == [ 1, 1, 1, 1, 2, 2, 2, 2 ]
35
            , repeatElements 4 [] == []
36
            , repeatElements 0 [ 1, 2 ] == []
37
            , repeatElements (-1) [ 1, 2 ] == []
38
            , repeatElements 40 [ 1 ] == [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
39
            , repeatElements 4 [ "1", "2" ] == [ "1", "1", "1", "1", "2", "2", "2", "2" ]
40
            ]
