{-# LANGUAGE OverloadedStrings #-}
module Practice.Page (render, Status(..)) where

import Text.Blaze.Html5 as H
import qualified Practice.Home (headAndBar)
import Text.Blaze.Html5.Attributes as A

data Status = Status {score :: Html, answerAnal :: Html}
-- where should persistent code go? in main
-- make simple question analysis for 1 question.
render :: Status -> Html
render status = Practice.Home.headAndBar "Intro - Practice: Lambda Math" $ do
    h1 "Practice"
    h3 ("Score: " <> score status) ! A.style "text-align:right;"
    H.form ! action "/practice/introduction" ! method "POST" $ do
        H.label $ do
            b "What is the first lowercase letter of the alphabet?"
        input ! type_ "text" ! name "answer" ! value "Type answer here"
        br
        input ! type_ "submit" ! value "Submit"
    answerAnal status
