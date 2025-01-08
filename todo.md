
``` diff
- text in red
+ text in green
! text in blue


bibli : https://sites.google.com/view/tpass-bibli/g%C3%A9n%C3%A9rateur-de-code-ruby-on-rails
(aide pour les migrations et autre)


### Projet de création d’application Ruby On Rails##
Vous devrez répondre à la problématique client en apportant une solution applicative pour gérer sa problématique. 
- Prise en compte dans le rendu :
interface graphique simple ergonomique et intuitive (un minimum de style svp)
Les actions doivent toutes fonctionner et doivent être intuitive pour l’utilisateur.
Vous pouvez partir de l’application actuelle vue pendant ses trois jours ou partir sur un nouveau projet (pas besoin de gérer dans ce cas l’authentification)
vous pouvez aussi partir sur le site replit.com (info plus bas pour parametrage replit)
- Problématique client :
    Nous avons besoin de digitaliser notre livre de gestion de SAV client.
    Actuellement, nous informons sur ce cahier les informations suivant :
    + client [nom, prenom, adresse, telephone]
    + Sav du client [nom produit, fournisseur, date dépôt client, date retour magasin, date enlèvement client]
    pour les fournisseuses, nous avons besoin seulement de ceux ci :
    + [“bosh”, “makita”, “delko”] (utiliser une variable global pour tout le projet de préférence)
    Besoin de créer de nouveau client.
    Besoin de créer de nouvelles SAV en la liant a un client déjà créé. un client peux avoir plusieurs SAV en Cours
    Nous avons besoin d’une vue simple pour  voir les clients qui ont des SAV en cours.
    De voir toutes les SAV en cours et pouvoir les filtrer par nom produit, fournisseur ou nom client.
    de pouvoir voir facilement la liste des SAV suivant leur état : sans date retour magasin et sans date enlèvement client.
    Action en lot : besoin de pouvoir passer toutes les SAV en avec [date retour magasin]=nil en [date retour magasin]=date d’aujourd’hui 
    Avoir un bouton pour avoir une vue JSON sur la liste des clients
    Avoir un bouton pour avoir un export CSV sur la liste des clients (avec petit plus dans une colonne mettre la liste des SAv du client avec [nom produit, date depot client, date retour magasin, date enlevement client])




