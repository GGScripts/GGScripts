--ver. 0.311

if myHero.charName ~= "Teemo" then return end

local version = "0.311"
local LocalVersion = 0.311
local scriptname = "BushMasterTeemo"
local developer = "THEOSWORLD"
local contact = "skype theosoworld"
local FONTAN = false
local lowBase = {["x"] = 406, ["z"] = 424}
local upBase = {["x"] = 14322, ["z"] = 14394}
local REGEN = false
local POTS = {"ItemCrystalFlask", "RegenerationPotion", "ItemMiniRegenPotion", "ItemCrystalFlaskJungle", "ItemDarkCrystalFlask"}
local YOLO = {}
local TIAMAT, TITANIC, CUTLASS, YOUMU, GUNBLADE, BOTRK, QSS, DERVISH = false
local UNDERCC = false
local CUTLASSSLOT, YOUMUSLOT, GUNBLADESLOT, BOTRKSLOT, QSSSLOT, DERVISHSLOT
local ATTACKITEMS = {"BilgewaterCutlass", "YoumusBlade", "HextechGunblade", "ItemSwordOfFeastAndFamine"}
local ANTICCITEMS = {"QuicksilverSash", "ItemDervishBlade"}
local FAGGOTS = { 
["AkaliShadowDance"] = 1,
["IreliaGatotsu"] = 1,
["JayceToTheSkies"] = 1,
["JaxLeapStrike"] = 1,
["Headbutt"] = 1,
["DianaTeleport"] = 1,
["MaokaiUnstableGrowth"] = 1,
["PantheonW"] = 1,
["XenZhaoSweep"] = 1,
["FizzPiercingStrike"] = 1,
["RengarLeap"] = 1,
["blindmonkqtwo"] = 1,
["PoppyHeroicCharge"] = 1,
["MonkeyKingNimbus"] = 1,
["ViR"] = 1,
["zedult"] = 1,
["JarvanIVCataclysm"] = 2,
["khazixelong"] = 2,
["RenektonSliceAndDice"] = 2,
["ShenShadowDash"] = 2,
["slashCast"] = 2,
["RocketJump"] = 2,
["SejuaniArcticAssault"] = 2,
["UFSlash"] = 2,
["KhazixE"] = 2,
["GragasE"] = 2,
["AatroxQ"] = 2,
["YasuoDashWrapper"] = 2
}
local CCSPELLS = {"MordekaiserChildrenOfTheGrave", "SkarnerImpale", "LuxLightBindingMis", "Wither", "SonaCrescendo", "DarkBindingMissile", "CurseoftheSadMummy",
"EnchantedCrystalArrow", "BlindingDart", "LuluWTwo", "AhriSeduce", "CassiopeiaPetrifyingGaze", "Terrify", "HowlingGale", "JaxCounterStrike", "KennenShurikenStorm",
"LeblancSoulShackle", "LeonaSolarFlare", "LissandraR", "AlZaharNetherGrasp", "MonkeyKingDecoy", "NamiQ", "OrianaDetonateCommand", "Pantheon_LeapBash", "PuncturingTaunt",
"SejuaniGlacialPrisonStart", "SwainShadowGrasp", "Imbue", "ThreshQ", "UrgotSwap2", "VarusR", "VeigarEventHorizon", "ViR", "InfiniteDuress", "ZyraGraspingRoots",
"paranoiamisschance", "puncturingtauntarmordebuff", "surpression", "zedulttargetmark", "enchantedcrystalarrow", "nasusw"}
local AttackResets = {"dariusnoxiantacticsonh", "fioraflurry", "garenq", "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", 
"luciane", "lucianq", "lucianw", "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade", "parley", 
"poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack", "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", 
"vaynetumble", "vie", "volibearq", "xenzhaocombotarget", "yorickspectral", "reksaiq"}
local NoAttacks = {"jarvanivcataclysmattack", "monkeykingdoubleattack", "shyvanadoubleattack", "shyvanadoubleattackdragon", "zyragraspingplantattack", 
"zyragraspingplantattack2", "zyragraspingplantattackfire", "zyragraspingplantattack2fire", "viktorpowertransfer", "sivirwattackbounce"}
local Attacks = {"caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", 
"renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "xenzhaothrust2", "xenzhaothrust3", "viktorqbuff"}
local VARS = {
  AA = {RANGE = 500},
  Q = {RANGE = 580}
}


function OnLoad()
  AddApplyBuffCallback(Buff_Add)
  AddRemoveBuffCallback(Buff_Rem)
  AddProcessAttackCallback(Teeto_ProcessAttack)

  KatarinaUpdate(
    Version,
    'raw.githubusercontent.com', 
    '/GGScripts/GGScripts/BushMasterTeemo/BushMasterTeemo.lua', 
    SCRIPT_PATH.._ENV.FILE_NAME, 
    function() PrintChat('<font color = \"#B13070\">[BushMasterTeemo]</font> <font color = \"#4DFF4D\">SCRIPT UPDATED. RESTART BOL (2xF9)</font>') end, 
    function() PrintChat('<font color = \"#B13070\">[BushMasterTeemo]</font> <font color = \"#4DFF4D\">LOADED VERSION //</font>'..version) end, 
    function() PrintChat(Menu.update and '<font color = \"#B13070\">[BushMasterTeemo]</font> <font color = \"#4DFF4D\">NEW VERSION, WAIT...</font>' or
     '<font color = \"#B13070\">[BushMasterTeemo]</font> <font color = \"#4DFF4D\">NEW VERSION, DOWNLOAD IT MANUALLY FROM FORUM</font>') end, 
    function() PrintChat('<font color = \"#B13070\">[BushMasterTeemo]</font> <font color = \"#4DFF4D\">UPDATE ERROR, DOWNLOAD IT MANUALLY FROM FORUM</font>') end)

  Menu = scriptConfig("[BushMasterTeemo]", "BushMasterTeemo")
  Menu:addSubMenu("[Key Binds]", "Key")
  Menu.Key:addParam("combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
  Menu.Key:addParam("harras", "Harras", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Menu.Key:addParam("lasthit", "Lasthit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))

  Menu:addSubMenu("[Combo]", "Combo")
  Menu.Combo:addSubMenu("[Q] whitelist", "whitelist")
  for i,enemy in pairs(GetEnemyHeroes()) do
    table.insert(YOLO, enemy.charName)
  end
  for i = 1, #YOLO do
    local a1 = "a"..i
    local a2 = ""..YOLO[i]
    Menu.Combo.whitelist:addParam(a1, "Cast Q on "..a2, SCRIPT_PARAM_ONOFF, true)
  end
  Menu.Combo:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useAAQ", "Use AA-Q", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, false)

  Menu:addSubMenu("[Harras]", "Harras")
  Menu.Harras:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Menu.Harras:addParam("useAAQ", "Use AA-Q", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Farm]", "Farm")
  Menu.Farm:addSubMenu("[Lasthit]", "Lasthit")
  Menu.Farm.Lasthit:addParam("lasthitQ", "Use Q for lasthit", SCRIPT_PARAM_ONOFF, true)
  Menu.Farm.Lasthit:addParam("lasthitQmana", "% Mana for lasthit", SCRIPT_PARAM_SLICE, 80, 0, 100, 0)

  Menu:addSubMenu("[Item Usage]", "Item")
  Menu.Item:addParam("UseItem", "Enable Item Usage", SCRIPT_PARAM_ONOFF, true)
  Menu.Item:addSubMenu("[Offensive Items]", "AttackItem")
  Menu.Item.AttackItem:addParam("UseCutlass", "Use Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseBOTRK", "Use BOTRK", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseYoumu", "Use Youmus Blade", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseGunblade", "Use Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)
  Menu.Item:addSubMenu("[Anti CC]", "DefItem")
  Menu.Item.DefItem:addParam("EnableACC", "Enable AntiCC", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.DefItem:addParam("UseQSS", "Use Quicksilver Sash", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.DefItem:addParam("UseDervish", "Use Dervish Blade", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Draws]", "Draws")
  Menu.Draws:addParam("drawQ", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("drawHP", "Draw damage on HP bars", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Auto]", "Auto")
  Menu.Auto:addParam("autoPots", "Auto Potions usage", SCRIPT_PARAM_ONOFF, true)
  Menu.Auto:addParam("autoShroom", "Auto Poop on gapclosers", SCRIPT_PARAM_ONOFF, true)
  Menu.Auto:addParam("autoPotsHealth", "% Health for autopots", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)

  Menu:addSubMenu("[Killsteal]", "KS")
  Menu.KS:addParam("ksQ", "Use Q for killsteal", SCRIPT_PARAM_ONOFF, true)
  Menu.KS:addParam("ksIgnite", "Use Ignite for killsteal", SCRIPT_PARAM_ONOFF, true)
  Menu.KS:addParam("UseItems", "Use Items in Killsteal", SCRIPT_PARAM_ONOFF, true)

  Menu:addParam("info1", "", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info2", ""..scriptname.." [ver. "..version.."]", SCRIPT_PARAM_INFO, "")
  Menu:addParam("update", "Enable Auto Update", SCRIPT_PARAM_ONOFF, true)
  Menu:addParam("info5", "", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info3", "Created by "..developer.."", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info4", "Contact me: "..contact.."", SCRIPT_PARAM_INFO, "")

  
  igniteslot = FindSlotByName("summonerdot")

  
  if _G.Reborn_Loaded ~= nil then
    SAC = true 
  elseif _G.MMA_IsLoaded then
    MMA = true
  elseif _G.NebelwolfisOrbWalkerInit then
    WOLFY = true
  elseif _Pewalk then
    PEW = true            
  end
end

function OnTick()
  if Menu.Item.UseItem then
    FindItems()
  end 
  
  if UNDERCC and Menu.Item.UseItem and Menu.Item.DefItem.EnableACC then
    if Menu.Item.DefItem.UseQSS and QSS then
      CastQSS()
    end
    if Menu.Item.DefItem.UseDervish and DERVISH then
      CastDervish()
    end
  end
  Killsteal()
  if igniteslot ~= nil then
    AutoIgnite()
  end
  
  if Menu.Key.combo then
    Combo()
  end
  
  if Menu.Key.harras then
    Harras()
  end
  
  if Menu.Key.lasthit then
    Lasthit()
  end
  
  if Menu.Auto.autoPots then
    CheckFountain()
  end
  if Menu.Auto.autoPots and not REGEN and not FONTAN then
    AutoPotion()
  end 
end

function OnDraw()
  if not myHero.dead then
    if Menu.Draws.drawQ then
      DrawFPSCircle(myHero.x, myHero.z, VARS.Q.RANGE, ARGB(255,193,61,255), 24)
    end
    if Menu.Draws.drawHP then
      DrawHPbar()
    end
  end
end

function DrawHPbar()
  for i, HPbarEnemyChamp in pairs(GetEnemyHeroes()) do
    if not HPbarEnemyChamp.dead and HPbarEnemyChamp.visible then
      local dmg = myHero:CalcDamage(HPbarEnemyChamp, myHero.totalDamage)
      if myHero:CanUseSpell(_Q) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetQDamage(HPbarEnemyChamp)
      end
      if myHero:CanUseSpell(_E) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetEDamage(HPbarEnemyChamp)
      end
      if igniteslot ~= nil then
        if CanCast(igniteslot) then
          dmg = dmg + (50 + 20*myHero.level)
        end
      end
      DrawLineHPBar(dmg, "", HPbarEnemyChamp, HPbarEnemyChamp.team)
    end
  end
end

function Combo()
  if not Menu.Combo.useAAQ and CanCast(_Q) and Menu.Combo.useQ then
    local target = GetHentaiTarget(VARS.Q.RANGE)
    if target ~= nil then
      if isWhitelisted(target) then
        CastQ(target)
      end
    end
  end
  if Menu.Combo.useW and CanCast(_W) then
    local target = GetHentaiTarget(VARS.AA.RANGE + 100)
    if target ~= nil then
      if (((target.health*100)/target.maxHealth) <= 70) or CountNearTargetR(target) >= 2 then
        CastW()
      end
    end
  end
end

function CountNearTargetR(unit)
  local count = 0
  for i,enemy in pairs(GetEnemyHeroes()) do
    if unit ~= enemy then
      if GetRastoyanie(unit, enemy) <= 750 then
        count = count + 1
      end
    end
  end
  return count
end

function Harras()
  if not Menu.Harras.useAAQ and CanCast(_Q) and Menu.Harras.useQ then
    local target = GetHentaiTarget(VARS.Q.RANGE)
    if target ~= nil then
      CastQ(target)
    end
  end
end

function Lasthit()
  if not Menu.Farm.Lasthit.lasthitQ  then return end
  if ((myHero.mana*100)/myHero.maxMana) <= Menu.Farm.Lasthit.lasthitQmana then return end 
  for _, minion in pairs(minionManager(MINION_ENEMY, VARS.Q.RANGE, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if ValidTarget(minion, VARS.Q.RANGE) and minion.visible and not minion.dead then
      local QDmg = GetQDamage(minion)
      if QDmg >= minion.health then
        CastSpell(_Q, minion)
      end
    end
  end
end

function Killsteal()
  if not Menu.KS.ksQ and not Menu.KS.ksE and not Menu.KS.ksR and not Menu.KS.ksIgnite then return end
  for i,enemy in pairs(GetEnemyHeroes()) do
    if Menu.KS.ksQ and ValidTarget(enemy, VARS.Q.RANGE) and not CheckInvul(enemy) then
      local QDmg = GetQDamage(enemy)
      if QDmg >= enemy.health then
        CastQ(enemy)
      end
    end
    if isValid(enemy, 700) and not CheckInvul(enemy) then
      if GetRastoyanie(myHero, enemy) <= 550 then
        if BOTRK and Menu.KS.UseItems then
          local BOTRKDamage = GetBOTRKDamage(enemy)
          if BOTRKDamage >= enemy.health and CanCast(BOTRKSLOT) and not enemy.dead then
            CastBOTRK(enemy)
          end
        end
        if CUTLASS and Menu.KS.UseItems then
          local CutlassDamage = GetCutlassDamage(enemy)
          if CutlassDamage >= enemy.health and CanCast(CUTLASSSLOT) and not enemy.dead then
            CastCutlass(enemy)
          end
        end
      end
      if GetRastoyanie(myHero, enemy) <= 700 then
        if GUNBLADE and Menu.KS.UseItems then
          local GunbladeDamage = GetGunbladeDamage(enemy)
          if GunbladeDamage >= enemy.health and CanCast(GUNBLADESLOT) and not enemy.dead then
            CastGunblade(enemy)
          end
        end
      end
    end
  end
end

function Teeto_ProcessAttack(unit, spell)
  if not unit.isMe then return end
  local reseted = false
  if isAutoAttack(spell.name) and spell.target and spell.target.type == myHero.type and Menu.Key.combo then
    local AADmg = myHero:CalcDamage(spell.target, myHero.totalDamage)
    CastYoumu()
    CastBOTRK(spell.target)
    CastCutlass(spell.target)
    CastGunblade(spell.target)
    if CanCast(_Q) and not spell.target.dead and not (spell.target.type == "obj_AI_Turret") and not reseted then
      if CanCast(_Q) and Menu.Combo.useQ and isWhitelisted(spell.target) then
        CastQ(spell.target)
        if SAC then
          _G.AutoCarry.Orbwalker:ResetAttackTimer()
        end
        if WOLFY then
          _G.NebelwolfisOrbWalker:ResetAA()
        end
        if PEW then
          _Pewalk.AllowAttack(false)
          _Pewalk.AllowMove(false)
          myHero:Attack(spell.target)
          DelayAction(function()
            _Pewalk.AllowAttack(true)
            _Pewalk.AllowMove(true)
          end, 0.1)
        end
        if MMA then
          _G.MMA_ResetAutoAttack()
        end
        reseted = true
      end
    end
  end
  if isAutoAttack(spell.name) and spell.target and spell.target.type == myHero.type and Menu.Key.harras then
    local AADmg = myHero:CalcDamage(spell.target, myHero.totalDamage)
    if CanCast(_Q) and not spell.target.dead and not (spell.target.type == "obj_AI_Turret") and not reseted then
      if CanCast(_Q) and Menu.Harras.useQ and isWhitelisted(spell.target) then
        CastQ(spell.target)
        if SAC then
          _G.AutoCarry.Orbwalker:ResetAttackTimer()
        end
        if WOLFY then
          _G.NebelwolfisOrbWalker:ResetAA()
        end
        if PEW then
          _Pewalk.AllowAttack(false)
          _Pewalk.AllowMove(false)
          myHero:Attack(spell.target)
          DelayAction(function()
            _Pewalk.AllowAttack(true)
            _Pewalk.AllowMove(true)
          end, 0.1)
        end
        if MMA then
          _G.MMA_ResetAutoAttack()
        end
        reseted = true
      end
    end
  end
end

function isAutoAttack(name)
  local lName = string.lower(name)
  return (string.find(lName, "attack") and not table.contains(NoAttacks,lName)) or table.contains(Attacks,lName)
end

function FindItems()
  if (Menu.Item.AttackItem.UseBOTRK) then
    GetBOTRK()
  end
  if (Menu.Item.AttackItem.UseCutlass) then
    GetCutlass()
  end
  if (Menu.Item.AttackItem.UseYoumu) then
    GetYoumu()
  end
  if (Menu.Item.AttackItem.UseGunblade) then
    GetGunblade()
  end
  if (Menu.Item.DefItem.UseQSS) then
    GetQSS()
  end
  if (Menu.Item.DefItem.UseDervish) then
    GetDervish()
  end
end

function GetCutlass()
  local slot = GetItem(ATTACKITEMS[1])
  if (slot ~= nil) then
    CUTLASS = true
    CUTLASSSLOT = slot
  else
    CUTLASS = false
  end
end

function GetYoumu()
  local slot = GetItem(ATTACKITEMS[2])
  if (slot ~= nil) then
    YOUMU = true
    YOUMUSLOT = slot
  else
    YOUMU = false
  end
end

function GetGunblade()
  local slot = GetItem(ATTACKITEMS[3])
  if (slot ~= nil) then
    GUNBLADE = true
    GUNBLADESLOT = slot
  else
    GUNBLADE = false
  end
end

function GetBOTRK()
  local slot = GetItem(ATTACKITEMS[4])
  if (slot ~= nil) then
    BOTRK = true
    BOTRKSLOT = slot
  else
    BOTRK = false
  end
end

function GetQSS()
  local slot = GetItem(ANTICCITEMS[1])
  if (slot ~= nil) then
    QSS = true
    QSSSLOT = slot
  else
    QSS = false
  end
end

function GetDervish()
  local slot = GetItem(ANTICCITEMS[2])
  if (slot ~= nil) then
    DERVISH = true
    DERVISHSLOT = slot
  else
    DERVISH = false
  end
end

function CastYoumu()
  if YOUMU then
    if (CanCast(YOUMUSLOT)) then
      CastSpell(YOUMUSLOT)
    end
  end
end

function CastBOTRK(target)
  if BOTRK then
    if (CanCast(BOTRKSLOT)) then
      CastSpell(BOTRKSLOT, target)
    end
  end
end

function CastCutlass(target)
  if CUTLASS then
    if (CanCast(CUTLASSSLOT)) then
      CastSpell(CUTLASSSLOT, target)
    end
  end
end

function CastGunblade(target)
  if GUNBLADE then
    if (CanCast(GUNBLADESLOT)) then
      CastSpell(GUNBLADESLOT, target)
    end
  end
end

function CastQSS()
  if QSS then
    if CanCast(QSSSLOT) then
      CastSpell(QSSSLOT)
    end
  end
end

function CastDervish()
  if DERVISH then
    if CanCast(DERVISHSLOT) then
      CastSpell(DERVISHSLOT)
    end
  end
end

function GetBOTRKDamage(unit)
  local Dmg = myHero:CalcDamage(unit, unit.maxHealth*0.1)
  return Dmg
end

function GetCutlassDamage(unit)
  local Dmg = myHero:CalcMagicDamage(unit, 100)
  return Dmg
end

function GetGunbladeDamage(unit)
  local Dmg = myHero:CalcMagicDamage(unit, 150+myHero.ap*0.4)
  return Dmg
end


local invul = {"undyingrage", "sionpassivezombie", "aatroxpassivedeath", "chronoshift", "judicatorintervention"}

function CheckInvul(unit)
  for i,buff in pairs(invul) do
    if TargetHaveBuff(buff, unit) then
      return true
    end
  end
    return false
end

function DrawSelectedTarget()
  if not Menu.Combo.focus then return end
  local target = GetTarget()
  if target == nil then return end
  if (target ~= nil and target.type == myHero.type and target.team ~= myHero.team) then
    DrawFPSCircle(target.x, target.z, 150, ARGB(255,255,0,0), 4)
    local posMinion = WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
    DrawText("FOCUS!", 20, posMinion.x, posMinion.y, ARGB(255,255,0,0))
  end
end

function GetHentaiTarget(range)
  local selectedTarget = GetTarget()
  local hentaiTarget = nil
  local lessCast = 0
  for i = 1, #GetEnemyHeroes() do
    local enemy = GetEnemyHeroes()[i]
    if isValid(enemy, range) and not CheckInvul(enemy) then
      local kArmor = (100+enemy.armor)/100
      local kKillable = kArmor*enemy.health
      if kKillable <= lessCast or lessCast == 0 then
        hentaiTarget = enemy
        lessCast = kKillable
      end
    end
  end
  return hentaiTarget
end

function isValid(object, range)
  return object ~= nil and object.valid and object.visible and not object.dead and object.bInvulnerable == 0
   and object.bTargetable and (range == nil or GetRastoyanie(object, myHero) <= range)
end

function isWhitelisted(enemy)
  local index = whitelistIndex(enemy)
  if index == 1 then
    if Menu.Combo.whitelist.a1 then
      return true
    else
      return false
    end
  end
  if index == 2 then
    if Menu.Combo.whitelist.a2 then
      return true
    else
      return false
    end
  end
  if index == 3 then
    if Menu.Combo.whitelist.a3 then
      return true
    else
      return false
    end
  end
  if index == 4 then
    if Menu.Combo.whitelist.a4 then
      return true
    else
      return false
    end
  end
  if index == 5 then
    if Menu.Combo.whitelist.a5 then
      return true
    else
      return false
    end
  end
end

function whitelistIndex(enemy)
  for i = 1, #YOLO do
    if enemy.charName == YOLO[i] then
      return i
    end
  end
end

function AutoIgnite()
  if igniteslot == nil then return end
  for i,enemy in pairs(GetEnemyHeroes()) do
    if not enemy.dead and enemy.visible then
      local rastoyanie = math.sqrt((enemy.x-myHero.x)*(enemy.x-myHero.x) + (enemy.z-myHero.z)*(enemy.z-myHero.z))
      if rastoyanie <= 600 then
        if ((50 + (20*myHero.level)) >= enemy.health and igniteslot ~= nil and myHero:CanUseSpell(igniteslot) == READY and
          ValidTarget(enemy, 600)) then 
          CastSpell(igniteslot, enemy)
        end
      end
    end
  end
end

function AutoPotion()
  for i=1, 5 do
    local pot = GetItem(POTS[i])
    if (pot ~= nil) then
      if (((myHero.health*100)/myHero.maxHealth) <= Menu.Auto.autoPotsHealth and not REGEN) then
        CastSpell(pot)
      end
    end
  end
end

function OnProcessSpell(unit, spell)
  if unit and spell and CanCast(_R) and Menu.Auto.autoShroom then
    if unit.team ~= myHero.team and FAGGOTS[spell.name] ~= nil then
      if FAGGOTS[spell.name] == 1 and spell.target.isMe then
        CastSpell(_R, myHero.x, myHero.z)
      end
      if FAGGOTS[spell.name] == 2 and spell.endPos ~= nil then
        local rastoyanie = GetRastoyanie(myHero, spell.endPos)
        if rastoyanie <= 250 and rastoyanie > 100 then
          local a = (myHero.x - spell.endPos.x)/rastoyanie * 50 + spell.endPos.x
          local b = (myHero.z - spell.endPos.z)/rastoyanie * 50 + spell.endPos.z
          CastSpell(_R, a, b)
        end
        if rastoyanie <= 100 then
          CastSpell(_R, endPos.x, endPos.z)
        end
      end
    end
  end
end

function GetQDamage(unit)
  local Qlvl = myHero:GetSpellData(_Q).level
  if Qlvl < 1 then return 0 end
  local QDmg = {80, 125, 170, 215, 260}
  local QDmgMod = 0.8
  local DmgRaw = QDmg[Qlvl] + myHero.ap * QDmgMod
  local Dmg = myHero:CalcMagicDamage(unit, DmgRaw)
  return Dmg
end

function GetEDamage(unit)
  local Elvl = myHero:GetSpellData(_E).level
  if Elvl < 1 then return 0 end
  local EDmg = {24, 48, 72, 96, 120}
  local EDmgMod = 0.4
  local DmgRaw = EDmg[Elvl] + myHero.ap * EDmgMod
  local Dmg = myHero:CalcMagicDamage(unit, DmgRaw)
  return Dmg
end

function CastQ(unit)
  CastSpell(_Q, unit)
end

function CastW()
  CastSpell(_W)
end

function Buff_Add(unit, target, buff)
  for j = 1, #CCSPELLS do
    if target then
      if target.isMe and buff.name == CCSPELLS[j] then
        UNDERCC = true
      end
    end
  end
  for i=1, 5 do
    if (buff.name == POTS[i] and unit.isMe) then
      REGEN = true
    end
  end
end

function Buff_Rem(unit, buff)
  for j = 1, #CCSPELLS do
    if unit.isMe and buff.name == CCSPELLS[j] then
      UNDERCC = false
    end
  end
  for i=1, 5 do
    if (buff.name == POTS[i] and unit.isMe) then
      REGEN = false
    end
  end
end

function FindSlotByName(name)
  if name ~= nil then
    for i=0, 12 do
      if string.lower(myHero:GetSpellData(i).name) == string.lower(name) then
        return i
      end
    end
  end  
  return nil
end

function GetItem(name)
  local slot = FindSlotByName(name)
  return slot 
end

function DrawLineA(x1, y1, x2, y2, color)
  DrawLine(x1, y1, x2, y2, 1, color)
end

function DrawFPSCircle(xCoordinate, zCoordinate, radius, color, quality)
  DrawCircle3D(xCoordinate, myHero.y, zCoordinate, radius, 2, color, quality)
end

function GetHPBarPos(enemy)
  enemy.barData = {PercentageOffset = {x = -0.05, y = 0}}
  local barPos = GetUnitHPBarPos(enemy)
  local barPosOffset = GetUnitHPBarOffset(enemy)
  local barOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
  local barPosPercentageOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
  local BarPosOffsetX = -50
  local BarPosOffsetY = 46
  local CorrectionY = 39
  local StartHpPos = 31 
  barPos.x = math.floor(barPos.x + (barPosOffset.x - 0.5 + barPosPercentageOffset.x) * BarPosOffsetX + StartHpPos)
  barPos.y = math.floor(barPos.y + (barPosOffset.y - 0.5 + barPosPercentageOffset.y) * BarPosOffsetY + CorrectionY)
  local StartPos = Vector(barPos.x , barPos.y, 0)
  local EndPos = Vector(barPos.x + 108 , barPos.y , 0)    
  return Vector(StartPos.x, StartPos.y, 0), Vector(EndPos.x, EndPos.y, 0)
end

function DrawLineHPBar(damage, text, unit, enemyteam)
  if unit.dead or not unit.visible then return end
  local p = WorldToScreen(D3DXVECTOR3(unit.x, unit.y, unit.z))
  if not OnScreen(p.x, p.y) then return end
  local thedmg = 0
  local line = 2
  local linePosA  = {x = 0, y = 0 }
  local linePosB  = {x = 0, y = 0 }
  local TextPos   = {x = 0, y = 0 }

  if damage >= unit.health then
    thedmg = unit.health - 1
    text = "KILLABLE!"
  else
    thedmg = damage
    text = "Possible Damage"
  end

  thedmg = math.round(thedmg)

  local StartPos, EndPos = GetHPBarPos(unit)
  local Real_X = StartPos.x + 24
  local Offs_X = (Real_X + ((unit.health - thedmg) / unit.maxHealth) * (EndPos.x - StartPos.x - 2))
  if Offs_X < Real_X then Offs_X = Real_X end 
  local mytrans = 350 - math.round(255*((unit.health-thedmg)/unit.maxHealth))
  if mytrans >= 255 then mytrans=254 end
  local my_bluepart = math.round(400*((unit.health-thedmg)/unit.maxHealth))
  if my_bluepart >= 255 then my_bluepart=254 end

  if enemyteam then
    linePosA.x = Offs_X-150
    linePosA.y = (StartPos.y-(30+(line*15)))    
    linePosB.x = Offs_X-150
    linePosB.y = (StartPos.y-10)
    TextPos.x = Offs_X-148
    TextPos.y = (StartPos.y-(30+(line*15)))
  else
    linePosA.x = Offs_X-125
    linePosA.y = (StartPos.y-(30+(line*15)))    
    linePosB.x = Offs_X-125
    linePosB.y = (StartPos.y-15)

    TextPos.x = Offs_X-122
    TextPos.y = (StartPos.y-(30+(line*15)))
  end

  DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y , 2, ARGB(mytrans, 255, my_bluepart, 0))
  DrawText(tostring(thedmg).." "..tostring(text), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
end

function GetRastoyanie(a, b)
  local rastoyanie = math.sqrt((b.x-a.x)*(b.x-a.x) + (b.z-a.z)*(b.z-a.z))
  return rastoyanie
end

function CanCast(spell)
  return myHero:CanUseSpell(spell) == READY
end

function CheckFountain()
  if not GetGame().map.index == 15 then return end
  if myHero.team == 100 then
    local rastoyanieDown = math.sqrt((myHero.x-lowBase.x)*(myHero.x-lowBase.x) + (myHero.z-lowBase.z)*(myHero.z-lowBase.z))
    if rastoyanieDown < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  elseif myHero.team == 200 then
    local rastoyanieUp = math.sqrt((myHero.x-upBase.x)*(myHero.x-upBase.x) + (myHero.z-upBase.z)*(myHero.z-upBase.z))
    if rastoyanieUp < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  end
end

class 'KatarinaUpdate'
  
function KatarinaUpdate:__init(LocalVersion, Host, VersionPath, ScriptPath, SavePath, CallbackUpdate, CallbackNoUpdate, CallbackNewVersion, CallbackError) 
  self.LocalVersion = LocalVersion
  self.Host = Host
  self.VersionPath = '/BoL/TCPUpdater/GetScript5.php?script='..self:Base64Encode(self.Host..VersionPath)..'&rand='..math.random(99999999)
  self.ScriptPath = '/BoL/TCPUpdater/GetScript5.php?script='..self:Base64Encode(self.Host..ScriptPath)..'&rand='..math.random(99999999)
  self.SavePath = SavePath
  self.CallbackUpdate = CallbackUpdate
  self.CallbackNoUpdate = CallbackNoUpdate
  self.CallbackNewVersion = CallbackNewVersion
  self.CallbackError = CallbackError
  self:CreateSocket(self.VersionPath)
  self.DownloadStatus = 'Connect to Server for VersionInfo'
  AddTickCallback(function() self:GetOnlineVersion() end)
end

function KatarinaUpdate:OnDraw()
  local bP = {['x1'] = WINDOW_W - (WINDOW_W - 390),['x2'] = WINDOW_W - (WINDOW_W - 20),['y1'] = WINDOW_H / 2,['y2'] = (WINDOW_H / 2) + 20,}
  local text = 'Download Status: '..(self.DownloadStatus or 'Unknown')
  DrawLine(bP.x1, bP.y1 + 10, bP.x2,  bP.y1 + 10, 18, ARGB(0x7D,0xE1,0xE1,0xE1))
  local xOff
  if self.File and self.Size then
    local c = math.round(100/self.Size*self.File:len(),2)/100
    xOff = c < 1 and math.ceil(370 * c) or 370
  else
    xOff = 0
  end
  DrawLine(bP.x2 + xOff, bP.y1 + 10, bP.x2, bP.y1 + 10, 18, ARGB(255, 5, 117, 1))
  DrawLines2({D3DXVECTOR2(bP.x1, bP.y1),D3DXVECTOR2(bP.x2, bP.y1),D3DXVECTOR2(bP.x2, bP.y2),D3DXVECTOR2(bP.x1, bP.y2),D3DXVECTOR2(bP.x1, bP.y1),}, 3, ARGB(255, 86, 6, 62))
  DrawText(text, 16, WINDOW_W - (WINDOW_W - 205) - (GetTextArea(text, 16).x / 2), bP.y1 + 2, ARGB(255, 8, 224, 52))
end

function KatarinaUpdate:CreateSocket(url)
    if not self.LuaSocket then
        self.LuaSocket = require("socket")
    else
        self.Socket:close()
        self.Socket = nil
        self.Size = nil
        self.RecvStarted = false
    end
    self.LuaSocket = require("socket")
    self.Socket = self.LuaSocket.tcp()
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')
    self.Socket:connect('sx-bol.eu', 80)
    self.Url = url
    self.Started = false
    self.LastPrint = ""
    self.File = ""
end

function KatarinaUpdate:Base64Encode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function KatarinaUpdate:GetOnlineVersion()
    if self.GotScriptVersion then return end

    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading VersionInfo (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</s'..'ize>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading VersionInfo ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading VersionInfo (100%)'
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.File:find('<scr'..'ipt>')
        local ContentEnd, _ = self.File:find('</scr'..'ipt>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
                self.CallbackError()
            end
        else
            self.OnlineVersion = (Base64Decode(self.File:sub(ContentStart + 1,ContentEnd-1)))
            self.OnlineVersion = tonumber(self.OnlineVersion)
            if self.OnlineVersion and self.OnlineVersion > LocalVersion then
                if self.CallbackNewVersion and type(self.CallbackNewVersion) == 'function' then
                    self.CallbackNewVersion(self.OnlineVersion,self.LocalVersion)
                end
        if not Menu.update then return end
        AddDrawCallback(function() self:OnDraw() end)
                self:CreateSocket(self.ScriptPath)
                self.DownloadStatus = 'Connect to Server for ScriptDownload'
                AddTickCallback(function() self:DownloadUpdate() end)
            else
                if self.CallbackNoUpdate and type(self.CallbackNoUpdate) == 'function' then
                    self.CallbackNoUpdate(self.LocalVersion)
                end
            end
        end
        self.GotScriptVersion = true
    end
end

function KatarinaUpdate:DownloadUpdate()
    if self.GotScriptUpdate then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Status == 'timeout' and not self.Started then
        self.Started = true
        self.Socket:send("GET "..self.Url.." HTTP/1.1\r\nHost: sx-bol.eu\r\n\r\n")
    end
    if (self.Receive or (#self.Snipped > 0)) and not self.RecvStarted then
        self.RecvStarted = true
        self.DownloadStatus = 'Downloading Script (0%)'
    end

    self.File = self.File .. (self.Receive or self.Snipped)
    if self.File:find('</si'..'ze>') then
        if not self.Size then
            self.Size = tonumber(self.File:sub(self.File:find('<si'..'ze>')+6,self.File:find('</si'..'ze>')-1))
        end
        if self.File:find('<scr'..'ipt>') then
            local _,ScriptFind = self.File:find('<scr'..'ipt>')
            local ScriptEnd = self.File:find('</scr'..'ipt>')
            if ScriptEnd then ScriptEnd = ScriptEnd - 1 end
            local DownloadedSize = self.File:sub(ScriptFind+1,ScriptEnd or -1):len()
            self.DownloadStatus = 'Downloading Script ('..math.round(100/self.Size*DownloadedSize,2)..'%)'
        end
    end
    if self.File:find('</scr'..'ipt>') then
        self.DownloadStatus = 'Downloading Script (100%)'
        local a,b = self.File:find('\r\n\r\n')
        self.File = self.File:sub(a,-1)
        self.NewFile = ''
        for line,content in ipairs(self.File:split('\n')) do
            if content:len() > 5 then
                self.NewFile = self.NewFile .. content
            end
        end
        local HeaderEnd, ContentStart = self.NewFile:find('<scr'..'ipt>')
        local ContentEnd, _ = self.NewFile:find('</scr'..'ipt>')
        if not ContentStart or not ContentEnd then
            if self.CallbackError and type(self.CallbackError) == 'function' then
        print('Error1')
        self.CallbackError()
            end
        else
            local newf = self.NewFile:sub(ContentStart+1,ContentEnd-1)
            local newf = newf:gsub('\r','')
            if newf:len() ~= self.Size then
                if self.CallbackError and type(self.CallbackError) == 'function' then
          print('Error2')
                    self.CallbackError()
                end
                return
            end
            local newf = Base64Decode(newf)
            if not self.isSprite and type(load(newf)) ~= 'function' then
                if self.CallbackError and type(self.CallbackError) == 'function' then
          print('Error2')
                    self.CallbackError()
                end
            else
                local f = io.open(self.SavePath,"w+b")
        if f then
          f:write(newf)
          f:close()
          if self.CallbackUpdate and type(self.CallbackUpdate) == 'function' then
            self.CallbackUpdate(self.OnlineVersion,self.LocalVersion)
          end
        end
            end
        end
        self.GotScriptUpdate = true
    end
end

class "SxWebResulter"

function SxWebResulter:__init(Host, Path, cbComplete, cbError)
    self.Host = Host
    self.Path = Path
    self.Callback = cbComplete
  self.Error = cbError
    self.LuaSocket = require("socket")

    self.Socket = self.LuaSocket.connect(Host, 80)
    self.Socket:send("GET "..self.Path.." HTTP/1.0\r\nHost: "..Host.."\r\n\r\n")
    self.Socket:settimeout(0, 'b')
    self.Socket:settimeout(99999999, 't')

    self.LastPrint = ""
    self.File = ""
    AddDrawCallback(function() self:GetResult() end)
end

function SxWebResulter:GetResult()
    if self.Status == 'closed' then return end
    self.Receive, self.Status, self.Snipped = self.Socket:receive(1024)
    if self.Receive then
        if self.LastPrint ~= self.Receive then
            self.LastPrint = self.Receive
            self.File = self.File .. self.Receive
        end
    end

    if self.Snipped ~= "" and self.Snipped then
        self.File = self.File .. self.Snipped
    end
    if self.Status == 'closed' then
        local HeaderEnd, ContentStart = self.File:find('\r\n\r\n')
        if HeaderEnd and ContentStart then
            self.Callback(self.File:sub(ContentStart + 1))
        else
            self.Error()
        end
    end
end
