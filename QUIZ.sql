Luiz Otavio Marques Gios 
Tel: (11) 95163-3903 
linkedln:  otavio.gios


QUIZ
A partir das informações acima

modelar as tabelas, com colunas e relacionamentos, usando o padrão da modelagem entidade relacionamento:
definir as chaves primárias de cada tabela
montar as consultas nas tabelas para obter as seguintes respostas:

/*MODELO DE DADOS EM ANEXO NO REPOSITÓRIO .PNG(FOTO)*/


qual seller que tem mais itens disponíveis para venda em nossos sites?

			SELECT COUNT (a.id_partner), b.nome
			FROM item a 
				INNER JOIN PARCEIROS b	ON a.id_partner = b.id_partner
			WHERE ROWNUM = 1
			GROUP BY b.nome	 
			ORDER BY DESC;


qual o seller que mais vende? E qual cliente que mais compra?

			SELECT COUNT (a.id_partner), b.nome
			FROM pedido a 
				INNER JOIN parceiros b	ON a.id_partner = b.id_partner
			WHERE ROWNUM = 1
			GROUP BY b.nome	 
			ORDER BY DESC;


qual é o total ($) de venda aprovada no último mês?


			SELECT SUM (valor_total) 
			FROM pedidos
			WHERE data_venda BETWEEN ‘01/03/2018’ AND ‘31/03/2018’


qual seller que tem o maior ticket médio? e o menor?

N/D

qual o seller que mais atrasa para entregar no RJ nos últimos 30d?

			SELECT a.nome, 
					(SELECT TOP (1) DATEDIFF (DAY, data_venda, data_entrega) OVER SYSDATETIME ()-30 as intervalo_atraso
					FROM pedidos b
					WHERE a.id_partner = b.id_partner
					AND UF = ‘RJ’)  as atraso_dias
			FROM parceiros a


qual o seller que gera mais dinheiro para a B2W?
			SELECT a.nome, 
							(SELECT SUM (valor_comissao)
							FROM site b 
							WHERE a.id_partner = b.id_partner AND ROWNUM = 1
							ORDER BY DESC;)
			FROM PARCEIROS a	 
			
			
Tarefa extra
Se suas tabelas tiverem bilhões de registros, o que você faria para a consulta de pedidos e itens de um parceiro não ficar lenta?

		/*Construção de um metadados, via Pyton ou até mesmo utilizando um script agendado PL/SQL*/

© 2018 GitHub, Inc.