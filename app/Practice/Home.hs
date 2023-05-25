{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Practice.Home (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Practice: Lambda Math" $ do
    h1 "WIP"
    p ""
    ol $ do
          li $ a "Learn: Introduction" ! href "./introduction"
          li $ a "Learn: Formal Definitions" ! href "./definitions"
          li $ a "Learn: Encoding Booleans" ! href "./booleans"
          li $ a "Learn: Natural Numbers" ! href "./numbers"
          li $ a "Learn: Recursion" ! href "./recursion"