Class Ext_TraitUnCloak extends Ext_TraitBase;

var array<float> RadiusValues;

static function ApplyEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_UnCloakHelper H;
	
	H = Player.Spawn(class'Ext_T_UnCloakHelper',Player);
	if( H!=None )
		H.HandleRadius = Default.RadiusValues[Level-1];
}
static function CancelEffectOn( KFPawn_Human Player, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local Ext_T_UnCloakHelper H;

	foreach Player.ChildActors(class'Ext_T_UnCloakHelper',H)
		H.Destroy();
}

defaultproperties
{
	TraitName="“˛…Ì’Ï≤‚"
	NumLevels=5
	DefLevelCosts(0)=5
	DefLevelCosts(1)=7
	DefLevelCosts(2)=10
	DefLevelCosts(3)=15
	DefLevelCosts(4)=25
	Description="»√ƒ„ƒ‹πªÃΩ≤‚“˛…Ìµ–»À£¨ÃΩ≤‚æ‡¿ÎÀÊµ»º∂…œ…˝£∫|Lv1-5: 8m, 12m, 18m, 30m, 60m"
	RadiusValues.Add(800)
	RadiusValues.Add(1200)
	RadiusValues.Add(1800)
	RadiusValues.Add(3000)
	RadiusValues.Add(6000)
}