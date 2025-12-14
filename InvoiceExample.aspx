<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="InvoiceExample.aspx.vb"
    Inherits="InvoiceExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Universal PDF Export - Invoice Example</title>

    <!-- Bootstrap (optionnel) -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- pdfMake (vendor) -->
    <script src="Scripts/vendor/pdfmake.min.js"></script>
    <script src="Scripts/vendor/vfs_fonts.js"></script>

    <!-- Code pdfMake de la facture (séparé du HTML) -->
    <script src="Scripts/invoice/invoice.pdf.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="container my-4">

        <h3 class="mb-3">Universal PDF Export – Invoice Example</h3>

        <div class="row g-3 align-items-end">
            <div class="col-md-4">
                <label for="<%= txtInvoiceNumber.ClientID %>" class="form-label">Invoice Number</label>
                <asp:TextBox ID="txtInvoiceNumber" runat="server"
                             CssClass="form-control"
                             Text="INV-2025-001" />
            </div>

            <div class="col-md-4">
                <label for="<%= txtCustomer.ClientID %>" class="form-label">Customer Name</label>
                <asp:TextBox ID="txtCustomer" runat="server"
                             CssClass="form-control"
                             Text="Sample Customer" />
            </div>

            <div class="col-md-3">
                <label for="<%= txtDate.ClientID %>" class="form-label">Invoice Date</label>
                <asp:TextBox ID="txtDate" runat="server"
                             CssClass="form-control"
                             Text="2025-01-01" />
            </div>

            <div class="col-md-1 d-grid">
                <asp:Button ID="btnGenerate" runat="server"
                            Text="PDF"
                            CssClass="btn btn-primary"
                            OnClientClick="generateInvoice(); return false;" />
            </div>
        </div>

        <div class="mt-3">
            <asp:Label ID="lblInfo" runat="server"
                       CssClass="text-muted"
                       Text="Click on PDF to generate invoice example."></asp:Label>
        </div>

    </form>

    <script type="text/javascript">
        // Appel AJAX vers la WebMethod côté serveur
        function generateInvoice() {
            var invoiceNumber = $('#<%= txtInvoiceNumber.ClientID %>').val() || "INV-0001";
            var customerName = $('#<%= txtCustomer.ClientID %>').val() || "Customer";
            var invoiceDate = $('#<%= txtDate.ClientID %>').val() || "2025-01-01";

            $.ajax({
                type: "POST",
                url: "InvoiceExample.aspx/GenerateInvoice",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    invoiceNumber: invoiceNumber,
                    customerName: customerName,
                    invoiceDate: invoiceDate
                }),
                success: function (res) {
                    var invoice = res.d;   // objet JSON InvoiceDocument
                    InvoicePdf.render(invoice); // fonction définie dans invoice.pdf.js
                },
                error: function (xhr, status, err) {
                    console.error("Error:", xhr.responseText || err);
                    alert("Error while generating invoice.");
                }
            });
        }
    </script>
</body>
</html>
