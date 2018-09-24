﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Progress.aspx.cs" Inherits="PMS.Draw.Progress" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="titlebox">
        <h1>楼栋均匀抽取</h1>
    </div>
    <div class="box">
        <h2>抽选参数</h2>
        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Caption="选择项目" DataSourceID="EntityDataSource1" TextField="Name" ValueField="Id" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" AutoPostBack="true"></dx:ASPxComboBox>
        <asp:Repeater ID="Repeater1" runat="server" ItemType="System.string" >
            <ItemTemplate>
                <div class="m-t">
                    <dx:ASPxSpinEdit runat="server" Number="1" Caption="<%# Item %>" MinValue="1" MaxValue="100"></dx:ASPxSpinEdit>
                </div>
            </ItemTemplate>
        </asp:Repeater>
       
        <div class="m-t">
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="抽取结果" OnClick="ASPxButton1_Click" Width="242px"></dx:ASPxButton>
        </div>
    </div>
    <div class="box">
        <h2>抽选结果</h2>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Visible="false" AutoGenerateColumns="False" Width="242px">
            <Columns>
                <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="Index" Caption="序号"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="Building.Name" Caption="楼栋号"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="Floor" Caption="层"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="3" FieldName="Door" Caption="户"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="4" FieldName="Progress" Caption="施工阶段"></dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>


    <ef:EntityDataSource ID="EntityDataSource1" runat="server" EntitySetName="Projects" ContextTypeName="PMS.Models.Db"></ef:EntityDataSource>
</asp:Content>
