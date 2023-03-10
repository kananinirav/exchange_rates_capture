# Exchange Rates Capture

Create prototype to capture exchange rates on day-to-day basis. Since currency exchange rates varies on day to day basis, let’s create an app to capture the exchange rates on every day basis.

## Tasks

- Create APIs
  - Public API: For get data using from currency, to currency and date. If input date data not present return latest record
  - Admin API: For Create Exchange Rate data using CSV file.
- Create WebUI
  - Create interface to list exchange rates with different filters
  - Apply exchange rate similar to Google.. For given date.

## Modeling

- Country
- Exchange Rate

### Country

| Column       | Data Type  | Primary Key | Foreign key | Comment               |
| ------------ | ---------- | ----------- | ----------- | --------------------- |
| id           | Integer    | ○           |             |                       |
| country      | String     |             |             | country name          |
| country_code | String     |             |             | country currency code |
| created_at   | Time Stamp |             |             |                       |
| updated_at   | Time Stamp |             |             |                       |

### Exchange Rate

| Column        | Data Type  | Primary Key | Foreign key | Comment                           |
| ------------- | ---------- | ----------- | ----------- | --------------------------------- |
| id            | Integer    | ○           |             |                                   |
| from_id       | Integer    |             | ○           | country table id as a foreign key |
| to_id         | Integer    |             | ○           | country table id as a foreign key |
| export_date   | Date       |             |             | data export date                  |
| exchange_rate | Float      |             |             |                                   |
| variance      | Float      |             |             | variance with previous record     |
| created_at    | Time Stamp |             |             |                                   |
| updated_at    | Time Stamp |             |             |                                   |

- For performance improvement we will create clustered index for ( from_id, to_id, export_date )

### Relations

- Country has many Exchange Rates for from country and to country (so has_many for both)
- Exchange Rate columns from_id and to_id belongs to country

## Technologies and Gems used

- Ruby on Rails (Ruby: 3.2.0, Rails: 7.0.4)
- Test Framework (Rspec)
- Factory_bot_rails
- PostgreSQL@14
- Database_cleaner (clean the database before running tests)
- shoulda-matchers (Simple one-liner tests for common Rails functionality)

## Development

- step 1: Generate migrations
- step 2: Give relation and validations in models and write test cases
- step 3: Create separate name space for public and admin api and create controllers accordingly
- step 4: Create Admin Data import api and write functional and unit test cases
  - Will create service for file import
  - setup mailer for sending mail
- step 5: Create public API with parameters and write functional and unit test cases
  - Will create service for public api
- step 6: Create list screen and add search filters and display data accordingly

## Setup

```sh
# Clone Repository
git clone https://github.com/kananinirav/exchange_rates_capture.git

# Go to Folder
cd ./exchange_rates_capture

# Run bundle to install dependencies
bundle

# Create Database
rails db:create

# Run migration
rails db:migrate

# Default seed data
rails db:seed

# Finally start server
rails s

# Open web application
open http://localhost:3000/

```

## APIs Endpoints

1. Public API:
   - ```curl --location --request GET 'http://localhost:3000/api/public/v1/currencies?from_country=INR&to_country=JPY&exchange_date=2023-02-07'```
2. Admin API:
   - ```curl --location --request POST 'http://localhost:3000/api/admin/v1/currencies' \--form 'file=@"/Users/kananinirav/Documents/currency_rate.csv"'```

### Sample csv file

```csv
from,to,exchange_rate
USD,INR,100.10
USD,JPY,129.10
INR,JPY,1.41
```
