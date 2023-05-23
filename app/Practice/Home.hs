{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Practice.Home (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Practice: Lambda Math" $ do
    h1 "WIP"