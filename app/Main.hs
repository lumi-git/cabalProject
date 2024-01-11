module Main where
import TodoLogics
main :: IO ()
main = do
    let filename = "todolist.txt"
    todos <- TodoLogics.readTodoList filename
    mainLoop todos
  where
    mainLoop todos = do
        putStrLn "Enter a command (add, view, remove, complete, quit):"
        command <- getLine
        let todoUID = command
        case command of
            "add"      -> TodoLogics.addTodo todoUID
            "view"     -> TodoLogics.viewTodo todoUID
            "remove"   -> TodoLogics.removeTodo todoUID
            "complete" -> TodoLogics.completeTodo todoUID
            _          -> putStrLn "Unknown command" >> mainLoop todos todoUID