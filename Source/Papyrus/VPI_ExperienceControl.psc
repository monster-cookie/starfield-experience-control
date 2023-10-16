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
GlobalVariable Property MainQuestAct1XPRewardSmall Auto   ;; Form ID 000DF3E1
GlobalVariable Property MainQuestAct1XPRewardMedium Auto  ;; Form ID 0023DF3D
GlobalVariable Property MainQuestAct1XPRewardLarge Auto   ;; Form ID 000DF3E0
GlobalVariable Property MainQuestAct2XPRewardSmall Auto   ;; Form ID 0011C0E1
GlobalVariable Property MainQuestAct2XPRewardMedium Auto  ;; Form ID 0011C0E0
GlobalVariable Property MainQuestAct2XPRewardLarge Auto   ;; Form ID 0011C0DF
;; GlobalVariable Property MainQuestAct3XPRewardSmall Auto   ;; Form ID ???????? -- Doesn't seeem to exist but should per leveling curve
GlobalVariable Property MainQuestAct3XPRewardMedium Auto  ;; Form ID 0011C0EA
GlobalVariable Property MainQuestAct3XPRewardLarge Auto   ;; Form ID 0011C0E3

GlobalVariable Property FactionQuestXPRewardSmall Auto   ;; Form ID 000DF3DE
GlobalVariable Property FactionQuestXPRewardMedium Auto  ;; Form ID 0023DF3B
GlobalVariable Property FactionQuestXPRewardLarge Auto   ;; Form ID 000DF3DD

GlobalVariable Property RadiantQuestVersion01XPRewardSmall Auto   ;; Form ID 000DF3E5
GlobalVariable Property RadiantQuestVersion02XPRewardSmall Auto   ;; Form ID 00100AB6
GlobalVariable Property RadiantQuestVersion03XPRewardSmall Auto   ;; Form ID 00100ABC
GlobalVariable Property RadiantQuestVersion04XPRewardSmall Auto   ;; Form ID 0016D9A6
GlobalVariable Property RadiantQuestVersion05XPRewardSmall Auto   ;; Form ID 001AF650
GlobalVariable Property RadiantQuestVersion06XPRewardSmall Auto   ;; Form ID 0022B890
GlobalVariable Property RadiantQuestVersion07XPRewardSmall Auto   ;; Form ID 0022B943
GlobalVariable Property RadiantQuestVersion08XPRewardSmall Auto   ;; Form ID 0022B947
GlobalVariable Property RadiantQuestVersion09XPRewardSmall Auto   ;; Form ID 0022B94B
GlobalVariable Property RadiantQuestVersion10XPRewardSmall Auto   ;; Form ID 00255B55
GlobalVariable Property RadiantQuestVersion11XPRewardSmall Auto   ;; Form ID 00255B60
GlobalVariable Property RadiantQuestVersion12XPRewardSmall Auto   ;; Form ID 00255B6B
GlobalVariable Property RadiantQuestVersion13XPRewardSmall Auto   ;; Form ID 00255B75
GlobalVariable Property RadiantQuestVersion14XPRewardSmall Auto   ;; Form ID 00269A65
GlobalVariable Property RadiantQuestVersion15XPRewardSmall Auto   ;; Form ID 00269BF3
GlobalVariable Property RadiantQuestVersion01XPRewardMedium Auto  ;; Form ID 001AB4F3
GlobalVariable Property RadiantQuestVersion01XPRewardLarge Auto   ;; Form ID 0023DF35
GlobalVariable Property RadiantQuestVersion02XPRewardLarge Auto   ;; Form ID 000023A2
GlobalVariable Property RadiantQuestVersion03XPRewardLarge Auto   ;; Form ID 000023A3
GlobalVariable Property RadiantQuestVersion04XPRewardLarge Auto   ;; Form ID 00002690
GlobalVariable Property RadiantQuestVersion05XPRewardLarge Auto   ;; Form ID 00003DDC
GlobalVariable Property RadiantQuestVersion06XPRewardLarge Auto   ;; Form ID 001AEA62

