{-# LANGUAGE OverloadedStrings #-}

module Site (app) where

import Data.Cruncher.SELinux
import qualified Data.Cruncher.Request as DCR
import Data.Cruncher.Language ()
import qualified Data.Cruncher.Language as DCL
import qualified Data.Cruncher.Language.Everything as DCLE

import Application
import Control.Monad.IO.Class
import Data.ByteString (ByteString)
import Data.List (intercalate)
import qualified Data.Map as M
import Data.Monoid
import qualified Data.Text as T
import Snap.Extras.JSON
import Snap.Core
import Snap.Snaplet
import Snap.Snaplet.Heist
import Snap.Util.FileServe
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Renderer.XmlHtml
import Heist
import qualified Heist.Interpreted as I

-- | The @/api/evaluate@ endpoint, which actually evaluates code.
--
--   This is what actually performs an evaluation by using Cruncher's 'SELinux'
--   module.
evaluate :: Handler App App ()
evaluate = do
  r <- reqJSON :: Handler App App DCR.Request
  finalResult <- liftIO $ runRequest r
  writeJSON finalResult

-- | The @/try@ endpoint, which provides a way for people to see how the API
--   works, from their browser.
--
--   We do some special handling of the languages list so that CodeMirror syntax
--   highlights correctly.
try :: Handler App App ()
try = heistLocal (I.bindSplices splices) $ render "try"
  where
    splices = do
      "cm-map" ## codeMirrorLanguagesSplice
      "languages" ## renderLanguages

    codeMirrorLanguagesSplice :: SnapletISplice App
    codeMirrorLanguagesSplice = return $ renderHtmlNodes $ do
      let cmLangs = intercalate ", " $
                    (fmap (\(a, b) -> "\"" ++ a ++ "\": \"" ++ b ++ "\"") $
                     M.toList $
                     M.map (DCL.codemirror) DCLE.languages)
        in
       H.script ("var cmMap = {" `mappend` H.toHtml cmLangs `mappend` "};")

    renderLanguages :: SnapletISplice App
    renderLanguages = I.mapSplices (I.runChildrenWith . languages') (M.assocs DCLE.languages)

    languages' :: Monad n => (String, DCL.Language) -> Splices (I.Splice n)
    languages' (k, v) = do
      "displayname" ## I.textSplice (T.pack $ DCL.displayName v)
      "apiname"     ## I.textSplice (T.pack k)

-- | The @/api/languages@ endpoint, which provides information about each
--   language that we support.
languages :: Handler App App ()
languages = writeJSON $ M.elems DCLE.languages

-- | The @/@ landing page.
index :: Handler App App ()
index = ifTop $ render "index"

routes :: [(ByteString, Handler App App ())]
routes = [
           ("/static", serveDirectory "static")
         , ("/", index)
         , ("/try", try)
         , ("/api/evaluate", evaluate)
         , ("/api/languages", languages)
         ]

app :: SnapletInit App App
app = makeSnaplet "app" "An snaplet example application." Nothing $ do
    h <- nestSnaplet "" heist $ heistInit "templates" -- $ mempty { hcInterpretedSplices = defaultInterpretedSplices }
    addRoutes routes
    return $ App h

