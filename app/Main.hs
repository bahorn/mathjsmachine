module Main where

import MathJSAST

main :: IO ()
main = print (Seq [
                (Fun "test" [Variable "x", Variable "y"]
                    (Infix (Power) (Var (Variable "x")) (Var (Variable "y")))),
                (Assign (Variable "k") (Call "test" [Constant (Int 2), Constant (Int 2)])),
                (Call "sin" [Var (Variable "k")])]
             )
