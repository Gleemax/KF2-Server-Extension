Class Ext_TraitWPSharp extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="神射初始武器"
	Description="使你重生时携带特定神射职业武器。|Level 1: 十字弩|Level 2: M14|Level 3: 轨道枪|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Bow_Crossbow'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Rifle_M14EBR'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Rifle_RailGun'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Bow_Crossbow',class'KFWeap_Rifle_M14EBR',class'KFWeap_Rifle_RailGun'))
}