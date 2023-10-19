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
;; GlobalVariable Property PlanetaryTraitAstroBonusXPReward Auto  ;; Form ID 002B97EC -- GlobalVar only supprot Int in what we have access too and not sure of its use so disabling
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

String Property Version="1.2.0" Auto ;; -- MOD VERSION SET HERE

Actor Property PlayerRef Auto
ActorValue Property Experience Auto

Bool Property LevelingXPEnabled=true Auto
Bool Property ResearchXPEnabled=true Auto
Bool Property CraftingXPEnabled=true Auto
Bool Property LockpickingXPEnabled=true Auto
Bool Property DiscoveryXPEnabled=true Auto
Bool Property QuestXPEnabled=true Auto
Bool Property SpeechcraftXPEnabled=true Auto

;; Leveling XP Settings
Int Property ConfigXPKillOpponent Auto

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
Float Property ConfigXPScanCompletion Auto

;; Speechcraft XP Settings
Float Property ConfigXPSpeechcraftSuccess Auto

;; XP Difficulty Multiplier
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

;; Scaling Bracket Variables
Float[] Property SF_XPDifficultyMultiplier Auto
Float[] Property SF_CombatXP Auto
Float[] Property SF_ResearchXP Auto
Float[] Property SF_CraftingXP Auto
Float[] Property SF_LockpickingXP Auto
Float[] Property SF_DiscoveryXP Auto
Float[] Property SF_QuestXP Auto
Float[] Property SF_SpeechcraftXP Auto


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;

