Class UI_PrestigeNote extends UI_ResetWarning;

function SetupTo( Ext_PerkBase P )
{
	PerkToReset = P.Class;
	WindowTitle = "��ʾ: ת�� "$P.PerkName;
	InfoLabel.SetText("��ʾ: ��������ת�����㽫���ܳ������������|��ľ���͵ȼ�������Ϊ #{FF0000}0#{DEF}.|���������ÿ���������� #{F7FE2E}+"$P.PrestigeSPIncrease$"#{DEF} ������||��ȷ��Ҫ��������");
}

defaultproperties
{
	bIsPrestige=true

	Begin Object Name=YesButten
		Tooltip="ת����ְҵ���޷���������"
	End Object
}