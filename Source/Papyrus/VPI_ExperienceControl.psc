;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; This script will let you control your experience gains and 
;;; eventually the leveling curve. You need to link this to your 
;;; player actor using the command below:
;;;
;;; player.aps VPI_ExperienceControl
;;;
ScriptName VPI_ExperienceControl Extends ReferenceAlias


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Global Variables
;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;

String Property Version="1.0.1" Auto

Actor Property PlayerRef Auto
ActorValue Property Experience Auto

Bool Property LevelingXPEnabled=true Auto
Bool Property ResearchXPEnabled=true Auto
Bool Property CraftingXPEnabled=true Auto
Bool Property LockpickingXPEnabled=true Auto
Bool Property DiscoveryXPEnabled=true Auto
Bool Property QuestXPEnabled=true Auto
Bool Property SpeechcraftXPEnabled=true Auto

;; Base XP Original Settings
Float Property OriginalXPStart Auto
Float Property OriginalXPBase Auto
Float Property OriginalXPMult Auto
Float Property OriginalXPModBase Auto

;; Cooking XP Original Settings
Float Property OriginalXPCookingBase Auto
Float Property OriginalXPCookingMult Auto
Float Property OriginalXPCookingMin Auto
Float Property OriginalXPCookingMax Auto

;; Research XP Original Settings
Float Property OriginalXPResearchBase Auto
Float Property OriginalXPResearchMult Auto
Float Property OriginalXPResearchMax Auto

;; Crafting XP Original Settings
Float Property OriginalXPCraftingBase Auto
Float Property OriginalXPCraftingMult Auto
Float Property OriginalXPCraftingMin Auto
Float Property OriginalXPCraftingMax Auto

;; Lockpicking/Hacking XP Original Settings
Float Property OriginalXPLockpickingNovice Auto
Float Property OriginalXPLockpickingAdvanced Auto
Float Property OriginalXPLockpickingExpert Auto
Float Property OriginalXPLockpickingMaster Auto

;; Discovery XP Original Settings
Int Property OriginalXPDiscoveryMapMarker Auto
Int Property OriginalXPDiscoverySecretArea Auto
Float Property OriginalXPScanCompletiong Auto

;; Speechcraft XP Original Settings
Float Property OriginalXPSpeechcraftSuccess Auto

;; Combat XP Original Settings
Int Property OriginalXPKillOpponent Auto


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

  ;; Store Current XP Settings
  StoreCurrentXPSettings()

  EnableAllXP()
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

  ;; DO NOT STORE CURRENT SETTINGS THEY WILL WIPE OLD SETTINGS with game defaults and/or garbage

  If (CraftingXPEnabled == true)
    EnableCraftingXP()
  Else 
    DisableCraftingXP()
  EndIf

  If (DiscoveryXPEnabled == true)
    EnableDiscoveryXP()
  Else 
    DisableDiscoveryXP()
  EndIf

  If (LevelingXPEnabled == true)
    EnableLevelingXP()
  Else 
    DisableLevelingXP()
  EndIf

  If (LockpickingXPEnabled == true)
    EnableLockpickingXP()
  Else 
    DisableLockpickingXP()
  EndIf

  If (QuestXPEnabled == true)
    EnableQuestXP()
  Else 
    DisableQuestXP()
  EndIf

  If (ResearchXPEnabled == true)
    EnableResearchXP()
  Else 
    DisableResearchXP()
  EndIf

  If (SpeechcraftXPEnabled == true)
    EnableSpeechcraftXP()
  Else 
    DisableSpeechcraftXP()
  EndIf
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
  if (Experience == None) 
    Experience = Game.GetForm(0x000002C9) as ActorValue
  EndIf
EndFunction

;; ****************************************************************************
;; Set a float based game setting 
;;
Function SetGameSettingFloat(String gameSetting, Float value)
  Debug.ExecuteConsole("setgs " + gameSetting + " " + value)
EndFunction

