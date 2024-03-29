{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE MultiWayIf #-}
module Main (main) where

import Lib
import Text.Blaze.Html.Renderer.Text ( renderHtml )
import Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Data.Text.Lazy as TL
--import qualified Data.Text as T


import qualified Practice.Home
import qualified Practice.Page
import qualified Practice.Login
import qualified Home
import qualified Intro
import qualified Defin
import qualified Boole
import qualified Numbe
import qualified Recur
import qualified NoPage
import Practice.Page (Status(..))

blaze :: H.Html -> ActionM ()
blaze = html . renderHtml

loginCheck :: ActionM () -> ActionM ()
loginCheck page = do
    cookies <- getCookie "id"
    if cookies /= Just "1" then 
        blaze $ Practice.Login.render True
    else page

main :: IO ()
main = scotty 3000 $ do
    get "/icon.svg" $ do
        addHeader "Content-Type" "image/svg+xml"
        file "./img/Anonymous-lambda.svg"
    
    get "/practice" $ loginCheck $ blaze Practice.Home.render
    get "/practice/introduction" $ loginCheck $ blaze $ Practice.Page.render $ Status {score = "0", answerAnal = H.h3 ""}
    post "/practice/introduction" $ loginCheck $ do
        answer <- param "answer"
        let attempts = 3 :: Int
        if | (answer :: TL.Text) == "a" ->
             blaze $ Practice.Page.render $ Status {score = "1", answerAnal = H.h3 "Correct answer!"}
           | attempts <= 3 -> blaze $ Practice.Page.render $ Status {score = "0", answerAnal = do
                H.h3 "Incorrect answer."
                H.h3 "Try again."}
           | True -> blaze $ Practice.Page.render $ Status {score = "0", answerAnal = do
                H.h3 "Incorrect answer."
                H.h3 "This is the correct answer:"
                H.p "a"}
    post "/practice" $ do
        username <- param "username"
        password <- param "password"
        if (password :: TL.Text) == "password" then do
            setCookie "username" username
            setCookie "id" "1"
            blaze Practice.Home.render
        else blaze $ Practice.Login.render False
    get "/practice/logout" $ do
        setCookie "id" ""
        setCookie "username" ""
        redirect "/practice"
    get "/practice/:path" $ blaze $ NoPage.render "Practice has pages."

    get "/" $ blaze Home.render
    get "/introduction" $ blaze $ Intro.render ""
    post "/introduction" $ do
        answer <- param "answer"
        if (answer :: TL.Text) == "a" then do
            blaze $ Intro.render $ H.h3 "Correct answer!"
        else blaze $ Intro.render $ do
                H.h3 "Incorrect answer."
                H.h3 "This is the correct answer:"
                H.p "a"
    get "/definitions" $ blaze Defin.render
    get "/booleans" $ blaze Boole.render
    get "/numbers" $ blaze Numbe.render
    get "/recursion" $ blaze Recur.render
    get "/:path" $ blaze $ NoPage.render "Learn has pages."
    
    notFound $ blaze $ NoPage.render "No pages/subpages."

