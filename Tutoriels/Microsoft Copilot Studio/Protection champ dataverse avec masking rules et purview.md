
> Version 2024.12.13, Auteur : Dominique Delaire
> 
![TutorielSecuritecopilotstudio (1)](https://github.com/user-attachments/assets/33f70511-a1cc-46c9-b380-6076488549ac)


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

**3 grandes parties constituent le tutoriel :**
* **Première partie :** Présentation d'une powerapps model driven simple avec ses données et création d'un agent ia avec Copilot Studio interrogeant les données de l'application
* **Deuxième partie :** Microsoft Purview et Azure : Protection des données sensibles de notre base de données dataverse de notre application et vérification de la protection avec notre Agent IA Copilot Studio
* **Troisième partie :** Fonction "Masking Rules" de PowerApps : Protection des données sensibles de notre base de données dataverse de notre application et vérification de la protection avec notre Agent IA Copilot Studio 

# Partie 1 : Présentation d'une App PowerApps model driven et ses données et Création d'un Agent avec Copilot Studio
#### Etape 1 : Dans notre solution "Mylife365" (créez la votre), nous allons ajouter une nouvelle table.



#### Etape 2 : Nommez la "Activités et tâches" et choisissez comme type "Activités".



![Capture d’écran, le 2023-10-07 à 14 31 14](https://github.com/nuage365/Tutoriels/assets/102873102/743c2e2f-dfa7-46c7-a311-d2ede54fcfa7)

> Comme d'habitude, Si vous avez des questions ou un projet, vous pouvez me contacter sur [Linkedin](https://www.linkedin.com/in/dominiquedelaire/)
> Notre équipe sera heureuse de communiquer avec vous :)
> Dominique








