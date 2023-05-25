{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Boole (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Boole - Learn: Lambda Math" $ do
    h1 "Booleans"