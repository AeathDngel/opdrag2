<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Process_Scheduler.aspx.cs" Inherits="Online_Scheduler.Process_Scheduler" %>

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
        
                 #txtQ1, #txtQ2, #txtQ3, #txtQ4 {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
 text-align:center;
  font-size: 16px; /* Increase font-size */

  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px;
            margin-left: 0px;
            margin-top: 0px;
        }



        #btnStep, #Button1 {
         display: inline-block;
  border-radius: 2px;
  border: none;
  padding: 0;
  margin-top: 5px;
  margin-bottom: 5px;

         background-color: transparent;
  color: #ff6a00;
  border: 1px solid  #ff6a00;
  
  transition: .2s ease;
  
   
        }

            #btnStep:hover , #Button1:hover{
            background-color: #ff6a00;
            color:#fff;
            }

        #line {
            color: #ff6a00;

        
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Names="Impact" Font-Size="XX-Large" Text="Process Scheduler"></asp:Label>
            <br />
            <br />
            <h3>Unloaded Processes:</h3>
            <asp:ListBox ID="lbxProcesses" runat="server" Height="131px" Width="374px"></asp:ListBox>
            <br />
            <br />
            <asp:Label ID="lblDisplay" runat="server"></asp:Label>
            <br />
            <h4 style="display:inline-block">Queue 1 Run time:</h4> 
            <asp:TextBox ID="txtQ1" runat="server" Width="20px" OnTextChanged="txtQ1_TextChanged" onkeypress ="document.getElementById('txtQ2').innerHTML = this.value;" AutoPostBack="True">1</asp:TextBox>
            

            <asp:TextBox ID="sldrQ1" runat="server" OnTextChanged="sldrQ1_TextChanged" style="margin-top: 0px"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ1_SliderExtender" runat="server" TargetControlID="sldrQ1"  Minimum ="1" Maximum ="10" BoundControlID="txtQ1"/>
            
            <h4 style="display:inline-block">Queue 2 Run time:</h4> 
            <asp:TextBox ID="txtQ2" runat="server" Width="22px" OnTextChanged="txtQ2_TextChanged" onkeypress ="document.getElementById('txtQ3').innerHTML = this.value;" ReadOnly="False" AutoPostBack="True">1</asp:TextBox>
            
            <asp:TextBox ID="sldrQ2" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ2_SliderExtender" runat="server" TargetControlID="sldrQ2"  Minimum ="1" Maximum ="10" BoundControlID="txtQ2"/>

            <h4 style="display:inline-block">Queue 3 Run time:</h4>
            <asp:TextBox ID="txtQ3" runat="server" Width="20px" OnTextChanged="txtQ3_TextChanged" onkeypress ="document.getElementById('txtQ4').innerHTML = this.value;" ReadOnly="False" AutoPostBack="True">1</asp:TextBox>
            
        
            <asp:TextBox ID="sldrQ3" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ3_SliderExtender" runat="server" TargetControlID="sldrQ3"  Minimum ="1" Maximum ="20" BoundControlID="txtQ3"/>
            
            <h4 style="display:inline-block">Queue 4 Run time:</h4> 
            <asp:TextBox ID="txtQ4" runat="server" Width="21px" OnTextChanged="txtQ4_TextChanged" ReadOnly="False" AutoPostBack="True">1</asp:TextBox>
            
            <asp:TextBox ID="sldrQ4" runat="server"></asp:TextBox>
            <ajaxToolkit:SliderExtender ID="sldrQ4_SliderExtender" runat="server" TargetControlID="sldrQ4"  Minimum ="1" Maximum ="40" BoundControlID="txtQ4"/>

            <asp:Button ID="btnStep" runat="server" OnClick="btnStep_Click" Text="Step" Height="29px" Width="168px" />

            <h3>Current Time:</h3>
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
            Completed Tasks:<br />
            <br />
            <asp:ListBox ID="lbxCompleted" runat="server" Height="142px" Width="276px"></asp:ListBox>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="End Scheduler" Height="32px" />
    </form>


</body>
</html>
