{-# LANGUAGE OverloadedStrings #-}
module Practice.Login (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
    ( action, method, name, type_, value )
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Login: Lambda Math" $ do
    H.form ! action "/practice/" ! method "POST" $ do
        H.label "username:"
        br
        input ! type_ "text" ! name "" ! value "Type name here"
        input ! type_ "submit" ! value "Submit"