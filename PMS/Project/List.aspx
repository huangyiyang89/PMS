<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="PMS.Project.List" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <div class="titlebox">
        <h1>项目</h1>   
    </div>

    <div class="box">
          <h2>项目列表</h2>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="EntityDataSource1" AutoGenerateColumns="False" Width="100%" KeyFieldName="Id" SettingsBehavior-ConfirmDelete="true" OnDataBinding="ASPxGridView1_DataBinding">

        <SettingsEditing Mode="EditFormAndDisplayRow"></SettingsEditing>

        <SettingsPopup>
            <EditForm VerticalAlign="WindowCenter" HorizontalAlign="WindowCenter"></EditForm>
        </SettingsPopup>

        <SettingsSearchPanel Visible="True" CustomEditorID="tbToolbarSearch"></SettingsSearchPanel>

        <EditFormLayoutProperties ColCount="2" ColumnCount="2">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="Name" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="Section" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="总包单位" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="总包负责人" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="监理单位" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="监理负责人" ColSpan="1"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="标段简介" ColSpan="2" ColumnSpan="2"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="标段面积" ColSpan="2" ColumnSpan="2"></dx:GridViewColumnLayoutItem>
                <dx:GridViewColumnLayoutItem ColumnName="交付计划" ColSpan="2" ColumnSpan="2"></dx:GridViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right" ColumnSpan="2"></dx:EditModeCommandLayoutItem>
            </Items>
        </EditFormLayoutProperties>
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True" Caption="" Width="100px" HeaderStyle-HorizontalAlign="Center" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="项目编号" FieldName="Id" VisibleIndex="1" Width="50px" CellStyle-HorizontalAlign="Center"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="项目名称" FieldName="Name" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="标段名称" FieldName="Section" VisibleIndex="3"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="总包单位" FieldName="GeneralContractor"  VisibleIndex="4"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="总包负责人" FieldName="GeneralContractorPIC"  VisibleIndex="5"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="监理单位" FieldName="Supervisor"  VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="监理负责人" FieldName="SupervisorPIC"  VisibleIndex="7"></dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="标段简介" FieldName="Introduction" VisibleIndex="8"></dx:GridViewDataMemoColumn>
            <dx:GridViewDataMemoColumn Caption="标段面积" FieldName="Area" VisibleIndex="9"></dx:GridViewDataMemoColumn>
            <dx:GridViewDataMemoColumn Caption="交付计划" FieldName="Delivery" VisibleIndex="10"></dx:GridViewDataMemoColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="Id" VisibleIndex="99" Caption="更新项目信息" Width="100px" HeaderStyle-HorizontalAlign="Center" CellStyle-HorizontalAlign="Center">
                <PropertiesHyperLinkEdit Text="更新项目信息" NavigateUrlFormatString="Update.aspx?Id={0}"></PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
        
        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
    </dx:ASPxGridView>
    </div>
  
    <ef:EntityDataSource ID="EntityDataSource1" runat="server" EntitySetName="Projects" ContextTypeName="PMS.Models.Db" EnableInsert="true" EnableDelete="true" EnableUpdate="true"></ef:EntityDataSource>
</asp:Content>
