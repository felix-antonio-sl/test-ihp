module ToDo.FrontController where

import IHP.RouterPrelude
import ToDo.Controller.Prelude
import ToDo.View.Layout (defaultLayout)

-- Controller Imports
import ToDo.Controller.Static

instance FrontController ToDoApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        ]

instance InitControllerContext ToDoApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
