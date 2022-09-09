use vacinacao;

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

#drop table agendamento;

delimiter $$
$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\PACIENTE.csv"
INTO TABLE paciente
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\TIPO_VACINA.csv"
INTO TABLE tipo_vacina
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\PUBLICO_ALVO.csv"
INTO TABLE publico_alvo
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\FORNECEDOR.csv"
INTO TABLE fornecedor
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\POSTO.csv"
INTO TABLE posto
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\SERVICO_SEGURANCA.csv"
INTO TABLE servico_seguranca
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\GERENTE.csv"
INTO TABLE gerente
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\ENFERMEIRA.csv"
INTO TABLE enfermeira
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\RECEPCIONISTA.csv"
INTO TABLE recepcionista
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\ESTOQUE.csv"
INTO TABLE estoque
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\CAMPANHA.csv"
INTO TABLE campanha
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\AGENDAMENTO.csv"
INTO TABLE agendamento
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\VACINA_REF.csv"
INTO TABLE vacina_ref
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\PEDIDO_VACINA.csv"
INTO TABLE pedido_vacina
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\ITEM_VACINA_ESTOQUE.csv"
INTO TABLE item_vacina_estoque
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\AGENDAMENTO_PACIENTE_VACINA.csv"
INTO TABLE agendamento_paciente_vacina
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\CAMPANHA_PUBLICO_ALVO.csv"
INTO TABLE campanha_publico_alvo
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\ITEM_PEDIDO_VACINA.csv"
INTO TABLE item_pedido_vacina
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

$$
LOAD DATA LOCAL INFILE "C:\\Users\\Pl4y\\Desktop\\Arquivos\\POSTO_REALIZA_CAMPANHA.csv"
INTO TABLE posto_realiza_campanha
FIELDS ENCLOSED BY '\ ' TERMINATED BY ','
;$$

