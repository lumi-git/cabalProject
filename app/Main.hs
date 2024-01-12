import System.Environment (getArgs)
import TodoLogics
import FileManager


main :: IO ()
main = do
    todoFilePath <- ensureDataFile
    args <- getArgs

    case args of
        ("add":todoId:todoDescription:_) -> addTodo todoId todoDescription todoFilePath
        ("view":_)                       -> viewTodo
        ("remove":todoId:_)              -> removeTodo todoId
        ("complete":todoId:_)            -> completeTodo todoId
        _                                -> putStrLn "Unknown command or incorrect arguments"


