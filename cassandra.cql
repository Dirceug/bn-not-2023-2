//Criação da Column Family "users" no keyspace "cassandra"

create table cassandra.users(
    id int,
    country text,
    first_name text,
    last_name text,
    active boolean,
    primary key(id)
);

//Para retornar todos os registros da column Family
select * from cassandra.users;

//Inserção de registros na column family ('tabela') **4 registros**
insert into cassandra.users(id, country, first_name, active)
values(1, 'BR', 'Tonho', true);

insert into cassandra.users(id, country, first_name, active)
values(2, 'AR', 'Maria', false);

insert into cassandra.users(id, country, first_name)
values(3, 'BR', 'Joaquin');

insert into cassandra.users(id, country, first_name, active)
values(4, 'US', 'John', true);



************************************************************************
//Corrigindo erro meu, criei a column famoly sem last name:
insert into cassandra.users(id, country, first_name, activate) values(1, 'BR', 'Tonho', true);

insert into cassandra.users(id, country, first_name, activate)
values(2, 'AR', 'Maria', false);

insert into cassandra.users(id, country, first_name, activate)
values(3, 'BR', 'Joaquin' false);

insert into cassandra.users(id, country, first_name)
values(4, 'US', 'John');

//Cassandra só faz pesquisas por ID
select * from cassandra.users where id = 2;

select * from cassandra.users where country = 'BR';
//InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot execute this query
//as it might involve data filtering and thus may have unpredictable performance.
//If you want to execute this query despite the performance unpredictability, use ALLOW FILTERING"

select * from cassandra.users where country = 'BR' allow filtering;

//Comando para excluir a column family:
drop table cassandra.users;


//Recriando a column family:
create table cassandra.users(
    id int,
    country text,
    first_name text,
    last_name text,
    active boolean,
    primary key(country, id)
);

//neste exemplo: country é partition key (define os clusters em que os dados serã salvos)
                 id é clustering key (define o "ordenamento" dos dados)

//Para retornar todos os registros da column Family
select * from cassandra.users;

// Na pesquisa é necessário colocar todos os campos o partitionkey no where.
//Assim não funcionária:
select * from cassandra.users where id = 2;

//Precisamos fazer assim:
select * from cassandra.users country = 'AR';
//Ou assim:
select * from cassandra.users where id = 2 and country = 'AR';
select * from cassandra.users where id > 0 and country = 'AR'; //também funciona


//Criando um índice secundário em um campo para possibilitar consultas por exemplo:
create index idx_first_name on cassandra.users(first_name);

//Agora podemos fazer uma busca com base em first_name:
select * from cassandra.users where country = 'BR' and first_name = 'Tonho';

//Agora podemos buscar só com first name também:
select * from cassandra.users where first_name = 'Tonho';


//Obtendo informações sobre o keyspace("banco de dados")
describe cassandra;

Obtendo informações sobre uma column family:
describle cassandra.users;

//Alterando a column family para acrescentar novos campos:
alter table cassandra.users add
favs map<text, text>;
alter table cassandra.users add
interests set<text>;
alter table cassandra.users add
friends list<text>;


//Atualização de linha:
update cassandra.users
set last_name = 'Lópes'
where country = 'AR' and id = 2; //Chame primário inteira.

//Inserindo um mapa(equivalente a um JSON em outros bancos de dados).
update cassandra.users
set favs = {'food': 'torresmo', 'car': 'Caminhonete Rural'}
where country = 'BR' and id = 1;

update cassandra.users
set favs = {'food': 'hamburgue', 'sport': 'basebal', 'color':'green', 'luck_number': '7'}
where country = 'US' and id = 4;

//Trabalhando com um set//um set é um conjunto de itens, sem repetição:
update cassandra.users
set interests = {'moda', 'educação', 'viagens', 'moda', 'linguas' }
where country = 'BR' and id = 2;
//Por definição, conjunto não tem ítens duplicados portanto ele ignora o segundo 'moda'.
update cassandra.users
set interests = {'moda', 'educação', 'viagens', 'moda', 'linguas' }
where country = 'BR' and id = 3;


//Trabalhando com listas:
//Listas são semelhantes a conjuntos, mas permitem repetições
update cassandra.users
set friends = ['Zefa S.', 'Turíbio X.', 'Jupira B.', 'Turibio X.']
where country = 'BR' and id=1;


//Definição:
//map-> JSON {'chave': 'valor', 'chave':'valor', ...}
set          {'valor1', 'valor2', 'valor3', ...}
list-> array ['valor', 'valor', 'valor']

//aqui pode repetir

//Atualizando para incluir um novo Favorito(map)
update cassandra.users
set favs['drink'] = 'cerveja'
where country = 'BR' and id = 1;

//Excluindo um item de MAP:
delete favs['sport'] from cassandra.users
where country = 'US' and id = 4;

//Atualizando para incluir um novo interesse (set):
update cassandra.users
set interests = interests + {'esportes radicais', 'música'}
where country = 'BR' and id = 3;

//Atualizando para excluir um interesse (set):
update cassandra.users
set interests = interests - {'moda', 'viagens'}
where country = 'BR' and id = 3;

//Atualizando para incluir novos amigos(LIST):
update cassandra.users
set friends = friends + ['Gilvanete J.', 'Wesclerson R.']
where country = 'BR' and id = 1;

//Atualizando para excluir amigos(LIST):
*de acordo com a documentação, mas não está*
delete friends[3] from cassandra.users
where country = 'BR' and id = 1;
