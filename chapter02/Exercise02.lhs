\begin{exs}
Define the logical operators \texttt{AND OR XOR} and \texttt{NOT} in Haskell.
\end{exs}

\begin{code}
module Exercise02 where

xor1 :: Bool -> Bool -> Bool
xor1 x y = (not x && y) || (x && not y)

xor2 :: Bool -> Bool -> Bool
xor2 x y = x /= y

and1 :: Bool -> Bool -> Bool
and1 True y = y
and1 False _ = False

or1 :: Bool -> Bool -> Bool
or1 True _ = True
or1 False y = y

infixr 3 #
infixr 3 &
infixr 3 %
(#), (&), (%) :: Bool -> Bool -> Bool
(#) x y = x /= y

(&) True  x = x
(&) False _ = False

(%) True  _ = True
(%) False x = x

not1 :: Bool -> Bool
not1 True = False
not1 False = True
\end{code}