;; This event will run once, when the script is initialized and is a member of any and all scripts 
;; per docs. In the terms of ReferenceAlias is called when the script is bound to something. 
Event OnInit() 
  Debug.Trace("VPIXPCTRL_EVENT: : OnInit triggered populating Properties and resetting XP based on last mode", 0)
  Debug.Notification("Experience Control version " + version + " is currently running.")

  UpdateBindings()
  CreateBracketArrays()

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
  Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame triggered populating Properties and resetting XP based on last mode", 0)
  Debug.Notification("Experience Control version " + version + " is currently running.")

  ;; If Version is not set or not current update it -- MOD VERSION SET HERE
  If (Version != "1.2.0")
    Version = "1.2.0"
  EndIf

  UpdateBindings()
  CreateBracketArrays()

  ;; DO NOT STORE CURRENT SETTINGS THEY WILL WIPE OLD SETTINGS with game defaults and/or garbage

  If (CraftingXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Crafting XP in enable mode", 0)
    EnableCraftingXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Crafting XP in disable mode", 0)
    DisableCraftingXP()
  EndIf

  If (DiscoveryXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Discovery XP in enable mode", 0)
    EnableDiscoveryXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Discovery XP in disable mode", 0)
    DisableDiscoveryXP()
  EndIf

  If (LevelingXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Leveling XP in enable mode", 0)
    EnableLevelingXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Leveling XP in disable mode", 0)
    DisableLevelingXP()
  EndIf

  If (LockpickingXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Lockpicking XP in enable mode", 0)
    EnableLockpickingXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Lockpicking XP in disable mode", 0)
    DisableLockpickingXP()
  EndIf

  If (QuestXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Quest XP in enable mode", 0)
    EnableQuestXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Quest XP in disable mode", 0)
    DisableQuestXP()
  EndIf

  If (ResearchXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Research XP in enable mode", 0)
    EnableResearchXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Research XP in disable mode", 0)
    DisableResearchXP()
  EndIf

  If (SpeechcraftXPEnabled == true)
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Speechcraft XP in enable mode", 0)
    EnableSpeechcraftXP()
  Else 
    Debug.Trace("VPIXPCTRL_EVENT: OnPlayerLoadGame - Reloading Speechcraft XP in disable mode", 0)
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

  If (MainQuestAct1XPRewardSmall == None)
    MainQuestAct1XPRewardSmall = Game.GetForm(0x000DF3E1) as GlobalVariable
  EndIf

  If (MainQuestAct1XPRewardMedium == None)
    MainQuestAct1XPRewardMedium = Game.GetForm(0x0023DF3D) as GlobalVariable
  EndIf

  If (MainQuestAct1XPRewardLarge == None)
    MainQuestAct1XPRewardLarge = Game.GetForm(0x000DF3E0) as GlobalVariable
  EndIf

  If (MainQuestAct2XPRewardSmall == None)
    MainQuestAct2XPRewardSmall = Game.GetForm(0x0011C0E1) as GlobalVariable
  EndIf

  If (MainQuestAct2XPRewardMedium == None)
    MainQuestAct2XPRewardMedium = Game.GetForm(0x0011C0E0) as GlobalVariable
  EndIf

  If (MainQuestAct2XPRewardLarge == None)
    MainQuestAct2XPRewardLarge = Game.GetForm(0x0011C0DF) as GlobalVariable
  EndIf

  If (MainQuestAct3XPRewardMedium == None)
    MainQuestAct3XPRewardMedium = Game.GetForm(0x0011C0EA) as GlobalVariable
  EndIf

  If (MainQuestAct3XPRewardLarge == None)
    MainQuestAct3XPRewardLarge = Game.GetForm(0x0011C0E3) as GlobalVariable
  EndIf
  
  If (FactionQuestXPRewardSmall == None)
    FactionQuestXPRewardSmall = Game.GetForm(0x000DF3DE) as GlobalVariable
  EndIf

  If (FactionQuestXPRewardMedium == None)
    FactionQuestXPRewardMedium = Game.GetForm(0x0023DF3B) as GlobalVariable
  EndIf

  If (FactionQuestXPRewardLarge == None)
    FactionQuestXPRewardLarge = Game.GetForm(0x000DF3DD) as GlobalVariable
  EndIf
  
  If (RadiantQuestVersion01XPRewardSmall == None)
    RadiantQuestVersion01XPRewardSmall = Game.GetForm(0x000DF3E5) as GlobalVariable
  EndIf

  If (RadiantQuestVersion02XPRewardSmall == None)
    RadiantQuestVersion02XPRewardSmall = Game.GetForm(0x00100AB6) as GlobalVariable
  EndIf

  If (RadiantQuestVersion03XPRewardSmall == None)
    RadiantQuestVersion03XPRewardSmall = Game.GetForm(0x00100ABC) as GlobalVariable
  EndIf

  If (RadiantQuestVersion04XPRewardSmall == None)
    RadiantQuestVersion04XPRewardSmall = Game.GetForm(0x0016D9A6) as GlobalVariable
  EndIf

  If (RadiantQuestVersion05XPRewardSmall == None)
    RadiantQuestVersion05XPRewardSmall = Game.GetForm(0x001AF650) as GlobalVariable
  EndIf

  If (RadiantQuestVersion06XPRewardSmall == None)
    RadiantQuestVersion06XPRewardSmall = Game.GetForm(0x0022B890) as GlobalVariable
  EndIf

  If (RadiantQuestVersion07XPRewardSmall == None)
    RadiantQuestVersion07XPRewardSmall = Game.GetForm(0x0022B943) as GlobalVariable
  EndIf

  If (RadiantQuestVersion08XPRewardSmall == None)
    RadiantQuestVersion08XPRewardSmall = Game.GetForm(0x0022B947) as GlobalVariable
  EndIf

  If (RadiantQuestVersion09XPRewardSmall == None)
    RadiantQuestVersion09XPRewardSmall = Game.GetForm(0x0022B94B) as GlobalVariable
  EndIf

  If (RadiantQuestVersion10XPRewardSmall == None)
    RadiantQuestVersion10XPRewardSmall = Game.GetForm(0x00255B55) as GlobalVariable
  EndIf

  If (RadiantQuestVersion11XPRewardSmall == None)
    RadiantQuestVersion11XPRewardSmall = Game.GetForm(0x00255B60) as GlobalVariable
  EndIf

  If (RadiantQuestVersion12XPRewardSmall == None)
    RadiantQuestVersion12XPRewardSmall = Game.GetForm(0x00255B6B) as GlobalVariable
  EndIf

  If (RadiantQuestVersion13XPRewardSmall == None)
    RadiantQuestVersion13XPRewardSmall = Game.GetForm(0x00255B75) as GlobalVariable
  EndIf

  If (RadiantQuestVersion14XPRewardSmall == None)
    RadiantQuestVersion14XPRewardSmall = Game.GetForm(0x00269A65) as GlobalVariable
  EndIf

  If (RadiantQuestVersion15XPRewardSmall == None)
    RadiantQuestVersion15XPRewardSmall = Game.GetForm(0x00269BF3) as GlobalVariable
  EndIf

  If (RadiantQuestVersion01XPRewardMedium == None)
    RadiantQuestVersion01XPRewardMedium = Game.GetForm(0x001AB4F3) as GlobalVariable
  EndIf

  If (RadiantQuestVersion01XPRewardLarge == None)
    RadiantQuestVersion01XPRewardLarge = Game.GetForm(0x0023DF35) as GlobalVariable
  EndIf

  If (RadiantQuestVersion02XPRewardLarge == None)
    RadiantQuestVersion02XPRewardLarge = Game.GetForm(0x000023A2) as GlobalVariable
  EndIf

  If (RadiantQuestVersion03XPRewardLarge == None)
    RadiantQuestVersion03XPRewardLarge = Game.GetForm(0x000023A3) as GlobalVariable
  EndIf

  If (RadiantQuestVersion04XPRewardLarge == None)
    RadiantQuestVersion04XPRewardLarge = Game.GetForm(0x00002690) as GlobalVariable
  EndIf

  If (RadiantQuestVersion05XPRewardLarge == None)
    RadiantQuestVersion05XPRewardLarge = Game.GetForm(0x00003DDC) as GlobalVariable
  EndIf

  If (RadiantQuestVersion06XPRewardLarge == None)
    RadiantQuestVersion06XPRewardLarge = Game.GetForm(0x001AEA62) as GlobalVariable
  EndIf
  
  If (MiscQuestXPRewardTiny == None)
    MiscQuestXPRewardTiny = Game.GetForm(0x002685E7) as GlobalVariable
  EndIf

  If (MiscQuestXPRewardSmall == None)
    MiscQuestXPRewardSmall = Game.GetForm(0x000DF3E4) as GlobalVariable
  EndIf

  If (MiscQuestXPRewardMedium == None)
    MiscQuestXPRewardMedium = Game.GetForm(0x0023DF3C) as GlobalVariable
  EndIf

  If (MiscQuestXPRewardLarge == None)
    MiscQuestXPRewardLarge = Game.GetForm(0x000DF3E2) as GlobalVariable
  EndIf

  If (CompanionQuestXPReward == None)
    CompanionQuestXPReward = Game.GetForm(0x000FD332) as GlobalVariable
  EndIf

  If (OptionalObjectiveQuestXPReward == None)
    OptionalObjectiveQuestXPReward = Game.GetForm(0x00167860) as GlobalVariable
  EndIf

  If (RedMileRunQuestXPReward == None)
    RedMileRunQuestXPReward = Game.GetForm(0x002E0EC4) as GlobalVariable
  EndIf

  If (OESmallQuestXPReward == None)
    OESmallQuestXPReward = Game.GetForm(0x0006B510) as GlobalVariable
  EndIf

  If (OEMediumQuestXPReward == None)
    OEMediumQuestXPReward = Game.GetForm(0x000F3CF9) as GlobalVariable
  EndIf

  If (OELargeQuestXPReward == None)
    OELargeQuestXPReward = Game.GetForm(0x000F19CC) as GlobalVariable
  EndIf

  If (StarbornTempleXPReward == None)
    StarbornTempleXPReward = Game.GetForm(0x00246AD7) as GlobalVariable
  EndIf

  If (PlanetaryTraitXPReward == None)
    PlanetaryTraitXPReward = Game.GetForm(0x00245AB9) as GlobalVariable
  EndIf

  If (PlanetaryTraitSkillBonusXPReward == None)
    PlanetaryTraitSkillBonusXPReward = Game.GetForm(0x001AEB4E) as GlobalVariable
  EndIf

  ; If (PlanetaryTraitAstroBonusXPReward == None)
  ;   PlanetaryTraitAstroBonusXPReward = Game.GetForm(0x002B97EC) as GlobalVariable
  ; EndIf

  If (PlanetarySurveyV1XPReward == None)
    PlanetarySurveyV1XPReward = Game.GetForm(0x0030A8C5) as GlobalVariable
  EndIf

  If (PlanetarySurveyV2XPReward == None)
    PlanetarySurveyV2XPReward = Game.GetForm(0x0030A8C6) as GlobalVariable
  EndIf

  If (PlanetarySurveyV3XPReward == None)
    PlanetarySurveyV3XPReward = Game.GetForm(0x0030A8C7) as GlobalVariable
  EndIf

  If (PlanetarySurveyV4XPReward == None)
    PlanetarySurveyV4XPReward = Game.GetForm(0x00056E62) as GlobalVariable
  EndIf

  If (PlanetarySurveyV5XPReward == None)
    PlanetarySurveyV5XPReward = Game.GetForm(0x0023842C) as GlobalVariable
  EndIf

  If (SystemSurveyV1XPReward == None)
    SystemSurveyV1XPReward = Game.GetForm(0x0030A8C8) as GlobalVariable
  EndIf

  If (SystemSurveyV2XPReward == None)
    SystemSurveyV2XPReward = Game.GetForm(0x0030A8C9) as GlobalVariable
  EndIf

  If (SystemSurveyV3XPReward == None)
    SystemSurveyV3XPReward = Game.GetForm(0x0030A8CA) as GlobalVariable
  EndIf

  If (SystemSurveyV4XPReward == None)
    SystemSurveyV4XPReward = Game.GetForm(0x0030A8CB) as GlobalVariable
  EndIf
  
  If (SettlementV1QuestXPRewardSmall == None)
    SettlementV1QuestXPRewardSmall = Game.GetForm(0x000DF3E7) as GlobalVariable
  EndIf

  If (SettlementV2QuestXPRewardSmall == None)
    SettlementV2QuestXPRewardSmall = Game.GetForm(0x0010DF00) as GlobalVariable
  EndIf

  If (SettlementV3QuestXPRewardSmall == None)
    SettlementV3QuestXPRewardSmall = Game.GetForm(0x0010DF0E) as GlobalVariable
  EndIf

  If (SettlementV4QuestXPRewardSmall == None)
    SettlementV4QuestXPRewardSmall = Game.GetForm(0x0010DF12) as GlobalVariable
  EndIf

  If (SettlementV5QuestXPRewardSmall == None)
    SettlementV5QuestXPRewardSmall = Game.GetForm(0x0010DF16) as GlobalVariable
  EndIf

  If (SettlementV1QuestXPRewardMedium == None)
    SettlementV1QuestXPRewardMedium = Game.GetForm(0x001AB4F2) as GlobalVariable
  EndIf

  If (SettlementV1QuestXPRewardLarge == None)
    SettlementV1QuestXPRewardLarge = Game.GetForm(0x0023DF34) as GlobalVariable
  EndIf

  If (MissionBoardSurveyBaseXPReward == None)
    MissionBoardSurveyBaseXPReward = Game.GetForm(0x0009E153) as GlobalVariable
  EndIf

  If (MissionBoardSurveyTraitV1XPReward == None)
    MissionBoardSurveyTraitV1XPReward = Game.GetForm(0x0016AB84) as GlobalVariable
  EndIf

  If (MissionBoardSurveyTraitV2XPReward == None)
    MissionBoardSurveyTraitV2XPReward = Game.GetForm(0x0016AB85) as GlobalVariable
  EndIf

  If (MissionBoardSurveyTraitV3XPReward == None)
    MissionBoardSurveyTraitV3XPReward = Game.GetForm(0x0016AB86) as GlobalVariable
  EndIf

  If (MissionBoardSurveyTraitV4XPReward == None)
    MissionBoardSurveyTraitV4XPReward = Game.GetForm(0x0016AB87) as GlobalVariable
  EndIf

  If (MissionBoardSurveyTraitV5XPReward == None)
    MissionBoardSurveyTraitV5XPReward = Game.GetForm(0x0016AB88) as GlobalVariable
  EndIf
EndFunction


Function CreateBracketArrays() 
  If (SF_XPDifficultyMultiplier == None)
    SF_XPDifficultyMultiplier = new Float[11]
    SF_XPDifficultyMultiplier[1] = 1.00
    SF_XPDifficultyMultiplier[2] = 1.00
    SF_XPDifficultyMultiplier[3] = 1.25
    SF_XPDifficultyMultiplier[4] = 1.25
    SF_XPDifficultyMultiplier[5] = 1.50
    SF_XPDifficultyMultiplier[6] = 1.50
    SF_XPDifficultyMultiplier[7] = 1.75
    SF_XPDifficultyMultiplier[8] = 1.75
    SF_XPDifficultyMultiplier[9] = 2.00
    SF_XPDifficultyMultiplier[10] = 2.50
  EndIf

  If (SF_CombatXP == None)
    SF_CombatXP = new Float[11]
    SF_CombatXP[1] = 1.00
    SF_CombatXP[2] = 1.00
    SF_CombatXP[3] = 1.00
    SF_CombatXP[4] = 1.00
    SF_CombatXP[5] = 1.00
    SF_CombatXP[6] = 1.00
    SF_CombatXP[7] = 1.00
    SF_CombatXP[8] = 1.00
    SF_CombatXP[9] = 1.00
    SF_CombatXP[10] = 1.00
  EndIf

  If (SF_ResearchXP == None)
    SF_ResearchXP = new Float[11]
    SF_ResearchXP[1] = 1.00
    SF_ResearchXP[2] = 1.00
    SF_ResearchXP[3] = 1.00
    SF_ResearchXP[4] = 1.00
    SF_ResearchXP[5] = 1.00
    SF_ResearchXP[6] = 1.00
    SF_ResearchXP[7] = 1.00
    SF_ResearchXP[8] = 1.00
    SF_ResearchXP[9] = 1.00
    SF_ResearchXP[10] = 1.00
  EndIf

  If (SF_CraftingXP == None)
    SF_CraftingXP = new Float[11]
    SF_CraftingXP[1] = 1.00
    SF_CraftingXP[2] = 1.00
    SF_CraftingXP[3] = 1.00
    SF_CraftingXP[4] = 1.00
    SF_CraftingXP[5] = 1.00
    SF_CraftingXP[6] = 1.00
    SF_CraftingXP[7] = 1.00
    SF_CraftingXP[8] = 1.00
    SF_CraftingXP[9] = 1.00
    SF_CraftingXP[10] = 1.00
  EndIf

  If (SF_LockpickingXP == None)
    SF_LockpickingXP = new Float[11]
    SF_LockpickingXP[1] = 1.00
    SF_LockpickingXP[2] = 1.00
    SF_LockpickingXP[3] = 1.00
    SF_LockpickingXP[4] = 1.00
    SF_LockpickingXP[5] = 1.00
    SF_LockpickingXP[6] = 1.00
    SF_LockpickingXP[7] = 1.00
    SF_LockpickingXP[8] = 1.00
    SF_LockpickingXP[9] = 1.00
    SF_LockpickingXP[10] = 1.00
  EndIf

  If (SF_DiscoveryXP == None)
    SF_DiscoveryXP = new Float[11]
    SF_DiscoveryXP[1] = 1.00
    SF_DiscoveryXP[2] = 1.00
    SF_DiscoveryXP[3] = 1.00
    SF_DiscoveryXP[4] = 1.00
    SF_DiscoveryXP[5] = 1.00
    SF_DiscoveryXP[6] = 1.00
    SF_DiscoveryXP[7] = 1.00
    SF_DiscoveryXP[8] = 1.00
    SF_DiscoveryXP[9] = 1.00
    SF_DiscoveryXP[10] = 1.00
  EndIf

  If (SF_QuestXP == None)
    SF_QuestXP = new Float[11]
    SF_QuestXP[1] = 1.00
    SF_QuestXP[2] = 1.00
    SF_QuestXP[3] = 1.00
    SF_QuestXP[4] = 1.00
    SF_QuestXP[5] = 1.00
    SF_QuestXP[6] = 1.00
    SF_QuestXP[7] = 1.00
    SF_QuestXP[8] = 1.00
    SF_QuestXP[9] = 1.00
    SF_QuestXP[10] = 1.00
  EndIf

  If (SF_SpeechcraftXP == None)
    SF_SpeechcraftXP = new Float[11]
    SF_SpeechcraftXP[1] = 1.00
    SF_SpeechcraftXP[2] = 1.00
    SF_SpeechcraftXP[3] = 1.00
    SF_SpeechcraftXP[4] = 1.00
    SF_SpeechcraftXP[5] = 1.00
    SF_SpeechcraftXP[6] = 1.00
    SF_SpeechcraftXP[7] = 1.00
    SF_SpeechcraftXP[8] = 1.00
    SF_SpeechcraftXP[9] = 1.00
    SF_SpeechcraftXP[10] = 1.00
  EndIf
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
  ConfigXPScanCompletion=Game.GetGameSettingFloat("fScanCompleteXPReward")

  ;; Speechcraft XP Settings
  ConfigXPSpeechcraftSuccess=Game.GetGameSettingFloat("fSpeechChallengeSuccessXP")

  ;; Combat XP Settings
  ConfigXPKillOpponent=Game.GetGameSettingInt("iXPRewardKillOpponent")

  ;; XP Difficulty Multiplier
  ConfigXPDiffMultXPVE=Game.GetGameSettingFloat("fDiffMultXPVE")
  ConfigXPDiffMultXPE=Game.GetGameSettingFloat("fDiffMultXPE")
  ConfigXPDiffMultXPN=Game.GetGameSettingFloat("fDiffMultXPN")
  ConfigXPDiffMultXPH=Game.GetGameSettingFloat("fDiffMultXPH")
  ConfigXPDiffMultXPVH=Game.GetGameSettingFloat("fDiffMultXPVH")

  ;; Quest XP Settings -- VERY VERY EXPERIMENTAL: These are Form Values making them a pain to deal with and they are stored in the save
  ConfigMQACT1Small=MainQuestAct1XPRewardSmall.GetValueInt()    ;; Default is 300
  ConfigMQACT1Medium=MainQuestAct1XPRewardMedium.GetValueInt()  ;; Default is 350
  ConfigMQACT1Large=MainQuestAct1XPRewardLarge.GetValueInt()    ;; Default is 400
  ConfigMQACT2Small=MainQuestAct2XPRewardSmall.GetValueInt()    ;; Default is 700
  ConfigMQACT2Medium=MainQuestAct2XPRewardMedium.GetValueInt()  ;; Default is 750
  ConfigMQACT2Large=MainQuestAct2XPRewardLarge.GetValueInt()    ;; Default is 800
  ConfigMQACT3Small=4000                                         ;; Doesn't seem to exist right now but shuld based on leveling curve
  ConfigMQACT3Medium=MainQuestAct3XPRewardMedium.GetValueInt()  ;; Default is 4500
  ConfigMQACT3Large=MainQuestAct3XPRewardLarge.GetValueInt()    ;; Default is 5000

  ConfigQuestTN=MiscQuestXPRewardTiny.GetValueInt()           ;; Generally 50
  ConfigQuestSM=MiscQuestXPRewardSmall.GetValueInt()          ;; Generally 100
  ConfigQuestMD=MiscQuestXPRewardMedium.GetValueInt()         ;; Generally 200
  ConfigQuestLG=MiscQuestXPRewardLarge.GetValueInt()          ;; Generally 300
  ConfigQuestXL=PlanetarySurveyV5XPReward.GetValueInt()       ;; Generally 500
  ConfigQuestXXL=MainQuestAct1XPRewardMedium.GetValueInt()    ;; Generally 750  -- Not Used Currently but should based on the leveling curve
  ConfigQuestXXXL=1000                                        ;; Generally 1000 -- Not Used Currently but should based on the leveling curve
  ConfigQuestMSVSM=4000                                       ;; Generally 4000 -- Not Used Currently but should based on the leveling curve
  ConfigQuestMSVMD=MainQuestAct3XPRewardMedium.GetValueInt()  ;; Generally 4500
  ConfigQuestMSVLG=MainQuestAct3XPRewardLarge.GetValueInt()   ;; Generally 5000
EndFunction


;;
;; Mass Enable/Disable Public Functions
;;


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


;;
;; Leveling Experience Public Functions
;;

;; ****************************************************************************
;; Disable Leveling Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableLevelingXP"
;;
Function DisableLevelingXP()
  LevelingXPEnabled=false

  ;; Combat XP Settings
  VPI_Helper.SetGameSettingInt("iXPRewardKillOpponent", 0)

  ;; XP Difficulty Multiplier
  VPI_Helper.SetGameSettingFloat("fDiffMultXPVE", 0.00)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPE", 0.00)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPN", 0.00)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPH", 0.00)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPVH", 0.00)
EndFunction

;; ****************************************************************************
;; Enable Leveling Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableLevelingXP"
;;
Function EnableLevelingXP()
  LevelingXPEnabled=true

  ;; Combat XP Settings
  VPI_Helper.SetGameSettingInt("iXPRewardKillOpponent", ConfigXPKillOpponent)

  ;; XP Difficulty Multiplier
  VPI_Helper.SetGameSettingFloat("fDiffMultXPVE", ConfigXPDiffMultXPVE)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPE", ConfigXPDiffMultXPE)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPN", ConfigXPDiffMultXPN)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPH", ConfigXPDiffMultXPH)
  VPI_Helper.SetGameSettingFloat("fDiffMultXPVH", ConfigXPDiffMultXPVH)
EndFunction

;; ****************************************************************************
;; Configure Level XP Settings: Difficulty Multiplier - Must call EnableLevelingXP manually after this completes
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureDifficultyXPMultiplier" <newDiffXPModVE> <newDiffXPModE> <newDiffXPModN> <newDiffXPModH> <newDiffXPModVH>
;; Params:
;;   newDiffXPModVE = The percentage multiplier in decimal form for the very easy difficulty mode. 
;;   newDiffXPModE = The percentage multiplier in decimal form for the easy difficulty mode. 
;;   newDiffXPModN = The percentage multiplier in decimal form for the normal difficulty mode. 
;;   newDiffXPModH = The percentage multiplier in decimal form for the hard difficulty mode. 
;;   newDiffXPModVH = The percentage multiplier in decimal form for the very hard difficulty mode. 
;;
Function ConfigureDifficultyXPMultiplier(Float newDiffXPModVE, Float newDiffXPModE, Float newDiffXPModN, Float newDiffXPModH, Float newDiffXPModVH)
  ConfigXPDiffMultXPVE=newDiffXPModVE
  ConfigXPDiffMultXPE=newDiffXPModE
  ConfigXPDiffMultXPN=newDiffXPModN
  ConfigXPDiffMultXPH=newDiffXPModH
  ConfigXPDiffMultXPVH=newDiffXPModVH
  ;; DO NOT CALL EnableLevelingXP ON SINGLE CHANGES you will cause a race condition
EndFunction

;; ****************************************************************************
;; Configure Level XP Settings: Kill XP - Must call EnableLevelingXP manually after this completes
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureCombatXP" <newKillXPReward>
;; Params:
;;   newKillXPReward = The XP awarded for killing stuff. Unlike normal this is an int not a float.
;;
Function ConfigureCombatXP(int newKillXPReward)
  ConfigXPKillOpponent=newKillXPReward
  ;; DO NOT CALL EnableLevelingXP ON SINGLE CHANGES you will cause a race condition
EndFunction

;; ****************************************************************************
;; Dump current Level XP Settings for the current difficulty mode
;;
;; Use: player.cf "VPI_ExperienceControl.DumpLevelingXP"
Function DumpLevelingXP()
  Int iDifficulty = Game.GetDifficulty()
  string sDifficulty = VPI_Helper.GetDifficulty(iDifficulty)

  string message = "Combat kills reward " + ConfigXPKillOpponent + " experience pre-multipliers."
  
  Float activeDifficultyMultiplier = 0;
  if (iDifficulty == 0) 
    activeDifficultyMultiplier = ConfigXPDiffMultXPVE
  ElseIf  (iDifficulty == 1) 
    activeDifficultyMultiplier = ConfigXPDiffMultXPE
  ElseIf  (iDifficulty == 2) 
    activeDifficultyMultiplier = ConfigXPDiffMultXPN
  ElseIf  (iDifficulty == 3) 
    activeDifficultyMultiplier = ConfigXPDiffMultXPH
  ElseIf  (iDifficulty == 4) 
    activeDifficultyMultiplier = ConfigXPDiffMultXPVH
  EndIf
  message += "Running in " + sDifficulty + " so the difficulty experience multiplier is " + activeDifficultyMultiplier + "\n."
  
  Debug.Trace("VPIXPCTRL_DEBUG" + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Crafting Experience Public Functions
;;

;; ****************************************************************************
;; Disable Crafting Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableCraftingXP"
;;
Function DisableCraftingXP()
  CraftingXPEnabled=false
 
  ;; Cooking XP Settings
  VPI_Helper.SetGameSettingFloat("fCookingExpBase", 0.00)
  VPI_Helper.SetGameSettingFloat("fCookingExpMult", 0.00)
  VPI_Helper.SetGameSettingFloat("fCookingExpMin", 0.00)
  VPI_Helper.SetGameSettingFloat("fCookingExpMax", 0.00)
  
  ;; Crafting XP Settings
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceBase", 0.00)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMult", 0.00)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMin", 0.00)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMax", 0.00)
EndFunction

;; ****************************************************************************
;; Enable Crafting Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableCraftingXP"
;;
Function EnableCraftingXP()
  CraftingXPEnabled=true
  
  ;; Cooking XP Settings
  VPI_Helper.SetGameSettingFloat("fCookingExpBase", ConfigXPCookingBase)
  VPI_Helper.SetGameSettingFloat("fCookingExpMult", ConfigXPCookingMult)
  VPI_Helper.SetGameSettingFloat("fCookingExpMin", ConfigXPCookingMin)
  VPI_Helper.SetGameSettingFloat("fCookingExpMax", ConfigXPCookingMax)
  
  ;; Crafting XP Settings
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceBase", ConfigXPCraftingBase)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMult", ConfigXPCraftingMult)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMin", ConfigXPCraftingMin)
  VPI_Helper.SetGameSettingFloat("fWorkbenchExperienceMax", ConfigXPCraftingMax)
EndFunction

;; ****************************************************************************
;; Configure Cooking XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureCookingXP" <base> <multiplier> <minReward> <maxReward>
;; Params:
;;   base = The base amount of XP that can be rewarded. 
;;   multiplier = The percentage multiplier in decimal form to apply to the base rewarded XP. 
;;   minReward = The minimum ammount of XP reward you can get after the multiplier is applied. 
;;   maxReward = The maximum ammount of XP reward you can get after the multiplier is applied. 
;;
Function ConfigureCookingXP(Float base, Float multiplier, Float minReward, Float maxReward)
  ConfigXPCookingBase=base
  ConfigXPCookingMult=multiplier
  ConfigXPCookingMin=minReward
  ConfigXPCookingMax=maxReward

  EnableCraftingXP()
EndFunction

;; ****************************************************************************
;; Configure Workbench XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureWorkbenchXP" <base> <multiplier> <minReward> <maxReward>
;; Params:
;;   base = The base amount of XP that can be rewarded. 
;;   multiplier = The percentage multiplier in decimal form to apply to the base rewarded XP. 
;;   minReward = The minimum ammount of XP reward you can get after the multiplier is applied. 
;;   maxReward = The maximum ammount of XP reward you can get after the multiplier is applied. 
;;
Function ConfigureWorkbenchXP(Float base, Float multiplier, Float minReward, Float maxReward)
  ConfigXPCraftingBase=base
  ConfigXPCraftingMult=multiplier
  ConfigXPCraftingMin=minReward
  ConfigXPCraftingMax=maxReward

  EnableCraftingXP()
EndFunction

;; ****************************************************************************
;; Dump current crafting (Cooking and Workbench) XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpCraftingXP"
Function DumpCraftingXP()
  string message = ""
  message += "***** Cooking *****\n"
  message += "Base=" + ConfigXPCookingBase + "; Multiplier=" + ConfigXPCookingMult + "; Min Reward=" + ConfigXPCookingMin + "; Max Reward=" + ConfigXPCookingMax + ";\n"
  message += "\n\n***** Workbench *****\n"
  message += "Base=" + ConfigXPCraftingBase + "; Multiplier=" + ConfigXPCraftingMult + "; Min Reward=" + ConfigXPCraftingMin + "; Max Reward=" + ConfigXPCraftingMax + ";\n"
  
  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Research Experience Public Functions
;;

;; ****************************************************************************
;; Disable Research Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableResearchXP"
;;
Function DisableResearchXP()
  ResearchXPEnabled=false
 
  ;; Research XP Settings
  VPI_Helper.SetGameSettingFloat("fResearchExpBase", 0.00)
  VPI_Helper.SetGameSettingFloat("fResearchExpMult", 0.00)
  VPI_Helper.SetGameSettingFloat("fResearchExpMax", 0.00)
EndFunction

;; ****************************************************************************
;; Enable Research Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableResearchXP"
;;
Function EnableResearchXP()
  ResearchXPEnabled=true
  
  ;; Research XP Settings
  VPI_Helper.SetGameSettingFloat("fResearchExpBase", ConfigXPResearchBase)
  VPI_Helper.SetGameSettingFloat("fResearchExpMult", ConfigXPResearchMult)
  VPI_Helper.SetGameSettingFloat("fResearchExpMax", ConfigXPResearchMax)
EndFunction

;; ****************************************************************************
;; Configure Research XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureResearchXP" <base> <multiplier> <maxReward>
;; Params:
;;   base = The base amount of XP that can be rewarded. 
;;   multiplier = The percentage multiplier in decimal form to apply to the base rewarded XP. 
;;   maxReward = The maximum ammount of XP reward you can get after the multiplier is applied. 
;;
Function ConfigureResearchXP(Float base, Float multiplier, Float maxReward)
  ConfigXPResearchBase=base
  ConfigXPResearchMult=multiplier
  ConfigXPResearchMax=maxReward

  EnableResearchXP()
EndFunction

;; ****************************************************************************
;; Dump current Research XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpResearchXP"
Function DumpResearchXP()
  string message = ""
  message += "Research: Base=" + ConfigXPResearchBase + "; Multiplier=" + ConfigXPResearchMult + "; Min Reward=1; Max Reward=" + ConfigXPResearchMax + ";\n"
  
  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Lockpicking/Hacking Experience Public Functions
;;

;; ****************************************************************************
;; Disable Lockpicking/Hacking Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableLockpickingXP"
;;
Function DisableLockpickingXP()
  LockpickingXPEnabled=false
  
  ;; Lockpicking/Hacking XP Settings
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardEasy", 0.00)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardAverage", 0.00)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardHard", 0.00)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardVeryHard", 0.00)
  VPI_Helper.SetGameSettingFloat("fHackingExperienceBase", 0.00)
