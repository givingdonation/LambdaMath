{-# LANGUAGE OverloadedStrings #-}
module Practice.Login (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Practice.Home (headAndBar)

render :: Bool -> Html
render validity = Practice.Home.headAndBar "Login: Lambda Math" $ do
    H.form ! action "/practice/" ! method "POST" $ do
        H.label $ do
            "username:"
            input ! type_ "text" ! name "username" ! value "Type username here"
        H.label $ do
            "password:"
            if validity then
                input ! type_ "password" ! name "password" ! A.title "Type password here" ! value ""
            else
                input ! type_ "password" ! name "password" ! A.style "border-color: red;" ! A.title "invalid password" ! value ""
        input ! type_ "submit" ! value "Submit"