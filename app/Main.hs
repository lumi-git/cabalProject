import System.Environment (getArgs)
import TodoLogics
import System.Directory (getHomeDirectory,createDirectoryIfMissing,doesFileExist)
import System.FilePath ((</>))
import System.IO (writeFile)


createFileIfMissing :: FilePath -> IO ()
createFileIfMissing filePath = do
    fileExists <- doesFileExist filePath
    if not fileExists
        then writeFile filePath ""
        else return ()

ensureDataFile :: IO FilePath
ensureDataFile = do
    homeDir <- getHomeDirectory
    let todoFilePath = homeDir </> ".todomanager" </> "todos.yaml"
    createDirectoryIfMissing True (homeDir </> ".todomanager")
    createFileIfMissing todoFilePath
    return todoFilePath


main :: IO ()
main = do
    todoFilePath <- ensureDataFile
    todos <- readTodoList todoFilePath

    args <- getArgs

    print todos

    case args of
        ("add":todoId:todoDescription:_) -> addTodo todoId todoDescription todoFilePath
        ("view":_)                       -> viewTodo
        ("remove":todoId:_)              -> removeTodo todoId
        ("complete":todoId:_)            -> completeTodo todoId
        _                                -> putStrLn "Unknown command or incorrect arguments"


