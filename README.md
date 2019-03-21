# Andelzik

**Andelzik** is an online music store API built as code challenge for Andela interview.

The API has 6 endpoints:

- `GET https://andelzik.herokuapp.com/albums`
- `POST https://andelzik.herokuapp.com/albums`
  ```json
  required params {"title": string, "performer": string, "cost": integer }
  ```
- `GET https://andelzik.herokuapp.com/albums/:id`
- `PUT https://andelzik.herokuapp.com/albums/:id`
  ```json
  params {"title": string, "performer": string, "cost": integer }
  ```
 - `DELETE https://andelzik.herokuapp.com/albums/:id`
- `POST https://andelzik.herokuapp.com/purchases`
    ```json
    required params {"user_id": integer, "album_id": integer }
    ```

### Continous Integration
Circle CI is used as a service for continuous integration and delivery.

### Deployment

The app is deployed, up and running on Heroku at [this link](https://andelzik.herokuapp.com/)

The automatic deploy is done everytime a branch pass the tests and get merge into master.
