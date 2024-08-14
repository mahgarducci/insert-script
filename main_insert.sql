INSERT INTO [dbo].[tb_paulinia_estoque]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1.2 nome da escola] as nome_escola
      ,[2.2 - foi realizada a contagem do estoque (apenas as sextas-fei] as contagem_estoque
  FROM [DADOS].[dbo].[paulinia_nutricao_estoque];


INSERT INTO [dbo].[tb_vitoria_supervisao]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1.1 - posto] as posto
      ,[1.2 - cidade] as cidade
      ,[1.3 - tipo da visita] as tipo_visita
      ,[3.3 - satisfacao do cliente] as satisfacao_cliente
  FROM [DADOS].[dbo].[vitoria_supervisao];


INSERT INTO [dbo].[tb_vitoria_nutricao]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1.1 - posto] as posto
      ,[1.2 - cidade] as cidade
      ,[2.1 - estão utilizando uniforme completo?] as uniforme_completo
      ,[2.2 - os uniformes estão limpos?] as uniforme_limpo
      ,[7.2 - a aceitação dos alunos está satisfatória?] as satisfacao_alunos
  FROM [DADOS].[dbo].[vitoria_nutricao];


INSERT INTO [dbo].[tb_paulinia_ope_supervisao]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1.1 - posto] as posto
      ,[1.2 - tipo da visita] as tipo_visita
      ,[2.1 - limpeza geral] as limpeza_geral
      ,[4.1 - estoques] estoques
      ,[4.2 - equipamentos] equipamentos
      ,[6.1 - satisfação do cliente] satisfacao_cliente
  FROM [DADOS].[dbo].[paunilia_ope_supervisao];


INSERT INTO [dbo].[tb_paulinia_ope_limpeza]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[Local da análise/inspeção] local_analise
      ,[1 - setor] setor
      ,[2 - limpeza geral] limpeza_geral
  FROM [DADOS].[dbo].[paulinia_ope_limpeza];

  
INSERT INTO [dbo].[tb_paulinia_preparo]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1.1 - nome da escola] nome_escola
      ,[2.1 refeição] refeicao
  FROM [DADOS].[dbo].[paulinia_nutricao_preparo];

  
INSERT INTO [dbo].[tb_paulinia_inicio]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1 - posto de trabalho] posto_trabalho
      ,[1.2 - o estoque possui todos os produtos para cardápio do dia] estoque
  FROM [DADOS].[dbo].[paulinia_nutricao_inicio];

  
INSERT INTO [dbo].[tb_paulinia_fim]
SELECT 
	   CONVERT(date, [Data], 103) as Data
      ,CONVERT(time, [Hora], 108) as Hora
      ,[Nome]
      ,[Empresa/filial]
      ,[1 - posto de trabalho] posto_trabalho
      ,[higienização] higienizacao
  FROM [DADOS].[dbo].[paulinia_nutricao_fim];