;; ****************************************************************************
;; Set a integer based game setting 
;;
Function SetGameSettingInt(String gameSetting, Int value)
  Debug.ExecuteConsole("setgs " + gameSetting + " " + value)
EndFunction

;; ****************************************************************************
;; Set a float based form setting 
;;
Function SetFormSettingFloat(String formID, Float value)
  Debug.ExecuteConsole("set " + formID + " to " + value)
EndFunction

;; ****************************************************************************
;; Set a integer based form setting 
;;
Function SetFormSettingInt(String formID, Int value)
  Debug.ExecuteConsole("set " + formID + " to " + value)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Public Member Functions
;;;

;; ****************************************************************************
;; Backup current XP Settings for later restore with EnableXP
;;
;; Use: player.cf "VPI_ExperienceControl.StoreCurrentXPSettings"
;;
Function StoreCurrentXPSettings()
  Debug.MessageBox("Current Game XP settings (except quest values) hav been backed up to your save and can be restored by using EnableXP")

  ;; Base XP Settings
  OriginalXPStart=Game.GetGameSettingFloat("fXPStart")
  OriginalXPBase=Game.GetGameSettingFloat("fXPBase")
  OriginalXPMult=Game.GetGameSettingFloat("fXPExpMult")
  OriginalXPModBase=Game.GetGameSettingFloat("fXPModBase")
  
  ;; Cooking XP Settings
  OriginalXPCookingBase=Game.GetGameSettingFloat("fCookingExpBase")
  OriginalXPCookingMult=Game.GetGameSettingFloat("fCookingExpMult")
  OriginalXPCookingMin=Game.GetGameSettingFloat("fCookingExpMin")
  OriginalXPCookingMax=Game.GetGameSettingFloat("fCookingExpMax")
  
  ;; Research XP Settings
  OriginalXPResearchBase=Game.GetGameSettingFloat("fResearchExpBase")
  OriginalXPResearchMult=Game.GetGameSettingFloat("fResearchExpMult")
  OriginalXPResearchMax=Game.GetGameSettingFloat("fResearchExpMax")
  
  ;; Crafting XP Settings
  OriginalXPCraftingBase=Game.GetGameSettingFloat("fWorkbenchExperienceBase")
  OriginalXPCraftingMult=Game.GetGameSettingFloat("fWorkbenchExperienceMult")
  OriginalXPCraftingMin=Game.GetGameSettingFloat("fWorkbenchExperienceMin")
  OriginalXPCraftingMax=Game.GetGameSettingFloat("fWorkbenchExperienceMax")
  
  ;; Lockpicking/Hacking XP Settings
  OriginalXPLockpickingNovice=Game.GetGameSettingFloat("fLockpickXPRewardEasy")
  OriginalXPLockpickingAdvanced=Game.GetGameSettingFloat("fLockpickXPRewardAverage")
  OriginalXPLockpickingExpert=Game.GetGameSettingFloat("fLockpickXPRewardHard")
  OriginalXPLockpickingMaster=Game.GetGameSettingFloat("fLockpickXPRewardVeryHard")
  
  ;; Discovery XP Settings
  OriginalXPDiscoveryMapMarker=Game.GetGameSettingInt("iXPRewardDiscoverMapMarker")
  OriginalXPDiscoverySecretArea=Game.GetGameSettingInt("iXPRewardDiscoverSecretArea")
  OriginalXPScanCompletiong=Game.GetGameSettingFloat("fScanCompleteXPReward")

  ;; Speechcraft XP Settings
  OriginalXPSpeechcraftSuccess=Game.GetGameSettingFloat("fSpeechChallengeSuccessXP")

  ;; Combat XP Settings
  OriginalXPKillOpponent=Game.GetGameSettingInt("iXPRewardKillOpponent")

  ;;
  ;; Will not store quest XP too much of a pain and not very likely they were changed from defaults
  ;;

EndFunction

;; ****************************************************************************
;; Disable All Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableAllXP"
;;
Function DisableAllXP()
  DisableCraftingXP()
  DisableDiscoveryXP()
  DisableLevelingXP()
  DisableLockpickingXP()
  DisableQuestXP()
  DisableResearchXP()
  DisableSpeechcraftXP()
