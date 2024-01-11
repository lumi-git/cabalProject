import System.Environment (getArgs)
import TodoLogics

main :: IO ()
main = do
    args <- getArgs
    case args of
        ("add":todoId:todoDescription:_) -> TodoLogics.addTodo todoId todoDescription
        ("view":_)                       -> TodoLogics.viewTodo
        ("remove":todoId:_)              -> TodoLogics.removeTodo todoId
        ("complete":todoId:_)            -> TodoLogics.completeTodo todoId
        _                                -> putStrLn "Unknown command or incorrect arguments"