EndFunction

;; ****************************************************************************
;; Enable Lockpicking Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableLockpickingXP"
;;
Function EnableLockpickingXP()
  LockpickingXPEnabled=true
  
  ;; Lockpicking/Hacking XP Settings
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardEasy", ConfigXPLockpickingNovice)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardAverage", ConfigXPLockpickingAdvanced)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardHard", ConfigXPLockpickingExpert)
  VPI_Helper.SetGameSettingFloat("fLockpickXPRewardVeryHard", ConfigXPLockpickingMaster)
  VPI_Helper.SetGameSettingFloat("fHackingExperienceBase", ConfigXPHackingExperienceBase)
EndFunction

;; ****************************************************************************
;; Configure Lockpicking XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureLockpickingXP" <novice> <advanced> <expert> <master> <hackingBase>
;; Params:
;;   novice = The XP rewarded for successfully hacking a novice lock/terminal
;;   advanced = The XP rewarded for successfully hacking a advanced lock/terminal
;;   expert = The XP rewarded for successfully hacking a expert lock/terminal
;;   master = The XP rewarded for successfully hacking a master lock/terminal
;;   hackingBase = The base XP rewarded for successfully hacking a terminal. Not sure this is actually used but setting is to 0 crashed the game on terminals so might be a minimum reward. 
;;
Function ConfigureLockpickingXP(Float novice, Float advanced, Float expert, Float master, Float hackingBase)
  ConfigXPLockpickingNovice=novice
  ConfigXPLockpickingAdvanced=advanced
  ConfigXPLockpickingExpert=expert
  ConfigXPLockpickingMaster=master
  ConfigXPHackingExperienceBase=hackingBase

  EnableLockpickingXP()
