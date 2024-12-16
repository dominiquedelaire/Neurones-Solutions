
> Version 2024.12.13, Auteur : Dominique Delaire
> 
![TutorielSecuritecopilotstudio (2)](https://github.com/user-attachments/assets/58d1a788-e6a5-4221-bf26-53fe2ae02a96)



# Contexte

Avec de plus en plus d'**outils externes qui analysent, entraînent ou présentent des données de votre organisation**, il est **primordial d'attacher de l'importance à la sécurité des données et données sensibles**.

Notamment, aujourd'hui, avec l'**ia qui va chercher des données un peu partout, il est nécessaire d'avoir une gouvernance sur les données de l'entreprise**.

Aujourd'hui, dans ce tutoriel, nous allons avec **Copilot Studio**, faire un **Agent IA pour répondre à des questions sur des données d'une base de données Dataverse**. 
Cette base de données est utilisée par une Application Power Apps Model driven et/ou Dynamics 365 Sales.   

Nous allons **sécuriser des champs afin que Copilot Studio ne puisse pas retourner certaines valeurs de la base de données**. Pour cela, il y a plusieurs façons de faire, notamment avec **Microsoft Purview, Microsoft Azure et les fonctionnalités de "Masking Rules" (preview feature) de Power Apps** mais nous verrons qu'il y a quelques limites pour le moment pour certains de ces outils.

# Prérequis
* Avoir un **compte Microsoft PowerApps** et un environnement de développement disposant d'une solution avec quelques tables au moins ou prendre notre solution PowerApps Model driver Open Source "Mylife365" ou "Compta365" comme exemple.
* Avoir activé les **features de préversion** pour Microsoft PowerApps pour bénéficier par exemple des **"Masking Rules"** dans la sécurité des champs (disponible depuis août 2024).
* Avoir **Copilot Studio**
* Avoir une **licence ou un essai de la version Entreprise de Microsoft Purview**
* Avoir une **licence ou une version d'essai d'un abonnement Microsoft 365 E5 Compliance** pour l'utilisateur, voir **E3 avec option Compliance**
* Avoir une **subscription Microsoft Azure** pour faire certains paramétrages et enregistrements d'applications pour la sécurité.

# Introduction

**3 grandes parties et une conclusion constituent le tutoriel :**
* **Première partie :** Présentation d'une powerapps model driven simple avec ses données et création d'un agent ia avec Copilot Studio interrogeant les données de l'application
* **Deuxième partie :** Microsoft Purview et Azure : Protection des données sensibles de notre base de données dataverse de notre application et vérification de la protection avec notre Agent IA Copilot Studio
* **Troisième partie :** Fonction "Masking Rules" de PowerApps : Protection des données sensibles de notre base de données dataverse de notre application et vérification de la protection avec notre Agent IA Copilot Studio
* **Conclusion :** Meilleure méthode à ce jour de protection et autres possibilités de sécurité.

# Partie 1 : Présentation d'une App PowerApps model driven et ses données et Création d'un Agent avec Copilot Studio
### Etape 1 : Voici de quoi à l'air notre application PowerApps Model driven exemple "Mylife365". Nous utiliserons certaines de ses données pour notre tutoriel.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 40 31" src="https://github.com/user-attachments/assets/12bb13eb-27b1-42c6-b672-df654ccf0ef7" />

### Etape 2 : Dans le tutoriel, nous allons vouloir protéger la colonne "Cellulaire" de notre entité/table "Entité". C'est le numéro de téléphone mobile des contacts de la base de données.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 41 48" src="https://github.com/user-attachments/assets/c177b9c3-72e2-48f1-ad71-487f9e1d531f" />

### Etape 3 : Nous allons maintenant créé un Agent IA avec Microsoft Copilot Studio. Allez dans votre environnement Copilot Studio à l'adresse https://copilotstudio.microsoft.com. Ne pas oubliez avant de créer un nouvel Agent, de sélectionner le bon environnement en haut à droite en cliquant sur Environnement. Les Agents peuvent ensuite être ajoutés à une ou plusieurs de vos solutions spécifiques PowerApps. Pour créer un nouvel Agent, cliquez sur le bouton "Créer" à gauche, puis choisir l'option "Nouvel assistant".    
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 43 11" src="https://github.com/user-attachments/assets/c87dcc34-464c-4c18-8e07-1515ea11dc14" />

### Etape 4 : Dans l'écran de création d'un nouvel agent, saisir le nom que vous souhaitez lui donner, vous pouvez changer son icône, mettre une description, des instructions. Ici, nous avons indiqué un Nom, une description et avons changé d'icône.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 44 57" src="https://github.com/user-attachments/assets/d011b395-9a7d-4767-ba8f-22505e483af2" />

### Etape 5 : Nous allons ajouter une base de connaissance, c'est à dire nos données de notre Table Entité de notre bd Dataverse. Il faut d'abord cliquer sur "Créer" avant de pouvoir ajouter une base de données de type Dataverse dans la fonction "Ajouter des connaissances".   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 45 20" src="https://github.com/user-attachments/assets/e43326ea-403c-459a-82da-6dfa644b2daf" />

<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 46 09" src="https://github.com/user-attachments/assets/01cb88c2-7f42-41f7-aac1-6255913effa2" />

### Etape 6 : On peut ajouter maintenant des connaissances. Choisir "Dataverse (version préliminaire)".
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 46 37" src="https://github.com/user-attachments/assets/13ff8cbb-3ac2-4c49-99b1-487cfc73558b" />

### Etape 7 : Ici, on peut sélectionner les tables (jusqu'à 15 tables maximum) qui vont nous servir de bases de connaissances dans notre Agent IA.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 46 55" src="https://github.com/user-attachments/assets/a5ee72fb-eef3-48ce-9d90-b0aa32937623" />

### Etape 8 : Dans notre exemple, je vais juste sélectionner la table "Entité" de notre base de données Dataverse en lien avec notre PowerApps Mylife365.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 47 52" src="https://github.com/user-attachments/assets/7be9c832-09a9-4b6f-a7b4-28a66ca20002" />

### Etape 9 : En faisant "Suivant", l'étape nous affiche quelques données de la table sélectionnée.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 49 17" src="https://github.com/user-attachments/assets/4acbc9b2-0f0e-47d2-9ceb-311ac4a33e5a" />

### Etape 10 : En sélectionnant "Suivant", cette étape nous permet de vérifier les éléments sélectionnés. Avant de cliquer sur le bouton "Ajouter", vous pouvez ajouter des synonymes aussi par rapport à des champs spécifiques de votre table, afin que l'agent puisse aussi faire le rapprochement avec certains termes spécifiques.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 49 47" src="https://github.com/user-attachments/assets/b699c684-6418-424a-91f2-2ac517ce162f" />

### Etape 11 : Par exemple, ici, j'ai ajouté le terme Auteur en lien avec le champ "Créé par" de la table Entité.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 50 36" src="https://github.com/user-attachments/assets/c844363a-8cfe-4e96-ac07-edc521f983e2" />

### Etape 12 : Ensuite, vous pouvez cliquer sur Retour, puis "Ajouter". Votre Agent, avec le peu d'informations que nous avons donné, peut déjà être testé.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 52 32" src="https://github.com/user-attachments/assets/ef526f0b-6819-456f-bdd8-f98d09ef0bfa" />

### Etape 13 : A droite de votre agent, vous avez une section "Tester votre agent". Je lui pose ma première question :) Combien j'ai d'entités (de contacts). Il me répond 16, ce qui est juste.
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 55 22" src="https://github.com/user-attachments/assets/77598bf5-f8ce-4c8e-aa7c-28698a9139e0" />

### Etape 14 : Ensuite, je lui demande si j'ai un "Antoine" dans ma bd. Il m'indique que j'en ai un en effet.
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 56 35" src="https://github.com/user-attachments/assets/a3b6d82a-bc8f-4c4d-9052-cd8223d9502d" />

### Etape 15 : Un autre test, je lui demande combien j'ai de contacts qui sont dans la catégorie santé. Il me donne une liste de 3 contacts, ce qui est juste aussi.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 57 40" src="https://github.com/user-attachments/assets/04c05e06-a41b-48e1-8b8d-643f1da7991d" />

### Etape 16 : Enfin, un dernier test, et c'est cette donnée que nous allons vouloir sécuriser dans notre tutoriel. Quel est le cellulaire de Antoine ? Et l'agent me donne bien le numéro de téléphone.    
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 15 58 19" src="https://github.com/user-attachments/assets/059b7093-d6b8-498f-93f0-1fcafce92061" />   

> 
> **En résumé** : Nous avons créé un simple Agent avec Copilot Studio pour répondre à des questions sur nos données d'une table Contact (entité).
> **L'objectif maintenant est que notre Agent, lorsqu'il est interrogé sur la donnée Cellulaire, ne donne pas cette information.**
> 

# Partie 2 : Gouvernance et protection des données avec Microsoft Purview
> 
> **Microsoft Purview assure une gestion de gouvernance des données. Nous pouvons notamment classifier des données en lien avec nos champs et tables Dataverse.**
> **Nous pouvons créer aussi des étiquettes de sensibilité et recevoir des alertes. Nous pouvons aussi créer des règles pour gérer le "data loss protection" (DLP)**
> **Il y a quelques fonctions encore inaccessibles en dataverse qui nous limitent à certains fonctions pour notre agent Copilot Studio**
> **Voici ce qu'on peut faire en lien avec notre bd dataverse de notre app mylife365 :**

### Etape 1 : Voici l'écran d'accueil de Microsoft Purview. Vous pouvez vous connecter et essayer la version d'essai sur https://purview.microsoft.com   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 06 32" src="https://github.com/user-attachments/assets/abe4b524-2b38-4b7f-9b8e-b7486cee8825" />

### Etape 2 : Dans le paramétrage, vous pouvez vérifier votre type de compte. Il faut une version Entreprise pour pouvoir accéder à toutes les fonctions. De plus, côté utilisateur, l'utilisateur doit avoir au moins une licence M365 E3 ou E5 compliance.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 06 53" src="https://github.com/user-attachments/assets/ec1ca6e8-f442-4e22-a06a-9859892b8528" />

### Etape 3 : La première chose à réaliser est de donner des permissions à différents rôles dans Purview qui vont nous permettre de faire différents types d'opérations. Quand vous sélectionnez notamment tous les Admin role avec le mot Administrator, vous pouvez ajouter ces rôles directement dans Azure et le ou les utilisateurs dans Microsoft Entra ID.  
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 07 35" src="https://github.com/user-attachments/assets/13590e63-c94c-447e-b88e-d43fd67f524e" />

### Etape 4 : Dans l'utilisateur ou les groupes, vous pouvez assigner les rôles nécessaires pour gérer les opérations dans Microsoft Purview.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 08 56" src="https://github.com/user-attachments/assets/c4f6d027-071a-47bf-8991-024998085d38" />

### Etape 5 : Ensuite, dans Purview, on doit aussi affecter certains rôles spécifiques pour pouvoir par exemple gérer les connexions aux sources de données cloud ou externes, gérer des étiquettes de sensibilité, etc.
Notamment, pour les sources de données et des opérations majeures de protection et de gouvernance, les rôles suivants doivent être donnés pour le paramétrage :
* Compliance Administrator
* Purview Administrator
* Security Administrator
* Compliance Data administrator
* Data source administrators
* Data Governance
* Data Catalog Curators (important pour les sources de données, notamment pour faire le mapping)
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 10 13" src="https://github.com/user-attachments/assets/e5d7a3f7-4ebf-451d-b48a-1dc7cc94d240" />

### Etape 6 : Maintenant que nous avons les rôles, nous allons commencer par référencer notre base de données dataverse de notre app Mylife365.    
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 13 48" src="https://github.com/user-attachments/assets/f57543d5-3055-41fe-84ff-23a985f8e216" />

### Etape 7 : 
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 14 27" src="https://github.com/user-attachments/assets/ee0bacdc-1096-4598-a693-4f2f33968a69" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 15 56" src="https://github.com/user-attachments/assets/b898e514-d878-4399-a53b-0cc532c5a4e9" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 16 27" src="https://github.com/user-attachments/assets/be158725-27e7-4c72-92d7-081027fd61e7" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 17 33" src="https://github.com/user-attachments/assets/f945b827-4f36-4842-873c-582baaa25332" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 17 49" src="https://github.com/user-attachments/assets/d32aacfd-db32-4642-985d-82e94a237d5b" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 19 42" src="https://github.com/user-attachments/assets/16a6443c-3bb3-444d-8f87-c6295ba635b7" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 19 51" src="https://github.com/user-attachments/assets/20338f19-b7ef-4660-8aee-97fa6dd28e92" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 20 02" src="https://github.com/user-attachments/assets/6f54f2d5-093c-42f2-b845-ea870ef3d2b9" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 20 26" src="https://github.com/user-attachments/assets/0cabd8bc-6a00-4184-ac29-969240e9ec66" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 21 11" src="https://github.com/user-attachments/assets/d0eca734-f01b-4615-ad7e-083b96e2006b" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 22 43" src="https://github.com/user-attachments/assets/51839c9b-864d-4456-8194-78c06c08883c" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 24 29" src="https://github.com/user-attachments/assets/293d52ad-4520-4c71-a2e5-04aa7b6c1532" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 24 56" src="https://github.com/user-attachments/assets/68ec2fba-5f9f-4c56-b044-f7e08a1a02e2" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 25 42" src="https://github.com/user-attachments/assets/1bbcd596-baf8-4400-bd29-76e5b0eb36b2" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 27 25" src="https://github.com/user-attachments/assets/1d064cbe-d5a2-4297-b181-91558e755489" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 28 20" src="https://github.com/user-attachments/assets/2d789ed3-15a9-465c-b653-4f6b36a3080a" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 29 08" src="https://github.com/user-attachments/assets/6557b4ad-d1ab-4d57-98f1-9b961af88426" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 30 00" src="https://github.com/user-attachments/assets/31049b0e-7f31-428c-9fa8-b44fa5b8da68" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 30 11" src="https://github.com/user-attachments/assets/764d1fb7-593d-467b-afc8-52ee5ad4b973" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 30 37" src="https://github.com/user-attachments/assets/5e0e4c33-91ae-4899-a3e5-d29932264422" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 30 46" src="https://github.com/user-attachments/assets/a40a1310-2cc6-40df-a0d7-b6d729fb6724" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 31 38" src="https://github.com/user-attachments/assets/5020d101-8e9a-49a2-bf75-65023cf7e37d" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 32 37" src="https://github.com/user-attachments/assets/bc86087d-dbbe-455e-bd64-5752251c3604" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 33 05" src="https://github.com/user-attachments/assets/bb4945ea-7c30-44ab-876e-1a0920a3283a" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 33 34" src="https://github.com/user-attachments/assets/acc9649f-c8b7-4023-908f-f4fb5be34350" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 34 11" src="https://github.com/user-attachments/assets/3a1cfe77-4514-46e6-aa44-48e27a21b287" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 34 23" src="https://github.com/user-attachments/assets/828b1663-7592-4d08-a39c-a4532adf203d" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 34 50" src="https://github.com/user-attachments/assets/ad4776db-0954-4856-981a-2748963c480e" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 35 13" src="https://github.com/user-attachments/assets/a7fe34b4-2402-4a91-88d5-ba08945f4931" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 35 32" src="https://github.com/user-attachments/assets/7495d157-f2b8-4b53-acd5-94d99521c522" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 35 41" src="https://github.com/user-attachments/assets/91155691-3ef7-48e7-8088-41699004a920" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 36 13" src="https://github.com/user-attachments/assets/1ad38fd1-101f-449b-9139-658997075afe" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 37 03" src="https://github.com/user-attachments/assets/04094cfb-c6ac-495e-9a7e-fa6c7c072ea3" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 37 17" src="https://github.com/user-attachments/assets/2bd49d99-3609-480c-a396-4f349ba37b2a" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 37 26" src="https://github.com/user-attachments/assets/fa0bc0ca-ef22-4e49-bd42-56e771d4fc2a" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 37 33" src="https://github.com/user-attachments/assets/30bdd829-df53-4042-9b70-46dd457f3072" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 37 49" src="https://github.com/user-attachments/assets/d805acab-7806-4d82-8c90-254feb8cac89" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 38 01" src="https://github.com/user-attachments/assets/23e81a69-4641-44f4-b7fa-47d369e9465c" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 38 28" src="https://github.com/user-attachments/assets/6e83d05c-e44a-4918-bf15-b093293a468e" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 38 43" src="https://github.com/user-attachments/assets/acd2e763-6f4b-416d-b9ee-6ab98b0daae8" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 39 06" src="https://github.com/user-attachments/assets/bd572ced-0f56-4d70-ba73-0824411ddd32" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 39 32" src="https://github.com/user-attachments/assets/1ad2b199-d536-4f7d-9b1e-c646e5b317b9" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 39 51" src="https://github.com/user-attachments/assets/af24a76b-e5df-46b6-a88d-d73b26f6679c" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 44 47" src="https://github.com/user-attachments/assets/e707e2f2-6825-4ce8-a62a-bda3c42a534f" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 20 45 42" src="https://github.com/user-attachments/assets/02dee057-c2d0-47fd-9843-3b50f7eef3bf" />































# Partie 3 : Protection de la donnée Cellulaire avec les "Masking Rules" pour Copilot Studio et autres apps externes.
> 
> **La fonction "Profils de sécurité de colonne" dans l'admin center de power platform ne suffit pas à protéger un champ ou la donnée du champ dans Copilot**
> **Il faut utiliser aussi la nouvelle fonction préliminaire "Masking Rules" dans PowerApps.**

### Etape 1 : Pour créer une nouvelle "Secured Masking Rule", aller dans votre solution PowerApps et/ou Dynamics, puis Ajouter un nouvel objet "Security"->"Secured masking rule".   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 16 57 08" src="https://github.com/user-attachments/assets/e99c1a56-6962-4497-886f-9e98ec8bedfc" />

### Etape 2 : Dans l'écran, saisir un Nom. Attention ! Ici, vous devez indiquer votre préfixe d'éditeur si vous en avez un ou "new_". Car l'outil pour le moment ne le fait pas automatiquement. Et sinon, vous allez avoir une erreur à l'enregistrement de cette règle de sécurité.   
Ensuite, saisir un **Nom d'affichage et une description**. Le point intéressant ici est que l'on peut mettre une **Expression régulière et un caractère qui va masquer tous les caractères répondant à cette expression régulière**. Voici pour info ce qu'il est possible de mettre : https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference   

Pour tester votre expression régulière, vous pouvez dans la section de droite, ajouter un texte brut et/ou un texte enrichi pour voir le résultat du parsing de l'expression régulière dans les 2 champs en lecture seule.
Pour afficher le résultat de ce test, il faut d'abord enregistrer votre règle et le résultat s'affichera dans les 2 champs :)   

