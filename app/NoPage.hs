{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module NoPage (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html -> Html
render message = Home.headAndBar "No Page: Lambda Math" $ do
    h1 "There is no such page."
    p message