EndFunction

;; ****************************************************************************
;; Dump current Lockpicking XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpLockpickingXP"
Function DumpLockpickingXP()
  string message = ""
  message += "Lockpicking: Novice=" + ConfigXPLockpickingNovice + "; Advanced=" + ConfigXPLockpickingAdvanced + "; Expert=" + ConfigXPLockpickingExpert + "; Master=" + ConfigXPLockpickingMaster + ";\n"
  message += "Hacking: Base=" + ConfigXPHackingExperienceBase + ";\n"

  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Discovery/Survey Experience Public Functions
;;

;; ****************************************************************************
;; Disable Discovery Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableDiscoveryXP"
;;
Function DisableDiscoveryXP()
  DiscoveryXPEnabled=false
  
  ;; Discovery XP Settings
  VPI_Helper.SetGameSettingInt("iXPRewardDiscoverMapMarker", 0)
  VPI_Helper.SetGameSettingInt("iXPRewardDiscoverSecretArea", 0)
  VPI_Helper.SetGameSettingFloat("fScanCompleteXPReward", 0.00)

  ;; Planet Surveys
  VPI_Helper.SetFormSettingInt("0x00245AB9", 0) ;; PlanetaryTraitXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x001AEB4E", 0) ;; PlanetaryTraitSkillBonusXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  ;; PlanetaryTraitAstroBonusXPReward.SetValueInt(0)
  VPI_Helper.SetFormSettingInt("0x0030A8C5", 0) ;; PlanetarySurveyV1XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C6", 0) ;; PlanetarySurveyV2XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C7", 0) ;; PlanetarySurveyV3XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x00056E62", 0) ;; PlanetarySurveyV4XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0023842C", 0) ;; PlanetarySurveyV5XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works

  ;; System Surveys
  VPI_Helper.SetFormSettingInt("0x0030A8C8", 0) ;; SystemSurveyV1XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C9", 0) ;; SystemSurveyV2XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8CA", 0) ;; SystemSurveyV3XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8CB", 0) ;; SystemSurveyV4XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
