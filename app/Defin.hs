{-# LANGUAGE OverloadedStrings #-}
module Defin (render) where

import Text.Blaze.Html5 as H
import qualified Home (headAndBar)

render :: Html
render = Home.headAndBar "Defin - Learn: Lambda Math" $ do
    h1 "Definition of lambda calculus"
    p ""