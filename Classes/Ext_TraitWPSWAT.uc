Class Ext_TraitWPSWAT extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="特警初始武器"
	Description="使你重生时携带特定特警职业武器。|Level 1: MP5冲锋枪|Level 2: P90冲锋枪|Level 3: Kriss冲锋枪|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_SMG_MP5RAS'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_SMG_P90'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_SMG_Kriss'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_SMG_MP5RAS',class'KFWeap_SMG_P90',class'KFWeap_SMG_Kriss'))
}