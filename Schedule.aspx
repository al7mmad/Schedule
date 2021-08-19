<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="Schedule" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server" CssClass="auto-style1" DataEndField="EndTime" DataSourceID="TableGeneration" DataStartField="StartTime" DataTextField="CourseName" DataValueField="Id" HeightSpec="Full" StartDate="2020-01-19" style="left: 0px; top: 0px; height: 617px" ViewType="Week" HourWidth="50" BusinessBeginsHour="8" />
            <asp:SqlDataSource ID="TableGeneration" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [CourseName], [StartTime], [EndTime] FROM [Schedule] WHERE ([StudentId] = @StudentId)" onselecting="TableGeneration_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="StudentId" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
