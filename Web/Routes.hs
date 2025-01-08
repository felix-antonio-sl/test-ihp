module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance CanRoute TodosController where
    parseRoute' = do
        string "/todos"
        endOfInput >> pure TodosAction
        <|> do
            string "/todos/new"
            endOfInput >> pure NewTodoAction
        <|> do
            string "/todos/"
            todoId <- parseId @"todos"
            endOfInput >> pure ShowTodoAction { .. }
        <|> do
            string "/todos/"
            todoId <- parseId @"todos"
            string "/edit"
            endOfInput >> pure EditTodoAction { .. }
        <|> do
            string "/todos/"
            todoId <- parseId @"todos"
            string "/toggle"
            endOfInput >> pure ToggleTodoAction { .. }

instance HasPath TodosController where
    pathTo TodosAction = "/todos"
    pathTo NewTodoAction = "/todos/new"
    pathTo (ShowTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo (EditTodoAction todoId) = "/todos/" <> tshow todoId <> "/edit"
    pathTo (UpdateTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo CreateTodoAction = "/todos"
    pathTo (DeleteTodoAction todoId) = "/todos/" <> tshow todoId
    pathTo (ToggleTodoAction todoId) = "/todos/" <> tshow todoId <> "/toggle"