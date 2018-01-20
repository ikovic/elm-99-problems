More Examples HereCompileLights

st
1
import Html 
2
import List
3
​
4
​
5
dropWhile : (a -> Bool) -> List a -> List a
6
dropWhile predicate list =
7
    case list of
8
        [] ->
9
            []
10
        x::xs ->
11
            if(predicate x == True) then dropWhile predicate xs
12
            else list
13
​
14
main : Html.Html a
15
main =
16
    Html.text
17
        <| case test of
18
            0 ->
19
                "Your implementation passed all tests."
20
​
21
            1 ->
22
                "Your implementation failed one test."
23
​
24
            x ->
25
                "Your implementation failed " ++ (toString x) ++ " tests."
26
​
27
​
28
test : Int
29
test =
30
    List.length
31
        <| List.filter ((==) False)
32
            [ ( dropWhile isOdd [1, 2, 1] == [2, 1] )
33
            , ( dropWhile isEven [1, 2, 1] == [1, 2, 1] )
34
            , ( dropWhile isEven [] == [] )
35
            , ( dropWhile isEven [2, 4, 100000, 1] == [1] )
36
            , ( dropWhile ((>) 5 ) (List.range 1 10) == [5, 6, 7, 8, 9, 10])
37
            , ( dropWhile ((>) 50 ) (List.range 1 10) ==[])
38
            ]
39
​
40
​
41
isEven x = 
42
    x % 2 == 0
43
​
44
​
45
isOdd x = 
46
    x % 2 /= 0
