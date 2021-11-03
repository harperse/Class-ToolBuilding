$ErrorActionPreference = "SilentlyContinue"

Function function3 {
    Try {NonsenseCOmmand}
    Catch {"Error trapped in function"; Throw}
    "Function3 complete"
}

Try {function3}
Catch {"Internal Function error re-thrown $($_.ScriptStackTrace)"}
"script completed"