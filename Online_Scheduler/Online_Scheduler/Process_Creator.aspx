<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Creator.aspx.cs" Inherits="Online_Scheduler.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Impact" Font-Size="XX-Large" Text="Process Creator"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        Process Details:<br />
        <br />
        <br />
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server" Width="160px"></asp:TextBox>
        <br />
        <br />
        Start Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtStart" runat="server" Width="160px"></asp:TextBox>
        <br />
        <br />
        Time Required:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTime" runat="server" Width="160px"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
        <br />
        <br />
        <asp:GridView ID="gviewProcess" runat="server" AutoGenerateColumns="False" DataKeyNames="Process_ID" DataSourceID="ProcessDataSource">
            <Columns>
                <asp:BoundField DataField="Process_ID" HeaderText="Process_ID" ReadOnly="True" SortExpression="Process_ID" />
                <asp:BoundField DataField="Process_Name" HeaderText="Process_Name" SortExpression="Process_Name" />
                <asp:BoundField DataField="Process_Start" HeaderText="Process_Start" SortExpression="Process_Start" />
                <asp:BoundField DataField="Process_Time" HeaderText="Process_Time" SortExpression="Process_Time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ProcessDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Process_Info]"></asp:SqlDataSource>
    </form>
</body>
</html>
