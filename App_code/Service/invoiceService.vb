Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports InvoiceSample.Domain

Namespace InvoiceSample.Services

    Public Class InvoiceService

        ''' <summary>
        ''' Construit un exemple de facture.
        ''' Plus tard tu peux remplacer la partie "mock" par des données SQL.
        ''' </summary>
        Public Function BuildInvoice(invoiceNumber As String,
                                     customerName As String,
                                     invoiceDate As String) As InvoiceDocument

            Dim doc As New InvoiceDocument() With {
                .Title = "Invoice " & invoiceNumber,
                .InvoiceNumber = invoiceNumber,
                .InvoiceDate = invoiceDate,
                .CustomerName = customerName,
                .Lines = New List(Of InvoiceLine)()
            }

            ' TODO : ici tu peux remplacer par des données venant de la base.
            doc.Lines.Add(New InvoiceLine() With {
                .Description = "Product A",
                .Quantity = 2D,
                .UnitPrice = 100D
            })

            doc.Lines.Add(New InvoiceLine() With {
                .Description = "Service B",
                .Quantity = 1D,
                .UnitPrice = 250D
            })

            ' Calcul des totaux
            Dim totalExcl As Decimal = doc.Lines.Sum(Function(l) l.Total)
            Dim tax As Decimal = Math.Round(totalExcl * 0.2D, 2D) ' TVA 20% (exemple)
            Dim totalIncl As Decimal = totalExcl + tax

            doc.TotalExclTax = totalExcl
            doc.Tax = tax
            doc.TotalInclTax = totalIncl

            Return doc
        End Function

    End Class

End Namespace