GlobalVariable Property MiscQuestXPRewardTiny Auto           ;; Form ID 002685E7
GlobalVariable Property MiscQuestXPRewardSmall Auto          ;; Form ID 000DF3E4
GlobalVariable Property MiscQuestXPRewardMedium Auto         ;; Form ID 0023DF3C
GlobalVariable Property MiscQuestXPRewardLarge Auto          ;; Form ID 000DF3E2
GlobalVariable Property CompanionQuestXPReward Auto          ;; Form ID 000FD332
GlobalVariable Property OptionalObjectiveQuestXPReward Auto  ;; Form ID 00167860
GlobalVariable Property RedMileRunQuestXPReward Auto         ;; Form ID 002E0EC4
GlobalVariable Property OESmallQuestXPReward Auto            ;; Form ID 0006B510
GlobalVariable Property OEMediumQuestXPReward Auto           ;; Form ID 000F3CF9
GlobalVariable Property OELargeQuestXPReward Auto            ;; Form ID 000F19CC
GlobalVariable Property StarbornTempleXPReward Auto          ;; Form ID 00246AD7
; GlobalVariable Property CydoniaRedTapeQuestXPReward Auto     ;; Form ID 00237408 -- Not used default is 0
; GlobalVariable Property UnknownAppTrackingQuestXPReward Auto ;; Form ID 0027A57A -- Not used default is 0

GlobalVariable Property PlanetaryTraitXPReward Auto            ;; Form ID 00245AB9
GlobalVariable Property PlanetaryTraitSkillBonusXPReward Auto  ;; Form ID 001AEB4E
GlobalVariable Property PlanetaryTraitAstroBonusXPReward Auto  ;; Form ID 002B97EC
GlobalVariable Property PlanetarySurveyV1XPReward Auto         ;; Form ID 0030A8C5
GlobalVariable Property PlanetarySurveyV2XPReward Auto         ;; Form ID 0030A8C6
GlobalVariable Property PlanetarySurveyV3XPReward Auto         ;; Form ID 0030A8C7
GlobalVariable Property PlanetarySurveyV4XPReward Auto         ;; Form ID 00056E62
GlobalVariable Property PlanetarySurveyV5XPReward Auto         ;; Form ID 0023842C
GlobalVariable Property SystemSurveyV1XPReward Auto            ;; Form ID 0030A8C8
GlobalVariable Property SystemSurveyV2XPReward Auto            ;; Form ID 0030A8C9
GlobalVariable Property SystemSurveyV3XPReward Auto            ;; Form ID 0030A8CA
GlobalVariable Property SystemSurveyV4XPReward Auto            ;; Form ID 0030A8CB

GlobalVariable Property SettlementV1QuestXPRewardSmall Auto    ;; Form ID 000DF3E7
GlobalVariable Property SettlementV2QuestXPRewardSmall Auto    ;; Form ID 0010DF00
GlobalVariable Property SettlementV3QuestXPRewardSmall Auto    ;; Form ID 0010DF0E
GlobalVariable Property SettlementV4QuestXPRewardSmall Auto    ;; Form ID 0010DF12
GlobalVariable Property SettlementV5QuestXPRewardSmall Auto    ;; Form ID 0010DF16
GlobalVariable Property SettlementV1QuestXPRewardMedium Auto   ;; Form ID 001AB4F2
GlobalVariable Property SettlementV1QuestXPRewardLarge Auto    ;; Form ID 0023DF34

