{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Web.Scotty as S
import Web.Cookie
import qualified Data.Text.Encoding as TS
import qualified Data.Text as TSa
import Data.Text.Lazy.Encoding ( decodeUtf8, encodeUtf8 )
import Blaze.ByteString.Builder as B
import qualified Data.ByteString.Lazy as BSL
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html.Renderer.Text as T
import Data.Char
import qualified Home
import qualified Intro
import qualified Defin
import qualified NoPage
import qualified Practice.Home
import qualified Practice.Intro
import qualified Practice.Login

import qualified Data.Map

blaze :: H.Html -> ActionM ()
blaze = html . T.renderHtml

--makeSimpleCookie :: Data.Text.Internal.Text -> Data.Text.Internal.Text -> SetCookie
makeSimpleCookie :: TSa.Text -> TSa.Text -> SetCookie
makeSimpleCookie n v = def {setCookieName  = TS.encodeUtf8 n, setCookieValue = TS.encodeUtf8 v}


setCookie :: TSa.Text -> TSa.Text -> ActionM ()
setCookie n v = addHeader "Set-Cookie" (decodeUtf8 . B.toLazyByteString $ renderSetCookie $ makeSimpleCookie n v)

getCookies :: ActionM (Data.Map.Map TSa.Text TSa.Text)
getCookies = Data.Map.fromList . maybe [] parse <$> header "Cookie"
    where parse = parseCookiesText . BSL.toStrict . encodeUtf8

getCookie :: TSa.Text -> ActionM (Maybe TSa.Text)
getCookie c = fmap (Data.Map.lookup c) getCookies
{-
-- I wanna genocide after copying these things:
getCookies :: ActionM (Maybe CookiesText)
getCookies = fmap (fmap (parseCookiesText . lazyToStrict . encodeUtf8)) $ header "Cookie"
    where
        lazyToStrict = BS.concat . BSL.toChunks
-}




main :: IO ()
main = scotty 3000 $ do
    get "/icon.svg" $ do
        addHeader "Content-Type" "image/svg+xml"
        file "./img/Anonymous-lambda.svg"
    get "/practice" $ do
        cookies <- getCookie "a"
        case cookies of
            Just "a" -> blaze Practice.Home.render
            Just _   -> do
                blaze Practice.Login.render
            Nothing   -> blaze Practice.Login.render

    get "/practice/introduction" $ blaze Practice.Intro.render
    post "/practice" $ do 
        setCookie "a" "a"
        blaze Practice.Home.render
    get "/practice/:path" $ do
        blaze $ NoPage.render "Practice has pages."
    get "/" $ blaze Home.render
    get "/introduction" $ blaze Intro.render
    get "/definitions" $ blaze Defin.render
    get "/:path" $ do
        path <- param "path"
        case map toLower path of
            "introduction" -> redirect "/introduction"
            _       -> blaze $ NoPage.render "Learn has pages."
    notFound $ do
        blaze $ NoPage.render "No pages/subpages."

