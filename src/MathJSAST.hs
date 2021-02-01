{-# LANGUAGE GADTs #-} 

module MathJSAST where

-- types we support
data Types = String String
           | Int Int
           deriving (Eq)

-- Our abstract Syntax
data Expr = Seq Expr Expr       -- Sequence of expressions
          | Var String          -- Variable
          | Assign (Expr (Var)) Types   -- Assign a value to a variable.
          | If Expr Expr Expr   -- If expression
          | Fun String [Expr] Expr
                                -- Function, name, argument list, along with the body
                                -- in which they are bound in.
                                -- don't believe we can use anonymous functions,
                                -- so it needs a name.

instance Show Types where
    show (String x) =
        "\"" ++ x ++ "\""
    show (Int x) = show x

instance Show Expr where
    show (Var x) =
        x
    show (Seq s1 s2) =
        show s1 ++ ";" ++ show s2
    show (Assign var value) =
        show var ++ "=" ++ show value
    show (If s s1 s2) =
        show s ++ "?" ++ show s1 ++ ":" ++ show s2
    show (Fun name args expr) =
        name ++ "(" ++ show args ++ ")" ++ "=" ++ show expr
