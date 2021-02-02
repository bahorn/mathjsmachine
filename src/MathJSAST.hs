{-# LANGUAGE GADTs #-} 

module MathJSAST where

import Data.List

-- types we support
data Types = Bool Bool 
           | String String
           | Int Int
           | Float Float
           deriving (Eq)

-- Basic operators
data Operators = Plus
               | Minus
               | Mul
               | Div
               | Power
               deriving (Eq)

data Variable = Variable String

-- Our abstract Syntax
data Expr = Constant Types      -- Constant
          | Seq Expr Expr       -- Sequence of expressions
          | Var Variable        -- Variable
          | Infix Operators Expr Expr
                                -- Infix Operation
          | Assign Variable Expr
                                -- Assign a value to a variable.
          | If Expr Expr Expr   -- If expression
          | Fun String [Variable] Expr
                                -- Function, name, argument list, along with the
                                -- body in which they are bound in.
                                -- don't believe we can use anonymous functions,
                                -- so it needs a name.
          | Call String [Expr]  -- Calls a function.

instance Show Types where
    show (Bool True) = "true"
    show (Bool False) = "false"

    show (String x) =
        "\"" ++ x ++ "\""

    show (Int x) = show x
    show (Float x) = show x

instance Show Operators where
    show x = case x of
               Plus -> "+"
               Minus -> "-"
               Mul -> "*"
               Div -> "/"
               Power -> "^"

instance Show Variable where
    show (Variable x) =
        x

instance Show Expr where
    show (Constant x) =
        show x
    show (Var x) =
        show x
    show (Infix op s1 s2) =
        "(" ++ show s1 ++ ")" ++ show op ++ "(" ++ show s2 ++ ")"
    show (Seq s1 s2) =
        show s1 ++ ";" ++ show s2
    show (Assign var value) =
        show var ++ "=" ++ show value
    show (If s s1 s2) =
        show s ++ "?" ++ show s1 ++ ":" ++ show s2
    show (Fun name args expr) =
        name ++ "(" ++ (intercalate "," $ map show args) ++ ")"
        ++ "=" ++ show expr
    show (Call name args) =
        name ++ "(" ++ (intercalate "," $ map show args) ++ ")"
