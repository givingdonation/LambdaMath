{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib

import Web.Scotty
import Text.Blaze.Html5 hiding (main)
import Text.Blaze.Html5.Attributes
import qualified Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text

import qualified Home
import qualified Intro


blaze = S.html . renderHtml

main :: IO ()
main = scotty 3000 $ do
    get "/" $ do
        blaze Home.render
    get "/Introduction" $ do
        redirect "/intro"
    get "/intro" $ do
        blaze Intro.render
    notFound $ do
        S.text "There is no such page."