require "httparty"

Dado("que eu informe o seguinte CEP:") do |table|
  @cep = table.hashes.first["cep"]
end

Quando("envio a requisição de consulta") do
  @response = HTTParty.get(
    "https://viacep.com.br/ws/#{@cep}/json/",
    headers: {
      "Content-Type": "application/json",
    },
  )
end

Então("recebo o seguinte retorno: {string} {tipo}") do |ibge, tipo|
  expect(@response.code).to eql 200
  if tipo.eql?("positivo")
    expect(@response["erro"]).to be_nil
    expect(@response["ibge"]).to eql ibge
    log(@response["ibge"])
  else
    expect(@response["erro"] = true)
    expect(@response["ibge"]).to be_nil
  end
end
