import Array
import Html
import List

normalize : Int -> Int -> Int
normalize index length =
  if index < 1 then 1
  else if index > length then length
  else index
  
validate : Int -> Int -> Bool
validate start end =
  if(end < start) then False
      else if (end < 1) then False else True
  
slice : Int -> Int -> List a -> List a
slice start end list = 
  let
      length = List.length list
      (normalStart, normalEnd) = (normalize start length, normalize end length)
      count = normalEnd - (normalStart - 1)
      withoutStart = List.drop (normalStart - 1) list
      withoutEnd = List.take count withoutStart
  in
      withoutEnd

sublist : Int -> Int -> List a -> List a 
sublist start end list = 
    if (validate start end == False) then [] else slice start end list
      

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
    List.length <| List.filter ((==) False)
      [ True
      , sublist 3 7 (List.range 1 10) == List.range 3 7
      , sublist 2 100 [ 'a', 'b', 'c' ] == [ 'b', 'c' ]
      , sublist -1 2 (List.range 1 100) == [1, 2]
      , sublist -3 -2 [-3, -2, -1, 0, 1, 2, 3] == []
      , sublist 5 3 [ "indices", " are", "inverted"] == []
      , sublist 0 1 (List.range 1 10) == [1]
      , sublist -7 -3 (List.range 1 10) == []
      ]
