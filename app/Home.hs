{-# LANGUAGE OverloadedStrings #-}
module Home (render) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

render = do
  html ! class_ "holiday-css-dark" $ do
    H.head $ do 
      meta ! charset "UTF-8"
      meta ! name "viewport" ! content "width=device-width, initial-scale=1.0"
      script ! src "https://polyfill.io/v3/polyfill.min.js?features=es6" $ ""
      script ! A.id "MathJax-script" ! async "true" ! src "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" $ ""
      link ! rel "stylesheet" ! href "https://cdn.jsdelivr.net/npm/holiday.css@0.11.0"
      H.title "Lambda Math"
    body $ do
        nav $ ul $ do
            li $ a "Practice"
            li "Learn"
            li "$$\\lambda$$"
        