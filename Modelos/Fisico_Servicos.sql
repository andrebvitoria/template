CREATE TABLE PESSOA (
    nome varchar(250),
    id_pessoa SERIAL PRIMARY KEY,
    cpf varchar(11),
    email varchar(250),
    celular varchar(12),
    telefone varchar(11),
    emergencia varchar(12),
    genero varchar(10)
);

CREATE TABLE ALUNO (
    id_aluno SERIAL PRIMARY KEY,
    FK_PESSOA_id_pessoa SERIAL
);

CREATE TABLE PROFESSOR (
    id_professor SERIAL PRIMARY KEY,
    FK_PESSOA_id_pessoa SERIAL
);

CREATE TABLE VENDEDOR (
    id_vendedor SERIAL PRIMARY KEY,
    FK_PESSOA_id_pessoa SERIAL
);

CREATE TABLE SERVICO (
    id_servico SERIAL PRIMARY KEY,
    data DATE,
    valor FLOAT,
    desconto FLOAT,
    FK_VENDEDOR_id_vendedor SERIAL,
    FK_ALUNO_id_aluno SERIAL
);

CREATE TABLE GUARDERIA (
    vencimento DATE,
    id_guarderia SERIAL PRIMARY KEY,
    FK_SERVICO_id_servico SERIAL
);

CREATE TABLE ALUGUEL (
    id_aluguel SERIAL PRIMARY KEY,
    FK_SERVICO_id_servico SERIAL
);

CREATE TABLE AULA (
    id_aula SERIAL PRIMARY KEY,
    FK_SERVICO_id_servico SERIAL
);

CREATE TABLE DETALHE_GUARDERIA (
    id_detalhe_guarderia SERIAL PRIMARY KEY,
    valor FLOAT,
    FK_GUARDERIA_id_guarderia SERIAL,
    FK_ITEM_id_item SERIAL
);

CREATE TABLE DETALHE_ALUGUEL (
    valor FLOAT,
    FK_ALUGUEL_id_aluguel SERIAL
);

CREATE TABLE DETALHE_AULA (
    id_detalhe_aula SERIAL PRIMARY KEY,
    valor FLOAT,
    FK_AULA_id_aula SERIAL,
    FK_AULA_MARCADA_id_aula_marcada SERIAL,
    FK_PROFESSOR_id_professor SERIAL
);

CREATE TABLE ITEM (
    id_item SERIAL PRIMARY KEY,
    nome VARCHAR(250),
    descricao VARCHAR(250)
);

CREATE TABLE PRANCHA (
    litragem FLOAT,
    altura FLOAT,
    FK_TIPO_PRANCHA_id_tipo_prancha SERIAL
);

CREATE TABLE AULA_MARCADA (
    id_aula_marcada SERIAL PRIMARY KEY,
    horario TIMESTAMP
);

CREATE TABLE TIPO_PRANCHA (
    id_tipo_prancha SERIAL PRIMARY KEY,
    descricao varchar(250)
);

 
ALTER TABLE ALUNO ADD CONSTRAINT FK_ALUNO_1
    FOREIGN KEY (FK_PESSOA_id_pessoa)
    REFERENCES PESSOA (id_pessoa);
 
ALTER TABLE PROFESSOR ADD CONSTRAINT FK_PROFESSOR_1
    FOREIGN KEY (FK_PESSOA_id_pessoa)
    REFERENCES PESSOA (id_pessoa);
 
ALTER TABLE VENDEDOR ADD CONSTRAINT FK_VENDEDOR_1
    FOREIGN KEY (FK_PESSOA_id_pessoa)
    REFERENCES PESSOA (id_pessoa);
 
ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_1
    FOREIGN KEY (FK_VENDEDOR_id_vendedor)
    REFERENCES VENDEDOR (id_vendedor);
 
ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_2
    FOREIGN KEY (FK_ALUNO_id_aluno)
    REFERENCES ALUNO (id_aluno);
 
ALTER TABLE GUARDERIA ADD CONSTRAINT FK_GUARDERIA_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico);
 
ALTER TABLE ALUGUEL ADD CONSTRAINT FK_ALUGUEL_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico);
 
ALTER TABLE AULA ADD CONSTRAINT FK_AULA_1
    FOREIGN KEY (FK_SERVICO_id_servico)
    REFERENCES SERVICO (id_servico);
 
ALTER TABLE DETALHE_GUARDERIA ADD CONSTRAINT FK_DETALHE_GUARDERIA_1
    FOREIGN KEY (FK_GUARDERIA_id_guarderia)
    REFERENCES GUARDERIA (id_guarderia);
 
ALTER TABLE DETALHE_GUARDERIA ADD CONSTRAINT FK_DETALHE_GUARDERIA_2
    FOREIGN KEY (FK_ITEM_id_item)
    REFERENCES ITEM (id_item);
 
ALTER TABLE DETALHE_ALUGUEL ADD CONSTRAINT FK_DETALHE_ALUGUEL_0
    FOREIGN KEY (FK_ALUGUEL_id_aluguel)
    REFERENCES ALUGUEL (id_aluguel);
 
ALTER TABLE DETALHE_AULA ADD CONSTRAINT FK_DETALHE_AULA_1
    FOREIGN KEY (FK_AULA_id_aula)
    REFERENCES AULA (id_aula);
 
ALTER TABLE DETALHE_AULA ADD CONSTRAINT FK_DETALHE_AULA_2
    FOREIGN KEY (FK_AULA_MARCADA_id_aula_marcada)
    REFERENCES AULA_MARCADA (id_aula_marcada);
 
ALTER TABLE DETALHE_AULA ADD CONSTRAINT FK_DETALHE_AULA_3
    FOREIGN KEY (FK_PROFESSOR_id_professor)
    REFERENCES PROFESSOR (id_professor);
 
ALTER TABLE PRANCHA ADD CONSTRAINT FK_PRANCHA_0
    FOREIGN KEY (FK_TIPO_PRANCHA_id_tipo_prancha)
    REFERENCES TIPO_PRANCHA (id_tipo_prancha);
