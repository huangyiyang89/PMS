<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="PMS.Project.New" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <ef:EntityDataSource ID="EntityDataSource1" runat="server" EntitySetName="Projects" ContextTypeName="PMS.Models.Db" EnableInsert="true" EnableDelete="true" EnableUpdate="true"></ef:EntityDataSource>
</asp:Content>
