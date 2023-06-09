{-# LANGUAGE OverloadedStrings #-}
module Home (render, headAndBar) where

import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A


headAndBar :: Html -> Html -> Html
headAndBar pageTitle pageContent = html $ do
    H.head $ do
      meta ! charset "UTF-8"
      meta ! name "viewport" ! content "width=device-width, initial-scale=1.0"
      script ! src "https://polyfill.io/v3/polyfill.min.js?features=es6" $ ""
      script ! A.id "MathJax-script" ! async "true" ! src "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js" $ ""
      link ! rel "stylesheet" ! href "https://unpkg.com/sakura.css/css/sakura-vader.css"
      link ! rel "icon" ! A.type_ "image/svg+xml" ! href "/icon.svg"
      H.style "nav a:hover{border-bottom: none;} nav button {margin: 5px;}"
      H.title pageTitle
    body $ do
      nav $ do
        a ! href "/practice/" $ button "Practice"
        a ! href "/" $ button "Learn"
      hr
      main pageContent


render :: Html
render = do
      headAndBar "Lambda Math" $ do
        h1 "Lambda Math"
        p "The website for practicing and learning lambda calculus."
        ol $ do
          li $ a "Learn: Introduction" ! href "/introduction"
          li $ a "Learn: Formal Definitions" ! href "/definitions"
          li $ a "Learn: Encoding Booleans" ! href "/booleans"
          li $ a "Learn: Natural Numbers" ! href "/numbers"
          li $ a "Learn: Recursion" ! href "/recursion"
        br
        br
        h3 "Website made with:"
        ul $ do
          li $ a "Stack" ! href "https://docs.haskellstack.org/en/stable/"
          li $ a "Scotty" ! href "https://github.com/scotty-web/scotty"
          li $ a "BlazeHtml" ! href "https://jaspervdj.be/blaze/"
          li $ a "sakura" ! href "https://oxal.org/projects/sakura/"
          li $ a "MathJax" ! href "https://www.mathjax.org/"
        a "Visit Github" ! href "https://github.com/givingdonation/LambdaMath"