module Paths_myblog (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/palmer/Documents/myblog/.stack-work/install/x86_64-linux/lts-5.18/7.10.3/bin"
libdir     = "/home/palmer/Documents/myblog/.stack-work/install/x86_64-linux/lts-5.18/7.10.3/lib/x86_64-linux-ghc-7.10.3/myblog-0.1.0.0-ATAWaawVUvpKVAD7kKFrKa"
datadir    = "/home/palmer/Documents/myblog/.stack-work/install/x86_64-linux/lts-5.18/7.10.3/share/x86_64-linux-ghc-7.10.3/myblog-0.1.0.0"
libexecdir = "/home/palmer/Documents/myblog/.stack-work/install/x86_64-linux/lts-5.18/7.10.3/libexec"
sysconfdir = "/home/palmer/Documents/myblog/.stack-work/install/x86_64-linux/lts-5.18/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myblog_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myblog_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "myblog_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myblog_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myblog_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
