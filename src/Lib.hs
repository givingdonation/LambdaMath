{-# LANGUAGE OverloadedStrings #-}
module Lib ( setCookie, getCookie ) where

import qualified Data.Text.Encoding as TS
import qualified Data.Text as T
import qualified Data.Map
import Data.Text.Lazy.Encoding ( decodeUtf8, encodeUtf8 )
import Blaze.ByteString.Builder ( toLazyByteString )
import Data.ByteString.Lazy ( toStrict )
import Web.Scotty as S
import Web.Cookie

setCookie :: T.Text -> T.Text -> ActionM ()
setCookie n v = addHeader "Set-Cookie" (decodeUtf8 . toLazyByteString $ renderSetCookie $ makeSimpleCookie n v)

makeSimpleCookie :: T.Text -> T.Text -> SetCookie
makeSimpleCookie na va = def {setCookieName  = TS.encodeUtf8 na, setCookieValue = TS.encodeUtf8 va}

getCookies :: ActionM (Data.Map.Map T.Text T.Text)
getCookies = Data.Map.fromList . maybe [] parse <$> header "Cookie"
    where parse = parseCookiesText . toStrict . encodeUtf8

getCookie :: T.Text -> ActionM (Maybe T.Text)
getCookie c = fmap (Data.Map.lookup c) getCookies