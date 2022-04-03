# Customer REST API

This API is developed to create, update and retrieve customer data from Salesforce and COSMOS DB.


## Assumptions

1. Salesforce and COSMOS operations have HTTP endpoint to perform create,update and retrieve customer Data.
2. Salesforce and COSMOS have health check API to check the servive availability.

## Run configuration for Mule Application

    -M-Denv=dev
	-M-Dkey=mulesoftmulesoftmulesoft

## Run configuration for Munit Test Cases

    -Denv=dev
	-Dkey=mulesoftmulesoftmulesoft

# REST API

The REST API to the example app is described below.

## Check API Health

### Request

`GET /health`

    URL: https://localhost:8082/api/health
	Methode: GET
	Header: 
		Authorization: Basic ZWNvbV91c2VyOmVjb21fcGFzc3dvcmQlMTIz

### Response

	HTTP/1.1 200 OK
	Content-Type: application/json; charset=UTF-8
	Content-Length: 20
	Date: Sun, 03 Apr 2022 17:47:07 GMT	
    {
		"status": "ok"
	}

## Create Customer Data

### Request

`POST /customers`

    URL: http://localhost:8081/api/customers
	Method: POST
	Header: 
		Authorization: Basic ZWNvbV91c2VyOmVjb21fcGFzc3dvcmQlMTIz
		Content-Type: application/json
	Body:
	{
    "personalInformation": {
        "firstName": "Ulrich",
        "lastName": "Nielsen",
        "companyName": "E-ffoc",
        "email": "ulrichN@effoc.com",
        "phone": "+494341927420"
    },
    "address": [
        {
            "street": "Steinbrueckstrasse",
            "houseNumber": 114,
            "city": "Nuremberg",
            "country": "Germany",
            "postalCode": "90408"
        }
    ]
	}

### Response

    HTTP/1.1 201 Created
    Content-Type: application/json; charset=UTF-8
	Content-Length: 123
	Date: Sun, 03 Apr 2022 19:20:16 GMT

    {
    "customerId": "b0cad2ed-364b-4c69-904c-e4d32c33ccfc",
    "success": true,
    "message": "Customer Created Successfully"
	}
### Error Response (Required Field not passed)

	HTTP/1.1 400 Bad Request
	Content-Type: application/json; charset=UTF-8; skipnullon="everywhere"
	Content-Length: 174
	Date: Sun, 03 Apr 2022 19:26:18 GMT
	Connection: close
	
	{
    "error": {
        "errorCode": "BAD_REQUEST",
        "errorDateTime": "2022-04-03T21:26:18",
        "errorMessage": "/personalInformation required key [firstName] not found"
    }
	}
## Update Customer Data

### Request

`PATCH /customers/{customer-id}`

    URL: http://localhost:8081/api/customers/{customer-id}
	Method: PATCH
	Header: 
		Authorization: Basic ZWNvbV91c2VyOmVjb21fcGFzc3dvcmQlMTIz
		Content-Type: application/json
	Body:
	{
    "personalInformation": {
        "firstName": "Ulrich",
        "lastName": "Nielsen",
        "companyName": "E-ffoc",
        "email": "ulrichN@effoc.com",
        "phone": "+494341927420"
    },
    "address": [
        {
            "street": "Steinbrueckstrasse",
            "houseNumber": 114,
            "city": "Nuremberg",
            "country": "Germany",
            "postalCode": "90408"
        }
    ]
	}
### Response

    HTTP/1.1 200 OK
    Content-Type: application/json; charset=UTF-8
	Content-Length: 123
	Date: Sun, 03 Apr 2022 19:13:18 GMT

    {
    "customerId": "4d4de7d6-7f5e-4778-9c70-babba6c25c55",
    "success": true,
    "message": "Customer Updated Successfully"
	}

## Retrieve Customer Data

### Request

`GET /customers/{customer-id}`

    URL: http://localhost:8081/api/customers/{customer-id}
	Method: GET
	Header: 
		Authorization: Basic ZWNvbV91c2VyOmVjb21fcGFzc3dvcmQlMTIz
		Content-Type: application/json
		
### Response

    HTTP/1.1 200 OK
    Content-Type: application/json; charset=UTF-8
	Content-Length: 264
	Date: Sun, 03 Apr 2022 19:22:01 GMT

    {
    "personalInformation": {
        "firstName": "Ulrich",
        "lastName": "Nielsen",
        "companyName": "E-ffoc",
        "email": "ulrichN@effoc.com",
        "phone": "+494341927420"
    },
    "address": [
        {
            "street": "Steinbrueckstrasse",
            "houseNumber": 114,
            "city": "Nuremberg",
            "country": "Germany",
            "postalCode": "90408"
        }
    ]
    }
