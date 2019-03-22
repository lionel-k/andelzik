[![CircleCI](https://circleci.com/gh/lionel-k/andelzik.svg?style=svg)](https://circleci.com/gh/lionel-k/andelzik)
[![Maintainability](https://api.codeclimate.com/v1/badges/487952d798a176348a40/maintainability)](https://codeclimate.com/github/lionel-k/andelzik/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/487952d798a176348a40/test_coverage)](https://codeclimate.com/github/lionel-k/andelzik/test_coverage)

# Andelzik

**Andelzik** is an online music store API built as code challenge for Andela interview.

The API has 6 endpoints:

- `GET https://andelzik.herokuapp.com/albums`
- `POST https://andelzik.herokuapp.com/albums`
  ```json
  required params {"title": "string", "performer": "string", "cost": "integer" }
  ```
- `GET https://andelzik.herokuapp.com/albums/:id`
- `PUT https://andelzik.herokuapp.com/albums/:id`
  ```json
  params {"title": "string", "performer": "string", "cost": "integer" }
  ```
 - `DELETE https://andelzik.herokuapp.com/albums/:id`
- `POST https://andelzik.herokuapp.com/purchases`
    ```json
    required params {"user_id": "integer", "album_id": "integer" }
    ```
- `GET https://andelzik.herokuapp.com/search`
  ```json
  params {"term": "string" }
  ```

### Continous Integration
Circle CI is used as a service for continuous integration and delivery.

### Deployment

The app is deployed, up and running on Heroku at [this link](https://andelzik.herokuapp.com/)

The automatic deploy is done everytime a branch pass the tests and get merge into master.

### Code Quality

Code Quality is monitored with the `gem simplecov` and the CodeClimate service.

### Run the app in local environment

- `git clone https://github.com/lionel-k/andelzik.git`
- `cd andelzik`
- `bundle`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed` (optinal) - To populate the database with data

### Database schema

<p align="center">
  <img src="https://raw.githubusercontent.com/lionel-k/andelzik/master/public/database-schema.png" alt="Database schema"/>
</p>

### Monitoring

AppSignal service is used to catch errors, track performance, monitor hosts, detect anomalies in production. The configuration is done with the `gem appsignal
