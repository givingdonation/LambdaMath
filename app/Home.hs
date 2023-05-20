{-# LANGUAGE OverloadedStrings #-}
module Home (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes

render = do
  html $ do
    H.head $ link ! rel "stylesheet" ! href "https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css"
    body $ do
        h1 "Lambdamath"
        ul $ do
            li "Practice"
            li "Learn"