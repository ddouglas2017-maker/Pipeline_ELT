{{ config(materialized='table') }}

select
    -- Produto
    f.Produto_ID,
    f.Descricao_Item,

    -- Estoque
    f.Estoque_Atual,
    f.Custo_Medio,
    (f.Estoque_Atual * f.Custo_Medio) as Valor_Estoque,

    -- Documento
    f.Numero_NF,
    f.Data_Entrada_Compra,

    -- Fornecedor
    f.Fornecedor_ID,
    df.Nome_Fornecedor,
    df.Tipo_Fornecedor,
    df.Cidade as Cidade_Fornecedor,
    df.Estado as Estado_Fornecedor,
    df.Pais,
    df.Prazo_Medio_Dias,
    df.Fornecedor_Ativo,

    -- Local
    f.Local_Estoque,
    dl.Nome_Local_Estoque,
    dl.Tipo_Local,
    dl.Cidade as Cidade_Local,
    dl.Estado as Estado_Local,
    dl.Regiao,
    dl.Ativo as Local_Ativo,

    -- Tempo
    dt.Ano,
    dt.Mes,
    dt.Nome_Mes,
    dt.Trimestre,
    dt.Ano_Trimestre,
    dt.Semana_Ano,

    -- Faixas de cobertura
    f.CD1,
    f.CD7,
    f.CD15,
    f.CD30,
    f.CD60,
    f.CD90,
    f.CD120,
    f.CD150,
    f.CD180

from {{ ref('stg_fato_estoque') }} f

left join {{ ref('stg_dim_fornecedores') }} df
    on f.Fornecedor_ID = df.Fornecedor_ID

left join {{ ref('stg_dim_locais') }} dl
    on f.Local_Estoque = dl.Local_Estoque

left join {{ ref('stg_base_tempo_completa') }} dt
    on f.Data_Entrada_Compra = dt.Date