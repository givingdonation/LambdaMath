{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_LambdaMath (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/bin"
libdir     = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/lib/x86_64-linux-ghc-9.2.7/LambdaMath-0.1.0.0-CRzzOs4PCf1IOhg5bhtfnX-LambdaMath-exe"
dynlibdir  = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/share/x86_64-linux-ghc-9.2.7/LambdaMath-0.1.0.0"
libexecdir = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/libexec/x86_64-linux-ghc-9.2.7/LambdaMath-0.1.0.0"
sysconfdir = "/home/user/Documents/LambdaMath/.stack-work/install/x86_64-linux/67678019fde38a1f145abc7c8ea42beb12a81bdeaec03088eb622682994525b6/9.2.7/etc"

getBinDir     = catchIO (getEnv "LambdaMath_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "LambdaMath_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "LambdaMath_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "LambdaMath_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LambdaMath_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LambdaMath_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
