module Main where

import MathJSAST

main :: IO ()
main = print (Assign (Var "Hello") (String "hello"))
