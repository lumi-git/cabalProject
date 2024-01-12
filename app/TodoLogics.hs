module TodoLogics where

import FileManager
import TodoType


readTodoList :: String -> IO String
readTodoList filename = do
    readFile filename

addTodo :: String -> String -> String ->IO ()
addTodo todoId description filePath = do
    let todo = Todo { todoId = todoId, todoDescription = description }
    addTodoToFile filePath todo
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
