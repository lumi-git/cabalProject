module TodoLogics where

readTodoList :: String -> IO String
readTodoList filename = readFile filename

addTodo :: String -> String
addTodo todoUID = todoUID

viewTodo :: String -> String
viewTodo todoUID = todoUID

removeTodo :: String -> String
removeTodo todoUID = todoUID

completeTodo :: String -> String
completeTodo todoUID = todoUID