EndFunction


;; ****************************************************************************
;; Disable Leveling Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableLevelingXP"
;;
Function DisableLevelingXP()
  LevelingXPEnabled=false

  ;; Base XP Settings
  SetGameSettingFloat("fXPStart", 100000000.00)
  SetGameSettingFloat("fXPBase", 0.00)
  SetGameSettingFloat("fXPExpMult", 0.00)
  SetGameSettingFloat("fXPModBase", 0.00)

  ;; Combat XP Settings
  SetGameSettingInt("iXPRewardKillOpponent", 0)
EndFunction

;; ****************************************************************************
;; Disable Crafting Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableCraftingXP"
;;
Function DisableCraftingXP()
  CraftingXPEnabled=false
 
  ;; Cooking XP Settings
  SetGameSettingFloat("fCookingExpBase", 0.00)
  SetGameSettingFloat("fCookingExpMult", 0.00)
  SetGameSettingFloat("fCookingExpMin", 0.00)
  SetGameSettingFloat("fCookingExpMax", 0.00)
  
  ;; Crafting XP Settings
  SetGameSettingFloat("fWorkbenchExperienceBase", 0.00)
  SetGameSettingFloat("fWorkbenchExperienceMult", 0.00)
  SetGameSettingFloat("fWorkbenchExperienceMin", 0.00)
  SetGameSettingFloat("fWorkbenchExperienceMax", 0.00)
EndFunction

;; ****************************************************************************
;; Disable Research Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableResearchXP"
;;
Function DisableResearchXP()
  ResearchXPEnabled=false
 
  ;; Research XP Settings
  SetGameSettingFloat("fResearchExpBase", 0.00)
  SetGameSettingFloat("fResearchExpMult", 0.00)
  SetGameSettingFloat("fResearchExpMax", 0.00)
EndFunction

;; ****************************************************************************
;; Disable Lockpicking/Hacking Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableLockpickingXP"
;;
Function DisableLockpickingXP()
  LockpickingXPEnabled=false
  
  ;; Lockpicking/Hacking XP Settings
  SetGameSettingFloat("fLockpickXPRewardEasy", 0.00)
  SetGameSettingFloat("fLockpickXPRewardAverage", 0.00)
  SetGameSettingFloat("fLockpickXPRewardHard", 0.00)
  SetGameSettingFloat("fLockpickXPRewardVeryHard", 0.00)
EndFunction

;; ****************************************************************************
;; Disable Discovery Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableDiscoveryXP"
;;
Function DisableDiscoveryXP()
  DiscoveryXPEnabled=false
  
  ;; Discovery XP Settings
  SetGameSettingInt("iXPRewardDiscoverMapMarker", 0)
  SetGameSettingInt("iXPRewardDiscoverSecretArea", 0)
  SetGameSettingFloat("fScanCompleteXPReward", 0.00)
EndFunction

;; ****************************************************************************
;; Disable Speechcraft Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableSpeechcraftXP"
;;
Function DisableSpeechcraftXP()
  SpeechcraftXPEnabled=false

  ;; Speechcraft XP Settings
  SetGameSettingFloat("fSpeechChallengeSuccessXP", 0.00)
EndFunction

