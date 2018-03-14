Class Ext_TraitRetali extends Ext_TraitBase;

static function bool PreventDeath( KFPawn_Human Player, Controller Instigator, Class<DamageType> DamType, Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data )
{
	local ExtProj_SUPERGrenade P;
	
	P = Player.Spawn(class'ExtProj_SUPERGrenade');
	if( P!=None )
	{
		P.bExplodeOnContact = false; // Nope!
		P.InstigatorController = Player.Controller;
		P.ClusterNades = class'ExtProj_CrackerGrenade';
	}
	return false;
}

defaultproperties
{
	TraitName="复仇"
	DefLevelCosts(0)=50
	DefMinLevel=40
	Description="用一次大爆炸来结束你光辉的一生！"
}