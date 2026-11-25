Extração e carga: Python (pandas + SQLAlchemy) lê 4 arquivos CSV e carrega no SQL Server (schema dbo).
Validação: compara contagem de linhas entre CSV e banco, e verifica integridade referencial (zero registros órfãos entre Fato_Estoque e Dim_Fornecedores).
dbt staging: as tabelas brutas são materializadas como views.
Mart: mart_estoque é uma tabela materializada no dbt com os joins necessários.
