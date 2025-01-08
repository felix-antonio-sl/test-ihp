module Web.View.Todos.Show where
import Web.View.Prelude
import qualified Text.Blaze.Html5 as H

data ShowView = ShowView { todo :: Todo }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TodosAction}>Todos</a></li>
                <li class="breadcrumb-item active">Show Todo</li>
            </ol>
        </nav>
        <h1>Todo</h1>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">{get #title todo}</h5>
                <p class="card-text">{fromMaybe "" (get #description todo)}</p>
                <p class="card-text">
                    <small class="text-muted">Status: {H.text $ if get #isCompleted todo then "Completed" else "Pending"}</small>
                </p>
                <a href={EditTodoAction (get #id todo)} class="btn btn-primary">Edit</a>
            </div>
        </div>
    |]