<img width="976" height="330" alt="image" src="https://github.com/user-attachments/assets/c084214c-7787-40a7-aab2-c506302a1cfc" /> 
A) Select Emp_RazaoSocial as Empresa, IdPagar as IdFatura, Pag_Fatura as Fatura, Pag_Descricao, Pag_Valor as Debito, 
Pag_DataVencimento as Vencimento, Pag_DataPagto, DateDiff(DD, Pag_DataVencimento, GETDATE()) as atraso from empresa, pagar
where fkempresa = idempresa and Pag_DataPagto is null;





<img width="831" height="276" alt="image" src="https://github.com/user-attachments/assets/52d7a7fa-04c2-421c-9d6c-e971250a3ac7" />
B) Select Emp_RazaoSocial as Empresa, sum(Pag_Valor) as Total, Count(Pag_Fatura) as Qtd from empresa, Pagar where fkempresa = Idempresa 
Group By(Emp_RazaoSocial); 





<img width="746" height="71" alt="image" src="https://github.com/user-attachments/assets/4dce172b-1781-4a3a-84d0-e532a2050642" />
C) Select Emp_RazaoSocial as Empresa, sum(Pag_valor) as Total from empresa, pagar where FkEmpresa = Idempresa and Idempresa 
not in(Select Fkempresa from receber)
Group by Emp_RazaoSocial;






<img width="906" height="380" alt="image" src="https://github.com/user-attachments/assets/c4d8571f-f3e7-4011-a1b6-5413fc919ae2" />
D) 
Select 
	Emp_RazaoSocial As Empresa, 
	Count(Case When Pag_DataPagto is Null Then 1 End) as "Qtd em Aberto",
	Sum(Case When Pag_DataPagto is Null Then Pag_Valor Else 0 End) As "Em Aberto(R$)",
	Count(Case When Pag_DataPagto is Not Null Then 1 End) As "Qtd Recebida",
	Sum(Case When Pag_DataPagto is Not Null Then Pag_Valor Else 0 End) As "Recebida"
From empresa, 
	 Pagar
Where
	fkempresa = idempresa
Group by
	Emp_RazaoSocial;
