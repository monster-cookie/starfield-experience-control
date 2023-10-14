;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This script will let you control your experience gains and 
;;; eventually the leveling curve. You need to link this to your 
;;; player actor using the command below:
;;;
;;; player.aps VPI_ExperenceControl
;;;
ScriptName VPI_LevelBasedScaling Extends ReferenceAlias


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;

String Property Version="1.1.5" Auto

Actor Property PlayerRef Auto


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;

;; This event will run once, when the script is initialized and is a member of any and all scripts 
;; per docs. In the terms of ReferenceAlias is called when the script is bound to something. 
Event OnInit() 
  Debug.Trace("EVENT: OnInit triggered populating Properties and resetting XP based on last mode", 0)
  Debug.Notification("Experience Control version " + version + " is currently running.")

  UpdateBindings()

  ;; Handle enable/disble XP based on last setting
EndEvent

;; Event called when the player loads a save game. This event is only sent to the player actor. If 
;; this is the first save game load where the event is being listened to, and the event is on an 
;; alias, and the alias didn't exist at the time the save was made, then the player won't be in the 
;; alias by the time the event is sent, and the alias script will not receive the event. It should 
;; then receive later events.
Event OnPlayerLoadGame()
  Utility.Wait(1.0)
  Debug.Trace("EVENT: OnPlayerLoadGame triggered populating Properties and resetting XP based on last mode", 0)
  Debug.Notification("Experience Control version " + version + " is currently running.")

  UpdateBindings()

  ;; Handle enable/disble XP based on last setting
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Private Member Functions
;;;

;; ****************************************************************************
;; Update property bindings that can't automatically be bound without CK 
;;
Function UpdateBindings()
  if (PlayerRef == None) 
    PlayerRef = Game.GetPlayer()
  EndIf
EndFunction

;; ****************************************************************************
;; Set a float based game setting 
;;
Function SetGameSetting (String gameSetting, Float value)
  Debug.ExecuteConsole("setgs " + gameSetting + " " + value)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Public Member Functions
;;;


;; ****************************************************************************
;; Get the current version of the script
;;
;; Use: player.cf "VPI_LevelBasedScaling.GetVersion"
;;
Function GetVersion()
  Debug.Messagebox("VPI_LevelBasedScaling Version: " + Version)
EndFunction
