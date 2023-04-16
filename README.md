# HTML to PDF API

This API provides the ability to generate PDF documents from HTML templates.

## Dependencies

To install and run this project, you will need:

* Ruby 3.0.3 - We recommend using asdf to manage Ruby versions
* Bundler - to install Ruby gems and dependencies
* wkhtmltopdf - download here

## Instalation

### Follow the steps below

1. **Clone the repository**
`git clone https://github.com/JoaoLeopoldino/technical-challange.git`

2. **Instal the dependecies**
`bundle install`

3. **Run the migrations**
`rails db:create db:migrate`

4. **Run the specs**
`bundle exec rspec`

5. **Run the server**
`rails s`

## API Documentation

### Base URL

**Production**

 ``https://htmltopdf-q250.onrender.com``

**Development**

``localhost:3000``

### GET /api/v1/documents/list

**Returns a list of all documents in the database**

Response
Status: 200 OK

```javascript
// Example response of the GET /api/v1/documents/list request
[
  {
    "uuid": "2b2ab03a-8b81-47c1-9af3-3b3c8d695f71",
    "pdf_url": "presigned_url or local file path",
    "description": "Example description 1",
    "document_data": { // arbitrary data coming from the user
      "customer_name": "Tomás",
      "contract_value": "R$ 1.990,90",
      // ...
    },
    "created_at": "2012-04-23T18:25:43.511Z"
  },
    {
    "uuid": "d3b75481-3f8e-4a23-9c2e-738abf8e998b",
    "pdf_url": "presigned_url or local file path",
    "description": "Example description 2",
    "document_data": { // arbitrary data coming from the user
      "customer_name": "Haroldo",
      "contract_value": "R$ 10.990,90",
      // ...
    },
    "created_at": "2012-04-23T18:25:43.511Z"
  },
  // ...
]
```


### POST /api/v1/documents/create

**Creates a new document with the provided data**

Request Body

```javascript
// Example request to the POST/PUT /api/v1/documents/create endpoint
{
  "description": "Example description 2",
  "document_data": { // arbitrary data coming from the user
    "customer_name": "Haroldo",
    "contract_value": "R$ 10.990,90",
    // ...
  },
  "template": "HTML Fragment template goes here, for brevity it is shown on template.html file"
}
```

Response
Status: 201 Created
Body:

```javascript
// Example response of the POST/PUT /api/v1/documents/create endpoint
{
  "uuid": "10a32fae-1c61-4b2f-b5c7-4de80f4d6f1d",
  "pdf_url": "presigned_url or local file path",
  "description": "Example description 2",
  "document_data": { // arbitrary data coming from the user
    "customer_name": "Haroldo",
    "contract_value": "R$ 10.990,90"
  },
  "created_at": "2012-04-23T18:25:43.511Z"
}
```
