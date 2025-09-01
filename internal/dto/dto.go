package dto

type CreateProductInputDTO struct {
	Name  string  `json:"name"`
	Price float64 `json:"price"`
}

type CreateUserInputDTO struct {
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

type GetJWTInputDTO struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}
