<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 10px;
        }
        .auto-style2 {
            width: 8px;
        }
        .auto-style3 {
            width: 76px;
        }
        .auto-style4 {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LoginName ID="LoginName1" runat="server" />
            <br />
            <table>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Term:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="TermSelection" DataTextField="Term" DataValueField="Term" EnableTheming="True" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="TermSelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Term] FROM [Courses] GROUP BY [Term]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="Department:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DepartmentSelection" DataTextField="Dept" DataValueField="Dept" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="DepartmentSelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Dept] FROM [Courses] WHERE ([Term] = @Term) GROUP BY [Dept]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="Term" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Course:"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="CourseSelection" DataTextField="CourseName" DataValueField="CourseName" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CourseSelection" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseName] FROM [Courses] WHERE ([Dept] = @Dept) GROUP BY [CourseName]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="" Name="Dept" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Search" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseId"  DataSourceID="CoursesOptions" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="CourseId" HeaderText="CourseId" ReadOnly="True" SortExpression="CourseId" />
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="CourseDesc" HeaderText="CourseDesc" SortExpression="CourseDesc" />
                                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                                <asp:BoundField DataField="Activity" HeaderText="Activity" SortExpression="Activity" />
                                <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                                <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Add"  />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="CoursesOptions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Courses] WHERE ([CourseName] = @CourseName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList3" Name="CourseName" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="6" class="auto-style4">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseId" DataSourceID="SelectionGridView" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="CourseId" HeaderText="CourseId" ReadOnly="True" SortExpression="CourseId" />
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="CourseDesc" HeaderText="CourseDesc" SortExpression="CourseDesc" />
                                <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                                <asp:BoundField DataField="Activity" HeaderText="Activity" SortExpression="Activity" />
                                <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                                <asp:BoundField DataField="StartTime" HeaderText="StartTime" SortExpression="StartTime" />
                                <asp:BoundField DataField="EndTime" HeaderText="EndTime" SortExpression="EndTime" />
                                <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Delete" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SelectionGridView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Courses].[CourseId], [Courses].[CourseName], [Courses].[CourseDesc], [Courses].[Section], [Courses].[Activity], [Courses].[Days], [Courses].[StartTime], [Courses].[EndTime], [Courses].[Instructor], [Courses].[Location], [Courses].[Status]
FROM [Selection] INNER JOIN [Courses] ON [Selection].[CourseId] = [Courses].[CourseId]
WHERE ([StudentId] = @StudentId);" onselecting="SelectionGridView_Selecting">
                            <selectparameters>
	                            <asp:parameter name="StudentId" type="String" />
                            </selectparameters>
                        </asp:SqlDataSource>
                        
                        <br />
                    </td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td colspan="8">
                        <asp:Button ID="Generate" runat="server" Text="Generate" OnClick="Generate_Click" />   
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
