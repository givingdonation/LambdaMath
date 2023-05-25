{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib
import Text.Blaze.Html.Renderer.Text ( renderHtml )
import Data.Char ( toLower )
import Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Data.Text.Lazy as L

import qualified Practice.Home
import qualified Practice.Intro
import qualified Practice.Login
import qualified Home
import qualified Intro
import qualified Defin
import qualified NoPage

blaze :: H.Html -> ActionM ()
blaze = html . renderHtml

main :: IO ()
main = scotty 3000 $ do
    get "/icon.svg" $ do
        addHeader "Content-Type" "image/svg+xml"
        file "./img/Anonymous-lambda.svg"

    get "/practice" $ do
        cookies <- getCookie "id"
        case cookies of
            Just "1" -> blaze Practice.Home.render
            Just _   -> do
                blaze Practice.Login.render
            Nothing   -> blaze Practice.Login.render
    get "/practice/introduction" $ blaze Practice.Intro.render
    post "/practice" $ do
        username <- param "username"
        password <- param "password"
        if (password :: L.Text) == "password" then do
            setCookie "username" username
            setCookie "id" "1"
            blaze Practice.Home.render
        else 
            blaze $ do 
                Practice.Login.render
                H.p "Invalid password"
    get "/practice/logout" $ do
        setCookie "id" ""
        setCookie "username" ""
        redirect "/practice"
    get "/practice/:path" $ do
        blaze $ NoPage.render "Practice has pages."


    get "/" $ blaze Home.render
    get "/introduction" $ blaze Intro.render
    get "/definitions" $ blaze Defin.render
    get "/:path" $ do
        path <- param "path"
        case map toLower path of
            "introduction" -> redirect "/introduction"
            _              -> blaze $ NoPage.render "Learn has pages."
    notFound $ blaze $ NoPage.render "No pages/subpages."