;; ****************************************************************************
;; Disable Quest Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableDiscoveryXP"
;;
Function DisableQuestXP()
  QuestXPEnabled=false

  ;; Main Story Quests
  SetFormSettingFloat("000DF3E1", 0.00)
  SetFormSettingFloat("0023DF3D", 0.00)
  SetFormSettingFloat("000DF3E0", 0.00)
  SetFormSettingFloat("0011C0E1", 0.00)
  SetFormSettingFloat("0011C0E0", 0.00)
  SetFormSettingFloat("0011C0DF", 0.00)
  SetFormSettingFloat("0011C0EA", 0.00)
  SetFormSettingFloat("0011C0E3", 0.00)

  ;; Faction Quests
  SetFormSettingFloat("000DF3DE", 0.00)
  SetFormSettingFloat("0023DF3B", 0.00)
  SetFormSettingFloat("000DF3DD", 0.00)

  ;; Radient Quests
  SetFormSettingFloat("000DF3E5", 0.00)
  SetFormSettingFloat("00100AB6", 0.00)
  SetFormSettingFloat("00100ABC", 0.00)
  SetFormSettingFloat("0016D9A6", 0.00)
  SetFormSettingFloat("001AF650", 0.00)
  SetFormSettingFloat("0022B890", 0.00)
  SetFormSettingFloat("0022B943", 0.00)
  SetFormSettingFloat("0022B947", 0.00)
  SetFormSettingFloat("0022B94B", 0.00)
  SetFormSettingFloat("00255B55", 0.00)
  SetFormSettingFloat("00255B60", 0.00)
  SetFormSettingFloat("00255B6B", 0.00)
  SetFormSettingFloat("00255B75", 0.00)
  SetFormSettingFloat("00269A65", 0.00)
  SetFormSettingFloat("00269BF3", 0.00)
  SetFormSettingFloat("001AB4F3", 0.00)
  SetFormSettingFloat("0023DF35", 0.00)
  SetFormSettingFloat("000023A2", 0.00)
  SetFormSettingFloat("000023A3", 0.00)
  SetFormSettingFloat("00002690", 0.00)
  SetFormSettingFloat("00003DDC", 0.00)
  SetFormSettingFloat("001AEA62", 0.00)

  ;; Misc Quests
  SetFormSettingFloat("002685E7", 0.00)
  SetFormSettingFloat("000DF3E4", 0.00)
  SetFormSettingFloat("0023DF3C", 0.00)
  SetFormSettingFloat("000DF3E2", 0.00)

  ;; Other Quests
  SetFormSettingFloat("000FD332", 0.00)
  SetFormSettingFloat("00167860", 0.00)
  SetFormSettingFloat("002E0EC4", 0.00)
  SetFormSettingFloat("0006B510", 0.00)
  SetFormSettingFloat("000F3CF9", 0.00)
  SetFormSettingFloat("000F19CC", 0.00)
  SetFormSettingFloat("00246AD7", 0.00)

  ;; Planet/System Surveys
  SetFormSettingFloat("00245AB9", 0.00)
  SetFormSettingFloat("001AEB4E", 0.00)
  SetFormSettingFloat("0030A8C5", 0.00)
  SetFormSettingFloat("0030A8C6", 0.00)
  SetFormSettingFloat("0030A8C7", 0.00)
  SetFormSettingFloat("00056E62", 0.00)
  SetFormSettingFloat("0023842C", 0.00)
  SetFormSettingFloat("0030A8C8", 0.00)
  SetFormSettingFloat("0030A8C9", 0.00)
  SetFormSettingFloat("0030A8CA", 0.00)
  SetFormSettingFloat("0030A8CB", 0.00)

  ;; Settlement Quests
  SetFormSettingFloat("000DF3E7", 0.00)
  SetFormSettingFloat("0010DF00", 0.00)
  SetFormSettingFloat("0010DF0E", 0.00)
  SetFormSettingFloat("0010DF12", 0.00)
  SetFormSettingFloat("0010DF16", 0.00)
  SetFormSettingFloat("001AB4F2", 0.00)
  SetFormSettingFloat("0023DF34", 0.00)

  ;; Mission Board Quests
  SetFormSettingFloat("0009E153", 0.00)
  SetFormSettingFloat("0016AB84", 0.00)
  SetFormSettingFloat("0016AB85", 0.00)
  SetFormSettingFloat("0016AB86", 0.00)
  SetFormSettingFloat("0016AB87", 0.00)
  SetFormSettingFloat("0016AB88", 0.00)
EndFunction

