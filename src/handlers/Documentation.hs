{-# LANGUAGE OverloadedStrings #-}

module Documentation (
    docs
  , index
  , try) where

import Evalso.Cruncher.Language ()
import qualified Evalso.Cruncher.Language as DCL
import qualified Evalso.Cruncher.Language.Everything as DCLE

import Application
import Data.List (intercalate)
import qualified Data.Map as M
import Data.Monoid
import qualified Data.Text as T
import Snap.Core
import Snap.Snaplet
import Snap.Snaplet.Heist
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Renderer.XmlHtml
import Heist
import qualified Heist.Interpreted as I

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

-- | The @/@ landing page.
index :: Handler App App ()
index = ifTop $ cRender "index"

-- | The @/api@ endpoint which contains documentation for how to use the API.
docs :: Handler App App ()
docs = cRender "api"

