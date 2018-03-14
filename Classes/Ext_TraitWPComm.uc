Class Ext_TraitWPComm extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="突击初始武器"
	Description="使你重生时携带特定突击手职业武器。|Level 1: 小牛式步枪|Level 2: AK12|Level 3: SCAR|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Bullpup'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_AssaultRifle_AK12'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_AssaultRifle_SCAR'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_AssaultRifle_Bullpup',class'KFWeap_AssaultRifle_AK12',class'KFWeap_AssaultRifle_SCAR'))
}