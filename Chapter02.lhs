\chapter{Einfache Datentypen}
\section{Exercises}

\begin{code}
module Chapter02 where
import Test.QuickCheck ( quickCheck )

main :: IO ()
main = do
    quickCheck deMorgProp1
    quickCheck deMorgProp2
\end{code}

\setcounter{exs}{1}

\begin{exs}
Define the logical operators \texttt{AND OR XOR} and \texttt{NOT} in Haskell.
\end{exs}

\begin{code}

xor1 :: Bool -> Bool -> Bool
xor1 x y = (not x && y) || (x && not y)

xor2 :: Bool -> Bool -> Bool
xor2 x y = x /= y

and1 :: Bool -> Bool -> Bool
and1 True x = x
and1 False _ = False

or1 :: Bool -> Bool -> Bool
or1 True _ = True
or1 False x = x

not1 :: Bool -> Bool
not1 True = False
not1 False = True
\end{code}

Defining \texttt{AND OR XOR} as operators:

\begin{code}
infixr 3 #
infixr 3 &
infixr 3 %
(#), (&), (%) :: Bool -> Bool -> Bool
(#) x y = x /= y

(&) True  x = x
(&) False _ = False

(%) True  _ = True
(%) False x = x
\end{code}

Defining properties for the \emph{deMorgan} laws in order to test our functions with \mintinline{haskell}{QuickCheck}:

\begin{code}
deMorgProp1 :: Bool -> Bool -> Bool
deMorgProp1 x y = not (x & y) == not x % not y

deMorgProp2 :: Bool -> Bool -> Bool
deMorgProp2 x y = not1 (x `or1` y) == not1 x `and1` not1 y
\end{code}