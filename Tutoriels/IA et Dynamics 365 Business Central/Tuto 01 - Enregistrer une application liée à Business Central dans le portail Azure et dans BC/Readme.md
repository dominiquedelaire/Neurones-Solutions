# Tuto 01 - Enregistrer une application liée à Business Central et ses API dans le portail Azure et dans BC
> Version 2023.11.25.1, Auteur : Dominique Delaire

Dans ce premier tutoriel, nous allons apprendre comment enregistrer nos applis et services qui seront liés à Microsoft Dynamics 365 Business Central et à ses API pour créer des services d'intelligence artificielle à partir de Shellbots ou apps externes en lien avec l'ERP. 

**Pourquoi as t'on besoin d'enregistrer des applications lorsque nous voulons utiliser des données de notre ERP préféré ?**
En fait, avant il n'était pas nécessaire de s'authentifier ainsi. il était possible juste avec son nom d'utilisateur et une web api key paramétréé directement dans Business Central de se connecter aux API BC. Pour des raisons de sécurité et d'optimisation, **il faut maintenant enregistrer chacune de ses applications qui vont utiliser les API BC dans le portail Microsoft Azure et aussi maintenant dans Business central, une fois l'enregistrement fait dans Azure.**

## Prérequis
* Avoir un abonnement valide à Business Central ou une version d'essai
* Avoir un compte microsoft ou un compte microsoft avec un accès au portail Azure (vous pouvez obtenir un compte et des crédits gratuits si vous n'en avez pas encore !)

## Exemple et objectif du Tutoriel

Dans Business Central, nous avons différentes API disponibles et nous pouvons aussi définir les nôtres.
![Capture d’écran, le 2023-11-22 à 11 00 52](https://github.com/user-attachments/assets/8c44314d-9c66-4654-af4d-fd0039574574)



Pour nos tests, nous allons utiliser une API standard de Business Central qui fait référence aux clients de l'ERP. Enregistrer une application permet d'utiliser n'importe quelle API ou future API que nous pourrions publier :)

Voici ce que nous allons choisir pour nos tests comme web service : **allez dans l'écran Web services.**

![Capture d’écran, le 2023-11-22 à 11 01 21](https://github.com/user-attachments/assets/7eac482f-ea94-43e4-aa9f-e7eaf67360ff)



**Sélectionner la ligne comprenant la Page 22 Customers**
![Capture d’écran, le 2023-11-22 à 11 03 11](https://github.com/user-attachments/assets/0bd047d8-b49f-4591-ab7e-ecec0bf56027)

**Et faites un copier coller de la valeur de la colonne "OData V4 Url" dans un fichier texte ou autre et qui nous servira plus tard pour les tests**

![Capture d’écran, le 2023-11-22 à 11 05 26](https://github.com/user-attachments/assets/82fef631-1722-4594-ac58-15b186b1b68e)


**Cela devrait ressembler au même format que la ligne ci-dessous :**
![Capture d’écran, le 2023-11-22 à 11 06 06](https://github.com/user-attachments/assets/07d2d54b-c8d5-4c07-a5ed-a97e6406a504)


## Enregistrement de notre application dans le portail Azure 
Nous allons maintenant passer aux choses sérieuses :)

> **Pour commencer, allez sur le portail de microsoft azure : [https://azure.microsoft.com/](https://azure.microsoft.com/)**
![Capture d’écran, le 2023-11-22 à 11 11 55](https://github.com/user-attachments/assets/d56d3fde-f429-4bf7-b234-2ddef2634a76)


> **Puis choisir le module "Inscription d'applications" et cliquez sur le bouton "+ Nouvelle inscription"**
![Capture d’écran, le 2023-11-22 à 11 17 23](https://github.com/user-attachments/assets/8ab1ab2d-2f6e-496a-bf92-3312db785394)


> **Donnez lui un nom d'application** et qui reflète ce que vos applications ou services vont faire en lien avec Business Central.

> Puis dans **"Types de comptes pris en charge", indiquer "Comptes dans cet annuaire d'organisation uniquement"**
> Puis **dans l'écran "URI de redirection" choisissez Web et tapez l'adresse suivante : "https://businesscentral.dynamics.com/OAuthLanding.htm"**

> Ce fichier htm est utilisé pour gérer les échanges entre Business Central et les autres services à travers Azure Active Directory ou maintenant avec la nouvelle appellation "Microsoft Entra ID"
![Capture d’écran, le 2023-11-22 à 11 18 17](https://github.com/user-attachments/assets/2b83fe1c-c5e3-4152-a011-905f8786c0c1)

> **Cliquez ensuite sur le bouton "S'inscrire"**
![Capture d’écran, le 2023-11-22 à 11 18 36](https://github.com/user-attachments/assets/c647f90b-11c7-4774-b901-ab9708046cab)


> **Vous obtenez ainsi déjà votre "Client ID" (ID D'application (client)) que nous utiliserons plus tard dans le tutoriel.**
> **L'id de l'annuaire aussi est important pour se connecter à notre instance**
![Capture d’écran, le 2023-11-22 à 11 19 08](https://github.com/user-attachments/assets/8fb36824-9a71-4366-a1b1-eddf1d315702)


> **Maintenant, nous allons générer aussi un "Secret ID" que nous utiliserons dans nos applications avec le Client ID et l'Id de l'annuaire.**
> **Pour cela, allez dans le menu "Certificats et Secrets" ou cliquez sur "Ajouter un certificat ou un secret".**

![Capture d’écran, le 2023-11-22 à 11 19 41](https://github.com/nuage365/Tutoriels/assets/102873102/ee8e9a90-26db-4d8b-a8ad-e4a72e767372)

> **Cliquez ensuite sur "Nouveau secret Client"**
![Capture d’écran, le 2023-11-22 à 11 20 00](https://github.com/user-attachments/assets/73fc177d-9333-4b0c-8e9b-e61bc2c021ea)


> **Ajoutez ensuite une description puis une date d'expiration. Ici, nous avons indiqué 6 mois mais vous pouvez personnaliser votre date d'expiration. A l'échéance, vous pourrez regénérer une clé afin que votre ou vos applications puissent fonctionner de nouveau et s'authentifier.**
![Capture d’écran, le 2023-11-22 à 11 20 57](https://github.com/user-attachments/assets/298e2ad3-e253-4b6d-a175-c91e1ab756c3)

> **On obtient le secret Client dans la colonne "Valeur". Vous pouvez aussi la copier et la mettre quelque part, elle nous servira plus tard pour nos tests d'authentification.**
![Capture d’écran, le 2023-11-22 à 11 21 38](https://github.com/user-attachments/assets/fafa6124-d4cc-407e-ad9b-28e7abc8811a)


> **On peut générer plusieurs valeurs de Secret client pour chaque application ou par groupe d'applications si on le désire.**
![Capture d’écran, le 2023-11-22 à 11 22 32](https://github.com/user-attachments/assets/14c61f49-726b-4f50-a0e5-7ed05da4c2ae)


> **Ensuite, il faut indiquer des autorisations pour compléter notre enregistrement d'application(s).**
> 
> **Allez dans le menu "API autorisées" puis cliquez sur le bouton "Ajouter une nouvelle autorisation"**
![Capture d’écran, le 2023-11-22 à 11 24 44](https://github.com/user-attachments/assets/74255255-16d9-412b-89a7-97eca5f286db)


> **Sélectionnez API "Dynamics 365 Business Central"**
![Capture d’écran, le 2023-11-22 à 11 24 59](https://github.com/user-attachments/assets/0d23afe9-1cdc-4b50-91b3-8bdd24d1d64b)


> **Ensuite, il faut sélectionner le type d'autorisation : choisir "Autorisations d'application"**
![Capture d’écran, le 2023-11-22 à 11 25 37](https://github.com/user-attachments/assets/a6584ca5-5a99-4ffa-bf78-7ab4a1b71587)


> **Cochez les 4 autorisations et cliquez sur le bouton "Ajouter des autorisations"**
![Capture d’écran, le 2023-11-22 à 11 26 20](https://github.com/user-attachments/assets/f6e1a479-9702-4e50-803e-53c32395ca02)


> **Une fois l'ajout d'autorisations effectuée, il faut ajouter un consentement de l'administrateur.**
> **Pour cela, cliquez sur "Accorder un consentement d'administrateur" (pour votre domaine)**
![Capture d’écran, le 2023-11-22 à 11 27 24](https://github.com/user-attachments/assets/419a89ba-a7ec-4079-a520-ddda178c2b30)


> **Un message de confirmation apparaît. Cliquez sur "Oui"**
![Capture d’écran, le 2023-11-22 à 11 27 44](https://github.com/user-attachments/assets/afb268b0-4a7f-43dc-bb95-956f7fadedb6)


> **Une fois effectué, le statut change et le consentement a été validé.**
![Capture d’écran, le 2023-11-22 à 11 28 07](https://github.com/user-attachments/assets/561d8708-335f-467d-8131-8526145826f5)


> **En revenant à l'accueil de votre application, tout est correctement configuré. Vous avez votre "Client Id", votre ou vos "secrets clients" et votre Id de l'annuaire. Notez bien ces valeurs pour nos tests.**
![Capture d’écran, le 2023-11-22 à 11 29 50](https://github.com/user-attachments/assets/42483fe5-5924-4f33-93b9-edbcd1c27849)


## Enregistrement de notre application dans Business Central 
Après avoir enregistré notre ou nos apps dans le portail Microsoft Azure, il est maintenant aussi nécessaire d'enregistrer notre application directement dans 365 Business Central

> **Pour cela, en tant qu'administrateur, dans l'instance BC où vous souhaitez lier votre app, chercher "Azure Active Directory Applications" ou "Microsoft Entrant ID app"**
![Capture d’écran, le 2023-11-22 à 13 38 00](https://github.com/user-attachments/assets/c1bc0e3a-1b82-42f1-8e3b-653c8ddef91a)


> **Dans l'écran "Azure Active Directory Applications", créer un nouvel enregistrement.**
![Capture d’écran, le 2023-11-22 à 13 38 38](https://github.com/user-attachments/assets/38ee7ca9-b02c-4374-8326-eb16b6fbd579)


> **Dans le champ "Client ID", indiquez le "Client ID" de votre application enregistrée provenant d'Azure (ID D'application (client))**
> **Et indiquez une description puis la valeur "Enabled" dans le champ "State"**
![Capture d’écran, le 2023-11-22 à 13 43 01](https://github.com/user-attachments/assets/6cbeb9c7-94da-488e-9550-973c52165978)


> **Confirmez en cliquant sur "Oui"**
![Capture d’écran, le 2023-11-22 à 13 43 16](https://github.com/user-attachments/assets/300ab9db-9225-4c53-8e78-eb90c67a545e)


> **Ensuite, nous allons ajouter un ensemble d'autorisations pour l'enregistrement**
> **Pour cela, cliquez sur "Nouvelle ligne" et choisir l'autorisation "D365 BUS FULL ACCESS"**
![Capture d’écran, le 2023-11-22 à 13 44 08](https://github.com/user-attachments/assets/a7a84ac9-8e26-4723-9487-6d2d074b571f)

![Capture d’écran, le 2023-11-22 à 13 44 42](https://github.com/user-attachments/assets/5f8bdc82-76f5-402b-8cb1-4704924e50ca)


> **Revenez sur l'écran précédent et votre nouvelle Application Azure Active Directory ou Microsoft Entrant ID a été créée !**
> 
> **Tout est prêt maintenant pour tester nos inscriptions et les API Business Central via 2 méthodes :**
> - Via l'outil **Postman**
> - Via un programme **Python**
![Capture d’écran, le 2023-11-22 à 13 45 46](https://github.com/user-attachments/assets/cb302472-a096-4d3c-80fc-8a2d366f5d11)


## Tests des API Business central via nos 2 applications (Postman et programme Python) 
### Avec l'outil Postman

**L'outil Postman permet de tester des requêtes API et web et de voir les résultats de celles-ci.**

> **Première chose dans Postman, ajouter une requête de type GET, puis copier l'url vue au début qui était dans la colonne "OData V4 Url" représentant l'API Business Central des Clients (Customers)**
![Capture d’écran, le 2023-11-22 à 21 15 06](https://github.com/user-attachments/assets/cb6f319d-adaa-4430-b2bb-b41f7029429f)



> **Puis dans l'onglet Authorization, dans la section de droite "Configure New Token", ajouter les éléments suivants :**
> - Token Name : Indiqué un nom (ce que vous voulez comme identifiant de token)
> - Grant Type : "Client Credentials"
> - Access Token Url : Indiquez https://login.microsoftonline.com/VotreIddel'annuaire/oauth2/v2.0/token (Id de l'annuaire dans votre app enregistré sur azure)
> - Client ID : Le client ID de votre app enregistré sur azure
> - Client Secret : Le client Secret de votre app enregistré sur azure
> - Scope : https://api.businesscentral.dynamics.com/.default
> - Client Authentication : Send as Basic Auth header
![Capture d’écran, le 2023-11-22 à 21 20 37](https://github.com/user-attachments/assets/1641e7f4-cc8c-4b9f-94c4-e15ccb999426)

> **Une fois les informations saisies, cliquez sur le bouton "Get new access Token"**
![Capture d’écran, le 2023-11-22 à 21 21 16](https://github.com/user-attachments/assets/8b95ea2a-929e-45c4-892b-238e49391bed)


> **Le Token est obtenu et nous sommes prêts à l'utiliser. Cliquez sur le bouton "Use Token".**
![Capture d’écran, le 2023-11-22 à 21 22 54](https://github.com/user-attachments/assets/1d9b6080-d5fb-4998-8fd8-d7768aa687d1)


> **Nous sommes prêts à lancer la requête en cliquant sur le bouton "Send". Nous n'avons pas indiqué de paramètres donc nous aurons la liste de tous les clients de l'environnement de dev**
![Capture d’écran, le 2023-11-22 à 21 23 40](https://github.com/user-attachments/assets/1b061568-bcbf-4db4-8951-169cdf48aa2c)


> **Voici le résultat de la requête au format Json avec la liste des clients. Le fichier Json contient le détail de chaque enregistrement client**
![Capture d’écran, le 2023-11-22 à 21 28 11](https://github.com/user-attachments/assets/4815624c-aa69-4163-b596-61d201ca305c)


### Avec un programme Python

**Avec un simple programme en Python, nous sommes capables d'interroger la liste des clients de notre instance Business Central**

> **Même principe que Postman en utilisant les Id obtenus de notre enregistrement d'application effectué sur le portail Azure.**
![Capture d’écran, le 2023-11-22 à 22 09 45](https://github.com/user-attachments/assets/e54acf7d-1900-445e-8c1b-8a33046b24ea)


> **Résultat du programme Python à l'exécution**
![Capture d’écran, le 2023-11-22 à 22 55 31](https://github.com/user-attachments/assets/7e4a62bb-3a23-44b1-b703-f9d6a642e6f0)


**Fichier source en Python**

```python
import requests

# Remplacez ces valeurs par les informations de votre environnement Business Central
base_url = "https://api.businesscentral.dynamics.com/v2.0/0da8ae83-7b55-4b77-b6f2-c6b5267c540f/ShellbotsDev/ODataV4/Company('My%20Company')/"
client_id = "f03586ba-5c5c-488f-bd0b-9d4b99facae2"
client_secret = "0408Q~ljJ5RahrfgLXdSxqA-eUQUy~kG15j83aqc"
resource = "https://api.businesscentral.dynamics.com/"

# Demande d'autorisation OAuth
token_url = "https://login.microsoftonline.com/0da8ae83-7b55-4b77-b6f2-c6b5267c540f/oauth2/token"
data = {
    'grant_type': 'client_credentials',
    'client_id': client_id,
    'client_secret': client_secret,
    'resource': resource
}

response = requests.post(token_url, data=data)
token = response.json().get('access_token')

# Interroger l'API pour récupérer la liste des clients
customers_url = base_url + 'Customers'
headers = {
    'Authorization': f'Bearer {token}',
    'Content-Type': 'application/json'
}

response = requests.get(customers_url, headers=headers)

if response.status_code == 200:
    customers = response.json()
    for customer in customers.get('value'):
        print(f"Nom du client : {customer.get('Name')}")
else:
    print(f"Erreur lors de la récupération des clients. Code d'erreur : {response.status_code}")
```