<img width="1680" alt="Capture d’écran, le 2024-12-15 à 16 58 56" src="https://github.com/user-attachments/assets/55c3bef2-8620-4330-8722-0334afa84b51" />

### Etape 3 : Vous avez maintenant une nouvelle règle de "masking rule" dans votre solution qui s'appelle Cellulaire. Mais elle n'est pas encore lié à votre champ.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 01 48" src="https://github.com/user-attachments/assets/abd9655f-63fc-4730-91f4-1ad11631bdb1" />

### Etape 4 : Pour lier le champ à la règle "Masking rules" créée, on va dans la même solution de notre app et on va dans le design de la colonne "Cellulaire" dans la table "Entité".   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 02 03" src="https://github.com/user-attachments/assets/bac5e80e-5c07-432d-935a-66885160748c" />

### Etape 5 : Dans le design de la colonne, on va dans "Advanced options", puis on coche la case "Enable column security".
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 02 26" src="https://github.com/user-attachments/assets/1f91723a-8029-44eb-a0fa-f1597837f287" />

### Etape 6 : Puis en dessous, on sélectionne la règle "Masking rules" Protection cellulaire que l'on a créé à l'étape 2. On sauvegarde et on publie toutes les personnalisations de la solution.   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 02 45" src="https://github.com/user-attachments/assets/c4636a47-36e2-44e8-9f9f-7ebfa8251c82" />

