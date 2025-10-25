use database mecânica



CREATE TABLE oficina.Cliente (
	idCliente SERIAL NOT NULL,
	Identificacao varchar(15) NOT NULL,
	Nome varchar(45) NOT NULL,
	Fone varchar(15) NOT NULL,
	Endereco varchar(45) NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY(idCliente)
);

CREATE UNIQUE INDEX i_cliente_identificacao ON oficina.Cliente (
	Identificacao
);


CREATE TABLE oficina.Veiculo (
	idVeiculo SERIAL NOT NULL,
	Placa varchar(12) NOT NULL,
	Tipo varchar(25) NOT NULL,
	Marca varchar(25) NOT NULL,
	Cor varchar(25) NOT NULL,
	Ano int2 NOT NULL,
	idCliente int4 NOT NULL,
  	CONSTRAINT fk_veiculo_cliente
    		FOREIGN KEY (idCliente)
    		REFERENCES oficina.Cliente (idCliente),
	CONSTRAINT pk_veiculo PRIMARY KEY(idVeiculo)
);

CREATE UNIQUE INDEX i_veiculo_placa ON oficina.Veiculo (
	Placa
);


CREATE TABLE oficina.Status (
	idStatus SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	CONSTRAINT pk_status PRIMARY KEY(idStatus)
);

CREATE UNIQUE INDEX i_status_descricao ON oficina.Status (
	Descricao
);


	CONSTRAINT pk_servico PRIMARY KEY(idServico)
);
CREATE TABLE oficina.Servico (
	idServico SERIAL NOT NULL,
	idVeiculo int4 NOT NULL,
	idStatus int2 NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	DataEncerramento timestamp,
	Observacao varchar(150),
  	CONSTRAINT fk_servico_veiculo
    		FOREIGN KEY (idVeiculo)
    		REFERENCES oficina.Veiculo (idVeiculo),
  	CONSTRAINT fk_servico_status
    		FOREIGN KEY (idStatus)
    		REFERENCES oficina.Status (idStatus),

CREATE TABLE oficina.Agendamento (
	idServico int4 NOT NULL,
	Descricao varchar(45) NOT NULL,
	DataAgendamento timestamp NOT NULL,
  	CONSTRAINT fk_agendamento_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
	CONSTRAINT pk_agendamento PRIMARY KEY(idServico)
);

CREATE TABLE oficina.Especialidade (
	idEspecialidade SMALLSERIAL NOT NULL,
	Descricao varchar(45) NOT NULL,
	CONSTRAINT pk_especialidade PRIMARY KEY(idEspecialidade)
);

CREATE UNIQUE INDEX i_especialidade_descricao ON oficina.Especialidade (
	Descricao
);


CREATE TABLE oficina.Mecanico (
	idMecanico SERIAL NOT NULL,
	cpf varchar(15) NOT NULL,
	Nome varchar(45) NOT NULL,
	Fone varchar(15) NOT NULL,
	Endereco varchar(45) NOT NULL,
	idEspecialidade int2 NOT NULL,
  	CONSTRAINT fk_mecanico_especialidade
    		FOREIGN KEY (idEspecialidade)
    		REFERENCES oficina.Especialidade (idEspecialidade),
	CONSTRAINT pk_mecanico PRIMARY KEY(idMecanico)
);

CREATE UNIQUE INDEX i_mecanico_cpf ON oficina.Mecanico (
	cpf
);


CREATE TABLE oficina.Equipe (
	idEquipe SERIAL NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	DataEncerramento timestamp,
	CONSTRAINT pk_equipe PRIMARY KEY(idEquipe)
);


CREATE TABLE oficina.EquipeMecanico (
	idEquipe int4 NOT NULL,
	idMecanico int4 NOT NULL,
  	CONSTRAINT fk_equipemecanico_equipe
    		FOREIGN KEY (idEquipe)
    		REFERENCES oficina.Equipe (idEquipe),
  	CONSTRAINT fk_equipemecanico_mecanico
    		FOREIGN KEY (idMecanico)
    		REFERENCES oficina.Mecanico (idMecanico),
	CONSTRAINT pk_EquipeMecanico PRIMARY KEY(idEquipe,idMecanico)
);


CREATE TABLE oficina.ServicoEquipe (
	idServico int4 NOT NULL,
	idEquipe int4 NOT NULL,
	Data timestamp NOT NULL DEFAULT now(),
	Avaliacao varchar(200) NOT NULL,
  	CONSTRAINT fk_servicoequipe_servico
    		FOREIGN KEY (idServico)
    		REFERENCES oficina.Servico (idServico),
  	CONSTRAINT fk_servicoequipe_equipe
    		FOREIGN KEY (idEquipe)
    		REFERENCES oficina.Equipe (idEquipe),
	CONSTRAINT pk_equipeservico PRIMARY KEY(idServico)
);

CREATE INDEX i_servicoequipe_equipe ON oficina.ServicoEquipe (
	idEquipe