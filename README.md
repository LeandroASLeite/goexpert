# 📦 GoExpert API

API RESTful desenvolvida em Go para gerenciamento de produtos e
usuários, com autenticação JWT e documentação Swagger.

------------------------------------------------------------------------

## 🚀 Como executar o projeto

### Pré-requisitos

Certifique-se de ter instalado:

-   [Go](https://go.dev/dl) (versão 1.20 ou superior)

-   [Make](https://www.gnu.org/software/make/)

    -   No Windows, instale via
        [Chocolatey](https://chocolatey.org/install):

        ``` bash
        choco install make
        ```

-   [Swag CLI](https://github.com/swaggo/swag) para gerar a documentação
    Swagger:

    ``` bash
    go install github.com/swaggo/swag/cmd/swag@latest
    ```

------------------------------------------------------------------------

### ▶️ Execução

Clone o repositório e execute:

``` bash
make run-application
```

Esse comando realiza:

-   `go mod tidy` → organiza as dependências\
-   `swag init` → gera a documentação Swagger\
-   `clean-docs` → remove delimitadores indesejados\
-   `go run` → inicia o servidor

------------------------------------------------------------------------

## 📚 Documentação da API

Acesse a documentação Swagger em:\
👉 <http://localhost:8000/docs/index.html>

------------------------------------------------------------------------

## 🔐 Autenticação

A API utiliza autenticação via **Bearer Token (JWT)**.

### Gerar token

**Endpoint:**

    POST /users/generate_token
    Content-Type: application/json

**Body:**

``` json
{
  "email": "seu@email.com",
  "password": "sua_senha"
}
```

### Usar token

Inclua o token no header das requisições protegidas:

    Authorization: Bearer <seu-token>

------------------------------------------------------------------------

## 📁 Estrutura do projeto

    ├── cmd/server          # Ponto de entrada da aplicação
    ├── internal
    │   ├── dto             # Data Transfer Objects
    │   ├── entity          # Modelos de domínio
    │   ├── infra
    │   │   ├── database    # Repositórios e persistência
    │   │   └── webserver   # Handlers HTTP
    ├── docs                # Arquivos gerados pelo Swagger
    ├── Makefile            # Automação de tarefas
    └── go.mod              # Gerenciador de dependências

------------------------------------------------------------------------

## 🧪 Testes

Execute os testes com:

``` bash
make test
```

------------------------------------------------------------------------

## 🛠 Endpoints principais

-   `POST /products` → Criar produto\
-   `GET /products` → Listar produtos\
-   `GET /products/{id}` → Buscar produto por ID\
-   `PUT /products/{id}` → Atualizar produto\
-   `DELETE /products/{id}` → Remover produto\
-   `POST /users` → Criar usuário\
-   `POST /users/generate_token` → Gerar token JWT

------------------------------------------------------------------------

## 📌 Observações

-   O arquivo `.env` deve estar presente em `cmd/server/.env` com as
    variáveis necessárias.\
-   O banco de dados utilizado é **SQLite (`test.db`)**.\
-   A autenticação é obrigatória para todos os endpoints de `/products`.

------------------------------------------------------------------------

Feito com 💙 em Go.
