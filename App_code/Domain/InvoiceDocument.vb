Imports System
Imports System.Collections.Generic

Namespace InvoiceSample.Domain

    Public Class InvoiceDocument
        Public Property Title As String
        Public Property InvoiceNumber As String
        Public Property InvoiceDate As String
        Public Property CustomerName As String

        Public Property Lines As List(Of InvoiceLine)

        Public Property TotalExclTax As Decimal
        Public Property Tax As Decimal
        Public Property TotalInclTax As Decimal
    End Class

End Namespace