GlobalVariable Property MissionBoardSurveyBaseXPReward Auto            ;; Form ID 0009E153
; GlobalVariable Property MissionBoardSurveyActualV1XPReward Auto        ;; Form ID 0016AB80 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyActualV2XPReward Auto        ;; Form ID 0016AB81 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyActualV3XPReward Auto        ;; Form ID 0016AB82 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyActualV4XPReward Auto        ;; Form ID 0016AB83 -- Not used default is 0
GlobalVariable Property MissionBoardSurveyTraitV1XPReward Auto         ;; Form ID 0016AB84
GlobalVariable Property MissionBoardSurveyTraitV2XPReward Auto         ;; Form ID 0016AB85
GlobalVariable Property MissionBoardSurveyTraitV3XPReward Auto         ;; Form ID 0016AB86
GlobalVariable Property MissionBoardSurveyTraitV4XPReward Auto         ;; Form ID 0016AB87
GlobalVariable Property MissionBoardSurveyTraitV5XPReward Auto         ;; Form ID 0016AB88
; GlobalVariable Property MissionBoardSurveyTraitActualV01XPReward Auto  ;; Form ID 0016AB89 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV02XPReward Auto  ;; Form ID 0016AB8A -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV03XPReward Auto  ;; Form ID 0016AB8B -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV04XPReward Auto  ;; Form ID 0016AB8C -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV05XPReward Auto  ;; Form ID 0016AB8D -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV06XPReward Auto  ;; Form ID 0016AB8E -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV07XPReward Auto  ;; Form ID 0016AB8F -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV08XPReward Auto  ;; Form ID 0016AB90 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV09XPReward Auto  ;; Form ID 0016AB91 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV10XPReward Auto  ;; Form ID 0016AB92 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV11XPReward Auto  ;; Form ID 0016AB93 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV12XPReward Auto  ;; Form ID 0016AB94 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV13XPReward Auto  ;; Form ID 0016AB95 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV14XPReward Auto  ;; Form ID 0016AB96 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV15XPReward Auto  ;; Form ID 0016AB97 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV16XPReward Auto  ;; Form ID 0016AB98 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV17XPReward Auto  ;; Form ID 0016AB99 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV18XPReward Auto  ;; Form ID 0016AB9A -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV19XPReward Auto  ;; Form ID 0016AB9B -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV20XPReward Auto  ;; Form ID 0016AB9C -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV21XPReward Auto  ;; Form ID 0016AB9D -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV22XPReward Auto  ;; Form ID 0016AB9E -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV23XPReward Auto  ;; Form ID 0016AB9F -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV24XPReward Auto  ;; Form ID 0016ABA0 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV25XPReward Auto  ;; Form ID 0016ABA1 -- Not used default is 0
; GlobalVariable Property MissionBoardSurveyTraitActualV26XPReward Auto  ;; Form ID 0016ABA2 -- Not used default is 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Properties
;;;

String Property Version="1.1.0" Auto ;; -- MOD VERSION SET HERE

Actor Property PlayerRef Auto
ActorValue Property Experience Auto

Bool Property LevelingXPEnabled=true Auto
Bool Property ResearchXPEnabled=true Auto
Bool Property CraftingXPEnabled=true Auto
Bool Property LockpickingXPEnabled=true Auto
Bool Property DiscoveryXPEnabled=true Auto
Bool Property QuestXPEnabled=true Auto
Bool Property SpeechcraftXPEnabled=true Auto

;; Base XP Settings
Float Property ConfigXPStart Auto
Float Property ConfigXPBase Auto
Float Property ConfigXPMult Auto
Float Property ConfigXPModBase Auto

;; Cooking XP Settings
Float Property ConfigXPCookingBase Auto
Float Property ConfigXPCookingMult Auto
Float Property ConfigXPCookingMin Auto
Float Property ConfigXPCookingMax Auto

;; Research XP Settings
Float Property ConfigXPResearchBase Auto
Float Property ConfigXPResearchMult Auto
Float Property ConfigXPResearchMax Auto

;; Crafting XP Settings
Float Property ConfigXPCraftingBase Auto
Float Property ConfigXPCraftingMult Auto
Float Property ConfigXPCraftingMin Auto
Float Property ConfigXPCraftingMax Auto

;; Lockpicking/Hacking XP Settings
Float Property ConfigXPLockpickingNovice Auto
Float Property ConfigXPLockpickingAdvanced Auto
Float Property ConfigXPLockpickingExpert Auto
Float Property ConfigXPLockpickingMaster Auto
Float Property ConfigXPHackingExperienceBase Auto

;; Discovery XP Settings
Int Property ConfigXPDiscoveryMapMarker Auto
Int Property ConfigXPDiscoverySecretArea Auto
Float Property ConfigXPScanCompletiong Auto

;; Speechcraft XP Settings
Float Property ConfigXPSpeechcraftSuccess Auto

;; Combat XP Settings
Int Property ConfigXPKillOpponent Auto
Float Property ConfigXPDiffMultXPVE Auto
Float Property ConfigXPDiffMultXPE Auto
Float Property ConfigXPDiffMultXPN Auto
Float Property ConfigXPDiffMultXPH Auto
Float Property ConfigXPDiffMultXPVH Auto

;; Quest Settings
Int Property ConfigMQACT1Small Auto
Int Property ConfigMQACT1Medium Auto
Int Property ConfigMQACT1Large Auto
Int Property ConfigMQACT2Small Auto
Int Property ConfigMQACT2Medium Auto
Int Property ConfigMQACT2Large Auto
Int Property ConfigMQACT3Small Auto
Int Property ConfigMQACT3Medium Auto
Int Property ConfigMQACT3Large Auto

