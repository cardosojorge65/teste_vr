#language: pt

Funcionalidade: Consulta de CEP
    Como uma aplicação de serviço
    Quero consultar um Código de Endereçamento Postal
    Para verificar se o mesmo é válido

    @consulta_cep
    Esquema do Cenario: Consulta de CEP
        Dado que eu informe o seguinte CEP:
            | cep           |
            | <cep_entrada> |
        Quando envio a requisição de consulta
        Então recebo o seguinte retorno: "<ibge_saida>" <tipo>

        Exemplos:
            | tipo     | cep_entrada | ibge_saida | erro_saida |
            | positivo | 09691200    | 3548708    |            |
            | negativo | 11111111    |            | true       |