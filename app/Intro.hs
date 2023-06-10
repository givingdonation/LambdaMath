{-# LANGUAGE OverloadedStrings #-}
module Intro (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html -> Html
render answerTruth = Home.headAndBar "Intro - Learn: Lambda Math" $ do
    h1 "Introduction"
    h2 "Lambda Math"
    p "Lambda Math is a personal project designed to provide explanations for aspects of lambda calculus and provide you with questions to test your knowledge."
    h2 "Lambda Calculus"
    p "According to Wikipedia:"
    blockquote "Lambda calculus (also written as \\(\\lambda\\)-calculus) is a formal system in mathematical logic for expressing computation based on function abstraction and application using variable binding and substitution."
    h2 "Lambda Calculus Origins"
    p "Alonzo Church created lambda calculus in the 1930s. Lambda calculus was made for researching the foundations of mathematics, specifically the Entscheidungsproblem, which was a major question about algorithms ability to analyze logic."
    h2 "Lambda Calculus Importance"
    p $ "Lambda calculus is important mainly in the field of computer science, but it extends to many other fields of study such as mathematics, linguistics, logic, and philosophy. Lambda calculus is especially good for learning programming language design, since " <> a "type systems" ! href "https://en.wikipedia.org/wiki/Type_system" <> " and " <> a "functional programming languages" ! href "https://en.wikipedia.org/wiki/Functional_programming" <> " use concepts from lambda calculus extensively."
    h2 "Navigating Lambda Math"
    p "This website has different pages, these include:"
    ul $ do
        li "Learn home page: accessible from nav bar"
        li "Practice login/home page: accessible from nav bar"
        li "/introduction, /definitions, /booleans, /numbers, /recursion: accessible from Learn home page"
        li "/practice/introduction, ./definitions, ./booleans, ./numbers, ./recursion: accessible from Practice home page"
    p "You can make an account with any username and password, and you can then use it to practice with Lambda Math."
    p "Here is an example of what practicing with Lambda Math is like:"
    blockquote $ do
        H.form ! action "/introduction" ! method "POST" $ do
            H.label $ do
                b "What is the first lowercase letter of the alphabet?"
            input ! type_ "text" ! name "answer" ! value "Type answer here"
            br
            input ! type_ "submit" ! value "Submit"
        answerTruth
    a "Practice Introduction" ! href "/practice/introduction"