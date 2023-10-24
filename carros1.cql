//Comando para excluir a column family:
drop table cassandra.carros;

//1. Crie uma column family "carros" com os seguintes campos:
//marca(text), placa(text), modelo(text), cor(text), combustivel(set<text>), ano_fabric(int) e preco(decimal).
//Na chave primária, marca deve ser configurado como partition key e a placa como clustering key.

create table cassandra.carros(
    marca text,
    placa text,
    modelo text,
    cor text,
    combustivel set<text>,
    ano_fabricacao int,
    preco decimal,
    primary key(marca, placa)
);

//2. Faça oito inserções na column family. Ao terminar, tire um print da tela exibindo as linhas inseridas.

//1
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('VolksWagen', 'AAA0A01', 'Fusca', 'Azul Celeste', {'gasolina'}, 1978, 15000.00);

//2
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('Chevrolet', 'BBB0B02', 'Chevete', 'Branco', {'gasolina'}, 1979, 10000.00);

//3
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('Fiat', 'CCC0C03', 'Fusca', 'Amarelo', {'gasolina'}, 1977, 1.99);

//4
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('VolksWagen', 'DDD0D04', 'Gol', 'Vermelho', {'alcool'}, 1988, 12000.00);

//5
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('Fiat', 'EEE0E05', 'Uno', 'Cinza', {'gasolina'}, 1995, 12000.00);

//6
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('VolksWagen', 'FFF0F06', 'Golf', 'Preto', {'gasolina'}, 1997, 25000.00);

//7
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('Chevrolet', 'GGG0G07', 'Monza', 'Azul Celeste', {'gasolina'}, 1984, 15000.00);

//8
insert into cassandra.carros(marca, placa, modelo, cor, combustivel, ano_fabricacao, preco)
values('Chevrolet', 'HHH0H08', 'Kadet', 'Verde', {'alcool'}, 1988, 9000.00);

//3. Faça três atualizações na tabela. Pelo menos uma delas deve contemplar uma alteração de combustível.

//Para os combustiveis usar este model:
//Atualizando para incluir um novo interesse (set):
update cassandra.users
set combustivel = combustivel -  {'gasolina'}
where marca = 'VolksWagen' and placa = 'FFF0F06';

update cassandra.users
set combustivel = combustivel +  {'alcool'}
where marca = 'VolksWagen' and placa = 'FFF0F06';

//Atualizando para incluir um novo interesse (set):
update cassandra.users
set combustivel = combustivel -  {'gasolina'}
where marca = 'Fiat' and placa = 'CCC0C03';

update cassandra.users
set combustivel = combustivel +  {'alcool'}
where marca = 'Fiat' and placa = 'CCC0C03';


//Para atualizar um campo normal, este modelo:
//Atualização de linha:
update cassandra.users
set preco = 2.99
where marca = 'Fiat' and placa = 'CCC0C03';


//4. Exclua um dos registros.= Essa eu não consegui fazer direito. Fiz gambiarra excluindo campo por campo depois de pesquisar a documentação:
delete preco  from cassandra.carros
where marca = 'Chevrolet' and placa = 'HHH0H08';

//5. Tire um print da tela mostrando as linhas da column family em seu estado atual.

//Reúna o arquivo de comandos e os prints de tela para entrega. Poste a tarefa até o início da aula da próxima segunda-feira, (23/10). Esta atividade será considerada para a nota de Participação e Assiduidade (PA).
