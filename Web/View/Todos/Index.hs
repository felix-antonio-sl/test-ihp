module Web.View.Todos.Index where
import Web.View.Prelude

data IndexView = IndexView { todos :: [Todo] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={TodosAction}>Todos</a></li>
            </ol>
        </nav>
        <h1>Todos <a href={pathTo NewTodoAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Todo</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>{forEach todos renderTodo}</tbody>
            </table>
        </div>
    |]

renderTodo :: Todo -> Html
renderTodo todo = [hsx|
    <tr>
        <td>
            <h5>{get #title todo}</h5>
            <p class="text-muted">{fromMaybe "" (get #description todo)}</p>
        </td>
        <td>
            <form method="POST" action={ToggleTodoAction (get #id todo)} class="d-inline">
                <button class={classes ["btn", if get #isCompleted todo then "btn-success" else "btn-secondary"]}>
                    {if get #isCompleted todo then "Completed" else "Pending"}
                </button>
            </form>
        </td>
        <td>
            <a href={EditTodoAction (get #id todo)} class="text-muted">Edit</a>
            <form method="POST" action={DeleteTodoAction (get #id todo)} class="d-inline">
                <button type="submit" class="btn btn-link text-danger">Delete</button>
            </form>
        </td>
    </tr>
|]