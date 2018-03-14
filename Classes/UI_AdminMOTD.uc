Class UI_AdminMOTD extends KFGUI_FloatingWindow;

var KFGUI_TextField NewsField;
var KFGUI_EditBox EditField;

function InitMenu()
{
	Super.InitMenu();

	// Client settings
	NewsField = KFGUI_TextField(FindComponentID('News'));
	EditField = KFGUI_EditBox(FindComponentID('Edit'));
	Timer();
}
function Timer()
{
	if( !ExtPlayerController(GetPlayer()).bMOTDReceived )
		SetTimer(0.2,false);
	else
	{
		EditField.Value = ExtPlayerController(GetPlayer()).ServerMOTD;
		MOTDEdited(EditField);
	}
}
function ButtonClicked( KFGUI_Button Sender )
{
	local string S;

	switch( Sender.ID )
	{
	case 'Yes':
		S = EditField.Value;
		while( Len(S)>510 )
		{
			ExtPlayerController(GetPlayer()).ServerSetMOTD(Left(S,500),false);
			S = Mid(S,500);
		}
		ExtPlayerController(GetPlayer()).ServerSetMOTD(S,true);
		DoClose();
		break;
	case 'No':
		DoClose();
		break;
	}
}
function MOTDEdited( KFGUI_EditBox Sender )
{
	NewsField.SetText("每日讯息预览:|"$Sender.Value);
}

defaultproperties
{
	WindowTitle="编辑每日信息"
	XPosition=0.25
	YPosition=0.2
	XSize=0.5
	YSize=0.6
	bAlwaysTop=true
	bOnlyThisFocus=true
	
	Begin Object Class=KFGUI_TextField Name=WarningLabel
		ID="News"
		XPosition=0.01
		YPosition=0.18
		XSize=0.98
		YSize=0.77
	End Object
	Begin Object Class=KFGUI_Button Name=YesButten
		ID="Yes"
		ButtonText="确认"
		Tooltip="保存修改"
		XPosition=0.4
		YPosition=0.9
		XSize=0.09
		YSize=0.04
		ExtravDir=1
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_Button Name=NoButten
		ID="No"
		ButtonText="取消"
		Tooltip="取消修改"
		XPosition=0.5
		YPosition=0.9
		XSize=0.09
		YSize=0.04
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Begin Object Class=KFGUI_EditBox Name=EditBox
		ID="Edit"
		Tooltip="在此处输入内容，使用竖线字符进行换行。"
		XPosition=0.05
		YPosition=0.09
		XSize=0.9
		YSize=0.08
		OnTextChange=MOTDEdited
	End Object
	
	Components.Add(WarningLabel)
	Components.Add(YesButten)
	Components.Add(NoButten)
	Components.Add(EditBox)
}