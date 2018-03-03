Class Ext_PerkMetronomeBase extends Ext_PerkBase;

var byte HeadShotMax,HeadShotCount,ZTStackCount,ZTStackMax;
var float CountdownIntervall;
var KFPawn_Monster LKFPM;
var bool bCountingDown;

final function SetIntervall( float Intervall )
{
	CountdownIntervall = Intervall;
}
final function SetMaxStack( byte MaxStack )
{
	ZTStackMax = MaxStack;
}

final function EnableMetronome( bool bEnabled )
{
	if (!bEnabled) 
	{
		HeadShotMax = 0;
		HeadShotCount = 0;
		ZTStackCount = 0;
		ZTStackMax = 0;
		CountdownIntervall = 0;
		HeadShotMessage(0,true,1);
	}
	else 
		SetTimer(CountdownIntervall,true,nameOf(SetUpMetronome));
}
final function UpdateZedTimeCount( bool bHit )
{
	local KFGameInfo KFGI;
	if( bHit )
	{
		HeadShotCount = Max(HeadShotCount-1,0);
		if ( HeadShotCount <= 0 )
		{
			KFGI = KFGameInfo(WorldInfo.Game);
			KFGI.DramaticEvent(1.0);
			if ( --ZTStackCount > 0 )
				HeadShotCount = HeadShotMax;
			bCountingDown = true;
			SetTimer(CountdownIntervall,true,nameOf(SetUpMetronome));
		}
	}
	else
		HeadShotCount = HeadShotMax;
	HeadShotMessage(HeadShotCount,true,HeadShotMax);
}
final function SetUpMetronome()
{
	HeadShotMax = 5;
	ZTStackCount = ZTStackMax;
	UpdateZedTimeCount(false);
	ClearTimer(nameOf(SetUpMetronome));
	bCountingDown = false;
}
function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit )
{
   	local int HitZoneIdx;
   	local KFPawn_Monster KFPM;
 	
	if( ZTStackCount<=0 || HeadShotCount<=0 )
		return;
		
   	KFPM = KFPawn_Monster(Impact.HitActor);
   	if( KFPM==none || KFPM.GetTeamNum()==0 )
   		return;
	if ( KFPM != LKFPM )
	{
		UpdateZedTimeCount(false);
		LKFPM = KFPM;
	}

   	HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName);
   	if( HitZoneIdx == HZI_Head && KFPM.IsAliveAndWell() )
	{
		if( class<KFDamageType>(DamageType)!=None && class<KFDamageType>(DamageType).Default.ModifierPerkList.Find(BasePerk)>=0 )
			UpdateZedTimeCount(true);
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
	{
		TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Top';
		HeadshotNum = 6;
	}
	else if( HeadShotNum<MaxHits )
	{
		if( !bMissed )
		{				
			TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Hit';
		}
	}
	else if( bMissed )
		TempAkEvent = AkEvent'WW_UI_PlayerCharacter.Play_R_Method_Reset';

	if( TempAkEvent != none )
		PC.PlayRMEffect( TempAkEvent, 'R_Method', HeadshotNum );
}

defaultproperties
{
}