EndFunction

;; ****************************************************************************
;; Enable Discovery Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableDiscoveryXP"
;;
Function EnableDiscoveryXP()
  DiscoveryXPEnabled=true
  
  ;; Discovery XP Settings
  VPI_Helper.SetGameSettingInt("iXPRewardDiscoverMapMarker", ConfigXPDiscoveryMapMarker)
  VPI_Helper.SetGameSettingInt("iXPRewardDiscoverSecretArea", ConfigXPDiscoverySecretArea)
  VPI_Helper.SetGameSettingFloat("fScanCompleteXPReward", ConfigXPScanCompletion)

  ;; Planetary Surveys
  VPI_Helper.SetFormSettingInt("0x00245AB9", ConfigQuestSM) ;; PlanetaryTraitXPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x001AEB4E", ConfigQuestSM) ;; PlanetaryTraitSkillBonusXPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  ;; PlanetaryTraitAstroBonusXPReward.SetValueFloat(0.25)
  VPI_Helper.SetFormSettingInt("0x0030A8C5", ConfigQuestTN) ;; PlanetarySurveyV1XPReward.SetValueInt(ConfigQuestTN) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C6", ConfigQuestSM) ;; PlanetarySurveyV2XPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C7", ConfigQuestMD) ;; PlanetarySurveyV3XPReward.SetValueInt(ConfigQuestMD) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x00056E62", ConfigQuestLG) ;; PlanetarySurveyV4XPReward.SetValueInt(ConfigQuestLG) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0023842C", ConfigQuestXL) ;; PlanetarySurveyV5XPReward.SetValueInt(ConfigQuestXL) ;; Papyrus has this locked as a const var but set console command works

  ;; System Surveys
  VPI_Helper.SetFormSettingInt("0x0030A8C8", ConfigQuestTN) ;; SystemSurveyV1XPReward.SetValueInt(ConfigQuestTN) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8C9", ConfigQuestSM) ;; SystemSurveyV2XPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8CA", ConfigQuestMD) ;; SystemSurveyV3XPReward.SetValueInt(ConfigQuestMD) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0030A8CB", ConfigQuestLG) ;; SystemSurveyV4XPReward.SetValueInt(ConfigQuestLG) ;; Papyrus has this locked as a const var but set console command works
EndFunction

;; ****************************************************************************
;; Configure Discovery XP Settings. Please note the planetary/system survey XP uses the quest XP settings. 
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureDiscoveryXP" <mapMarkers> <secretAreas> <scanCompletion>
;; Params:
;;   mapMarkers = The XP rewarded for successfully unlocking a map marker (Again Int instead of Floats)
;;   secretAreas = The XP rewarded for successfully discovering a secret area (Again Int instead of Floats)
;;   scanCompletion = The XP rewarded for successfully completing a scan
;;
Function ConfigureDiscoveryXP(Int mapMarkers, Int secretAreas, Float scanCompletion)
  ConfigXPDiscoveryMapMarker=mapMarkers
  ConfigXPDiscoverySecretArea=secretAreas
  ConfigXPScanCompletion=scanCompletion

  EnableDiscoveryXP()
