Imports System
Imports System.Collections.Generic
Imports System.Web.Services
Imports InvoiceSample.Domain
Imports InvoiceSample.Services

Partial Public Class InvoiceExample
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Init éventuel côté serveur
        End If
    End Sub

    ' ======================================
    '   API JSON : WebMethod pour l'AJAX
    ' ======================================
    <WebMethod()>
    Public Shared Function GenerateInvoice(invoiceNumber As String,
                                           customerName As String,
                                           invoiceDate As String) As InvoiceDocument

        Dim service As New InvoiceService()
        Return service.BuildInvoice(invoiceNumber, customerName, invoiceDate)
    End Function

End Class
