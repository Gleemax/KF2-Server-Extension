Class Ext_TraitWPGuns extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="枪手初始武器"
	Description="使你重生时携带特定枪手职业武器。|Level 1: M1911手枪|Level 2: 沙漠之鹰|Level 3: 马格南左轮|Level 4: 全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Pistol_DualColt1911'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Pistol_DualDeagle'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Revolver_DualSW500'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Pistol_DualColt1911',class'KFWeap_Pistol_DualDeagle',class'KFWeap_Revolver_DualSW500'))
}