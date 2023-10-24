//Comando para excluir a column family:
drop table cassandra.carros;

//1. Crie uma column family "carros" com os seguintes campos:
//marca(text), placa(text), modelo(text), cor(text), combustivel(set<text>), ano_fabric(int) e preco(decimal).
//Na chave primária, marca deve ser configurado como partition key e a placa como clustering key.

create table cassandra.carrosFamosos(
    marca text,
    placa text,
    modelo text,
    cor text,
    filmes set<text>,
    anoLancamento int,
    ultimoFabricado int,
    preco decimal,
    primary key(marca, placa)
);

//2. Faça oito inserções na column family. Ao terminar, tire um print da tela exibindo as linhas inseridas.

//1
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('Lotus', 'PPW30GR', 'Lotus Esprit', 'Azul Celeste', {'007: O Espião que me Amava', 'Uma Linda Mulher'}, 1976, 2004, 150000.00);

//2
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('Cadillac Miller', 'Ecto-1', 'Meteor Ambulance', 'Branco', {'Caça Fantasmas 1', 'Caça Fantasmas 2', 'Caça Fantasmas 3'}, 1931, 1979, 1500000.00);

//3
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('DMC', 'AAA0A01', 'DeLorean DMC-12', 'Aço Inoxidável',  {'De volta para o futuro', 'De volta para o futuro II', 'De volta para o futuro III'}, 1981, 1982, 100000.00);

//4
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('Aston Martin', 'BMT 216A', 'DB5 ', 'Prata',{'007 contra Goldfinger'}, 1963, 1965, 1000000.00);

//5
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('VolksWagen', '53', 'Fusca', 'Branco', {'Herbie'}, 1938, 2003, 70000.00);

//6
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('Chevrolet ', 'Desconhecida', 'Camaro', 'Amarelo',  {'Transformers', 'Transformers 2', 'Transformers 3', 'Transformers 4'}, 1967, 2002, 300000.00);

//7
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('BatMovel', 'Inexistente', 'Chevy Impala', 'Preto', {'Batman de Tim Burton', 'Btman Returns'}, 1989, 1992, 999999.99);

//8
insert into cassandra.carrosFamosos(marca, placa, modelo, cor, filmes, anoLancamento, ultimoFabricado, preco)
values('Ferrari', 'Desconhecida', '250GT', 'Vermelho', {'Curtindo a vida adoidado'}, 1950, 1969, 1500000.00);

//3. Faça três atualizações na tabela. Pelo menos uma delas deve contemplar uma alteração de combustível.

//Atualizando: De volta para o futuro
update cassandra.carrosFamosos
set filmes = filmes - {'De volta para o futuro', 'De volta para o futuro II', 'De volta para o futuro III'}
where marca = 'DMC' and placa = 'AAA0A01';

update cassandra.carrosFamosos
set filmes = filmes + {'Back to the Future', 'Back to the Future Part II', 'Back to the Future Part III'}
where marca = 'DMC' and placa = 'AAA0A01';

//Atualizando: Caça Fantasmas
update cassandra.carrosFamosos
set filmes = filmes - {'Caça Fantasmas 1', 'Caça Fantasmas 2', 'Caça Fantasmas 3'}
where marca = 'Cadillac Miller' and placa = 'Ecto-1';

update cassandra.carrosFamosos
set filmes = filmes + {'Ghostbusters (1984)', 'Ghostbusters II(1989)', 'Ghostbusters: Afterlife(2021)'}
where marca = 'Cadillac Miller' and placa = 'Ecto-1';

//Atualizando: Batman
update cassandra.carrosFamosos
set modelo = 'Usado Chassi do Chavy Impala'
where marca = 'BatMovel' and placa = 'Inexistente'; //Chame primário inteira.


//4. Exclua um dos registros.

delete preco  from cassandra.carrosFamosos
where marca = 'Lotus' and placa = 'PPW30GR';

delete preco  from cassandra.carrosFamosos
where marca = 'Cadillac Miller' and placa = 'Ecto-1';

delete preco  from cassandra.carrosFamosos
where marca = 'DMC' and placa = 'AAA0A01';

delete preco  from cassandra.carrosFamosos
where marca = 'Aston Martin' and placa = 'BMT 216A';

delete preco  from cassandra.carrosFamosos
where marca = 'BatMovel' and placa = 'Inexistente';

delete preco  from cassandra.carrosFamosos
where marca = 'VolksWagen' and placa = '53';

delete preco  from cassandra.carrosFamosos
where marca = 'Lotus' and placa = 'PPW30GR';

delete preco  from cassandra.carrosFamosos
where marca = 'Chevrolet' and placa = 'Desconhecida';

//5. Tire um print da tela mostrando as linhas da column family em seu estado atual.


//Reúna o arquivo de comandos e os prints de tela para entrega. Poste a tarefa até o início da aula da próxima segunda-feira, (23/10). Esta atividade será considerada para a nota de Participação e Assiduidade (PA).
