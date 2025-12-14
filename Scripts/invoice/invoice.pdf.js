// Module JS responsable uniquement de la génération PDF de la facture
// Utilisé dans InvoiceExample.aspx via InvoicePdf.render(invoice)

var InvoicePdf = (function () {

    function render(invoice) {
        if (!invoice) {
            alert("No invoice data.");
            return;
        }

        var lines = invoice.Lines || [];
        var tableBody = [
            [
                { text: "Description", bold: true },
                { text: "Qty", bold: true, alignment: "right" },
                { text: "Unit Price", bold: true, alignment: "right" },
                { text: "Total", bold: true, alignment: "right" }
            ]
        ];

        lines.forEach(function (l) {
            tableBody.push([
                { text: l.Description || "" },
                {
                    text: l.Quantity != null ? l.Quantity.toString() : "",
                    alignment: "right"
                },
                {
                    text: l.UnitPrice != null ? Number(l.UnitPrice).toFixed(2) : "",
                    alignment: "right"
                },
                {
                    text: l.Total != null ? Number(l.Total).toFixed(2) : "",
                    alignment: "right"
                }
            ]);
        });

        var docDefinition = {
            pageSize: "A4",
            pageMargins: [40, 40, 40, 40],
            content: [
                {
                    text: invoice.Title || "Invoice",
                    style: "title"
                },
                {
                    text: "Invoice n° " + (invoice.InvoiceNumber || ""),
                    margin: [0, 10, 0, 0]
                },
                {
                    text: "Date : " + (invoice.InvoiceDate || ""),
                    margin: [0, 0, 0, 5]
                },
                {
                    text: "Customer : " + (invoice.CustomerName || ""),
                    margin: [0, 0, 0, 15]
                },

                {
                    table: {
                        headerRows: 1,
                        widths: ["*", "auto", "auto", "auto"],
                        body: tableBody
                    },
                    layout: "lightHorizontalLines"
                },

                { text: " ", margin: [0, 10, 0, 0] },

                {
                    columns: [
                        { width: "*", text: "" },
                        {
                            width: "auto",
                            table: {
                                body: [
                                    ["Total excl. tax", formatNumber(invoice.TotalExclTax)],
                                    ["Tax", formatNumber(invoice.Tax)],
                                    ["Total incl. tax", formatNumber(invoice.TotalInclTax)]
                                ]
                            },
                            layout: "lightHorizontalLines"
                        }
                    ]
                }
            ],
            styles: {
                title: {
                    fontSize: 16,
                    bold: true,
                    alignment: "center"
                }
            }
        };

        pdfMake.createPdf(docDefinition).open();
    }

    function formatNumber(value) {
        if (value == null) return "0.00";
        var n = Number(value);
        if (isNaN(n)) return "0.00";
        return n.toFixed(2);
    }

    return {
        render: render
    };

})();
