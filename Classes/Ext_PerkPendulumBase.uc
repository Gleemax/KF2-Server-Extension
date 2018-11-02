Class Ext_PerkPendulumBase extends Ext_PerkBase;

var byte StackInterval,HeadShotMax,HeadShotCount,StackCount,StackMax;
var int CooldownCount;
var KFPawn KFP;
var bool bCountingDown,bEnabledUI;

final function SetIntervall( byte Intervall )
{
	StackInterval = Intervall;
}
final function SetMaxStack( byte MaxStack )
{
	StackMax = MaxStack;
}

final function EnablePendulum( bool bEnabled )
{
	if( !bEnabled ) 
	{
		HeadShotCount = 0;
		StackCount = 0;
		StackMax = 0;
		bEnabledUI = false;
		StackInterval = 0;
		CooldownCount = 0;
		HeadShotMessage(0,true,1);
		ClearTimer(nameOf(CooldownTimer));
	}
	else 
	{
		bCountingDown = true;
		CooldownCount = StackInterval;
		SetTimer(1.0f,true,nameOf(CooldownTimer));
	}
}
final function EnableUI( bool bEnabled )
{
	if ( !bEnabled ) 
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
				bCountingDown = true;
				CooldownCount = StackInterval;
				SetTimer(1.0f,true,nameOf(CooldownTimer));
				
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
final function CooldownTimer()
{
	if( WorldInfo.TimeDilation<1.f )
		return;

	if( --CooldownCount<=0 )
	{
		StackCount = Min(StackCount+1, StackMax);
		if( StackCount == StackMax )
		{
			bCountingDown = false;
			CooldownCount = 0;
			ClearTimer(nameOf(CooldownTimer));
		}
		else
			CooldownCount = StackInterval;
		if( HeadShotCount <= 0 )
		UpdHeadshotCount(false);
	}
}
function UpdatePerkHeadShots( ImpactInfo Impact, class<DamageType> DamageType, int NumHit )
{
   	local int HitZoneIdx;
   	local KFPawn KFP;
 	
	if( WorldInfo.TimeDilation<1.f || StackCount<=0 || HeadShotCount<=0 )
		return;
		
   	KFP = KFPawn(Impact.HitActor);
   	if( KFP==none || (KFP.GetTeamNum()==0 && KFGameInfo(WorldInfo.Game).FriendlyFireScale<=0.f) )
   		return;
	if ( KFP != LKFP )
	{
		UpdHeadshotCount(false);
		LKFP = KFP;
	}

   	HitZoneIdx = KFP.HitZones.Find('ZoneName', Impact.HitInfo.BoneName);
   	if( HitZoneIdx == HZI_Head && KFP.IsAliveAndWell() )
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