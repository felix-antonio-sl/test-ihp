module Application.Todo where

import IHP.ModelSupport
import Generated.Types

instance Default Todo where
    def = Todo { 
        title = ""
        , description = Nothing
        , isCompleted = False
        , createdAt = currentTime
    } 