EndFunction

;; ****************************************************************************
;; Dump current Discovery XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpDiscoveryXP"
Function DumpDiscoveryXP()
  string message = ""
  message += "Discovery: Map Markers=" + ConfigXPDiscoveryMapMarker + "; Secret Areas=" + ConfigXPDiscoverySecretArea + "; Scan Completion=" + ConfigXPScanCompletion + ";\n"
  message += "\n\n***** Planetary Surveys (Uses Normalized Quest XP) *****\n"
  message += "Trait XP=" + ConfigQuestSM + "; Survey T1=" + ConfigQuestTN + "; Survey T2=" + ConfigQuestSM + "; Survey T3=" + ConfigQuestMD + "; Survey T4=" + ConfigQuestLG + "; Survey T5=" + ConfigQuestXL + ";\n"
  message += "\n\n***** System Surveys (Uses Normalized Quest XP) *****\n"
  message += "Survey T1=" + ConfigQuestTN + "; Survey T2=" + ConfigQuestSM + "; Survey T3=" + ConfigQuestMD + "; Survey T4=" + ConfigQuestLG + ";\n"

  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Speechcraft Experience Public Functions
;;

;; ****************************************************************************
;; Disable Speechcraft Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableSpeechcraftXP"
;;
Function DisableSpeechcraftXP()
  SpeechcraftXPEnabled=false

  ;; Speechcraft XP Settings
  VPI_Helper.SetGameSettingFloat("fSpeechChallengeSuccessXP", 0.00)
EndFunction

;; ****************************************************************************
;; Enable Speechcraft Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableSpeechcraftXP"
;;
Function EnableSpeechcraftXP()
  SpeechcraftXPEnabled=true

  ;; Speechcraft XP Settings
  VPI_Helper.SetGameSettingFloat("fSpeechChallengeSuccessXP", ConfigXPSpeechcraftSuccess)
EndFunction

;; ****************************************************************************
;; Configure Speechcraft XP Settings.
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureSpeechcraftXP" <successReward>
;; Params:
;;   successReward = The XP rewarded for successfully completeing a speechcraft action (persuasion, diplomacy, etc)
;;
Function ConfigureSpeechcraftXP(Int successReward)
  ConfigXPSpeechcraftSuccess=successReward

  EnableSpeechcraftXP()
EndFunction

;; ****************************************************************************
;; Dump current Discovery XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpSpeechcraftXP"
Function DumpSpeechcraftXP()
  string message = ""
  message += "Speechcraft: Successs=" + ConfigXPSpeechcraftSuccess + ";\n"

  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Quest Experience Public Functions
;;

;; ****************************************************************************
;; Disable Quest Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.DisableDiscoveryXP"
;;
Function DisableQuestXP()
  QuestXPEnabled=false

  ;; Main Story Quests
  MainQuestAct1XPRewardSmall.SetValueInt(0)
  MainQuestAct1XPRewardMedium.SetValueInt(0)
  MainQuestAct1XPRewardLarge.SetValueInt(0)
  MainQuestAct2XPRewardSmall.SetValueInt(0)
  MainQuestAct2XPRewardMedium.SetValueInt(0)
  MainQuestAct2XPRewardLarge.SetValueInt(0)
  MainQuestAct3XPRewardMedium.SetValueInt(0)
  MainQuestAct3XPRewardLarge.SetValueInt(0)

  ;; Faction Quests
  FactionQuestXPRewardSmall.SetValueInt(0)
  FactionQuestXPRewardMedium.SetValueInt(0)
  FactionQuestXPRewardLarge.SetValueInt(0)

  ;; Radient Quests
  RadiantQuestVersion01XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion02XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion03XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion04XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion05XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion06XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion07XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion08XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion09XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion10XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion11XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion12XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion13XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion14XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion15XPRewardSmall.SetValueInt(0)
  RadiantQuestVersion01XPRewardMedium.SetValueInt(0)
  RadiantQuestVersion02XPRewardLarge.SetValueInt(0)
  RadiantQuestVersion03XPRewardLarge.SetValueInt(0)
  RadiantQuestVersion04XPRewardLarge.SetValueInt(0)
  RadiantQuestVersion05XPRewardLarge.SetValueInt(0)
  RadiantQuestVersion06XPRewardLarge.SetValueInt(0)

  ;; Misc Quests
  VPI_Helper.SetFormSettingInt("0x002685E7", 0) ;; MiscQuestXPRewardTiny.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  MiscQuestXPRewardSmall.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  MiscQuestXPRewardMedium.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  MiscQuestXPRewardLarge.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works

  ;; Other Quests
  CompanionQuestXPReward.SetValueInt(0)
  OptionalObjectiveQuestXPReward.SetValueInt(0)
  RedMileRunQuestXPReward.SetValueInt(0)
  VPI_Helper.SetFormSettingInt("0x0006B510", 0) ;; OESmallQuestXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x000F3CF9", 0) ;; OEMediumQuestXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x000F19CC", 0) ;; OELargeQuestXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  StarbornTempleXPReward.SetValueInt(0)

  ;; Settlement Quests
  SettlementV1QuestXPRewardSmall.SetValueInt(0)
  SettlementV2QuestXPRewardSmall.SetValueInt(0)
  SettlementV3QuestXPRewardSmall.SetValueInt(0)
  SettlementV4QuestXPRewardSmall.SetValueInt(0)
  SettlementV5QuestXPRewardSmall.SetValueInt(0)
  SettlementV1QuestXPRewardMedium.SetValueInt(0)
  SettlementV1QuestXPRewardLarge.SetValueInt(0)

  ;; Mission Board Quests
  VPI_Helper.SetFormSettingInt("0x0009E153", 0) ;; MissionBoardSurveyBaseXPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB84", 0) ;; MissionBoardSurveyTraitV1XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB85", 0) ;; MissionBoardSurveyTraitV2XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB86", 0) ;; MissionBoardSurveyTraitV3XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB87", 0) ;; MissionBoardSurveyTraitV4XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB88", 0) ;; MissionBoardSurveyTraitV5XPReward.SetValueInt(0) ;; Papyrus has this locked as a const var but set console command works
EndFunction