Int Property ConfigQuestTN Auto    ;; Generally 50
Int Property ConfigQuestSM Auto    ;; Generally 100
Int Property ConfigQuestMD Auto    ;; Generally 200
Int Property ConfigQuestLG Auto    ;; Generally 300
Int Property ConfigQuestXL Auto    ;; GEnerally 500
Int Property ConfigQuestXXL Auto   ;; GEnerally 750
Int Property ConfigQuestXXXL Auto  ;; GEnerally 1000
Int Property ConfigQuestMSVSM Auto ;; GEnerally 4000
Int Property ConfigQuestMSVMD Auto ;; GEnerally 4500
Int Property ConfigQuestMSVLG Auto ;; GEnerally 5000


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

  ;; If Version is not set or not current update it -- MOD VERSION SET HERE
  If (Version != "1.1.0")
    Version = "1.1.0"
  EndIf

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
  ConfigXPStart=Game.GetGameSettingFloat("fXPStart")
  ConfigXPBase=Game.GetGameSettingFloat("fXPBase")
  ConfigXPMult=Game.GetGameSettingFloat("fXPExpMult")
  ConfigXPModBase=Game.GetGameSettingFloat("fXPModBase")
  
  ;; Cooking XP Settings
  ConfigXPCookingBase=Game.GetGameSettingFloat("fCookingExpBase")
  ConfigXPCookingMult=Game.GetGameSettingFloat("fCookingExpMult")
  ConfigXPCookingMin=Game.GetGameSettingFloat("fCookingExpMin")
  ConfigXPCookingMax=Game.GetGameSettingFloat("fCookingExpMax")
  
  ;; Research XP Settings
  ConfigXPResearchBase=Game.GetGameSettingFloat("fResearchExpBase")
  ConfigXPResearchMult=Game.GetGameSettingFloat("fResearchExpMult")
  ConfigXPResearchMax=Game.GetGameSettingFloat("fResearchExpMax")
  
  ;; Crafting XP Settings
  ConfigXPCraftingBase=Game.GetGameSettingFloat("fWorkbenchExperienceBase")
  ConfigXPCraftingMult=Game.GetGameSettingFloat("fWorkbenchExperienceMult")
  ConfigXPCraftingMin=Game.GetGameSettingFloat("fWorkbenchExperienceMin")
  ConfigXPCraftingMax=Game.GetGameSettingFloat("fWorkbenchExperienceMax")
  
  ;; Lockpicking/Hacking XP Settings
  ConfigXPLockpickingNovice=Game.GetGameSettingFloat("fLockpickXPRewardEasy")
  ConfigXPLockpickingAdvanced=Game.GetGameSettingFloat("fLockpickXPRewardAverage")
  ConfigXPLockpickingExpert=Game.GetGameSettingFloat("fLockpickXPRewardHard")
  ConfigXPLockpickingMaster=Game.GetGameSettingFloat("fLockpickXPRewardVeryHard")
  ConfigXPHackingExperienceBase=Game.GetGameSettingFloat("fHackingExperienceBase")
  
  ;; Discovery XP Settings
  ConfigXPDiscoveryMapMarker=Game.GetGameSettingInt("iXPRewardDiscoverMapMarker")
  ConfigXPDiscoverySecretArea=Game.GetGameSettingInt("iXPRewardDiscoverSecretArea")
  ConfigXPScanCompletiong=Game.GetGameSettingFloat("fScanCompleteXPReward")

  ;; Speechcraft XP Settings
  ConfigXPSpeechcraftSuccess=Game.GetGameSettingFloat("fSpeechChallengeSuccessXP")

  ;; Combat XP Settings
  ConfigXPKillOpponent=Game.GetGameSettingInt("iXPRewardKillOpponent")
  ConfigXPDiffMultXPVE=Game.GetGameSettingFloat("fDiffMultXPVE")
  ConfigXPDiffMultXPE=Game.GetGameSettingFloat("fDiffMultXPE")
  ConfigXPDiffMultXPN=Game.GetGameSettingFloat("fDiffMultXPN")
  ConfigXPDiffMultXPH=Game.GetGameSettingFloat("fDiffMultXPH")
  ConfigXPDiffMultXPVH=Game.GetGameSettingFloat("fDiffMultXPVH")

  ;; Quest XP Settings -- VERY VERY EXPERIMENTAL: These are Form Values making them a pain to deal with and they are stored in the save
  GlobalVariable MQACT1RewardSmall = Game.GetForm(0x000DF3E1) as GlobalVariable
  GlobalVariable MQACT1RewardMedium = Game.GetForm(0x0023DF3D) as GlobalVariable
  GlobalVariable MQACT1RewardLarge = Game.GetForm(0x000DF3E0) as GlobalVariable
  GlobalVariable MQACT2RewardSmall = Game.GetForm(0x0011C0E1) as GlobalVariable
  GlobalVariable MQACT2RewardMedium = Game.GetForm(0x0011C0E0) as GlobalVariable
  GlobalVariable MQACT2RewardLarge = Game.GetForm(0x0011C0DF) as GlobalVariable
  GlobalVariable MQACT3RewardMedium = Game.GetForm(0x0011C0EA) as GlobalVariable
  GlobalVariable MQACT3RewardLarge = Game.GetForm(0x0011C0E3) as GlobalVariable

  ConfigMQACT1Small=MQACT1RewardSmall.GetValueInt()    ;; Default is 300
  ConfigMQACT1Medium=MQACT1RewardMedium.GetValueInt()  ;; Default is 350
  ConfigMQACT1Large=MQACT1RewardLarge.GetValueInt()    ;; Default is 400
  ConfigMQACT2Small=MQACT2RewardSmall.GetValueInt()    ;; Default is 700
  ConfigMQACT2Medium=MQACT2RewardMedium.GetValueInt()  ;; Default is 750
  ConfigMQACT2Large=MQACT2RewardLarge.GetValueInt()    ;; Default is 800
  ConfigMQACT3Small=4000                               ;; Doesn't seem to exist right now but shuld based on leveling curve
  ConfigMQACT3Medium=MQACT3RewardMedium.GetValueInt()  ;; Default is 4500
  ConfigMQACT3Large=MQACT3RewardLarge.GetValueInt()    ;; Default is 5000
  
  GlobalVariable QuestTN=Game.GetForm(0x002685E7) as GlobalVariable
  GlobalVariable QuestSM=Game.GetForm(0x000DF3E4) as GlobalVariable
  GlobalVariable QuestMD=Game.GetForm(0x0023DF3C) as GlobalVariable
  GlobalVariable QuestLG=Game.GetForm(0x000DF3E2) as GlobalVariable
  GlobalVariable QuestXL=Game.GetForm(0x0023842C) as GlobalVariable
  GlobalVariable QuestMSVMD=Game.GetForm(0x0011C0EA) as GlobalVariable
  GlobalVariable QuestMSVLG=Game.GetForm(0x0011C0E3) as GlobalVariable

  ConfigQuestTN=QuestTN.GetValueInt()        ;; Generally 50
  ConfigQuestSM=QuestSM.GetValueInt()        ;; Generally 100
  ConfigQuestMD=QuestMD.GetValueInt()        ;; Generally 200
  ConfigQuestLG=QuestLG.GetValueInt()        ;; Generally 300
  ConfigQuestXL=QuestXL.GetValueInt()        ;; Generally 500
  ConfigQuestXXL=750                         ;; Generally 750  -- Not Used Currently but should based on the leveling curve
  ConfigQuestXXXL=1000                       ;; Generally 1000 -- Not Used Currently but should based on the leveling curve
  ConfigQuestMSVSM=4000                      ;; Generally 4000 -- Not Used Currently but should based on the leveling curve
  ConfigQuestMSVMD=QuestMSVMD.GetValueInt()  ;; Generally 4500
  ConfigQuestMSVLG=QuestMSVLG.GetValueInt()  ;; Generally 5000
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
  SetGameSettingFloat("fDiffMultXPVE", 0.00)
  SetGameSettingFloat("fDiffMultXPE", 0.00)
  SetGameSettingFloat("fDiffMultXPN", 0.00)
  SetGameSettingFloat("fDiffMultXPH", 0.00)
  SetGameSettingFloat("fDiffMultXPVH", 0.00)
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
  SetGameSettingFloat("fHackingExperienceBase", 0.00)
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
  SetFormSettingInt("000DF3E1", 0)
  SetFormSettingInt("0023DF3D", 0)
  SetFormSettingInt("000DF3E0", 0)
  SetFormSettingInt("0011C0E1", 0)
  SetFormSettingInt("0011C0E0", 0)
  SetFormSettingInt("0011C0DF", 0)
  SetFormSettingInt("0011C0EA", 0)
  SetFormSettingInt("0011C0E3", 0)

  ;; Faction Quests
  SetFormSettingInt("000DF3DE", 0)
  SetFormSettingInt("0023DF3B", 0)
  SetFormSettingInt("000DF3DD", 0)

  ;; Radient Quests
  SetFormSettingInt("000DF3E5", 0)
  SetFormSettingInt("00100AB6", 0)
  SetFormSettingInt("00100ABC", 0)
  SetFormSettingInt("0016D9A6", 0)
  SetFormSettingInt("001AF650", 0)
  SetFormSettingInt("0022B890", 0)
  SetFormSettingInt("0022B943", 0)
  SetFormSettingInt("0022B947", 0)
  SetFormSettingInt("0022B94B", 0)
  SetFormSettingInt("00255B55", 0)
  SetFormSettingInt("00255B60", 0)
  SetFormSettingInt("00255B6B", 0)
  SetFormSettingInt("00255B75", 0)
  SetFormSettingInt("00269A65", 0)
  SetFormSettingInt("00269BF3", 0)
  SetFormSettingInt("001AB4F3", 0)
  SetFormSettingInt("0023DF35", 0)
  SetFormSettingInt("000023A2", 0)
  SetFormSettingInt("000023A3", 0)
  SetFormSettingInt("00002690", 0)
  SetFormSettingInt("00003DDC", 0)
  SetFormSettingInt("001AEA62", 0)

  ;; Misc Quests
  SetFormSettingInt("002685E7", 0)
  SetFormSettingInt("000DF3E4", 0)
  SetFormSettingInt("0023DF3C", 0)
  SetFormSettingInt("000DF3E2", 0)

  ;; Other Quests
  SetFormSettingInt("000FD332", 0)
  SetFormSettingInt("00167860", 0)
  SetFormSettingInt("002E0EC4", 0)
  SetFormSettingInt("0006B510", 0)
  SetFormSettingInt("000F3CF9", 0)
  SetFormSettingInt("000F19CC", 0)
  SetFormSettingInt("00246AD7", 0)

  ;; Planet/System Surveys
  SetFormSettingInt("00245AB9", 0)
  SetFormSettingInt("001AEB4E", 0)
  SetFormSettingInt("0030A8C5", 0)
  SetFormSettingInt("0030A8C6", 0)
  SetFormSettingInt("0030A8C7", 0)
  SetFormSettingInt("00056E62", 0)
  SetFormSettingInt("0023842C", 0)
  SetFormSettingInt("0030A8C8", 0)
  SetFormSettingInt("0030A8C9", 0)
  SetFormSettingInt("0030A8CA", 0)
  SetFormSettingInt("0030A8CB", 0)

  ;; Settlement Quests
  SetFormSettingInt("000DF3E7", 0)
  SetFormSettingInt("0010DF00", 0)
  SetFormSettingInt("0010DF0E", 0)
  SetFormSettingInt("0010DF12", 0)
  SetFormSettingInt("0010DF16", 0)
  SetFormSettingInt("001AB4F2", 0)
  SetFormSettingInt("0023DF34", 0)

  ;; Mission Board Quests
  SetFormSettingInt("0009E153", 0)
  SetFormSettingInt("0016AB84", 0)
  SetFormSettingInt("0016AB85", 0)
  SetFormSettingInt("0016AB86", 0)
  SetFormSettingInt("0016AB87", 0)
  SetFormSettingInt("0016AB88", 0)
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
  SetGameSettingFloat("fXPStart", ConfigXPStart)
  SetGameSettingFloat("fXPBase", ConfigXPBase)
  SetGameSettingFloat("fXPExpMult", ConfigXPMult)
  SetGameSettingFloat("fXPModBase", ConfigXPModBase)

  ;; Combat XP Settings
  SetGameSettingInt("iXPRewardKillOpponent", ConfigXPKillOpponent)
  SetGameSettingFloat("fDiffMultXPVE", ConfigXPDiffMultXPVE)
  SetGameSettingFloat("fDiffMultXPE", ConfigXPDiffMultXPE)
  SetGameSettingFloat("fDiffMultXPN", ConfigXPDiffMultXPN)
  SetGameSettingFloat("fDiffMultXPH", ConfigXPDiffMultXPH)
  SetGameSettingFloat("fDiffMultXPVH", ConfigXPDiffMultXPVH)
