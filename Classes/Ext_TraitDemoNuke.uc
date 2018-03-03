Class Ext_TraitDemoNuke extends Ext_TraitBase;

static function string GetPerkDescription()
{
	local string S;

	S = Super.GetPerkDescription();
	S $= "|Trait requires prestige level: #{FF4000}3";
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
	TraitName="ZED Time - Nuke"
	NumLevels=4
	DefLevelCosts(0)=100
	DefLevelCosts(1)=150
	DefLevelCosts(2)=200
	DefLevelCosts(3)=250
	DefMinLevel=100
	Description="Demo weapons will spawn a nuke during ZED time. |Each level increases the damage & time of the nuke field. ||-REQUIREMENT: Damage bonus trait needs to have at least 30 points!"
}