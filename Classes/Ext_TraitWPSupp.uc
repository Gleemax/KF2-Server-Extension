Class Ext_TraitWPSupp extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="支援初始武器"
	Description="使你重生时携带特定支援职业武器。|Level 1: M4霰弹枪|Level 2: 双管霰弹枪|Level 3: AA12|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Shotgun_M4'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Shotgun_DoubleBarrel'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Shotgun_AA12'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Shotgun_M4',class'KFWeap_Shotgun_DoubleBarrel',class'KFWeap_Shotgun_AA12'))
}