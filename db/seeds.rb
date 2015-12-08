User.create!([
  {email: "adirkuhn@gmail.com", encrypted_password: "$2a$10$7ZOxcp2n.npyC5xwN/MXbOphdraaSuVYol76sxUrGdWS1/HWK0RDy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2015-12-01 13:33:38", last_sign_in_at: "2015-11-17 02:28:26", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Adir Kuhn", is_admin: nil, cpf: "06015756950"},
  {email: "joao@gmail.com", encrypted_password: "$2a$10$AG0OHyKeTnOFyibvkbAJmO8X3vHtt54Iv0lsmVOW/RyETAeEyEEJm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-16 23:52:17", last_sign_in_at: "2015-11-16 23:52:17", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Joao Joao Joao", is_admin: nil, cpf: "01291299101"},
  {email: "xong-lee@gmail.com", encrypted_password: "$2a$10$nIGF8.pHBDlElzdc0yWhg.yFfCPmHpF9H5lB2.INw.B0irRvhCjIC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-17 00:43:15", last_sign_in_at: "2015-11-17 00:43:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Xong Lee", is_admin: nil, cpf: "01212301200"},
  {email: "xing-ling@gmail.com", encrypted_password: "$2a$10$pfXRxFnol.1W08q4uaGQfuX8bV.jdAn2rp8h1vdbR2qYo.82P1Epy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-17 00:46:15", last_sign_in_at: "2015-11-17 00:46:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Xing W. Ling", is_admin: nil, cpf: "19291299199"},
  {email: "fabianoneumann@gmail.com", encrypted_password: "$2a$10$g3SO0b0nv0idWEPyr8BKGe5d0MUdeVVHYISQsjcQkYIzhK7vJp2GS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-17 02:28:15", last_sign_in_at: "2015-11-17 02:28:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Fabiano", is_admin: nil, cpf: "12312312311"}
])
AdminInvite.create!([
  {token: "8e753851cc84f15bdf94e9d2ac55f3de6bb2d877", user_id: 1, company_id: 1, email: "joao@gmail.com", cpf: nil},
  {token: "cdbc620a4bca4d7f71b67da9a11cb2c37557d027", user_id: 1, company_id: 1, email: "marcos@gmail.com", cpf: nil}
])
Attachment.create!([
  {path_file_name: "original.jpg", path_content_type: "image/jpeg", path_file_size: 189676, path_updated_at: "2015-12-07 16:56:59", moot_id: 2},
  {path_file_name: "password", path_content_type: "application/octet-stream", path_file_size: 25598, path_updated_at: "2015-12-07 16:57:00", moot_id: 2},
  {path_file_name: "password.gz", path_content_type: "application/x-gzip", path_file_size: 13604, path_updated_at: "2015-12-07 16:57:00", moot_id: 2},
  {path_file_name: "pinto-armado-em-ponto-d--large-msg-1121446364-2.jpg", path_content_type: "image/jpeg", path_file_size: 38125, path_updated_at: "2015-12-07 16:57:00", moot_id: 2},
  {path_file_name: "teta.xls", path_content_type: "application/vnd.ms-excel", path_file_size: 570880, path_updated_at: "2015-12-07 17:16:03", moot_id: 2},
  {path_file_name: "wireframe_v.1.pdf", path_content_type: "application/pdf", path_file_size: 423017, path_updated_at: "2015-12-07 17:16:03", moot_id: 2}
])
Company.create!([
  {name: "JSS LTDA", site: "jss.com.br", cnpj: "01192042000101", plan_id: 1},
  {name: "XST", site: "xst.com.br", cnpj: "01199234000199", plan_id: 3}
])
CompanyAdmin.create!([
  {token: nil, active: nil, user_id: 1, company_id: 1},
  {token: nil, active: nil, user_id: 1, company_id: 2},
  {token: nil, active: nil, user_id: 6, company_id: 1},
  {token: nil, active: nil, user_id: 10, company_id: 1}
])
CompanyVoter.create!([
  {active: nil, user_id: 8, company_id: 1},
  {active: nil, user_id: 9, company_id: 1}
])
Moot.create!([
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: nil},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "Novo Socio", description: "Aseembleia para eleicao de novo socio senior", voting_start_at: "2016-01-05 13:49:00", voting_ending_at: "2016-02-05 13:49:00", company_id: 1},
  {title: "asdadasd", description: "asdasdasd", voting_start_at: "2015-12-05 14:07:00", voting_ending_at: "2015-12-05 14:07:00", company_id: 1},
  {title: "asdadasd", description: "asdasdasd", voting_start_at: "2015-12-05 14:07:00", voting_ending_at: "2015-12-05 14:07:00", company_id: 1},
  {title: "asdadasd", description: "asdasdasd", voting_start_at: "2015-12-05 14:07:00", voting_ending_at: "2015-12-05 14:07:00", company_id: 1},
  {title: "Pium", description: "doasidaoisdoasidoaiodaisdi", voting_start_at: "2015-12-05 14:17:00", voting_ending_at: "2015-12-05 14:17:00", company_id: 1},
  {title: "Xigomas", description: "Amsasa", voting_start_at: "2015-12-05 14:18:00", voting_ending_at: "2015-12-05 14:18:00", company_id: 1},
  {title: "Xigomas", description: "Amsasa", voting_start_at: "2015-12-05 14:18:00", voting_ending_at: "2015-12-05 14:18:00", company_id: 1},
  {title: "Pluralize", description: "Pluralize", voting_start_at: "2015-12-05 14:22:00", voting_ending_at: "2015-12-05 14:22:00", company_id: 1}
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
