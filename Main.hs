module Main where

import Config
import IHP.FrameworkConfig
import IHP.Job.Types
import IHP.Prelude
import IHP.RouterSupport
import qualified IHP.Server
import Web.FrontController
import Web.Types
import ToDo.FrontController
import ToDo.Types

instance FrontController RootApplication where
  controllers =
    [ mountFrontController WebApplication
            , mountFrontController ToDoApplication
    ]

instance Worker RootApplication where
  workers _ = []

main :: IO ()
main = IHP.Server.run config
