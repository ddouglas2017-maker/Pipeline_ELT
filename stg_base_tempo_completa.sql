select *
from {{ source('gestao_estoque', 'Base_Tempo_Completa') }}