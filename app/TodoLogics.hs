module TodoLogics where

readTodoList :: String -> IO String
readTodoList filename = readFile filename

addTodo :: String -> String -> String ->IO ()
addTodo todoId description filePath = do

    let content = todoId ++":" ++"\ndescription: " ++ description ++ "\n"

    writeFile filePath content
    putStrLn ("Added todo: " ++ description)

viewTodo :: IO ()
viewTodo = do
    putStrLn "Viewing todo list..."

removeTodo :: String -> IO ()
removeTodo todoId = do
    putStrLn ("Removed todo with ID: " ++ todoId)

completeTodo :: String -> IO ()
completeTodo todoId = do
    putStrLn ("Completed todo with ID: " ++ todoId)


