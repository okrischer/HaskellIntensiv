import Test.QuickCheck ( quickCheck )
import Exercise02

deMorgProp1 :: Bool -> Bool -> Bool
deMorgProp1 x y = not (x & y) == not x % not y

deMorgProp2 :: Bool -> Bool -> Bool
deMorgProp2 x y = not1 (x `or1` y) == not1 x `and1` not1 y

main :: IO ()
main = do
    quickCheck deMorgProp1
    quickCheck deMorgProp2

