module ToDo.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data ToDoApplication = ToDoApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)
