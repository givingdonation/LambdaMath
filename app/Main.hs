{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Web.Scotty
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html.Renderer.Text as T
import Data.Char
import qualified Home
import qualified Intro
import qualified NoPage
import qualified Practice.Home

blaze :: H.Html -> ActionM ()
blaze = html . T.renderHtml

main :: IO ()
main = scotty 3000 $ do
    get "/icon.svg" $ do
        addHeader "Content-Type" "image/svg+xml"
        file "./img/Anonymous-lambda.svg"
    get "/practice/" $ blaze Practice.Home.render
    get "/practice/:path" $ do
        blaze $ NoPage.render "Practice has pages."
    get "/" $ blaze Home.render
    get "/introduction" $ blaze Intro.render
    get "/:path" $ do
        path <- param "path"
        case map toLower path of
            "introduction" -> redirect "/introduction"
            _       -> blaze $ NoPage.render "Learn has pages."
    notFound $ do
        blaze $ NoPage.render "No pages/subpages."