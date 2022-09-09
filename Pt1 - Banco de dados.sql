drop schema if exists vacinacao;

create schema vacinacao;
use vacinacao;

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

create table paciente(
	pcpf varchar(14) NOT NULL UNIQUE,
    pnome varchar(30),
    psexo enum ('H', 'M'),
    pcep varchar(9),
    pcomplemento varchar(20),
    pnumero varchar(8),
    pdata_nasci date,
    pidade integer(4),
    ppeso decimal,
    primary key (pcpf),
    check(ppeso > 0),
    check(pdata_nasci < DATE(SYSDATE()))
);

create table posto (
	pcnpj varchar(18) NOT NULL UNIQUE,
    nome varchar(30),
    cep varchar(9),
    complemento varchar(50),
    numero varchar(3),
    tipo varchar(20),
    primary key (pcnpj)
);

create table servico_seguranca (
	cpf varchar(14) NOT NULL UNIQUE,
    nome varchar(30),
    sexo enum ('H', 'M'),
    cep varchar(9),
    complemento varchar(50),
    numero varchar(3),
    data_nasci date,
    idade integer(3),
    peso decimal,
    funcional integer(5) NOT NULL UNIQUE,
    tipo varchar(20),
    cnpj_posto varchar(18) NOT NULL,
    primary key (cpf),
    foreign key (cnpj_posto) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
    check(peso > 0),
	check(data_nasci <  DATE(SYSDATE()))
);

create table gerente (
	cpf varchar(14) NOT NULL UNIQUE,
    nome varchar(30),
    sexo enum ('H', 'M'),
    cep varchar(9),
    complemento varchar(50),
    numero varchar(3),
    data_nasci date,
    idade integer(3),
    peso decimal,
    funcional integer(5) NOT NULL UNIQUE,
    setor varchar(5),
    cnpj_posto varchar(18) NOT NULL,
    primary key (funcional),
    foreign key (cnpj_posto) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
    check(peso > 0),
    check(data_nasci <  DATE(SYSDATE()))
);

create table enfermeira (
	cpf varchar(14) NOT NULL UNIQUE,
    nome varchar(30),
    sexo enum ('H', 'M'),
    cep varchar(9),
    complemento varchar(30),
    numero varchar(3),
    data_nasci date,
    idade integer(3),
    peso decimal,
    funcional integer(5) NOT NULL UNIQUE,
    coren varchar(20) NOT NULL UNIQUE,
    cnpj_posto varchar(18) NOT NULL,
    primary key (cpf),
    foreign key (cnpj_posto) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
	check(peso > 0),
    check(data_nasci <  DATE(SYSDATE()))
);

create table recepcionista (
	cpf varchar(14) NOT NULL UNIQUE,
    nome varchar(30),
    sexo enum ('H', 'M'),
    cep varchar(9),
    complemento varchar(20),
    numero varchar(3),
    data_nasci date,
    idade integer(3),
    peso decimal,
    funcional integer(5) NOT NULL UNIQUE,
    cnpj_posto varchar(18) NOT NULL,
    primary key (funcional),
    foreign key (cnpj_posto) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
	check(peso > 0),
    check(data_nasci < DATE(SYSDATE()))
);

create table estoque (
	cod varchar(5) NOT NULL UNIQUE,
    descricao varchar(30),
    qtd_total_vacinas integer(3),
    cod_posto varchar(18) NOT NULL UNIQUE,
    primary key (cod),
    foreign key (cod_posto) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
    check (qtd_total_vacinas > 0)
);

create table campanha (
	cod varchar(3) NOT NULL UNIQUE,
    nome varchar(30),
    doc_resultados varchar(30),
    obs varchar(20),
    primary key (cod)
);

create table publico_alvo(
	cod varchar(5) NOT NULL UNIQUE,
    descr varchar(100),
	idade_minima integer(1),
    idade_maxima integer(3),
    infantil boolean,
    primary key (cod),
    check(idade_minima >= 0),
    check(idade_maxima <= 150)
);

create table agendamento (
	seq varchar(5) NOT NULL UNIQUE,
	adata date ,
    hora time,
    efetivado enum ('TRUE', 'FALSE'),
    qtd_total integer(2),
    qtd_abert integer(2),
    funcional_enfer integer(5) NOT NULL,
    seq_dose varchar(5),
    da_atend date,
    hora_atend time,
    funcional_recep integer(5) NOT NULL,
    primary key (seq),
    foreign key (funcional_enfer) references enfermeira (funcional) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (funcional_recep) references recepcionista (funcional) ON DELETE CASCADE ON UPDATE CASCADE,
	check(da_atend <=  DATE(SYSDATE())),
	check(qtd_total > qtd_abert),
    check (adata >= da_atend)
);

