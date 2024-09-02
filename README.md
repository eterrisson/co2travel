# CO2Travel

CO2Travel est une application iOS développée en SwiftUI, qui permet aux utilisateurs de calculer le coût en CO2 de leurs déplacements en utilisant les données fournies par l'ADEME (Agence de la transition écologique). L'application utilise Realm comme base de données locale pour stocker les informations des déplacements.

## Table des matières

- [Aperçu](#aperçu)
- [Fonctionnalités](#fonctionnalités)
- [Technologies utilisées](#technologies-utilisées)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Contribuer](#contribuer)
- [Licence](#licence)

## Aperçu

CO2TripCalculator vise à sensibiliser les utilisateurs à l'impact environnemental de leurs déplacements en calculant les émissions de CO2 générées. En saisissant des informations telles que le type de transport, la distance parcourue, et d'autres paramètres, l'application utilise les données officielles de l'ADEME pour estimer les émissions de CO2.

## Fonctionnalités

- **Calcul des émissions de CO2** : Les utilisateurs peuvent entrer les détails de leurs déplacements pour calculer le coût en CO2.
- **Stockage des déplacements** : Utilisation de Realm pour stocker et gérer les données des déplacements des utilisateurs.
- **Historique des déplacements** : Les utilisateurs peuvent voir un historique de leurs déplacements passés et les émissions de CO2 associées.
- **Types de transport variés** : Support pour différents types de transport, y compris la voiture, le train, l'avion, etc.
- **Visualisation des données** : Graphiques pour visualiser les émissions de CO2 au fil du temps.

## Technologies utilisées

- **SwiftUI** : Pour l'interface utilisateur réactive et moderne.
- **Realm** : Pour le stockage de données local rapide et flexible.
- **API de l'ADEME** : Utilisation des données de l'ADEME pour les calculs d'émissions de CO2.
- **Combine** : Pour la gestion des flux de données asynchrones.
- **Swift** : Le langage de programmation principal pour le développement de l'application.

## Installation

### Prérequis

- Xcode 14.0 ou plus récent
- iOS 16.0 ou plus récent

### Étapes d'installation

1. **Clonez le dépôt :**

   ```bash
   git clone https://github.com/eterrisson/Co2travel.git
   cd CO2TripCalculator

