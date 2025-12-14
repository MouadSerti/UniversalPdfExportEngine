Imports System

Namespace InvoiceSample.Domain

    Public Class InvoiceLine
        Public Property Description As String
        Public Property Quantity As Decimal
        Public Property UnitPrice As Decimal

        Public ReadOnly Property Total As Decimal
            Get
                Return Quantity * UnitPrice
            End Get
        End Property
    End Class

End Namespace