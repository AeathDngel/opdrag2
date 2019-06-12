<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Creator.aspx.cs" Inherits="Online_Scheduler.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

         h3, h4 {
    
    font-family: "Calibri Light";
    }
        #Label1 {
        align-content: center;
        
        }
        
                 #txtTime,#txtStart,#txtName {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 100%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px;
            margin-left: 0px;
            margin-top: 0px;
        }

#gviewProcess {
  border-collapse: collapse; /* Collapse borders */
  width: 50%; /* Full-width */
  border: 1px solid #ddd; /* Add a grey border */
  font-size: 18px; /* Increase font-size */
}
#gviewProcess th, #gviewProcess td {
  text-align: left; /* Left-align text */
  padding: 12px; /* Add padding */
}

#gviewProcess tr {
  /* Add a bottom border to all table rows */
  border-bottom: 1px solid #ddd;
}

        #Table1 tr.header, #Table1 tr:hover {
            /* Add a grey background color to the table header and on hover */
            background-color: #f1f1f1;
        }

        #btnStart, #btnAdd {
         display: inline-block;
  border-radius: 2px;
  border: none;
  height: 45px;
  padding: 0;
  margin-top: 5px;
  margin-bottom: 5px;

         background-color: transparent;
  color: #ff6a00;
  border: 1px solid  #ff6a00;
  
  transition: .2s ease;
  
   
        }

            #btnStart:hover , #btnAdd:hover{
            background-color: #ff6a00;
            color:#fff;
            }

        #line {
            color: #ff6a00;

        
        }

    </style>
</head>
<body>
    <form runat="server" style="border:2px; margin:40px ; padding:10px;">
        <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Calibri Light" Font-Size="XX-Large" Text="Process Creator"></asp:Label>
        <div style="display:inline-block"><h1 id="line"> |</h1></div>
        <h3>Process Details:</h3>
        <h4>Name:</h4>
        <asp:TextBox ID="txtName" runat="server" Width="160px" style=""></asp:TextBox>
        <h4>Start Time:</h4>
        <asp:TextBox ID="txtStart" runat="server" Width="160px"></asp:TextBox>
        <h4>Time Required:</h4>
        <asp:TextBox ID="txtTime" runat="server" Width="160px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Process" Height="34px" style="margin-left: 0px; margin-top: 0px" Width="217px" Font-Names="Calibri" />
        <br />
        <br />
        <asp:GridView ID="gviewProcess" runat="server" AutoGenerateColumns="False" DataKeyNames="Process_ID" DataSourceID="ProcessDataSource" Font-Names="Calibri Light" Font-Size="Medium">
            <Columns>
                <asp:BoundField DataField="Process_ID" HeaderText="Process_ID" ReadOnly="True" SortExpression="Process_ID" />
                <asp:BoundField DataField="Process_Name" HeaderText="Process_Name" SortExpression="Process_Name" />
                <asp:BoundField DataField="Process_Start" HeaderText="Process_Start" SortExpression="Process_Start" />
                <asp:BoundField DataField="Process_Time" HeaderText="Process_Time" SortExpression="Process_Time" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ProcessDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Process_Info]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnStart" runat="server" OnClick="btnStart_Click" Text="Start Scheduler" Height="32px" Width="212px" Font-Names="Calibri" />
    </form>
</body>
</html>
