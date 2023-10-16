CREATE TABLE livros (
    id serial not null,
    titulo varchar(200) not null, 
    autor varchar(200) not null, 
    editora varchar(50) not null, 
    preco decimal(5, 2) not null,
);