SWAGGER_MAIN=./cmd/server/main.go
DOCS_FILE=./docs/docs.go

.PHONY: swag clean-docs docs run run-application test

test:
	go test ./... -v

swag:
	swag init -g $(SWAGGER_MAIN)

clean-docs:
	powershell -Command "while (!(Test-Path './docs/docs.go')) { Start-Sleep -Milliseconds 200 }; $$lines = Get-Content './docs/docs.go'; $$filtered = $$lines | Where-Object { ($$_ -notmatch 'LeftDelim') -and ($$_ -notmatch 'RightDelim') }; $$filtered | Set-Content './docs/docs.go'"
	@echo Linhas com LeftDelim e RightDelim removidas com sucesso.
	
docs: swag clean-docs

run:
	cd cmd/server && go run main.go

run-application:
	go mod tidy
	make docs
	make run
