{-# LANGUAGE OverloadedStrings #-}
module Practice.Intro (render) where

import Text.Blaze.Html5 as H
import qualified Practice.Home (headAndBar)

render :: Html
render = Practice.Home.headAndBar "Intro - Practice: Lambda Math" $ do
    h1 "Practice"