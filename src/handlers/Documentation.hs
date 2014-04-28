{-# LANGUAGE OverloadedStrings #-}

module Documentation (
    docs
  , index
  , languages
  , try) where

import Evalso.Cruncher.Language ()
import qualified Evalso.Cruncher.Language as DCL
import qualified Evalso.Cruncher.Language.Everything as DCLE
import qualified Evalso.Cruncher.Unsandboxed as Unsandboxed

import Application
import Control.Applicative ((<$>))
import Control.Lens hiding (index)
import Control.Monad.IO.Class
import Data.List (intercalate)
import qualified Data.Map as M
import Data.Maybe (fromMaybe)
import Data.Monoid
import qualified Data.Text as T
import Snap.Core
import Snap.Snaplet
import Snap.Snaplet.Heist
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Renderer.XmlHtml
import Text.XmlHtml (Node(TextNode))
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
                     M.map (^. DCL.codemirror) DCLE.languages)
        in
       H.script ("var cmMap = {" `mappend` H.toHtml cmLangs `mappend` "};")

    renderLanguages :: SnapletISplice App
    renderLanguages = I.mapSplices (I.runChildrenWith . languages') (M.assocs DCLE.languages)

    languages' :: Monad n => (String, DCL.Language) -> Splices (I.Splice n)
    languages' (k, v) = do
      "displayname" ## I.textSplice (T.pack $ v ^. DCL.displayName)
      "apiname"     ## I.textSplice (T.pack k)

-- | The @/@ landing page.
index :: Handler App App ()
index = ifTop $ cRender "index"

-- | The @/api@ endpoint which contains documentation for how to use the API.
docs :: Handler App App ()
docs = cRender "api"

-- | The @/languages@ documentation page.
--
--   This provides the same information as the @/api/languages@ API endpoint,
--   but in a pretty UI chrome. Because we're nice. ;)
--
--   TODO: I18n.
languages :: Handler App App ()
languages = heistLocal (I.bindSplices splices) $ render "languages"
  where
    splices = do
      "languages" ## languagesSplice

    languagesSplice :: SnapletISplice App
    languagesSplice = I.mapSplices (I.runChildrenWith . languages') (M.toAscList DCLE.languages)

    nvrSplice l = do
      nvr <- liftIO $ Unsandboxed.version l
      return $ [TextNode nvr]

    languages' :: MonadIO n => (String, DCL.Language) -> Splices (I.Splice n)
    languages' (k, v) = do
      "codeFilename"   ## I.textSplice (T.pack $ v ^. DCL.codeFilename)
      "compileCommand" ## I.textSplice (fromMaybe (T.pack "(Interpreted)") (T.unwords <$> v ^. DCL.compileCommand))
      "compileTimeout" ## I.textSplice (T.pack $ fromMaybe "(Interpreted)" ((++ " seconds") . show <$> v ^. DCL.compileTimeout))
      "runCommand"     ## I.textSplice (T.unwords (v ^. DCL.runCommand))
      "runTimeout"     ## I.textSplice (T.pack $ show (v ^. DCL.runTimeout) ++ " seconds")
      "codemirror"     ## I.textSplice (T.pack $ v ^. DCL.codemirror)
      "rpm-nvr"        ## nvrSplice v
      "displayName"    ## I.textSplice (T.pack $ v ^. DCL.displayName)
      "apiName"        ## I.textSplice (T.pack k)