### Etape 7 : Ensuite on doit gérer à qui on affecte/assigne cette sécurité de colonne (Equipe et/ou utilisateur).   
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 04 03" src="https://github.com/user-attachments/assets/599486f5-8734-41df-9288-0c64449b0ee5" />

### Etape 8 : On peut créer un nouveau profil de sécurité de colonne, nommé ici "Copilot Studio". 
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 08 15" src="https://github.com/user-attachments/assets/eaa46492-a576-4a44-af91-b65dddbbc686" />

### Etape 9 : Ensuite, dans le profil créé, on choisit notre champ Cellulaire pour lui affecter les autorisations et Equipes/Utilisateurs.    
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 12 11" src="https://github.com/user-attachments/assets/cd417087-0dfb-4a3b-8ba9-a3c044d7e36b" />

### Etape 10 : Dans "Autorisation de colonne", en sélectionnant notre champ, on peut cliquer en haut sur le bouton "Modifier" permettant de modifier les autorisations, en lecture, lecture non masquée, Mettre à jour et Créer.
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 12 25" src="https://github.com/user-attachments/assets/cb21d196-b054-4de3-a22c-82d801c28803" />

### Etape 11 : Ensuite, on peut affecter ces autorisations configurées à des équipes ou à un utilisateur. Ici, on va le faire sur un utilisateur en particulier, le mien :)
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 12 58" src="https://github.com/user-attachments/assets/97527e1e-e14b-4bf8-90a0-b835c2679f14" />
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 13 17" src="https://github.com/user-attachments/assets/343c51d9-a2c7-4c11-a951-2a6539db8278" />

### Etape 12 :  Si on se remet sur nos tests de notre Agent Copilot Studio, on lui repose la question du téléphone d'Antoine : Quel est le numéro d'Antoine ?, et l'agent répond soit un numéro masqué, soit il indique qu'il n'y a pas de numéros pour Antoine.
<img width="1680" alt="Capture d’écran, le 2024-12-15 à 17 14 33" src="https://github.com/user-attachments/assets/1c6768de-7c3f-423b-a669-3fc076c95e1b" />
<img width="398" alt="Capture d’écran, le 2024-12-14 à 17 06 42" src="https://github.com/user-attachments/assets/6f3c483f-52de-41f0-89f6-669bcfc4e9a8" />



> Comme d'habitude, Si vous avez des questions ou un projet, vous pouvez me contacter sur [Linkedin](https://www.linkedin.com/in/dominiquedelaire/)
> Notre équipe sera heureuse de communiquer avec vous :)
> Dominique








