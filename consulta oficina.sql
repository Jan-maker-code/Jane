CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE Cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE Veiculo (
  id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
  modelo VARCHAR(50),
  placa VARCHAR(10),
  ano INT,
  id_cliente INT,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Funcionario (
  id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  cargo VARCHAR(50),
  salario DECIMAL(10,2)
);

CREATE TABLE Servico (
  id_servico INT PRIMARY KEY AUTO_INCREMENT,
  descricao TEXT,
  data_servico DATE,
  id_veiculo INT,
  id_funcionario INT,
  valor DECIMAL(10,2),
  FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
  FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);

CREATE TABLE Peca (
  id_peca INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  preco DECIMAL(10,2),
  estoque INT
);

CREATE TABLE Servico_Peca (
  id_servico INT,
  id_peca INT,
  quantidade INT,
  PRIMARY KEY (id_servico, id_peca),
  FOREIGN KEY (id_servico) REFERENCES Servico(id_servico),
  FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);