module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute StaticController
instance AutoRoute TodosController

instance HasPath TodosController where
    pathTo TodosAction = "/todos"
    pathTo NewTodoAction = "/todos/new"
    pathTo (ShowTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo (EditTodoAction todoId) = "/todos/" <> tshow todoId <> "/edit"
    pathTo (UpdateTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo CreateTodoAction = "/todos"
    pathTo (DeleteTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo (ToggleTodoAction todoId) = "/todos/" <> tshow todoId <> "/toggle"