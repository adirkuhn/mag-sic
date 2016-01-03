CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "plans" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "max_moot_per_year" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "moots" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "description" text, "voting_start_at" datetime, "voting_ending_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "company_id" integer);
CREATE TABLE "company_admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "token" varchar, "active" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "company_id" integer);
CREATE UNIQUE INDEX "index_company_admins_on_user_id_and_company_id" ON "company_admins" ("user_id", "company_id");
CREATE TABLE "company_voters" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "active" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "company_id" integer);
CREATE UNIQUE INDEX "index_company_voters_on_user_id_and_company_id" ON "company_voters" ("user_id", "company_id");
CREATE TABLE "admin_invites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "token" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "company_id" integer, "email" varchar, "cpf" varchar(14));
CREATE UNIQUE INDEX "index_admin_invites_on_token_and_user_id_and_company_id" ON "admin_invites" ("token", "user_id", "company_id");
CREATE TABLE "voter_invites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "token" varchar, "email" varchar, "cpf" varchar(11), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer, "company_id" integer);
CREATE UNIQUE INDEX "index_voter_invites_on_token_and_user_id_and_company_id" ON "voter_invites" ("token", "user_id", "company_id");
CREATE INDEX "index_moots_on_company_id" ON "moots" ("company_id");
CREATE TABLE "rullings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "objective" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "moot_id" integer);
CREATE INDEX "index_rullings_on_moot_id" ON "rullings" ("moot_id");
CREATE TABLE "security_questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "question" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "companies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "site" varchar, "cnpj" varchar(14), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "plan_id" integer);
CREATE UNIQUE INDEX "index_companies_on_cnpj" ON "companies" ("cnpj");
CREATE TABLE "attachments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "path_file_name" varchar, "path_content_type" varchar, "path_file_size" integer, "path_updated_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "moot_id" integer, "rulling_id" integer);
CREATE INDEX "index_attachments_on_moot_id" ON "attachments" ("moot_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "name" varchar, "is_admin" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "cpf" varchar(11), "securityQuestion1_id" integer, "securityQuestion2_id" integer, "securityQuestion3_id" integer, "securityAnswer1" varchar, "securityAnswer2" varchar, "securityAnswer3" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_cpf" ON "users" ("cpf");
CREATE INDEX "index_users_on_securityQuestion1_id" ON "users" ("securityQuestion1_id");
CREATE INDEX "index_users_on_securityQuestion2_id" ON "users" ("securityQuestion2_id");
CREATE INDEX "index_users_on_securityQuestion3_id" ON "users" ("securityQuestion3_id");
CREATE INDEX "index_attachments_on_rulling_id" ON "attachments" ("rulling_id");
CREATE INDEX "index_companies_on_plan_id" ON "companies" ("plan_id");
INSERT INTO schema_migrations (version) VALUES ('20151016171023');

INSERT INTO schema_migrations (version) VALUES ('20151016171846');

INSERT INTO schema_migrations (version) VALUES ('20151016172245');

INSERT INTO schema_migrations (version) VALUES ('20151110153228');

INSERT INTO schema_migrations (version) VALUES ('20151110214201');

INSERT INTO schema_migrations (version) VALUES ('20151110215201');

INSERT INTO schema_migrations (version) VALUES ('201511110214202');

INSERT INTO schema_migrations (version) VALUES ('20151111205523');

INSERT INTO schema_migrations (version) VALUES ('20151116210326');

INSERT INTO schema_migrations (version) VALUES ('20151116215600');

INSERT INTO schema_migrations (version) VALUES ('20151117003017');

INSERT INTO schema_migrations (version) VALUES ('20151205045131');

INSERT INTO schema_migrations (version) VALUES ('20151207150240');

INSERT INTO schema_migrations (version) VALUES ('20151207151415');

INSERT INTO schema_migrations (version) VALUES ('20151208004037');

INSERT INTO schema_migrations (version) VALUES ('20151208004731');

INSERT INTO schema_migrations (version) VALUES ('20151219025459');

INSERT INTO schema_migrations (version) VALUES ('20151220033215');

INSERT INTO schema_migrations (version) VALUES ('20151228092428');

