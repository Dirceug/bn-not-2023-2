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
    imagem text,
    filmes set<text>,
    anoLancamento int,
    ultimoFabricado int,
    preco decimal,
    primary key(marca, placa)
);

//2. Faça oito inserções na column family. Ao terminar, tire um print da tela exibindo as linhas inseridas.

//1
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('Lotus', 'PPW30GR', 'Lotus Esprit', 'Azul Celeste', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj6ViMUrmhVIuYPruW6yhc_pGcKwBfvRj41RwE3U9D&s', {'007: O Espião que me Amava', 'Uma Linda Mulher'}, 1976, 2004, 150000.00);

//2
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('Cadillac Miller', 'Ecto-1', 'Meteor Ambulance', 'Branco', 'https://live.staticflickr.com/4732/39330413221_34d060c12d_b.jpg', {'Caça Fantasmas 1', 'Caça Fantasmas 2', 'Caça Fantasmas 3'}, 1931, 1979, 1500000.00);

//3
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('DMC', 'AAA0A01', 'DeLorean DMC-12', 'Aço Inoxidável', 'https://t2.tudocdn.net/617994?w=1920', {'De volta para o futuro', 'De volta para o futuro II', 'De volta para o futuro III'}, 1981, 1982, 100000.00);

//4
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('Aston Martin', 'BMT 216A', 'DB5 ', 'Prata', 'https://s2-gq.glbimg.com/UOazcFzcvF2pacuBXBN9uB2mwQ0=/0x0:680x453/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_71a8fe14ac6d40bd993eb59f7203fe6f/internal_photos/bs/2022/v/o/YjnRtzQeutKA5MDf1nSQ/007astonmartindb5.jpeg', {'007 contra Goldfinger'}, 1963, 1965, 1000000.00);

//5
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('VolksWagen', '53', 'Fusca', 'Branco', 'https://motorshow.com.br/wp-content/uploads/sites/2/2015/07/img-364437-herbie-ira-a-leilao-nos-eua-40.jpg', {'Herbie'}, 1938, 2003, 70000.00);

//6
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('Chevrolet ', 'Desconhecida', 'Camaro', 'Amarelo', 'https://www.autoo.com.br/fotos/2009/960_640/camaro_tranformers_960_640.jpg', {'Transformers', 'Transformers 2', 'Transformers 3', 'Transformers 4'}, 1967, 2002, 300000.00);

//7
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('BatMovel', 'Inexistente', 'Chevy Impala', 'Preto', 'https://revistacarro.com.br/wp-content/uploads/2021/03/Batmovel_5.jpg', {'Batman de Tim Burton', 'Btman Returns'}, 1989, 1992, 999999.99);

//8
insert into cassandra.carros(marca, placa, modelo, cor, imagem, filmes, anoLancamento, ultimoFabricado, preco)
values('Ferrari', 'Desconhecida', '250GT', 'Vermelho', 'https://media.gazetadopovo.com.br/2016/06/8847aaa94567145c457c291207be733d-gpMedium.png', {'Curtindo a vida adoidado'}, 1950, 1969, 1500000.00);

//3. Faça três atualizações na tabela. Pelo menos uma delas deve contemplar uma alteração de combustível.

update cassandra.carros
set filmes['drink'] = 'cerveja'
where marca = 'Lotus' and placa = 'PPW30GR';

//4. Exclua um dos registros.

//5. Tire um print da tela mostrando as linhas da column family em seu estado atual.

//Reúna o arquivo de comandos e os prints de tela para entrega. Poste a tarefa até o início da aula da próxima segunda-feira, (23/10). Esta atividade será considerada para a nota de Participação e Assiduidade (PA).