;; ****************************************************************************
;; Enable All Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableAllXP"
;;
Function EnableAllXP()
  EnableCraftingXP()
  EnableDiscoveryXP()
  EnableLevelingXP()
  EnableLockpickingXP()
  EnableQuestXP()
  EnableResearchXP()
  EnableSpeechcraftXP()
EndFunction

;; ****************************************************************************
;; Enable Leveling Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableLevelingXP"
;;
Function EnableLevelingXP()
  LevelingXPEnabled=true

  ;; Base XP Settings
  SetGameSettingFloat("fXPStart", OriginalXPStart)
  SetGameSettingFloat("fXPBase", OriginalXPBase)
  SetGameSettingFloat("fXPExpMult", OriginalXPMult)
  SetGameSettingFloat("fXPModBase", OriginalXPModBase)

  ;; Combat XP Settings
  SetGameSettingInt("iXPRewardKillOpponent", 20)
EndFunction

;; ****************************************************************************
;; Enable Crafting Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableCraftingXP"
;;
Function EnableCraftingXP()
  CraftingXPEnabled=true
  
  ;; Cooking XP Settings
  SetGameSettingFloat("fCookingExpBase", OriginalXPCookingBase)
  SetGameSettingFloat("fCookingExpMult", OriginalXPCookingMult)
  SetGameSettingFloat("fCookingExpMin", OriginalXPCookingMin)
  SetGameSettingFloat("fCookingExpMax", OriginalXPCookingMax)
  
  ;; Crafting XP Settings
  SetGameSettingFloat("fWorkbenchExperienceBase", OriginalXPCraftingBase)
  SetGameSettingFloat("fWorkbenchExperienceMult", OriginalXPCraftingMult)
  SetGameSettingFloat("fWorkbenchExperienceMin", OriginalXPCraftingMin)
  SetGameSettingFloat("fWorkbenchExperienceMax", OriginalXPCraftingMax)
EndFunction

;; ****************************************************************************
;; Enable Research Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableResearchXP"
;;
Function EnableResearchXP()
  ResearchXPEnabled=true
  
  ;; Research XP Settings
  SetGameSettingFloat("fResearchExpBase", OriginalXPResearchBase)
  SetGameSettingFloat("fResearchExpMult", OriginalXPResearchMult)
  SetGameSettingFloat("fResearchExpMax", OriginalXPResearchMax)
EndFunction

;; ****************************************************************************
;; Enable Lockpicking Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableLockpickingXP"
;;
Function EnableLockpickingXP()
  LockpickingXPEnabled=true
  
  ;; Lockpicking/Hacking XP Settings
  SetGameSettingFloat("fLockpickXPRewardEasy", OriginalXPLockpickingNovice)
  SetGameSettingFloat("fLockpickXPRewardAverage", OriginalXPLockpickingAdvanced)
  SetGameSettingFloat("fLockpickXPRewardHard", OriginalXPLockpickingExpert)
  SetGameSettingFloat("fLockpickXPRewardVeryHard", OriginalXPLockpickingMaster)
EndFunction

;; ****************************************************************************
;; Enable Discovery Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableDiscoveryXP"
;;
Function EnableDiscoveryXP()
  DiscoveryXPEnabled=true
  
  ;; Discovery XP Settings
  SetGameSettingInt("iXPRewardDiscoverMapMarker", OriginalXPDiscoveryMapMarker)
  SetGameSettingInt("iXPRewardDiscoverSecretArea", OriginalXPDiscoverySecretArea)
  SetGameSettingFloat("fScanCompleteXPReward", OriginalXPScanCompletiong)
EndFunction

;; ****************************************************************************
;; Enable Speechcraft Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableSpeechcraftXP"
;;
Function EnableSpeechcraftXP()
  SpeechcraftXPEnabled=true

  ;; Speechcraft XP Settings
  SetGameSettingFloat("fSpeechChallengeSuccessXP", OriginalXPSpeechcraftSuccess)
EndFunction

