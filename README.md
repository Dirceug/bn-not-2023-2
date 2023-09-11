# PROJETO BACK-END

## Para iniciar o projeto (nome: back-end)

`npx @aka-demy/create-express-app`

- *Install package...?*: y
- *Name*: back-end
- *Language*: JavaScript
- *Template engine*: None
- *Package manager*: npm

## Mudando para a pasta do projeto

`cd back-end`

## Atualizando pacotes vulneráveis com atualizações de segurança

`npm audit fix --force`

## Instalando o Prisma como dependência de desenvolvimento

`npm install prisma --save-dev`

## Inicializando o Prisma com conector para MongoDB

`npx prisma init --datasource-provider mongodb`

- Instale a extensão Prisma no Visual Studio Code

## Gerando o cliente do Prisma

`npx prisma generate`

- Precisa ser executado **toda vez** que o arquivo `schema.prisma` for alterado