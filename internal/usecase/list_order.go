package usecase

import (
	"fmt"

	"github.com/tiago-kimura/cleanArchitecture/internal/entity"
)

type ListOrdersUseCase struct {
	OrderRepository entity.OrderRepositoryInterface
}

func NewListOrdersUseCase(
	OrderRepository entity.OrderRepositoryInterface,
) *ListOrdersUseCase {
	return &ListOrdersUseCase{
		OrderRepository: OrderRepository,
	}
}

func (l *ListOrdersUseCase) Execute() ([]OrderOutputDTO, error) {
	var listOrders []OrderOutputDTO
	orders, err := l.OrderRepository.GetAll()
	if err != nil {
		fmt.Println("ERROR REPOSITORY: ", err)
		return listOrders, err
	}

	for _, order := range orders {
		dto := OrderOutputDTO{
			ID:         order.ID,
			Price:      order.Price,
			Tax:        order.Tax,
			FinalPrice: order.Price + order.Tax,
		}
		listOrders = append(listOrders, dto)
	}

	return listOrders, nil
}
