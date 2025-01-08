module ToDo.Controller.Static where
import ToDo.Controller.Prelude
import ToDo.View.Static.Welcome

instance Controller StaticController where
    action WelcomeAction = render WelcomeView
