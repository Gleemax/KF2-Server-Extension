Class Ext_PerkPendulumBase extends Ext_PerkBase;

var byte HeadShotMax,HeadShotCount,StackCount,StackMax;
var float StackInterval;
var KFPawn_Monster LKFPM;
var bool bCountingDown,bEnabledUI;

final function SetIntervall( float Intervall )
{
	StackInterval = Intervall;
}
final function SetMaxStack( byte MaxStack )
{
	StackMax = MaxStack;
}

final function EnableMetronome( bool bEnabled )
{
	if (!bEnabled) 
	{
		HeadShotCount = 0;
		StackCount = 0;
		StackMax = 0;
		bEnabledUI = false;
		StackInterval = 0;
		HeadShotMessage(0,true,1);
		ClearTimer(nameOf(AddStack));
	}
	else 
	{
		SetTimer(StackInterval,true,nameOf(AddStack));
	}
}
final function EnableUI( bool bEnabled )
{
	if (!bEnabled) 
	{
		bEnabledUI = false;
		HeadShotMessage(0,true,1);
	}
	else 
	{
		bEnabledUI = true;
		HeadShotMessage(HeadShotCount,true,HeadShotMax);
	}
	
}
final function UpdHeadshotCount( bool bHit )
{
	local KFGameInfo KFGI;
	if( bHit )
	{
		HeadShotCount = Max(HeadShotCount-1,0);
		if ( HeadShotCount == 0 )
		{
			KFGI = KFGameInfo(WorldInfo.Game);
			KFGI.DramaticEvent(1.0);
			if ( StackCount >= StackMax)
			{
				SetTimer(StackInterval,true,nameOf(AddStack));
				bCountingDown = true;
			}
			if ( --StackCount > 0 )
				HeadShotCount = HeadShotMax;
		}
	}
	else
	{
		HeadShotCount = HeadShotMax;
	}
	if ( bEnabledUI )
		HeadShotMessage(HeadShotCount,true,HeadShotMax);
}
final function AddStack()
{
	StackCount = Min(StackCount+1, StackMax);
	if( HeadShotCount <= 0 )
		UpdHeadshotCount(false);
	if( StackCount == StackMax )
	{
		ClearTimer(nameOf(AddStack));
		bCountingDown = false;
	}
}
function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit )
{
   	local int HitZoneIdx;
   	local KFPawn_Monster KFPM;
 	
	if( WorldInfo.TimeDilation<1.f || StackCount<=0 || HeadShotCount<=0 )
		return;
		
   	KFPM = KFPawn_Monster(Impact.HitActor);
   	if( KFPM==none || KFPM.GetTeamNum()==0 )
   		return;
	if ( KFPM != LKFPM )
	{
		UpdHeadshotCount(false);
		LKFPM = KFPM;
	}

   	HitZoneIdx = KFPM.HitZones.Find('ZoneName', Impact.HitInfo.BoneName);
   	if( HitZoneIdx == HZI_Head && KFPM.IsAliveAndWell() )
	{
		if( IsDamageTypeOnPerk(DamageType, BasePerk) )
			UpdHeadshotCount(true);
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
	bEnabledUI=false
	HeadShotMax=5
}