;; ****************************************************************************
;; Enable Quest Experience Gain
;;
;; Use: player.cf "VPI_ExperienceControl.EnableQuestXP"
;;
Function EnableQuestXP()
  QuestXPEnabled=true

  ;; Main Story Quests
  MainQuestAct1XPRewardSmall.SetValueInt(ConfigMQACT1Small)
  MainQuestAct1XPRewardMedium.SetValueInt(ConfigMQACT1Medium)
  MainQuestAct1XPRewardLarge.SetValueInt(ConfigMQACT1Large)
  MainQuestAct2XPRewardSmall.SetValueInt(ConfigMQACT2Small)
  MainQuestAct2XPRewardMedium.SetValueInt(ConfigMQACT2Medium)
  MainQuestAct2XPRewardLarge.SetValueInt(ConfigMQACT2Large)
  MainQuestAct3XPRewardMedium.SetValueInt(ConfigMQACT3Medium)
  MainQuestAct3XPRewardLarge.SetValueInt(ConfigMQACT3Large)

  ;; Faction Quests
  FactionQuestXPRewardSmall.SetValueInt(ConfigQuestMD)
  FactionQuestXPRewardMedium.SetValueInt(ConfigQuestLG)
  FactionQuestXPRewardLarge.SetValueInt(ConfigQuestXL)

  ;; Radient Quests
  RadiantQuestVersion01XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion02XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion03XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion04XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion05XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion06XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion07XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion08XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion09XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion10XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion11XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion12XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion13XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion14XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion15XPRewardSmall.SetValueInt(ConfigQuestSM)
  RadiantQuestVersion01XPRewardMedium.SetValueInt(ConfigQuestMD)
  RadiantQuestVersion02XPRewardLarge.SetValueInt(ConfigQuestLG)
  RadiantQuestVersion03XPRewardLarge.SetValueInt(ConfigQuestLG)
  RadiantQuestVersion04XPRewardLarge.SetValueInt(ConfigQuestLG)
  RadiantQuestVersion05XPRewardLarge.SetValueInt(ConfigQuestLG)
  RadiantQuestVersion06XPRewardLarge.SetValueInt(ConfigQuestLG)

  ;; Misc Quests
  VPI_Helper.SetFormSettingInt("0x002685E7", ConfigQuestTN) ;; MiscQuestXPRewardTiny.SetValueInt(ConfigQuestTN) ;; Papyrus has this locked as a const var but set console command works
  MiscQuestXPRewardSmall.SetValueInt(ConfigQuestSM)
  MiscQuestXPRewardMedium.SetValueInt(ConfigQuestMD)
  MiscQuestXPRewardLarge.SetValueInt(ConfigQuestLG)

  ;; Other Quests
  CompanionQuestXPReward.SetValueInt(ConfigQuestLG)
  OptionalObjectiveQuestXPReward.SetValueInt(ConfigQuestSM)
  RedMileRunQuestXPReward.SetValueInt(ConfigQuestSM)
  VPI_Helper.SetFormSettingInt("0x0006B510", ConfigQuestMD) ;; OESmallQuestXPReward.SetValueInt(ConfigQuestMD) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x000F3CF9", ConfigQuestLG) ;; OEMediumQuestXPReward.SetValueInt(ConfigQuestLG) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x000F19CC", ConfigQuestXL) ;; OELargeQuestXPReward.SetValueInt(ConfigQuestXL) ;; Papyrus has this locked as a const var but set console command works
  StarbornTempleXPReward.SetValueInt(ConfigQuestMD)

  ;; Settlement Quests
  SettlementV1QuestXPRewardSmall.SetValueInt(ConfigQuestTN)
  SettlementV2QuestXPRewardSmall.SetValueInt(ConfigQuestTN)
  SettlementV3QuestXPRewardSmall.SetValueInt(ConfigQuestTN)
  SettlementV4QuestXPRewardSmall.SetValueInt(ConfigQuestTN)
  SettlementV5QuestXPRewardSmall.SetValueInt(ConfigQuestTN)
  SettlementV1QuestXPRewardMedium.SetValueInt(ConfigQuestSM)
  SettlementV1QuestXPRewardLarge.SetValueInt(ConfigQuestMD)

  ;; Mission Board Quests
  VPI_Helper.SetFormSettingInt("0x0009E153", ConfigQuestSM) ;; MissionBoardSurveyBaseXPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB84", ConfigQuestTN) ;; MissionBoardSurveyTraitV1XPReward.SetValueInt(ConfigQuestTN) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB85", ConfigQuestSM) ;; MissionBoardSurveyTraitV2XPReward.SetValueInt(ConfigQuestSM) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB86", ConfigQuestMD) ;; MissionBoardSurveyTraitV3XPReward.SetValueInt(ConfigQuestMD) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB87", ConfigQuestLG) ;; MissionBoardSurveyTraitV4XPReward.SetValueInt(ConfigQuestLG) ;; Papyrus has this locked as a const var but set console command works
  VPI_Helper.SetFormSettingInt("0x0016AB88", ConfigQuestXL) ;; MissionBoardSurveyTraitV5XPReward.SetValueInt(ConfigQuestXL) ;; Papyrus has this locked as a const var but set console command works
EndFunction

;; ****************************************************************************
;; Configure Main Quest XP Settings.
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureMainQuestXP" <act1XPSmall> <act1XPMedium> <act1XPLarge> <act2XPSmall> <act2XPMedium> <act2XPLarge> <act3XPMedium> <act3XPLarge>
;; Params:
;;   act1XPSmall = The XP rewarded for completeing small quest in act 1
;;   act1XPMedium = The XP rewarded for completeing medium quest in act 1
;;   act1XPLarge = The XP rewarded for completeing large quest in act 1
;;   act2XPSmall = The XP rewarded for completeing small quest in act 2
;;   act2XPMedium = The XP rewarded for completeing medium quest in act 2
;;   act2XPLarge = The XP rewarded for completeing large quest in act 2
;;   act3XPMedium = The XP rewarded for completeing medium quest in act 3
;;   act3XPLarge = The XP rewarded for completeing large quest in act 3
;;
Function ConfigureMainQuestXP(Int act1XPSmall, Int act1XPMedium, Int act1XPLarge, Int act2XPSmall, Int act2XPMedium, Int act2XPLarge, Int act3XPMedium, Int act3XPLarge)
  ConfigMQACT1Small=act1XPSmall
  ConfigMQACT1Medium=act1XPMedium
  ConfigMQACT1Large=act1XPLarge

  ConfigMQACT2Small=act2XPSmall
  ConfigMQACT2Medium=act2XPMedium
  ConfigMQACT2Large=act2XPLarge

  ;; ConfigMQACT3Small=act3XPSmall ;; Doesn't Exist Currently
  ConfigMQACT3Medium=act3XPMedium
  ConfigMQACT3Large=act3XPLarge

  EnableQuestXP()
EndFunction

;; ****************************************************************************
;; Configure Normalized Quest XP Settings.
;;
;; Use: player.cf "VPI_ExperienceControl.ConfigureNormalizedQuestXP" <tinyReward> <smallReward> <mediumReward> <largeReward> <xlReward> <xxlReward> <xxxlReward> <smallMassiveReward> <mediumMassiveReward> <largeMassiveReward>
;; Params:
;;   tinyReward = Awards a tiny amount of XP for quest completion -- Default 50
;;   smallReward = Awards a small amount of XP for quest completion -- Default 100
;;   mediumReward = Awards a medium amount of XP for quest completion -- Default 200
;;   largeReward = Awards a large amount of XP for quest completion -- Default 300
;;   xlReward = Awards a extra large amount of XP for quest completion -- Default 500
;;   xxlReward = Awards a extra extra large amount of XP for quest completion -- Default 750
;;   xxxlReward = Awards a triple extra large amount of XP for quest completion -- Default 1000
;;   smallMassiveReward = Awards a small massively large amount of XP for quest completion -- Default 4000
;;   mediumMassiveReward = Awards a medium massively large amount of XP for quest completion -- Default 4500
;;   largeMassiveReward = Awards a large massively large amount of XP for quest completion -- Default 5000
;;
Function ConfigureNormalizedQuestXP(Int tinyReward, Int smallReward, Int mediumReward, Int largeReward, Int xlReward, Int xxlReward, Int xxxlReward, Int smallMassiveReward, Int mediumMassiveReward, Int largeMassiveReward)
  ConfigQuestTN=tinyReward
  ConfigQuestSM=smallReward
  ConfigQuestMD=mediumReward
  ConfigQuestLG=largeReward
  ConfigQuestXL=xlReward
  ConfigQuestXXL=xxlReward
  ConfigQuestXXXL=xxxlReward
  ConfigQuestMSVSM=smallMassiveReward
  ConfigQuestMSVMD=mediumMassiveReward
  ConfigQuestMSVLG=largeMassiveReward

  EnableQuestXP()
EndFunction

;; ****************************************************************************
;; Dump current Quest XP Settings
;;
;; Use: player.cf "VPI_ExperienceControl.DumpQuestXP"
Function DumpQuestXP()
  string message = ""
  message += "Main Quest Act 1: Small=" + ConfigMQACT1Small + "; Medium=" + ConfigMQACT1Medium + "; Large=" + ConfigMQACT1Large + ";\n"
  message += "Main Quest Act 2: Small=" + ConfigMQACT2Small + "; Medium=" + ConfigMQACT2Medium + "; Large=" + ConfigMQACT2Large + ";\n"
  message += "Main Quest Act 3: Small=N/A; Medium=" + ConfigMQACT3Medium + "; Large=" + ConfigMQACT3Large + ";\n"
  message += "\n\n***** Normalized Quest XP *****\n"
  message += "Tiny=" + ConfigQuestTN + "; Small=" + ConfigQuestSM + "; Medium=" + ConfigQuestMD + "; Large=" + ConfigQuestLG + ";\n"
  message += "XL=" + ConfigQuestXL + "; XXL=" + ConfigQuestXXL + "; XXL=" + ConfigQuestXXXL + ";\n"
  message += "SM MSV=" + ConfigQuestMSVSM + "; MD MSV=" + ConfigQuestMSVMD + "; LG MSV=" + ConfigQuestMSVLG + ";\n"

  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction



