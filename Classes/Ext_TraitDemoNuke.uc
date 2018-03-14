Class Ext_TraitDemoNuke extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|天赋需要转生等级： #{FF4000}3";
	return S;
}

static function bool MeetsRequirements( byte Lvl, Ext_PerkBase Perk )
{
	local int i;

	if( Perk.CurrentLevel<Default.MinLevel || Perk.CurrentPrestige<2 )
		return false;
	
	if( Lvl==0 )
	{
		i = Perk.PerkStats.Find('StatType','Damage');
		if( i>=0 )
			return (Perk.PerkStats[i].CurrentValue>=30);
	}
	
	return true;
}

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local ExtPlayerReplicationInfo MyPRI;
	
	MyPRI = ExtPlayerReplicationInfo(Perk.PlayerOwner.PlayerReplicationInfo);
	if( MyPRI == None || Ext_PerkDemolition(Perk) == None )
		return;
	
	MyPRI.bNukeActive = true;
	Ext_PerkDemolition(Perk).NukeDamageMult = 1.0 + (((float(Level) - 1.f) * 5.f) / 100.f);
}

static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local ExtPlayerReplicationInfo MyPRI;
	
	MyPRI = ExtPlayerReplicationInfo(Perk.PlayerOwner.PlayerReplicationInfo);
	if( MyPRI == None || Ext_PerkDemolition(Perk) == None )
		return;
	
	MyPRI.bNukeActive = false;
	Ext_PerkDemolition(Perk).NukeDamageMult = 1.0;
}

defaultproperties
{
	SupportedPerk=class'Ext_PerkDemolition'
	TraitGroup=class'Ext_TGroupZEDTime'
	TraitName="丧尸时间 - 核爆"
	NumLevels=4
	DefLevelCosts(0)=100
	DefLevelCosts(1)=150
	DefLevelCosts(2)=200
	DefLevelCosts(3)=250
	DefMinLevel=100
	Description="爆破武器将会在丧尸时间中制造核爆。|每等级增加核爆的威力和辐射的持续时间。||-需求：拥有至少30点职业伤害属性"
}