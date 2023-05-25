{-# LANGUAGE OverloadedStrings #-}
module Practice.Login (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
    ( action, method, name, type_, value )
import qualified Practice.Home (headAndBar)

render :: Html
render = Practice.Home.headAndBar "Login: Lambda Math" $ do
    H.form ! action "/practice/" ! method "POST" $ do
        H.label "username:"
        br
        input ! type_ "text" ! name "username" ! value "Type username here"
        input ! type_ "password" ! name "password" ! value ""
        input ! type_ "submit" ! value "Submit"