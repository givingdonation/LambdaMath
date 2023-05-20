{-# LANGUAGE OverloadedStrings #-}
module Home (render) where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes

render = do
  html $ do
    body $ do
      h1 "My todo list"
      ul $ do
        li "learn haskell"
        li "make a website"