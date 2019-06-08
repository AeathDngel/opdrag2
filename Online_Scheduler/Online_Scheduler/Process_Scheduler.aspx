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
            <asp:Label ID="lblDisplay" runat="server"></asp:Label>
            <br />
            Unloaded Processes:<br />
            <br />
            <asp:ListBox ID="lbxProcesses" runat="server" Height="192px" Width="374px"></asp:ListBox>
            <br />
            <br />
            Current Time:
            <asp:Label ID="lblCurrentTime" runat="server" Text="0"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnStep" runat="server" OnClick="btnStep_Click" Text="Step" />
            <br />
&nbsp;<br />
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
    </form>
</body>
</html>