create table fornecedor (
	id_forn varchar(5) NOT NULL UNIQUE,
    endereco varchar(30),
    razao_social varchar(30),
    primary key (id_forn)
);

create table tipo_vacina (
	cod varchar(6) NOT NULL UNIQUE,
    tdesc varchar(20),
    fabricante varchar(30),
    primary key (cod)
);

create table pedido_vacina (
	cod varchar(6) NOT NULL UNIQUE,
    pstatus enum ('espera', 'entregue'),
    data_entrega date,
    dt_pedido date,
    qtd_total integer(3),
    valor_total decimal,
    desconto_perc decimal,
    Valor_final decimal,
    funcional_gerente integer(5) NOT NULL,
    primary key (cod),
    foreign key (funcional_gerente) references gerente (funcional) ON DELETE CASCADE ON UPDATE CASCADE,
    check((pstatus = "entregue" and data_entrega >= dt_pedido) or pstatus = "espera"),
    check(valor_total > 0),
    check(valor_final > 0)
);

create table vacina_ref (
	cod varchar(6) NOT NULL UNIQUE,
    descricao varchar(30),
    cepa varchar(20),
    idade_minima integer(1),
    idade_maxima integer(3),
    valor_ref decimal,
    dosagem decimal,
    num_doses integer(2),
    cod_tipo_vacina varchar(6) NOT NULL,
    cod_forn varchar(5) NOT NULL,
    primary key (cod),
    foreign key (cod_tipo_vacina) references tipo_vacina (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_forn) references fornecedor (id_forn) ON DELETE CASCADE ON UPDATE CASCADE,
	check(idade_minima >= 0),
    check(idade_maxima < 150),
	check(valor_ref > 0)
);

create table item_pedido_vacina (
	cod_pedido varchar(6) NOT NULL,
    cod_vacina varchar(6) NOT NULL,
    seq varchar(5) NOT NULL UNIQUE,
    qtd integer(3),
    valor_unitario decimal,
    primary key (seq),
    foreign key (cod_pedido) references pedido_vacina (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_vacina) references vacina_ref(cod) ON DELETE CASCADE ON UPDATE CASCADE,
    check(qtd > 0),
    check(valor_unitario > 0)
);

create table item_vacina_estoque (
	cod_estoque varchar(5) not null,
    cod_vacina varchar(6) not null,
    seq varchar(5) NOT NULL UNIQUE,
    lote varchar(10),
    dt_fabricacao date,
    dt_validade date,
    qtd_atual integer(4),
    qtd_min integer(2),
    dt_entrada date,
    dt_saida date,
    primary key (seq),
    foreign key (cod_estoque) references estoque (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_vacina) references vacina_ref (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    check(dt_fabricacao <= dt_validade),
    check(qtd_atual >= qtd_min),
    check(qtd_min >= 0),
    check(dt_entrada <= dt_saida)
);

create table campanha_publico_alvo (
	cod_campanha varchar(3) NOT NULL,
    cod_publico varchar(5)  NOT NULL,
    foreign key (cod_campanha) references campanha (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_publico) references publico_alvo (cod) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (cod_campanha,  cod_publico)
);

create table posto_realiza_campanha (
	cnpj varchar(18) NOT NULL,
    cod_campanha varchar(8) NOT NULL,
    data_inicio date,
    data_fim date,
    foreign key (cnpj) references posto (pcnpj) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_campanha) references campanha (cod) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (cnpj, cod_campanha),
    check(data_inicio <= data_fim)
);

create table agendamento_paciente_vacina (
	cod_agend varchar(5) NOT NULL,
    cod_paciente varchar(14) NOT NULL,
    cod_estoque varchar(10) NOT NULL,
    cod_vacina varchar(8) NOT NULL,
    seq varchar(5) NOT NULL,
    foreign key (cod_agend) references agendamento (seq) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_paciente) references paciente (pcpf) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(seq) references item_vacina_estoque (seq) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (cod_agend, cod_paciente, cod_estoque, cod_vacina, seq)
);

