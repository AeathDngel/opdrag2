<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Scheduler.aspx.cs" Inherits="Online_Scheduler.Process_Scheduler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Names="Impact" Font-Size="XX-Large" Text="Process Scheduler"></asp:Label>
            <br />
            <br />
            Unloaded Processes:<br />
            <br />
            <asp:ListBox ID="lbxProcesses" runat="server" Height="192px" Width="374px"></asp:ListBox>
            <br />
            <br />
            <asp:Label ID="lblDisplay" runat="server"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="sldrQ1" runat="server" OnTextChanged="sldrQ1_TextChanged"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ1_SliderExtender" runat="server" TargetControlID="sldrQ1"  Minimum ="1" Maximum ="5" BoundControlID="txtQ1"/>
            
            &nbsp;
            <br />
            Queue 1 Run time: 
            <asp:TextBox ID="txtQ1" runat="server" Width="16px" OnTextChanged="txtQ1_TextChanged" onkeypress ="document.getElementById('txtQ2').innerHTML = this.value;" AutoPostBack="True">1</asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="sldrQ2" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ2_SliderExtender" runat="server" TargetControlID="sldrQ2"  Minimum ="1" Maximum ="10" BoundControlID="txtQ2"/>
            &nbsp; 
            <br />
            Queue 2 Run time: 
            <asp:TextBox ID="txtQ2" runat="server" Width="16px" OnTextChanged="txtQ2_TextChanged" onkeypress ="document.getElementById('txtQ3').innerHTML = this.value;" ReadOnly="False" AutoPostBack="True">1</asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="sldrQ3" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ3_SliderExtender" runat="server" TargetControlID="sldrQ3"  Minimum ="1" Maximum ="20" BoundControlID="txtQ3"/>
&nbsp;
            <br />
            Queue 3 Run time:
            <asp:TextBox ID="txtQ3" runat="server" Width="16px" OnTextChanged="txtQ3_TextChanged" onkeypress ="document.getElementById('txtQ4').innerHTML = this.value;" ReadOnly="False">1</asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="sldrQ4" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ4_SliderExtender" runat="server" TargetControlID="sldrQ4"  Minimum ="1" Maximum ="40" BoundControlID="txtQ4"/>
&nbsp;
            <br />
            Queue 4 Run time:
            <asp:TextBox ID="txtQ4" runat="server" Width="16px" OnTextChanged="txtQ4_TextChanged" ReadOnly="False">1</asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="btnStep" runat="server" OnClick="btnStep_Click" Text="Step" />
            <br />
            <br />
            Current Time:
            <asp:Label ID="lblCurrentTime" runat="server" Text="0"></asp:Label>
            <br />
            <br />
            Queue 1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Queue 2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Queue 3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Queue 4:<br />
            <br />
            <asp:ListBox ID="lbxQ1" runat="server" Height="130px" Width="160px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ListBox ID="lbxQ2" runat="server" Height="130px" Width="160px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ListBox ID="lbxQ3" runat="server" Height="130px" Width="160px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ListBox ID="lbxQ4" runat="server" Height="130px" Width="160px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            Completed Tasks:<br />
            <br />
            <asp:ListBox ID="lbxCompleted" runat="server" Height="198px" Width="276px"></asp:ListBox>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</body>
</html>