EndFunction

;; ****************************************************************************
;; Enable Crafting Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableCraftingXP"
;;
Function EnableCraftingXP()
  CraftingXPEnabled=true
  
  ;; Cooking XP Settings
  SetGameSettingFloat("fCookingExpBase", ConfigXPCookingBase)
  SetGameSettingFloat("fCookingExpMult", ConfigXPCookingMult)
  SetGameSettingFloat("fCookingExpMin", ConfigXPCookingMin)
  SetGameSettingFloat("fCookingExpMax", ConfigXPCookingMax)
  
  ;; Crafting XP Settings
  SetGameSettingFloat("fWorkbenchExperienceBase", ConfigXPCraftingBase)
  SetGameSettingFloat("fWorkbenchExperienceMult", ConfigXPCraftingMult)
  SetGameSettingFloat("fWorkbenchExperienceMin", ConfigXPCraftingMin)
  SetGameSettingFloat("fWorkbenchExperienceMax", ConfigXPCraftingMax)
EndFunction

;; ****************************************************************************
;; Enable Research Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableResearchXP"
;;
Function EnableResearchXP()
  ResearchXPEnabled=true
  
  ;; Research XP Settings
  SetGameSettingFloat("fResearchExpBase", ConfigXPResearchBase)
  SetGameSettingFloat("fResearchExpMult", ConfigXPResearchMult)
  SetGameSettingFloat("fResearchExpMax", ConfigXPResearchMax)
