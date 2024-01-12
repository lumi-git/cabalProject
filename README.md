# TodoApp

>This todo app is built using Haskell for learning purpose.

For now it is a very simple one not interractive (just calls to exe program)

It writes directly the result to the file 

# How to use

Build the app for your system and then link the exe file to your path.

The data file will be specified the first time you launch the app.

It will be located at the user root under ```~/.todomanager/todos.yaml ```


### From the build repository where the exe is built

```bash 
    ./todomanager add LearnHaskell "haskell has very good syntax (no)"
```

### After adding it to the path : 
```bash 
    todomanager add LearnHaskell "haskell has very good syntax (no)"
```
