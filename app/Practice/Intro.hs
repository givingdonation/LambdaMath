{-# LANGUAGE OverloadedStrings #-}
module Practice.Intro (renderGet, renderPost) where

import Text.Blaze.Html5 as H
import qualified Practice.Home (headAndBar)
import Text.Blaze.Html5.Attributes as A

renderGet :: Html
renderGet = Practice.Home.headAndBar "Intro - Practice: Lambda Math" $ do
    h1 "Practice"
    H.form ! action "/practice/introduction" ! method "POST" $ do
        H.label $ do
            b "What is the first lowercase letter of the alphabet?"
        input ! type_ "text" ! name "answer" ! value "Type answer here"
        br
        input ! type_ "submit" ! value "Submit"
renderPost :: Html
renderPost = Practice.Home.headAndBar "Intro - Practice: Lambda Math" $ do
    h1 "Practice"
    H.form ! action "/practice/introduction" ! method "POST" $ do
        H.label $ do
            b "What is the first lowercase letter of the alphabet?"
        input ! type_ "text" ! name "answer" ! value "Type answer here"
        br
        input ! type_ "submit" ! value "Submit"