EndFunction

;; ****************************************************************************
;; Enable Lockpicking Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableLockpickingXP"
;;
Function EnableLockpickingXP()
  LockpickingXPEnabled=true
  
  ;; Lockpicking/Hacking XP Settings
  SetGameSettingFloat("fLockpickXPRewardEasy", ConfigXPLockpickingNovice)
  SetGameSettingFloat("fLockpickXPRewardAverage", ConfigXPLockpickingAdvanced)
  SetGameSettingFloat("fLockpickXPRewardHard", ConfigXPLockpickingExpert)
  SetGameSettingFloat("fLockpickXPRewardVeryHard", ConfigXPLockpickingMaster)
EndFunction

;; ****************************************************************************
;; Enable Discovery Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableDiscoveryXP"
;;
Function EnableDiscoveryXP()
  DiscoveryXPEnabled=true
  
  ;; Discovery XP Settings
  SetGameSettingInt("iXPRewardDiscoverMapMarker", ConfigXPDiscoveryMapMarker)
  SetGameSettingInt("iXPRewardDiscoverSecretArea", ConfigXPDiscoverySecretArea)
  SetGameSettingFloat("fScanCompleteXPReward", ConfigXPScanCompletiong)
EndFunction

;; ****************************************************************************
;; Enable Speechcraft Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableSpeechcraftXP"
;;
Function EnableSpeechcraftXP()
  SpeechcraftXPEnabled=true

  ;; Speechcraft XP Settings
  SetGameSettingFloat("fSpeechChallengeSuccessXP", ConfigXPSpeechcraftSuccess)
