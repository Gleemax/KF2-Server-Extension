Class UIP_AdminMenu extends KFGUI_MultiComponent;

var KFGUI_ColumnList PlayersList;
var editinline export KFGUI_RightClickMenu PlayerContext;
var int SelectedID;

function InitMenu()
{
	PlayersList = KFGUI_ColumnList(FindComponentID('Players'));
	Super.InitMenu();
}
function ShowMenu()
{
	Super.ShowMenu();
	SetTimer(2,true);
	Timer();
}
function CloseMenu()
{
	Super.CloseMenu();
	SetTimer(0,false);
}

function Timer()
{
	class'UIP_PlayerSpecs'.Static.UpdatePlayerList(PlayersList,GetPlayer().WorldInfo.GRI);
}

function SelectedRow( KFGUI_ListItem Item, int Row, bool bRight, bool bDblClick )
{
	if( bRight || bDblClick )
	{
		PlayerContext.ItemRows[0].Text = ""$Item.Columns[0];
		SelectedID = Item.Value;
		PlayerContext.OpenMenu(Self);
	}
}
function SelectedRCItem( int Index )
{
	if( Index>0 && !PlayerContext.ItemRows[Index].bSplitter )
	{
		if( PlayerContext.ItemRows[Index].Value>=0 )
			ExtPlayerController(GetPlayer()).AdminRPGHandle(SelectedID,PlayerContext.ItemRows[Index].Value);
		else UI_AdminPerkLevel(Owner.OpenMenu(class'UI_AdminPerkLevel')).InitPage(SelectedID,-PlayerContext.ItemRows[Index].Value);
	}
}
function ButtonClicked( KFGUI_Button Sender )
{
	switch( Sender.ID )
	{
	case 'MOTD':
		Owner.OpenMenu(class'UI_AdminMOTD');
		break;
	}
}

defaultproperties
{
	Begin Object Class=KFGUI_RightClickMenu Name=PlayerContextMenu
		ItemRows.Add((Text="",Value=-1))
		ItemRows.Add((Text="��ʾ������Ϣ",Value=9))
		ItemRows.Add((bSplitter=true))
		ItemRows.Add((Text="���� 1000 ����",Value=2))
		ItemRows.Add((Text="���� 10000 ����",Value=3))
		ItemRows.Add((Text="����ְҵ�ȼ�",Value=4))
		ItemRows.Add((Text="����ְҵ�ȼ�",Value=-1))
		ItemRows.Add((Text="����ת���ȼ�",Value=-2))
		ItemRows.Add((bSplitter=true))
		ItemRows.Add((Text="������������",Value=5))
		ItemRows.Add((Text="�������м���",Value=6))
		ItemRows.Add((bSplitter=true))
		ItemRows.Add((Text="�Ƴ� 1000 ����",Value=7))
		ItemRows.Add((Text="�Ƴ� 10000 ����",Value=8))
		ItemRows.Add((bSplitter=true))
		ItemRows.Add((Text="��������״̬",Value=0))
		ItemRows.Add((Text="���õ�ǰ״̬",Value=1))
		OnSelectedItem=SelectedRCItem
	End Object
	PlayerContext=PlayerContextMenu
	
	Begin Object Class=KFGUI_Button Name=EditMOTDButton
		ID="MOTD"
		ButtonText="�༭ÿ����Ϣ"
		Tooltip="�༭��������ÿ����Ϣ"
		XPosition=0.2
		YPosition=0.997
		XSize=0.1
		YSize=0.03
		OnClickLeft=ButtonClicked
		OnClickRight=ButtonClicked
	End Object
	Components.Add(EditMOTDButton)
	
	Begin Object Class=KFGUI_ColumnList Name=PlayerList
		ID="Players"
		XPosition=0.05
		YPosition=0.05
		XSize=0.9
		YSize=0.92
		Columns.Add((Text="���",Width=0.55))
		Columns.Add((Text="��ɱ",Width=0.15))
		Columns.Add((Text="����",Width=0.15))
		Columns.Add((Text="��Ϸʱ��",Width=0.15))
		OnSelectedRow=SelectedRow
	End Object
	Components.Add(PlayerList)
}