{-# LANGUAGE OverloadedStrings #-}

module Site (app) where

import qualified API
import qualified Documentation

import Application
import Data.ByteString (ByteString)
import Snap.Snaplet
import Snap.Snaplet.Heist
import Snap.Util.FileServe

routes :: [(ByteString, Handler App App ())]
routes = [
           ("/static", serveDirectory "static")
         , ("/", Documentation.index)
         , ("/try", Documentation.try)
         , ("/api", Documentation.docs)
         , ("/api/evaluate", API.evaluate)
         , ("/api/languages", API.languages)
         ]

app :: SnapletInit App App
app = makeSnaplet "app" "An snaplet example application." Nothing $ do
    h <- nestSnaplet "" heist $ heistInit "templates" -- $ mempty { hcInterpretedSplices = defaultInterpretedSplices }
    addRoutes routes
    return $ App h

