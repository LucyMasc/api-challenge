# Rest Api --- Challenge 1 - m2y
## Back-End

REST API with specific filters built using Ruby on Rails and Postgresql.
Check it out on https://m2y-api.herokuapp.com/ 

Endpoints

 - `GET '/':` for reading a .csv file
 - `GET '/movies':` to list all movies
###### * Data is ordered in descending order.
Filters

 - `GET '/movies?query=:release_year'` to filter by `year`
 - `GET '/movies?query=:genre'` to filter by `genre`
 - `GET '/movies?query=:country'` to filter by `country`


###### Note: For uploading a .csv file successfully saving on db, headers of your file must match headers of fields on database.
