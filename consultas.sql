#Mostre o numero de doses das vacinas de gripe, HIV e Covid-19, junto
# com ao seu fornecedor e o tipo de vacina.

select v.descricao, v.num_doses,f.id_forn, f.razao_social, tv.tdesc
	from vacina_ref v join fornecedor f
    on v.cod_forn = f.id_forn
    join tipo_vacina tv
    on v.cod_tipo_vacina= tv.cod
    where v.descricao = 'Influenza' or v.descricao = 'Gripe' or v.descricao = 'HPV'
    ;
#Henrique UFRPE: Mostre todas as enfermeiras do sexo feminino junto a seus endereços e postos onde ela 
#trabalha nascidas antes de 1998
    
select e.nome,e.sexo, e.cep, e.complemento, p.nome
	from enfermeira e join posto p
    on e.cnpj_posto = p.pcnpj
	where e.sexo = 'M' and e.data_nasci < '1998-02-08'
    ;
    
#Mostrar todos os pacientes que foram vacinados no ano de 2022 junto com as suas informações 
#básicas de cpf e nome. Além disso também mostrar a data que foi vacinado junto ao nome da vacina que tomou  
  
	select pcpf as CPF, pnome as nome, adata as data_vacinação , descricao as vacina
from paciente join agendamento_paciente_vacina on cod_paciente = pcpf join agendamento on agendamento.seq = cod_agend 
join vacina_ref on cod_vacina = cod
where efetivado = 'TRUE' and  adata >= "2022-00-00";
