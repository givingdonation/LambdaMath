{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Intro (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Intro - Learn: Lambda Math" $ do
    h1 "Introduction"
    h2 "Lambda Math"
    p "Lambda Math is a personal project "
    h2 "lambda calculus"
    p "according to wikipedia"
    h2 "lambda calculus origins"
    h2 "lambda calculus importance"
    h2 "navigating Lambda Math"
    a "Practice Introduction"