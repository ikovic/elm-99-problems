import Html
import List
import Maybe


last : List a -> Maybe a
last xs =
    case List.length xs of
        0 ->
            Nothing
        x ->
            List.reverse xs |> List.head


main : Html.Html a
main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ last (1..4) == Just 4
            , last [ 1 ] == Just 1
            , last [] == Nothing
            , last [ 'a', 'b', 'c' ] == Just 'c'
            ]


(..) : Int -> Int -> List Int
(..) start end =
    List.range start end
