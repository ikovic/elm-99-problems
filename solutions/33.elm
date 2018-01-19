import Html 
import List

gcd : Int -> Int -> Int
gcd a b =
    let 
        remainder = a % b
    in
        if remainder == 0 then abs(b)
        else gcd b remainder

coprime :  Int -> Int -> Bool
coprime a b = 
    gcd a b == 1

main =
    Html.text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\(result, expect) -> result == expect)
        [ ( coprime 36 63, False )
        , ( coprime 10 25, False )
        , ( coprime 120 120, False )
        , ( coprime 2 12, False )
        , ( coprime 1313 1600, True)
        , ( coprime 23 37, True )
        , ( coprime 45 330, False)
        , ( coprime 24528 65934, False)
        , ( coprime 1600 1313, True)
        , ( coprime -23 37, True )
        , ( coprime 330 45, False)
        , ( coprime -23 37, True )
        , ( coprime -330 -45, False)
        , ( coprime -24528 65934, False)
        ]
