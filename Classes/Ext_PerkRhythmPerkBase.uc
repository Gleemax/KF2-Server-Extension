Class Ext_PerkRhythmPerkBase extends Ext_PerkBase;

var byte HeadShotComboCount,MaxRhythmCombo;
var float RhythmComboDmg,CountdownIntervall,HeadShotMultiplier;

simulated function ModifyDamageGiven( out int InDamage, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx )
{
	Super.ModifyDamageGiven(InDamage,DamageCauser,MyKFPM,DamageInstigator,DamageType,HitZoneIdx);

	if( HitZoneIdx == HZI_Head)
	{
		if( MaxRhythmCombo<=0 )
			return;

		if ( MyKFPM != none && MyKFPM.GetTeamNum()!=0 && MyKFPM.IsAliveAndWell() )
		{
			if( IsDamageTypeOnPerk(DamageType, BasePerk) )
				UpdateDmgScale(true);
		}

		if( RhythmComboDmg>0 && BasePerk==None || IsWeaponOnPerk(KFWeapon(DamageCauser)) || IsDamageTypeOnPerk(DamageType, BasePerk) )
		{
			InDamage *= (1.f+RhythmComboDmg);
		}
	}
	
}

final function SetMaxRhythm( byte MaxCombo )
{
	MaxRhythmCombo = MaxCombo;
}
final function SetIntervall( float Intervall )
{
	CountdownIntervall = Intervall;
}
final function SetMultiplier( float Multiplier )
{
	HeadShotMultiplier = Multiplier;
}
final function ResetRhythm()
{
	MaxRhythmCombo = 0;
	HeadShotComboCount = 0;
	CountdownIntervall = 0;
	HeadShotMultiplier = 0;
	RhythmComboDmg = 0;
	HeadShotMessage(0,true,1);
}
final function UpdateDmgScale( bool bUp )
{
	if( bUp )
	{
		HeadShotComboCount = Min(HeadShotComboCount+1,MaxRhythmCombo);
		HeadShotMessage(HeadShotComboCount,false,MaxRhythmCombo);
		SetTimer(CountdownIntervall,true,nameOf(ReduceDmgScale));
	}
	else if( HeadShotComboCount>0 )
	{
		--HeadShotComboCount;
		HeadShotMessage(HeadShotComboCount,true,MaxRhythmCombo);
	}
	RhythmComboDmg = FMin(HeadShotComboCount,MaxRhythmCombo)*HeadShotMultiplier;
}
final function ReduceDmgScale() 
{
	if (HeadShotComboCount>0)
	{
		UpdateDmgScale(false);
	}
	else
	{
		HeadShotComboCount=0;
		ClearTimer(nameOf(UpdateDmgScale));
	}
}
reliable client function HeadShotMessage( byte HeadShotNum, bool bMissed, byte MaxHits )
{
	local AkEvent TempAkEvent;
	local KFPlayerController PC;

	PC = KFPlayerController(PlayerOwner);
	if( PC==none || PC.MyGFxHUD==none )
	{
		return;
	}

	PC.MyGFxHUD.RhythmCounterWidget.SetInt("count", HeadShotNum);
	PC.MyGFxHUD.RhythmCounterWidget.SetBonusPercentage(float(HeadShotNum) / float(MaxHits));

	if( HeadshotNum==0 )
		TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset';
	else if( HeadShotNum<MaxHits )
	{
		if( !bMissed )
		{				
			//PC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShot');
			TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit';
		}
	}
	else if( !bMissed )
	{
		//PC.ClientSpawnCameraLensEffect(class'KFCameraLensEmit_RackemHeadShotPing');
		TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top';
		HeadshotNum = 6;
	}

	if( TempAkEvent != none )
		PC.PlayRMEffect( TempAkEvent, 'R_Method', HeadshotNum );
}

defaultproperties
{
}