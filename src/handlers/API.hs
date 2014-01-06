module API (
    evaluate
  , languages) where

import Evalso.Cruncher.SELinux
import qualified Evalso.Cruncher.Request as DCR
import qualified Evalso.Cruncher.Language.Everything as DCLE

import Application
import Control.Monad.IO.Class
import qualified Data.Map as M
import Snap.Extras.JSON
import Snap.Snaplet

-- | The @/api/evaluate@ endpoint, which actually evaluates code.
--
--   This is what actually performs an evaluation by using Cruncher's 'SELinux'
--   module.
evaluate :: Handler App App ()
evaluate = do
  r <- reqJSON :: Handler App App DCR.Request
  finalResult <- liftIO $ runRequest r
  writeJSON finalResult

-- | The @/api/languages@ endpoint, which provides information about each
--   language that we support.
languages :: Handler App App ()
languages = writeJSON $ M.elems DCLE.languages