;; ****************************************************************************
;; Enable Quest Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableQuestXP"
;;
Function EnableQuestXP()
  QuestXPEnabled=true

  ;; Main Story Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("000DF3E1", 300)
  SetFormSettingFloat("0023DF3D", 350)
  SetFormSettingFloat("000DF3E0", 400)
  SetFormSettingFloat("0011C0E1", 700)
  SetFormSettingFloat("0011C0E0", 750)
  SetFormSettingFloat("0011C0DF", 800)
  SetFormSettingFloat("0011C0EA", 4500)
  SetFormSettingFloat("0011C0E3", 5000)

  ;; Faction Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("000DF3DE", 150)
  SetFormSettingFloat("0023DF3B", 250)
  SetFormSettingFloat("000DF3DD", 350)

  ;; Radient Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("000DF3E5", 100)
  SetFormSettingFloat("00100AB6", 100)
  SetFormSettingFloat("00100ABC", 100)
  SetFormSettingFloat("0016D9A6", 100)
  SetFormSettingFloat("001AF650", 100)
  SetFormSettingFloat("0022B890", 100)
  SetFormSettingFloat("0022B943", 100)
  SetFormSettingFloat("0022B947", 100)
  SetFormSettingFloat("0022B94B", 100)
  SetFormSettingFloat("00255B55", 100)
  SetFormSettingFloat("00255B60", 100)
  SetFormSettingFloat("00255B6B", 100)
  SetFormSettingFloat("00255B75", 100)
  SetFormSettingFloat("00269A65", 100)
  SetFormSettingFloat("00269BF3", 100)
  SetFormSettingFloat("001AB4F3", 125)
  SetFormSettingFloat("0023DF35", 150)
  SetFormSettingFloat("000023A2", 150)
  SetFormSettingFloat("000023A3", 150)
  SetFormSettingFloat("00002690", 150)
  SetFormSettingFloat("00003DDC", 150)
  SetFormSettingFloat("001AEA62", 150)

  ;; Misc Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("002685E7", 50)
  SetFormSettingFloat("000DF3E4", 100)
  SetFormSettingFloat("0023DF3C", 200)
  SetFormSettingFloat("000DF3E2", 300)

  ;; Other Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("000FD332", 250)
  SetFormSettingFloat("00167860", 100)
  SetFormSettingFloat("002E0EC4", 100)
  SetFormSettingFloat("0006B510", 200)
  SetFormSettingFloat("000F3CF9", 300)
  SetFormSettingFloat("000F19CC", 400)
  SetFormSettingFloat("00246AD7", 200)

  ;; Planet/System Surveys -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("00245AB9", 100)
  SetFormSettingFloat("001AEB4E", 100)
  SetFormSettingFloat("0030A8C5", 50)
  SetFormSettingFloat("0030A8C6", 100)
  SetFormSettingFloat("0030A8C7", 200)
  SetFormSettingFloat("00056E62", 300)
  SetFormSettingFloat("0023842C", 500)
  SetFormSettingFloat("0030A8C8", 50)
  SetFormSettingFloat("0030A8C9", 100)
  SetFormSettingFloat("0030A8CA", 200)
  SetFormSettingFloat("0030A8CB", 300)

  ;; Settlement Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("000DF3E7", 50)
  SetFormSettingFloat("0010DF00", 50)
  SetFormSettingFloat("0010DF0E", 50)
  SetFormSettingFloat("0010DF12", 50)
  SetFormSettingFloat("0010DF16", 50)
  SetFormSettingFloat("001AB4F2", 75)
  SetFormSettingFloat("0023DF34", 100)

  ;; Mission Board Quests -- Too complicated to store this much so resetting to game defaults
  SetFormSettingFloat("0009E153", 100)
  SetFormSettingFloat("0016AB84", 100)
  SetFormSettingFloat("0016AB85", 150)
  SetFormSettingFloat("0016AB86", 200)
  SetFormSettingFloat("0016AB87", 300)
  SetFormSettingFloat("0016AB88", 500)
EndFunction

