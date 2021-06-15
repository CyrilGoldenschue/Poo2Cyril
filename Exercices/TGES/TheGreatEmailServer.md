# TheGreatEmailServer

Voici les nouvelles contraintes, attention vous ne devez pas les implémenter,
simplement les prendre en compte pour ré-usiner le code avec des Design Patterns.

1. Je veux pouvoir facilement changer de gestionnaire SMTP (remplacer Dumster/Rumbster par un autre composant)
2. Ajouter les stats suivantes:
   - volume (taille en byte) des mails rejetés.
   - volume (taille en byte) des mails stockés.
3. Ajouter le critère de blockage suivant:
   - les pièces jointes dont l'extension est `.rar`