EndFunction

;; ****************************************************************************
;; Enable Quest Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableQuestXP"
;;
Function EnableQuestXP()
  QuestXPEnabled=true

  ;; Main Story Quests
  SetFormSettingInt("000DF3E1", ConfigMQACT1Small)
  SetFormSettingInt("0023DF3D", ConfigMQACT1Medium)
  SetFormSettingInt("000DF3E0", ConfigMQACT1Large)
  SetFormSettingInt("0011C0E1", ConfigMQACT2Small)
  SetFormSettingInt("0011C0E0", ConfigMQACT2Medium)
  SetFormSettingInt("0011C0DF", ConfigMQACT2Large)
  SetFormSettingInt("0011C0EA", ConfigMQACT3Medium)
  SetFormSettingInt("0011C0E3", ConfigMQACT3Large)

  ;; Faction Quests
  SetFormSettingInt("000DF3DE", ConfigQuestMD)
  SetFormSettingInt("0023DF3B", ConfigQuestLG)
  SetFormSettingInt("000DF3DD", ConfigQuestXL)

  ;; Radient Quests
  SetFormSettingInt("000DF3E5", ConfigQuestSM)
  SetFormSettingInt("00100AB6", ConfigQuestSM)
  SetFormSettingInt("00100ABC", ConfigQuestSM)
  SetFormSettingInt("0016D9A6", ConfigQuestSM)
  SetFormSettingInt("001AF650", ConfigQuestSM)
  SetFormSettingInt("0022B890", ConfigQuestSM)
  SetFormSettingInt("0022B943", ConfigQuestSM)
  SetFormSettingInt("0022B947", ConfigQuestSM)
  SetFormSettingInt("0022B94B", ConfigQuestSM)
  SetFormSettingInt("00255B55", ConfigQuestSM)
  SetFormSettingInt("00255B60", ConfigQuestSM)
  SetFormSettingInt("00255B6B", ConfigQuestSM)
  SetFormSettingInt("00255B75", ConfigQuestSM)
  SetFormSettingInt("00269A65", ConfigQuestSM)
  SetFormSettingInt("00269BF3", ConfigQuestSM)
  SetFormSettingInt("001AB4F3", ConfigQuestMD)
  SetFormSettingInt("0023DF35", ConfigQuestMD)
  SetFormSettingInt("000023A2", ConfigQuestMD)
  SetFormSettingInt("000023A3", ConfigQuestMD)
  SetFormSettingInt("00002690", ConfigQuestMD)
  SetFormSettingInt("00003DDC", ConfigQuestMD)
  SetFormSettingInt("001AEA62", ConfigQuestMD)

  ;; Misc Quests
  SetFormSettingInt("002685E7", ConfigQuestTN)
  SetFormSettingInt("000DF3E4", ConfigQuestSM)
  SetFormSettingInt("0023DF3C", ConfigQuestMD)
  SetFormSettingInt("000DF3E2", ConfigQuestLG)

  ;; Other Quests
  SetFormSettingInt("000FD332", ConfigQuestLG)
  SetFormSettingInt("00167860", ConfigQuestSM)
  SetFormSettingInt("002E0EC4", ConfigQuestSM)
  SetFormSettingInt("0006B510", ConfigQuestMD)
  SetFormSettingInt("000F3CF9", ConfigQuestLG)
  SetFormSettingInt("000F19CC", ConfigQuestXL)
  SetFormSettingInt("00246AD7", ConfigQuestMD)

  ;; Planet/System Surveys
  SetFormSettingInt("00245AB9", ConfigQuestSM)
  SetFormSettingInt("001AEB4E", ConfigQuestSM)
  SetFormSettingInt("0030A8C5", ConfigQuestTN)
  SetFormSettingInt("0030A8C6", ConfigQuestSM)
  SetFormSettingInt("0030A8C7", ConfigQuestMD)
  SetFormSettingInt("00056E62", ConfigQuestLG)
  SetFormSettingInt("0023842C", ConfigQuestXL)
  SetFormSettingInt("0030A8C8", ConfigQuestTN)
  SetFormSettingInt("0030A8C9", ConfigQuestSM)
  SetFormSettingInt("0030A8CA", ConfigQuestMD)
  SetFormSettingInt("0030A8CB", ConfigQuestLG)

  ;; Settlement Quests
  SetFormSettingInt("000DF3E7", ConfigQuestTN)
  SetFormSettingInt("0010DF00", ConfigQuestTN)
  SetFormSettingInt("0010DF0E", ConfigQuestTN)
  SetFormSettingInt("0010DF12", ConfigQuestTN)
  SetFormSettingInt("0010DF16", ConfigQuestTN)
  SetFormSettingInt("001AB4F2", ConfigQuestSM)
  SetFormSettingInt("0023DF34", ConfigQuestMD)

  ;; Mission Board Quests
  SetFormSettingInt("0009E153", ConfigQuestSM)
  SetFormSettingInt("0016AB84", ConfigQuestSM)
  SetFormSettingInt("0016AB85", ConfigQuestMD)
  SetFormSettingInt("0016AB86", ConfigQuestMD)
  SetFormSettingInt("0016AB87", ConfigQuestLG)
  SetFormSettingInt("0016AB88", ConfigQuestXL)
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

Function DumpXPMatrix()
  
EndFunction

;; ****************************************************************************
;; Get the current version of the script
;;
;; Use: player.cf "VPI_ExperienceControl.GetVersion"
;;
Function GetVersion()
  Debug.Messagebox("VPI_ExperienceControl Version: " + Version)
EndFunction
