ScriptName VPI_Helper 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Public Member Functions
;;;

;; ****************************************************************************
;; Set a float based game setting 
;;
Function SetGameSettingFloat(String gameSetting, Float value) Global
  Debug.ExecuteConsole("setgs " + gameSetting + " " + value)
EndFunction

;; ****************************************************************************
;; Set a integer based game setting 
;;
Function SetGameSettingInt(String gameSetting, Int value) Global
  Debug.ExecuteConsole("setgs " + gameSetting + " " + value)
EndFunction

;; ****************************************************************************
;; Set a float based form setting 
;;
Function SetFormSettingFloat(String formID, Float value) Global
  Debug.ExecuteConsole("set " + formID + " to " + value)
EndFunction

;; ****************************************************************************
;; Set a integer based form setting 
;;
Function SetFormSettingInt(String formID, Int value) Global
  Debug.ExecuteConsole("set " + formID + " to " + value)
EndFunction

;; ****************************************************************************
;; Convert the difficulty int value to the string value
;;
String Function GetDifficulty(int iDifficulty) Global
  if (iDifficulty == 0)
    return "Very Easy"
  ElseIf (iDifficulty == 1)
    return "Easy"
  ElseIf (iDifficulty == 2)
    return "Normal"
  ElseIf (iDifficulty == 3)
    return "Hard"
  ElseIf (iDifficulty == 4)
    return "Very Hard"
  Else
    return "Unknown(" + iDifficulty +")"
  EndIf
EndFunction

;; ****************************************************************************
;; Get the bracket that applies to the player's current level
;;
Int Function GetBracketForPlayerLevel()
  Int playerLevel = PlayerRef.GetLevel()

  If (1 <= playerLevel && playerLevel <= 25)
    return 1
  ElseIf (26 <= playerLevel && playerLevel <= 50)
    return 2
  ElseIf (51 <= playerLevel && playerLevel <= 75)
    return 3
  ElseIf (76 <= playerLevel && playerLevel <= 100)
    return 4
  ElseIf (101 <= playerLevel && playerLevel <= 125)
    return 5
  ElseIf (126 <= playerLevel && playerLevel <= 150)
    return 6
  ElseIf (151 <= playerLevel && playerLevel <= 200)
    return 7
  ElseIf (201 <= playerLevel && playerLevel <= 250)
    return 8
  ElseIf (251 <= playerLevel && playerLevel <= 300)
    return 9
  Else
    return 10
  EndIf
EndFunction
