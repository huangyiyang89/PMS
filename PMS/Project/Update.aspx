<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="PMS.Project.Update" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="titlebox">
        <h1>项目信息</h1>   
    </div>
    <div class="box">
        <h2>基本信息</h2>
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" Styles-LayoutGroup-Cell-Paddings-PaddingBottom="14px">
            <Items>
                <dx:LayoutItem Caption="项目名称" FieldName="Name" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server"></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="标段名称" FieldName="Section" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server"></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="总包单位" FieldName="GeneralContractor" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server"></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="总包负责人" FieldName="GeneralContractorPIC" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server"></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="监理单位" FieldName="Supervisor" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server"></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="监理负责人" FieldName="SupervisorPIC" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server" ></dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="标段简介" FieldName="Introduction" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo runat="server" ID="ASPxMemo1" Rows="4" Width="100%"></dx:ASPxMemo>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="标段面积" FieldName="Area" ColSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo runat="server" ID="ASPxMemo2" Rows="4" Width="100%"></dx:ASPxMemo>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="交付计划" FieldName="Delivery" ColSpan="2" RowSpan="2">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxMemo runat="server" ID="ASPxMemo3" Rows="4" Width="100%"></dx:ASPxMemo>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>
   </div>
        <div class="box">
              <h2>楼栋信息</h2>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="EntityDataSource1" Width="700px" KeyFieldName="Id" OnDataBinding="ASPxGridView1_DataBinding" AutoGenerateColumns="False" OnInitNewRow="ASPxGridView1_InitNewRow" CssClass="m-t">
                <SettingsEditing Mode="EditFormAndDisplayRow"></SettingsEditing>
                <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

                <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="Name" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="DoorsEachFloor" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="BottomFloor" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="TopFloor" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ProjectId" ColSpan="1" ClientVisible="false"></dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True" ShowEditButton="True" Width="100px"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="Name" Caption="楼栋号"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataSpinEditColumn FieldName="BottomFloor" VisibleIndex="3" Caption="最低层数">
                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataSpinEditColumn FieldName="TopFloor" VisibleIndex="4" Caption="最高层数">
                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataSpinEditColumn FieldName="DoorsEachFloor" VisibleIndex="5" Caption="每层几户">
                        <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>


                    <dx:GridViewDataTextColumn FieldName="ProjectId" VisibleIndex="6" Visible="false"></dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
       
       



        <div class="box m-b">
            <h2>施工进度</h2>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="EntityDataSource2" AutoGenerateColumns="False" Width="700px" KeyFieldName="Id" OnDataBinding="ASPxGridView2_DataBinding" CssClass="m-t">
                <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="BuildingId" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="Progress" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="FromFloor" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="ToFloor" ColSpan="1"></dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" Width="100px" ShowDeleteButton="True"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="3" FieldName="FromFloor" Caption="开始层数"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="4" FieldName="ToFloor" Caption="结束层数"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="BuildingId" VisibleIndex="1" Caption="楼栋号">
                        <PropertiesComboBox DataSourceID="EntityDataSource1" TextField="Name" ValueField="Id"></PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Progress" VisibleIndex="2" PropertiesComboBox-DataSourceID="EntityDataSource3" Caption="施工进度">
                        <PropertiesComboBox TextField="Name" ValueField="Name"></PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>

                </Columns>
            </dx:ASPxGridView>
        </div>

   

    <ef:EntityDataSource ID="EntityDataSource1" runat="server" EntitySetName="Buildings" ContextTypeName="PMS.Models.Db" EnableInsert="true" EnableDelete="true" EnableUpdate="true" Where="it.ProjectId=@ProjectId">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProjectId" QueryStringField="Id" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>
    <ef:EntityDataSource ID="EntityDataSource2" runat="server" EntitySetName="BuildingProgresses" ContextTypeName="PMS.Models.Db" EnableInsert="true" EnableDelete="true" EnableUpdate="true" Include="Building" Where="it.Building.ProjectId = @ProjectId" OrderBy="it.BuildingId">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProjectId" QueryStringField="Id" Type="Int32" />
        </WhereParameters>
    </ef:EntityDataSource>
    <ef:EntityDataSource ID="EntityDataSource3" runat="server" EntitySetName="ProgressLists" ContextTypeName="PMS.Models.Db"></ef:EntityDataSource>
    
</asp:Content>
