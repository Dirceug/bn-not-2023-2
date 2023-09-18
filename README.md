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

## Exibindo os dados cadastrados com o Prisma Studio
'npx prisma studio'
* Deve ser executado em um segundo terminal enquanto o projeto está sendo executado no primeiro.

## Craindo um novo CRUD a partir de outro já existente

### _Controller_

1. Copie o arquivo do _controller_ e renomeie-o de aconco com a nova entidade para o qual será feito o novo CRUD
2. Substitua('Ctrl+H) todas as ocorrências de 'prisma.xxxx' por prisma.yyyy, onde 'xxxx' é o nome da entidade antiga e 'yyyy' é o nome da entidade nova.
3. Verifique, no método 'retrieveAll()' do _controller_, se há campos sendo usados no _orderBy_ e substitua-os conforme a nova entidade.

### _Route_
1. Copie o arquivo do _route ('Ctrl+C Ctrl+V') e renomeie-o de acordo com a nova entidade para a qual está sendo feito o CRUD.
2. Na linha de 'import' do _controller_, substitua o nome da entidade antiga pelo nome da entidade nova.


### 'app.js'
1. Na parte inferior do arquivo, ne seção de rotas, copie e cole as duas linhas correspondentes a uma rota já existente e faça as substituições necessárias.
2. Serão 4 substituições, 2 em cada linha

agora vamos para o terminal:
cd back-end
npm run dev

Tipo de deta no Mongo:
data e horário:
1989-07-18T00:00:00Z
aaaa-mm-ddThh:mm:ssZ (T significa que é minutos após, e Z indica horário de greenwich - para colocar horário brasileiro, coloque-03:00)
1989-07-18T00:00:00-03:00