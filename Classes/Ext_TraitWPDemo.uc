Class Ext_TraitWPDemo extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="爆破初始武器"
	Description="使你重生时携带特定爆破手职业武器。|Level 1: C4|Level 2: M79榴弹发射器|Level 3: RPG火箭发射器|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Thrown_C4'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_GrenadeLauncher_M79'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_RocketLauncher_RPG7'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Thrown_C4',class'KFWeap_GrenadeLauncher_M79',class'KFWeap_RocketLauncher_RPG7'))
}