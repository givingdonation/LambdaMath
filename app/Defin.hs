{-# LANGUAGE OverloadedStrings #-}
module Defin (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Defin - Learn: Lambda Math" $ do
    h1 "Definition of Lambda Calculus"
    h2 "Functions" ! A.id "1"
    p "Lambda calculus is ultimately about functions, in the purest sense. Despite the relationship of lambda calculus to programming, it may be better to think about of lambda calculus from the perspective of mathematical functions as well as from a traditional programming perspective."
    p "In mathematical notation, here is a function that squares a number:"
    "$$f(x)=x^2$$"
    p "If we were to apply this function to the number seven it would look like this:"
    "$$f(7)$$"
    p "One thing to note about this function is how the letter \\(f\\) \"holds\" the operation \\(x^2\\). This works for mathematical purposes because you can hold values in constants, but in lambda calculus functions don't work this way, instead t only uses anonymous functions."
    h3 "Anonymous functions"
    p "Here is an example of a way of writing an anonymous function, that also squares a number."
    "$$x \\mapsto x^2$$"
    p "So the only way of applying this function is by using its full definition and not a letter like \\(f\\)"
    "$$(x \\mapsto x^2)(7)$$"
    p "Anonymous functions, are functions that are not defined with a specific identifier. In other words, they simply don't have a name like \\(f\\). It is important to highlight how lambda calculus only uses these kinds of functions, since they are simpler."
    
    h2 "Lambda Terms" ! A.id "2"
    p ""
    h3 "Variables"
    h3 "Abstraction"
    h3 "Application"
    h2 "Notation" ! A.id "3"
    h2 "Reduction" ! A.id "4"
    h3 "Currying"
    h3 "Example"
    p "try this out on your own, and then view the solution"
    details $ do
        H.summary "answer"
        p "bbb"
    a "Practice Definitions" ! href "/practice/definitions"