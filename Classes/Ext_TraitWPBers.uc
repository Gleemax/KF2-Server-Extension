Class Ext_TraitWPBers extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="狂战初始武器"
	Description="使你重生时携带特定狂战士职业武器。|Level 1: 粉碎机|Level 2: 钉枪|Level 3: |Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Blunt_Pulverizer'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Shotgun_Nailgun'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Eviscerator'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Blunt_Pulverizer',class'KFWeap_Shotgun_Nailgun',class'KFWeap_Eviscerator'))
}