select *
from {{ source('gestao_estoque', 'Fato_Estoque') }}