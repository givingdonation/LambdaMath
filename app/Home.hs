{-# LANGUAGE OverloadedStrings #-}
module Home (render, headAndBar) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A


headAndBar :: Html -> Html -> Html
headAndBar pageTitle pageContent = html ! class_ "holiday-css-dark" $ do
    H.head $ do
      meta ! charset "UTF-8"
      meta ! name "viewport" ! content "width=device-width, initial-scale=1.0"
      script ! src "https://polyfill.io/v3/polyfill.min.js?features=es6" $ ""
      script ! A.id "MathJax-script" ! async "true" ! src "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" $ ""
      link ! rel "stylesheet" ! href "https://cdn.jsdelivr.net/npm/holiday.css@0.11.0"
      H.title pageTitle
    body $ do
      nav $ ul $ do
          li $ a "Practice" ! href "#"
          li $ a "Learn" ! href "/"
      pageContent



render :: Html
render = do
      headAndBar "Lambda Math" $ do
        h1 "Lambda Math"
        p "The website for lambda calculus learning and practice."
        ol $ do
          li $ a "Learn: Introduction"
          li $ a "Learn: Formal Definitions"
          li $ a "Learn: "
          li $ a "Learn: Introduction"
        br
        br
        h3 "Website made with:"
        ul $ do
          li $ a "Stack"
          li $ a "Scotty"
          li $ a "BlazeHtml"
          li $ a "holiday.css"
          li $ a "MathJax"
        a "Visit Github"