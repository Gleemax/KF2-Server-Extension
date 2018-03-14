Class Ext_TraitFireRange extends Ext_TraitBase;

static function TraitActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	KFPlayerReplicationInfo(Perk.PlayerOwner.PlayerReplicationInfo).bExtraFireRange = true;
}
static function TraitDeActivate( Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	KFPlayerReplicationInfo(Perk.PlayerOwner.PlayerReplicationInfo).bExtraFireRange = false;
}

defaultproperties
{
	TraitName="»ğÑæÑÓÉì"
	DefLevelCosts(0)=35
	Description="ÎªÄãµÄ»ğÑæÅçÉäÆ÷Ôö¼Ó¶îÍâµÄ»ğÑæÅçÉä¾àÀë¡£"
}