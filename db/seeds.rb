Plan.create!([
  {title: "Assembleia 5", description: "Plano simples permite criar 5 assembléias por ano", max_moot_per_year: 5},
  {title: "Assembleia 10", description: "Plano medio permite criar 10 assembléias por ano", max_moot_per_year: 10},
  {title: "Assembleia 20", description: "Plano pro permite criar 10 assembléias por ano", max_moot_per_year: 20}
])

SecurityQuestion.create!([
    {question: "Qual o nome do seu primeiro animal de estimação?"},
    {question: "Qual o nome da sua primeira professora?"},
    {question: "Qual o número do seu passaporte?"},
    {question: "Qual o nome da cidade em que você nasceu?"},
    {question: "Qual seu apelido de infância?"}
])