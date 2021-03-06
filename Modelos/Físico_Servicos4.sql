CREATE TABLE PESSOA (
    nome varchar(250),
    id_pessoa SERIAL PRIMARY KEY,
    cpf varchar(11),
    genero varchar(10),
    data_nascimento DATE
);

CREATE TABLE ALUNO (
    nome_responsavel VARCHAR(250)
)INHERITS (PESSOA);

CREATE TABLE PROFESSOR (
    ativado BOOLEAN
)INHERITS (PESSOA);

CREATE TABLE VENDEDOR (
    login VARCHAR(250),
    senha varchar(21)
)INHERITS (PESSOA);

CREATE TABLE SERVICO (
    id_servico SERIAL PRIMARY KEY,
    data DATE,
    desconto FLOAT,
    id_vendedor INT NOT NULL,
    id_aluno INT NOT NULL
);

CREATE TABLE GUARDERIA (
    vencimento DATE
)INHERITS (SERVICO);

CREATE TABLE ITEM_GUARDERIA (
    id_item_guarderia SERIAL PRIMARY KEY,
    valor FLOAT,
    id_guarderia INT NOT NULL,
    id_item INT NOT NULL
);

CREATE TABLE ITEM_ALUGUEL (
    id_item_aluguel SERIAL PRIMARY KEY,
    valor FLOAT,
    id_servico INT NOT NULL
);

CREATE TABLE ITEM_AULA (
    id_item_aula SERIAL PRIMARY KEY,
    valor FLOAT,
    id_servico INT NOT NULL,
    id_aula_marcada INT NOT NULL,
    id_professor INT NOT NULL
);

CREATE TABLE ITEM (
    id_item SERIAL PRIMARY KEY,
    nome VARCHAR(250),
    descricao VARCHAR(250)
);

CREATE TABLE PRANCHA (
    litragem FLOAT,
    altura FLOAT,
    des VARCHAR(250),
    id_tipo_prancha INT NOT NULL
);

CREATE TABLE AULA_MARCADA (
    id_aula_marcada SERIAL PRIMARY KEY,
    horario TIMESTAMP
);

CREATE TABLE TIPO_PRANCHA (
    id_tipo_prancha SERIAL PRIMARY KEY,
    descricao varchar(250)
);


CREATE TABLE CONTATO (
    contato_pessoa varchar(250),
    id_pessoa INT NOT NULL,
    id_tipo_contato INT NOT NULL
);


CREATE TABLE TIPO_CONTATO (
    descricao VARCHAR(250),
    id_tipo_contato SERIAL PRIMARY KEY
);
 

ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_1 FOREIGN KEY (id_vendedor) REFERENCES PESSOA (id_pessoa);
ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_2 FOREIGN KEY (id_aluno) REFERENCES PESSOA (id_pessoa);
ALTER TABLE ITEM_GUARDERIA ADD CONSTRAINT FK_ITEM_GUARDERIA_1 FOREIGN KEY (id_guarderia) REFERENCES SERVICO(id_servico);
ALTER TABLE ITEM_GUARDERIA ADD CONSTRAINT FK_ITEM_GUARDERIA_2 FOREIGN KEY (id_item) REFERENCES ITEM (id_item);
ALTER TABLE ITEM_ALUGUEL ADD CONSTRAINT FK_ITEM_ALUGUEL_0 FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico);
ALTER TABLE ITEM_AULA ADD CONSTRAINT FK_ITEM_AULA_1 FOREIGN KEY (id_servico) REFERENCES SERVICO (id_servico);
ALTER TABLE ITEM_AULA ADD CONSTRAINT FK_ITEM_AULA_2 FOREIGN KEY (id_aula_marcada) REFERENCES AULA_MARCADA (id_aula_marcada);
ALTER TABLE ITEM_AULA ADD CONSTRAINT FK_ITEM_AULA_3 FOREIGN KEY (id_professor) REFERENCES PESSOA (id_pessoa);
ALTER TABLE PRANCHA ADD CONSTRAINT FK_PRANCHA_0 FOREIGN KEY (id_tipo_prancha) REFERENCES TIPO_PRANCHA (id_tipo_prancha);
ALTER TABLE CONTATO ADD CONSTRAINT FK_CONTATO_1 FOREIGN KEY (id_pessoa) REFERENCES PESSOA (id_pessoa);
ALTER TABLE CONTATO ADD CONSTRAINT FK_CONTATO_2 FOREIGN KEY (id_tipo_contato) REFERENCES TIPO_CONTATO (id_tipo_contato);


