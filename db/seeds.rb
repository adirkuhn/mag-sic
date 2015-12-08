Company.create!([
  {name: "JSS LTDA", site: "jss.com.br", cnpj: "01192042000101", plan_id: 1},
  {name: "XST", site: "xst.com.br", cnpj: "01199234000199", plan_id: 3}
])
Moot.create!([
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Reuniao Mensal", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Resultados Assemblematicos", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1}
])
Plan.create!([
  {title: "Assembleia 5", description: "Plano simples permite criar 5 assembléias por ano", max_moot_per_year: 5},
  {title: "Assembleia 10", description: "Plano medio permite criar 10 assembléias por ano", max_moot_per_year: 10},
  {title: "Assembleia 20", description: "Plano pro permite criar 10 assembléias por ano", max_moot_per_year: 20}
])
Rulling.create!([
  {title: "Venda de acoes", objective: "vender 10% das acoes", description: "lorem ipsum dolor sit amet", moot_id: 2},
  {title: "Aquisição", objective: "Compra do Banco S/A", description: "lorem ipsum dolor sit amet", moot_id: 2}
])
VoterInvite.create!([
  {token: "941c5aaa09defc74cda478c05528867771f1c3bd", email: "xong-lee@gmail.com", cpf: nil, user_id: 6, company_id: 1},
  {token: "65ef025b08b3fd4db52b9940874e5a9c623eb1b8", email: "xing-ling@gmail.com", cpf: nil, user_id: 6, company_id: 1}
])
