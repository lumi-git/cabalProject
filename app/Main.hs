import System.Environment (getArgs)
import TodoLogics
import System.Directory (getHomeDirectory,createDirectoryIfMissing,doesFileExist)
import System.FilePath ((</>))
import System.IO (writeFile)


main :: IO ()
main = do
    
    homeDir <- getHomeDirectory
    let todoFilePath = homeDir </> ".todomanager" </> "todos.yaml"
    createDirectoryIfMissing True (homeDir </> ".todomanager")
    createFileIfMissing todoFilePath
    
    todos <- readTodoList todoFilePath

    args <- getArgs

    print todos

    case args of
        ("add":todoId:todoDescription:_) -> TodoLogics.addTodo todoId todoDescription todoFilePath
        ("view":_)                       -> TodoLogics.viewTodo
        ("remove":todoId:_)              -> TodoLogics.removeTodo todoId
        ("complete":todoId:_)            -> TodoLogics.completeTodo todoId
        _                                -> putStrLn "Unknown command or incorrect arguments"

createFileIfMissing :: FilePath -> IO ()
createFileIfMissing filePath = do
    fileExists <- doesFileExist filePath
    if not fileExists
        then writeFile filePath ""
        else return ()
