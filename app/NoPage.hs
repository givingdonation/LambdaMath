{-# LANGUAGE OverloadedStrings #-}
module NoPage (render) where

import Text.Blaze.Html5 as H
import qualified Home (headAndBar)

render :: Html -> Html
render message = Home.headAndBar "No Page: Lambda Math" $ do
    h1 "There is no such page."
    p message