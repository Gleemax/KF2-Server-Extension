Class Ext_PerkAbilityBase extends Ext_PerkBase;

var byte AbliityID,ActiveAbility;
var byte bEnabled[8],bIsCharged[8],bUber[8],bTimer[8];
var float Energy[8],EnergyNeeded[8],RechargeRate[8],TimeRemain[8];

var() Localized string NameStr;

replication
{
	// Things the server should send to the client.
	if ( true )
		AbliityID,bEnabled,bIsCharged,bUber,Energy,TimeRemain;
}

function Enabled( byte id, byte option )
{
    if( bEnabled[id] != option )
    {
        bEnabled[id] = option;

	    if( bEnabled[id]==1 )
        {
            if( bUber[id]==0 ) 
            {
                Recharge(id);
            } else
            {
                ImmediateRecharge(id);
            }
        } 
        else
        {
            bIsCharged[id] = 0;
            Energy[id] = EnergyNeeded[id];
        }
    }
}

final function RechargeTimer()
{
   // TODO
}

function Recharge( byte id )
{
    bTimer[id] = 1;
    bIsCharged[id] = 0;
    Energy[id] = EnergyNeeded[id];
}
function ImmediateRecharge( byte id )
{
    bTimer[id] = 1;
    bIsCharged[id] = 0;
    Energy[id] = 0;
}
function RechargePause( byte id )
{
    bTimer[id] = 0;
    bIsCharged[id] = 0;
}
function CoolDownContinue( byte id )
{
    bTimer[id] = 1;
}

function bool UseAbility( byte ID, bool isPassive, optional out string msg )
{
    if( default.AbliityID == ID )
    {
        if( isPassive )
        {
            // Passive Effect Fucntion
        } else
        {
            // Active Effect Function
        }
    }
    return false;
}

defaultproperties
{
    AbliityID=0
}