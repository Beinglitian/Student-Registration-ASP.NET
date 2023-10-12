<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Student_Registration.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  

<head runat="server">
    <title></title>
    <style>
        #Table1{
    width: auto;
    background-color:gold;
    background-position:center;
    background-size: cover;
    height: 100vh;
}

    </style>

    <script type="text/javascript">
        {
            function ValidNumeric() {

                var charCode = (event.which) ? event.which : event.keyCode;
                if (charCode >= 48 && charCode <= 57)
                { return true; }
                else
                { return false; }
            }


            
        }
     </script>     
    <script>

        function CheckIndianNumber(b) {
            debugger;
            var a = /^\d{10}$/;
            if (a.test(b)) {
                alert("Your Mobile Number Is Valid.")
            }
            else {
                alert("Your Mobile Number Is Not Valid.")
            }
        };

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div  align="center">
        <asp:Label ID="Label1"  runat="server"  ><b>Student Registration</b></asp:Label>
    </div>

        <table id="Table1" align="center" runat="server" >
            <tr>
                <td> Roll No:</td>
                <td><asp:TextBox ID="txt_rollno" MaxLength="14" onkeypress="return ValidNumeric()" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator runat="server" ControlToValidate="txt_rollno" ForeColor="Red" Font-Italic="true" ErrorMessage="Roll Number is Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td> Student Name:</td>
                <td><asp:TextBox ID="txt_studentname" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_studentname" ForeColor="Red" Font-Italic="true" ErrorMessage="Student name is Required"></asp:RequiredFieldValidator> </td>
                
            </tr>

            <tr>
                <td> Gender:</td>
                
                <td>
                    <asp:RadioButtonList ID="rdo_gender" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Transgender">Transgender</asp:ListItem>
                    </asp:RadioButtonList>

                </td>
                <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rdo_gender" ForeColor="Red" Font-Italic="true" ErrorMessage="Gender is Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td> Father Name:</td>
                <td><asp:TextBox ID="fathername" runat="server"></asp:TextBox></td>
                  <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fathername" ForeColor="Red" Font-Italic="true" ErrorMessage="Father name is Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td> Course:</td>
                <td><asp:DropDownList ID="ddl_Courses" runat="server">
                    <asp:ListItem Value=" ">--Select--</asp:ListItem>
                    <asp:ListItem Value="B.C.A">B.C.A</asp:ListItem>
                    <asp:ListItem Value="M.C.A">M.C.A</asp:ListItem>
                    <asp:ListItem Value="B.Tech">B.Tech</asp:ListItem>
                    <asp:ListItem Value="B.A">B.A</asp:ListItem>
                    <asp:ListItem Value="B.PHARMA">B.PHARMA</asp:ListItem>
                    <asp:ListItem Value="B.COM">B.COM</asp:ListItem>
                    </asp:DropDownList>

                </td>
                 <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Font-Italic="true" ControlToValidate="ddl_Courses" ErrorMessage="Select Course"></asp:RequiredFieldValidator></td>
                
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="address" runat="server"></asp:TextBox>
                </td>
                <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="address" ForeColor="Red" Font-Italic="true" ErrorMessage="Address is Required"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td>Mobile:</td>
                <td>
                    <asp:TextBox ID="mobile" runat="server" MaxLength="10" onkeypress="return ValidNumeric()" onchange="CheckIndianNumber(this.id)"></asp:TextBox>
                </td>
                <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="mobile" ForeColor="Red" Font-Italic="true" ErrorMessage="Mobile is Required"></asp:RequiredFieldValidator></td>
                <td><asp:RegularExpressionValidator ID="revMobNo" runat="server"  ErrorMessage="Invalid Mobile Number." ValidationExpression="^([0-9]{10})$" ControlToValidate="mobile" ValidationGroup="Validate" ForeColor="Red" Display="Static"></asp:RegularExpressionValidator></td>
                
                
            </tr>
            <tr>
                <td>
                    Photo:
                </td>
                <td><asp:FileUpload  ID="photo"  runat="server"/> 
                    
                    

                </td>
                
                <td>
                    Thumbh Impression:
                </td>
                <td><asp:FileUpload  ID="thumbh" runat="server"/></td>

            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_sub" runat="server" OnClick="btn_sub_Click"   Text="Submit"/>
                </td>
                <td> <input type="reset" runat="server" id="reset" /></td>
            </tr>

            
         </table>   



        <div class="row" style="margin-top:2%">
            <asp:GridView ID="gridview" runat="server" BorderWidth="2" AlternatingRowStyle-BorderColor="#00ff00" AutoGenerateColumns="false" GridLines="None" OnRowCancelingEdit="gridview_RowCancelingEdit1"   OnRowEditing="gridview_RowEditing1" OnRowUpdating="gridview_RowUpdating1" DataKeyNames="id">
                
              <Columns>

                  <asp:TemplateField   HeaderText="" >
                   <ItemTemplate>
                       <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Bind("id") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_id" runat="server"  Visible="false" Text='<%#Eval("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  
                  <asp:TemplateField HeaderText="Roll No." >
                   <ItemTemplate>
                       
                       <asp:Label ID="lbl_roll_no" runat="server" Text='<%# Bind("roll") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_roll" runat="server" Text='<%#Eval("roll") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Student Name" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_student_name" runat="server" Text='<%# Bind("name") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_student_name" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Gender" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_gender" runat="server" Text='<%# Bind("gender") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_gender" runat="server" Text='<%#Eval("gender") %>'></asp:TextBox>
                          <asp:RadioButtonList ID="rdo_gender"   RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Transgender">Transgender</asp:ListItem>
                    </asp:RadioButtonList>
                    </EditItemTemplate>
                      </asp:TemplateField>
                  

                  <asp:TemplateField HeaderText="Father Name" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_father_name" runat="server" Text='<%# Bind("father") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_father_name" runat="server" Text='<%#Eval("father") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Course" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_course" runat="server" Text='<%# Bind("course") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_course" runat="server" Text='<%#Eval("course") %>'></asp:TextBox>
                          <asp:DropDownList ID="ddl_Courses" Text='<%#Eval("course") %>' runat="server"  >
                    <asp:ListItem Value="">--Select--</asp:ListItem>
                    <asp:ListItem Value="B.C.A">B.C.A</asp:ListItem>
                    <asp:ListItem Value="M.C.A">M.C.A</asp:ListItem>
                    <asp:ListItem Value="B.Tech">B.Tech</asp:ListItem>
                    <asp:ListItem Value="B.A">B.A</asp:ListItem>
                    <asp:ListItem Value="B.PHARMA">B.PHARMA</asp:ListItem>
                    <asp:ListItem Value="B.COM">B.COM</asp:ListItem>
                    </asp:DropDownList>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Address" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_address" runat="server" Text='<%# Bind("address") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_address" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Mobile" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_mobile" runat="server" Text='<%# Bind("mobile") %>' ></asp:Label>
                   </ItemTemplate>
                      <EditItemTemplate>
                        <asp:TextBox ID="txt_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Photo" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_photo" runat="server" Text='<%# Bind("photo") %>' ></asp:Label>
                   </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="Thumbh" >
                   <ItemTemplate>
                       <asp:Label ID="lbl_thumbh" runat="server" Text='<%# Bind("thumbh") %>' ></asp:Label>
                   </ItemTemplate>
                  </asp:TemplateField>


                  <%--<asp:TemplateField HeaderText="Edit">
                      
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                   <ItemTemplate>
                       <asp:Button ID="btn_update"  runat="server" Text="Edit"  ForeColor="Red" />
                   </ItemTemplate>
                  </asp:TemplateField>--%>

                  <asp:CommandField ShowEditButton="True" CausesValidation="false" />
             
                  <asp:TemplateField  HeaderText="Delete">
                   <ItemTemplate>
                       

                       <asp:LinkButton ID="LinkBtndelete" OnClick="LinkBtndelete_Click" CommandArgument='<%# Eval("id") %>'  OnClientClick="return confirm('Are you sure you want to delete this ?')" runat="server" CausesValidation="false">Delete</asp:LinkButton>
                   </ItemTemplate>
                  </asp:TemplateField>
                  
                  
              </Columns>
            </asp:GridView>
        </div>
    
    </form>
    
</body>
</html>
