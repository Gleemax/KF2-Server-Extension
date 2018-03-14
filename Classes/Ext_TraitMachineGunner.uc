Class Ext_TraitMachineGunner extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|天赋需要转生等级： #{FF4000}1";
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<1 )
		return false;
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).bUseMachineGunner = true;
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	Ext_PerkCommando(Perk).bUseMachineGunner = false;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkCommando'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 机枪手"
	NumLevels=1
	DefLevelCosts(0)=60
	DefMinLevel=55
	Description="在丧失时间中，你的职业武器会造成3%的额外伤害而且会以三倍射速射击！"
}