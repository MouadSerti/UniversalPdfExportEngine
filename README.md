# UniversalPdfExport
 📄 Universal PDF Export Engine

Framework générique, modulaire et extensible pour générer des PDF en ASP.NET WebForms

Universal PDF Export Engine est un framework générique, modulaire et extensible permettant de générer des documents PDF à partir de données métiers, grâce à pdfMake
 côté frontend.

L’objectif est de proposer un moteur réutilisable dans différents contextes :

Facturation

Ressources humaines

Éducation

Logistique

Administration interne

Etc.

Aucune dépendance métier : chaque document est un module indépendant.

✨ Fonctionnalités principales

✅ Architecture multi-modules : chaque type de document est une extension (Invoice, Certificate, Report, …)

✅ Moteur de génération générique côté serveur (WebMethod → JSON)

✅ Templates PDF personnalisables avec pdfMake

✅ Séparation claire :

    Domain : modèles de données
    
    Services : logique métier
    
    Web : API WebMethod + interface
    
    Scripts : templates PDF

✅ Exemple complet intégré : module Facture (Invoice)

✅ Compatible ASP.NET WebForms / VB.NET (sans Core, sans MVC)

🧱 Architecture du projet
UniversalPdfEXPORTENGINE/
├─ InvoiceExample.aspx                 # Interface UI + AJAX
├─ InvoiceExample.aspx.vb              # WebMethod (API JSON)
│
├─ App_Code/
│  ├─ Domain/
│  │   ├─ InvoiceDocument.vb           # Modèle de document
│  │   └─ InvoiceLine.vb               # Modèle de ligne
│  │
│  └─ Services/
│      └─ InvoiceService.vb            # Logique métier (génération facture)
│
└─ Scripts/
   ├─ invoice/
   │   └─ invoice.pdf.js               # Template PDF pdfMake
   │
   └─ vendor/
       ├─ pdfmake.min.js               # Librairie PDF
       └─ vfs_fonts.js                 # Polices embarquées
