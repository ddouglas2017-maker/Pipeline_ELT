select *
from {{ source('gestao_estoque', 'Dim_Fornecedores') }}