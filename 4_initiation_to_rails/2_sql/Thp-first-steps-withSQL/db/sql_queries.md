Récupérer tous les albums
```sql
SELECT *
FROM albums
````

Récupérer tous les albums dont le titre contient "Great" (indice)
```sql
SELECT *
FROM albums
WHERE albums.Title LIKE '%Great%'
````

Donner le nombre total d'albums contenus dans la base (sans regarder les id bien sûr)
```sql
SELECT count(*)
FROM albums
````

Supprimer tous les albums dont le nom contient "music"
```sql
DELETE
FROM albums
WHERE albums.Title LIKE '%music%'
````

Récupérer tous les albums écrits par AC/DC
```sql
SELECT albums.Title
FROM albums INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name LIKE 'AC/DC'
````
Récupérer tous les titres des albums de AC/DC
```sql
SELECT tracks.Name
FROM albums INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE artists.Name LIKE '%AC/DC%'
````
Récupérer la liste des titres de l'album "Let There Be Rock"
```sql
SELECT tracks.Name
FROM albums INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE albums.Title LIKE '%Let There Be Rock%'
````
Afficher le prix de cet album ainsi que sa durée totale
```sql

````
Afficher le coût de l'intégralité de la discographie de "Deep Purple"
```sql

````
Créer l'album de ton artiste favori en base, en renseignant correctement les trois tables albums, artists et tracks
```sql

````