;;
;; Scaling Public Functions
;;

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Difficulty Based XP Multiplier
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyXPMultiplierSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyXPMultiplierSFForBracket(int bracket, Float newSF)
  SF_XPDifficultyMultiplier[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Kill XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyCombatXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyCombatXPSFForBracket(int bracket, Float newSF)
  SF_CombatXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Crafting XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyCraftingXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyCraftingXPSFForBracket(int bracket, Float newSF)
  SF_CraftingXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Research XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyResearchXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyResearchXPSFForBracket(int bracket, Float newSF)
  SF_ResearchXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Lockpicking XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyLockpickingXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyLockpickingXPSFForBracket(int bracket, Float newSF)
  SF_LockpickingXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Discovery XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyDiscoveryXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyDiscoveryXPSFForBracket(int bracket, Float newSF)
  SF_DiscoveryXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Speechcraft XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultySpeechcraftXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultySpeechcraftXPSFForBracket(int bracket, Float newSF)
  SF_SpeechcraftXP[bracket]=newSF
EndFunction

;; ****************************************************************************
;; Change a scaling factor in the specified level bracket for Quest XP Reward
;;
;; Use: player.cf "VPI_ExperienceControl.SetDifficultyQuestXPSFForBracket" <bracket> <newSF>
;;   bracket -> The bracket to change can be 1 to 10 only
;;   newSF -> The new scale factor to set for the bracket
;;
Function SetDifficultyQuestXPSFForBracket(int bracket, Float newSF)
  SF_QuestXP[bracket]=newSF
EndFunction



;;
;; General Debugging Public Functions
;;

;; ****************************************************************************
;; Check status of current XP gain settings
;;
;; Use: player.cf "VPI_ExperienceControl.CurrentXPStatus"
;;
Function CurrentXPStatus()
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

  message += "Combat Kill XP is set to " + gameXPKillOpponent + ".\n"
  message += "Cooking XP is set to " + gameXPCookingBase + " and the cooking multiplier is set too " + gameXPCookingMult + ".\n"
  message += "Research XP is set to " + gameXPResearchBase + " and the research multiplier is set too " + gameXPResearchMult + ".\n"
  message += "Crafting XP is set to " + gameXPCraftingBase + " and the crafting multiplier is set too " + gameXPCraftingMult + ".\n"
  message += "Lockpicking XP is set to " + gameXPLockpickingNovice + " for novice, " + gameXPLockpickingAdvanced + " for advanced, " + gameXPLockpickingExpert + " for expert, and finally " + gameXPLockpickingMaster + " for master.\n"
  message += "Speechcraft XP is set to " + gameXPSpeechcraftSuccess + ".\n"
  
  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 1)
  Debug.MessageBox(message)
EndFunction

;; ****************************************************************************
;; Get the current experience config
;;
;; Use: player.cf "VPI_ExperienceControl.DumpXPMatrix"
;;
Function DumpXPMatrix()
  string message = "Configuration Data from version " + Version + ".\n"
  message += "\n\n"
  message += "***** Combat/Crafting/ResearcH XP *****\n"
  message += "______________|_____Base_____|__Multiplier__|__Minimum___|__Maximum___|\n"
  message += "    Cooking XP| " + ConfigXPCookingBase + "     | " + ConfigXPCookingMult + "     | " + ConfigXPCookingMin  + "   | " + ConfigXPCookingMax  + "  |\n"
  message += "   Research XP| " + ConfigXPResearchBase + "     | " + ConfigXPResearchMult + "     |     N/A    | " + ConfigXPResearchMax + " |\n"
  message += "   Crafting XP| " + ConfigXPCraftingBase + "     | " + ConfigXPCraftingMult + "     | " + ConfigXPCraftingMin  + "   | " + ConfigXPCraftingMax + "  |\n"
  message += "==============|==============|==============|============|============|\n"
  message += "\n\n"
  message += "Lockpicking/Hacking:\n Novice=" + ConfigXPLockpickingNovice + "; Advanced=" + ConfigXPLockpickingAdvanced + "; Expert=" + ConfigXPLockpickingExpert + "; Master=" + ConfigXPLockpickingMaster + "; HAcking Base=" + ConfigXPHackingExperienceBase + "\n"
  message += "\n\n"
  message += "***** Discovery XP *****\n"
  message += "Map Markers: " + ConfigXPDiscoveryMapMarker + "\n"
  message += "Secret Areas: " + ConfigXPDiscoverySecretArea  + "\n"
  message += "Scan Complete: " + ConfigXPScanCompletion + "\n"
  message += "Survey Base XP: " + PlanetaryTraitXPReward.GetValueInt() + "\n"
  message += "_________________|____T1____|____T2____|____T3____|____T4____|____T5____|\n"
  message += "Planetary Surveys|    " + PlanetarySurveyV1XPReward.GetValueInt() + "    |   " + PlanetarySurveyV2XPReward.GetValueInt() + "    |   " + PlanetarySurveyV3XPReward.GetValueInt() + "    |   " + PlanetarySurveyV4XPReward.GetValueInt() + "    |    " + PlanetarySurveyV5XPReward.GetValueInt() + "   |\n"
  message += "   System Surveys|    " + SystemSurveyV1XPReward.GetValueInt() + "    |   " + SystemSurveyV2XPReward.GetValueInt() + "    |   " + SystemSurveyV3XPReward.GetValueInt() + "    |   " + SystemSurveyV4XPReward.GetValueInt() + "    |    N/A   |\n"
  message += "=================|==========|==========|==========|==========|==========|\n"
  message += "\n\n"
  message += "***** Quest XP *****\n"
  message += "_________________|___Base___|___Tiny___|__Small___|__Medium__|__Large___|____XL____|\n"
  message += " Main Quest Act 1|    N/A   |    N/A   |    " + MainQuestAct1XPRewardSmall.GetValueInt() + "   |    " + MainQuestAct1XPRewardMedium.GetValueInt() + "   |    " + MainQuestAct1XPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += " Main Quest Act 2|    N/A   |    N/A   |    " + MainQuestAct2XPRewardSmall.GetValueInt() + "   |    " + MainQuestAct2XPRewardMedium.GetValueInt() + "   |    " + MainQuestAct2XPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += " Main Quest Act 3|    N/A   |    N/A   |    N/A   |    " + MainQuestAct3XPRewardMedium.GetValueInt() + "  |    " + MainQuestAct3XPRewardLarge.GetValueInt() + "  |    N/A   |\n"
  message += "          Faction|    N/A   |    N/A   |    " + FactionQuestXPRewardSmall.GetValueInt() + "   |    " + FactionQuestXPRewardMedium.GetValueInt() + "   |    " + FactionQuestXPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += "          Radiant|    N/A   |    N/A   |    " + RadiantQuestVersion01XPRewardSmall.GetValueInt() + "   |    " + RadiantQuestVersion01XPRewardMedium.GetValueInt() + "   |    " + RadiantQuestVersion01XPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += "             Misc|    N/A   |    " + MiscQuestXPRewardTiny.GetValueInt() + "    |    " + MiscQuestXPRewardSmall.GetValueInt() + "   |    " + MiscQuestXPRewardMedium.GetValueInt() + "   |    " + MiscQuestXPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += "            OE???|    N/A   |    N/A   |    " + OESmallQuestXPReward.GetValueInt() + "   |    " + OEMediumQuestXPReward.GetValueInt() + "   |    " + OELargeQuestXPReward.GetValueInt() + "   |    N/A   |\n"
  message += "       Settlement|    N/A   |    N/A   |    " + SettlementV1QuestXPRewardSmall.GetValueInt() + "    |    " + SettlementV1QuestXPRewardMedium.GetValueInt() + "   |    " + SettlementV1QuestXPRewardLarge.GetValueInt() + "   |    N/A   |\n"
  message += "    Mission Board|    " + MissionBoardSurveyBaseXPReward.GetValueInt() + "   |    " + MissionBoardSurveyTraitV1XPReward.GetValueInt() + "   |    " + MissionBoardSurveyTraitV2XPReward.GetValueInt() + "   |    " + MissionBoardSurveyTraitV3XPReward.GetValueInt() + "   |    " + MissionBoardSurveyTraitV4XPReward.GetValueInt() + "   |    " + MissionBoardSurveyTraitV5XPReward.GetValueInt() + "   |\n"
  message += "=================|==========|==========|==========|==========|==========|==========|\n"

  Debug.Trace("VPIXPCTRL_DEBUG: " + message, 2)
  Debug.Messagebox("This message is too large for notification or message box so please enable and look in the papyrus Log. Sorry, I'll Look for a better way for a future version.")
EndFunction

;; ****************************************************************************
;; Get the current version of the script
;;
;; Use: player.cf "VPI_ExperienceControl.GetVersion"
;;
Function GetVersion()
  Debug.Messagebox("VPI_ExperienceControl Version: " + Version)
EndFunction
