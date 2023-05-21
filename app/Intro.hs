{-# LANGUAGE OverloadedStrings #-}
module Intro (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render = Home.headAndBar "Intro - Learn: Lambda Math" $ do
    h1 "Introduction"