;; ****************************************************************************
;; Check status of current XP gain settings
;;
;; Use: player.cf "VPI_ExperienceControl.CurrentXPStatus"
;;
Function CurrentXPStatus()
  Float gameXPStart=Game.GetGameSettingFloat("fXPStart")
  Float gameXPMultiplier=Game.GetGameSettingFloat("fXPExpMult")

  Float gameXPCookingBase=Game.GetGameSettingFloat("fCookingExpBase")
  Float gameXPCookingMult=Game.GetGameSettingFloat("fCookingExpMult")

  Float gameXPResearchBase=Game.GetGameSettingFloat("fResearchExpBase")
  Float gameXPResearchMult=Game.GetGameSettingFloat("fResearchExpMult")

  Float gameXPCraftingBase=Game.GetGameSettingFloat("fWorkbenchExperienceBase")
  Float gameXPCraftingMult=Game.GetGameSettingFloat("fWorkbenchExperienceMult")

  Float gameXPLockpickingNovice=Game.GetGameSettingFloat("fLockpickXPRewardEasy")
  Float gameXPLockpickingAdvanced=Game.GetGameSettingFloat("fLockpickXPRewardAverage")
  Float gameXPLockpickingExpert=Game.GetGameSettingFloat("fLockpickXPRewardHard")
  Float gameXPLockpickingMaster=Game.GetGameSettingFloat("fLockpickXPRewardVeryHard")

  Float gameXPSpeechcraftSuccess=Game.GetGameSettingFloat("fSpeechChallengeSuccessXP")

  Int gameXPKillOpponent=Game.GetGameSettingInt("iXPRewardKillOpponent")

  String message = "Using Experience Control v" + Version + ".\n"

  message += "XP Status:  "
  If (LevelingXPEnabled)
    message += "Leveling Enabled, "
  Else
    message += "Leveling Disabled, "
  EndIf    
  If (CraftingXPEnabled)
    message += "Crafting Enabled, "
  Else
    message += "Crafting Disabled, "
  EndIf    
  If (ResearchXPEnabled)
    message += "Research Enabled, "
  Else
    message += "Research Disabled, "
  EndIf    
  If (DiscoveryXPEnabled)
    message += "Discovery Enabled, "
  Else
    message += "Discovery Disabled, "
  EndIf    
  If (LockpickingXPEnabled)
    message += "Lockpicking/Hacking Enabled, "
  Else
    message += "Lockpicking/Hacking Disabled, "
  EndIf    
  If (SpeechcraftXPEnabled)
    message += "Speechcraft Enabled, "
  Else
    message += "Speechcraft Disabled, "
  EndIf    
  If (QuestXPEnabled)
    message += "Quest Enabled"
  Else
    message += "Quest Disabled"
  EndIf    
  message += ".\n"

  message += "XP per level is set to " + gameXPStart + " and the XP multiplier is set to " + gameXPMultiplier + ".\n"
  message += "Combat Kill XP is set to " + gameXPKillOpponent + ".\n"
  message += "Cooking XP is set to " + gameXPCookingBase + " and the cooking multiplier is set too " + gameXPCookingMult + ".\n"
  message += "Research XP is set to " + gameXPResearchBase + " and the research multiplier is set too " + gameXPResearchMult + ".\n"
  message += "Crafting XP is set to " + gameXPCraftingBase + " and the crafting multiplier is set too " + gameXPCraftingMult + ".\n"
  message += "Lockpicking XP is set to " + gameXPLockpickingNovice + " for novice, " + gameXPLockpickingAdvanced + " for advanced, " + gameXPLockpickingExpert + " for expert, and finally " + gameXPLockpickingMaster + " for master.\n"
  message += "Speechcraft XP is set to " + gameXPSpeechcraftSuccess + ".\n"
  
  Debug.Trace(message, 1)
  Debug.MessageBox(message)
EndFunction

;; ****************************************************************************
;; Get the current version of the script
;;
;; Use: player.cf "VPI_ExperienceControl.GetVersion"
;;
Function GetVersion()
  Debug.Messagebox("VPI_ExperienceControl Version: " + Version)
EndFunction
