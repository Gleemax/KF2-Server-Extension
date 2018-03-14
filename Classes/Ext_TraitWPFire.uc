Class Ext_TraitWPFire extends Ext_TraitWeapons;

defaultproperties
{
	TraitName="纵火初始武器"
	Description="使你重生时携带特定纵火狂职业武器。|Level 1: 龙息霰弹枪|Level 2: 火焰喷射器|Level 3: 微波枪|Level 4: 以上全部3种"
	
	LevelEffects(0)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath'))
	LevelEffects(1)=(LoadoutClasses=(class'KFWeap_Flame_Flamethrower'))
	LevelEffects(2)=(LoadoutClasses=(class'KFWeap_Beam_Microwave'))
	LevelEffects(3)=(LoadoutClasses=(class'KFWeap_Shotgun_DragonsBreath',class'KFWeap_Flame_Flamethrower',class'KFWeap_Beam_Microwave'))
}