module Web.View.Todos.Edit where
import Web.View.Prelude

data EditView = EditView { todo :: Todo }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TodosAction}>Todos</a></li>
                <li class="breadcrumb-item active">Edit Todo</li>
            </ol>
        </nav>
        <h1>Edit Todo</h1>
        {renderForm todo}
    |]

renderForm :: Todo -> Html
renderForm todo = formFor todo [hsx|
    {(textField #title)}
    {(textareaField #description)}
    {submitButton}
|]