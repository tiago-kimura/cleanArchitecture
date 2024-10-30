# cleanArchitecture

An application designed to register orders, calculate the total price, and return a list of orders. The main idea is to build a model that follows the best practices of Clean Architecture, making the system open to REST, gRPC, and GraphQL communication and save the payload in a RabbitMQ message broker.

## Running

### Prerequisites

- [Golang v1.22.5+](https://golang.org/) 
- [Docker]([https://www.docker.com/) - Docker is required to run the data base and broker message.

### Building docker image

To start the database and RabbitMQ services, run:

`docker-compose up -d`

### Running application

`cd cmd/ordersystem`
`go run main.go wire_gen.go`

### Executing the application with Rest 

In the project root, there is an 'api' folder containing examples to call the endpoints. You can click on 'Send Request' to test them.

- CreateOrder

![alt text](/docs/image-5.png)

- ListOrders

![alt text](/docs/image-4.png)

### Executing the application with gRPC

Using Insomnia API Client: 

- OrderService/CreateOrder

`{
	"id": "y",
	"price": 733.04,
	"tax": 5
}`

![alt text](/docs/image.png)

- OrderService/ListOrders

`{}`

![alt text](/docs/image-1.png)

### Executing the application with GraphQL

Open the browser and go to: http://localhost:8080/

- CreateOrder

`mutation createOrder {
  createOrder(input: {Id: "tr6544y", Price:185.77, Tax:15.33}) {
    Id
    Price
    Tax
    FinalPrice
  }
}`

![alt text](/docs/image-2.png)

- ListOrders

`query listOrders {
  listOrders{
    Id
    Price
    Tax
    FinalPrice
  }
}`

![alt text](/docs/image-3.png)

### Viewing the messages on HabbitMQ

Access RabbitMQ in browser at: http://localhost:15672/

![alt text](/docs/HabbitMQ.png)