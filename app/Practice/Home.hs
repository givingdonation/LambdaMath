{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Practice.Home (render, headAndBar) where

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
      link ! rel "icon" ! A.type_ "image/svg+xml" ! href "/icon.svg"
      H.title pageTitle
    body $ do
      nav $ ul $ do
          li $ a "Practice" ! href "/practice/"
          li $ a "Learn" ! href "/"
          li ! A.style "float: right;" $ a "Logout" ! href "/practice/logout"
      main pageContent


render :: Html
render = headAndBar "Practice: Lambda Math" $ do
    h1 "WIP"
    p ""
    ol $ do
          li $ a "Learn: Introduction" ! href "./introduction"
          li $ a "Learn: Formal Definitions" ! href "./definitions"
          li $ a "Learn: Encoding Booleans" ! href "./booleans"
          li $ a "Learn: Natural Numbers" ! href "./numbers"
          li $ a "Learn: Recursion" ! href "./recursion"