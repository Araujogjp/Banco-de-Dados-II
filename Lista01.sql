R -> Select Emp_RazaoSocial as Empresa, IdPagar as IdFatura, Pag_Fatura as Fatura, Pag_Descricao, Pag_Valor as Debito, 
Pag_DataVencimento as Vencimento, Pag_DataPagto, DateDiff(DD, Pag_DataVencimento, GETDATE()) as atraso from empresa, pagar
where fkempresa = idempresa and Pag_DataPagto is null;





b)	Use a tabela conta a receber para gerar um relatorio que mostre:
a.	O nome da empresa
b.	Quantidade de fatura ainda não pagar 
c.	Valor total ainda não pago
R -> Select Emp_RazaoSocial as Empresa, sum(Pag_Valor) as Total, Count(Pag_Fatura) as Qtd from empresa, Pagar where fkempresa = Idempresa 
Group By(Emp_RazaoSocial); 





C)	Gerar uma lista com o nome  e o total a pagar de todas as empresa que estão na tabela contas a pagar e NÃO estão na tabela do contas a receber.
R -> Select Emp_RazaoSocial as Empresa, sum(Pag_valor) as Total from empresa, pagar where FkEmpresa = Idempresa and Idempresa 
not in(Select Fkempresa from receber)
Group by Emp_RazaoSocial;






D)	Usando a mesma tabela, gere um relatorio que mostre
a.	O nome da empresa
b.	Quantidade de fatura ainda não pagar 
c.	Valor total ainda não pago
d.	Quantidade de fatura já pagas
e.	Valor ds faturas já pagas
R -> 
Select 
     Emp_RazaoSocial as Empresa,
     Count(Case When Pag_DataPagto is Null Then 1 End) as "Qtd em Aberto"
     Sum(Case When Pag_DataPagto is Null Then Pag_Valor Else 0 End) as "Em Aberto(R$)"
     Count(Case When Pag_DataPagto is Null Then 1 Else 0 End) as "Qtd Recebida"
     Sum(Case When Pag_DataPagto is Not null Then Pag_valor Else 0 End) as "Recebida(R$)"
From 
    empresa,
    pagar
Where 
    fkempresa = idempresa
Group by
    Emp_RazaoSocial 
