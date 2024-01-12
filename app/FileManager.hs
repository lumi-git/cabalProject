module FileManager where

import System.Directory (getHomeDirectory,createDirectoryIfMissing,doesFileExist)
import System.FilePath ((</>))
import TodoType

indent :: String -> String
indent content = "\r\t"++ content

convertTodoToYml :: Todo -> String
convertTodoToYml todo = "todoId: " 
                        ++ todoId todo 
                        ++ indent("description: "++ todoDescription todo)
                        ++ "\n"

createFileIfMissing :: FilePath -> IO ()
createFileIfMissing filePath = do
    fileExists <- doesFileExist filePath
    if not fileExists
        then do
            print "--Creating Todo app--"
            writeFile filePath ""
            putStrLn $ "Workspace created at: " ++ filePath
        else return ()

ensureDataFile :: IO FilePath
ensureDataFile = do
    homeDir <- getHomeDirectory
    let todoFilePath = homeDir </> ".todomanager" </> "todos.yaml"
    createDirectoryIfMissing True (homeDir </> ".todomanager")
    createFileIfMissing todoFilePath
    return todoFilePath


addTodoToFile :: FilePath -> Todo -> IO ()
addTodoToFile filePath todo = do 
    let content = convertTodoToYml todo
    appendFile filePath content
    print "todo written"
