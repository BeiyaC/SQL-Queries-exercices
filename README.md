## Prérequis

* PHP 8
* composer
* Une base de données MySQL

## Installation

Cloner le repository sur votre ordinateur
```
git clone https://github.com/le-campus-numerique/PHP_BDD_query_playground.git
```

Se placer dans le répertoire du projet
```
cd PHP_BDD_query_playground
```

Installer les dépendances du projet
```
composer install
```
   
## Initialisation de votre base de données

* Créer un export (Dump SQL) de votre base de données avec comme nom `dump.sql`
* Placer ce dump dans le répertoire `results/database/`

## Configuration de votre base de données

⚠️☠️⚠️ Créer une nouvelle base de données dédiée au projet ⚠️☠️⚠️

⚠️☠️⚠️ L'ensemble des tables et données sont supprimées à chaque éxécution du programme ⚠️☠️⚠️   

Copier le fichier exemple de configuration
```
cp .env.example .env
```
Éditer le fichier `.env` et personnaliser les paramètres de votre BDD :
* `DB_HOST` : Addresse IP du serveur MySQL 
* `DB_DATABASE` : Nom de la base de données
* `DB_USERNAME` : Utilisateur de la base de données
* `DB_PASSWORD` : Mot de passe de la base de données


## Créer les requêtes

Créer les requêtes conformément aux consignes dans le répertoire `./results/queries`

1 requête = 1 fichier


## Lancer les tests

Pour tester vos requêtes, lancer la commande (à la racine du projet et depuis Git Bash) :

```
./vendor/bin/pest --stop-on-error
```

### Rechargement automatique des tests

Sous 🍏 Mac et 🐧 Linux vous pouvez installer un outil complémentaire pour relancer automatiquement les tests à chaque modification de vos requêtes.

Installer l'outil php-watcher :  
```
composer require seregazhuk/php-watcher --dev
```

Lancer les tests avec php-watcher :
```
./vendor/bin/php-watcher "./vendor/bin/pest --stop-on-error"  
```
