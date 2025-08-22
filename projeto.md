Descrição curta (GitHub repository description):
Portal Imobiliário “Habitae” — sistema para gestão de imóveis, anúncios, visitas, contratos e comissões. MySQL (DDL), seeds (Python+Faker), queries da parte II, triggers/procedures e documentação.

README.md (conteúdo sugerido — copie/cole no seu repositório)
Habitae — Portal Imobiliário

Sistema de exemplo para gestão de imóveis, anúncios, visitas, contratos e comissões.
Projeto acadêmico (TCC) com modelo conceitual, DDL MySQL, scripts de seed (Python + Faker), triggers/procedures e queries exigidas pela Parte II.

Status: Protótipo / Pronto para demonstração acadêmica
Tech stack: MySQL 8+, Python 3.10+ (scripts de geração de dados), Docker (opcional para MySQL), SQL scripts

Badges (sugestão)
![Status](https://img.shields.io/badge/status-prototype-yellow)
![MySQL](https://img.shields.io/badge/DB-MySQL-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Índice

Visão geral

Funcionalidades principais

Estrutura do repositório

Requisitos

Instalação rápida (MySQL local ou Docker)

Importar schema e seeds

Scripts importantes (triggers, procedures, queries)

População de dados (Python + Faker)

Como demonstrar a Parte II (queries a executar)

Contribuição e estilo de commits

Licença e contato

1. Visão geral

Habitae é um portal imobiliário didático que modela:

cadastro de proprietários, imóveis e endereços;

anúncios (listings) e agentes/corretores;

clientes interessados, agendamento de visitas;

contratos de venda/locação e cálculo/registro automático de comissões;

ordens de manutenção e fotos de imóvel.

O objetivo do repositório é fornecer um banco de dados completo (modelo, DDL, seeds e queries) para uso em apresentação de TCC.

2. Funcionalidades principais

Modelo lógico e físico (DDL) pronto para MySQL.

Triggers que: geram comissões automaticamente e marcam propriedades como inativas após venda.

Stored procedures exemplares (criar contrato com checagens transacionais).

Scripts de seed em Python usando Faker para gerar 50+ registros por tabela.

Conjunto de queries essenciais e avançadas (GROUP BY, window functions, subqueries, CTEs) para a Parte II.

Documentação e exemplos de export (dump.sql).

3. Estrutura do repositório (sugestão)
habitae-portal-imobiliario/
├─ README.md
├─ schema.sql                  # CREATE TABLE + INDEXES
├─ triggers_procs.sql          # triggers e stored procedures
├─ part2_queries.sql           # queries pedidas na Parte II (comentadas)
├─ seed/
│  ├─ requirements.txt
│  ├─ generate_csvs.py        # script Python que usa Faker para gerar CSVs
│  └─ csv/                    # CSVs gerados para LOAD DATA
├─ dump.sql                    # mysqldump (opcional, gerado após popular)
├─ ER-diagram.png              # diagrama ER (export do Workbench / draw.io)
├─ docs/
│  └─ modelo_conceitual.pdf
└─ .gitignore

4. Requisitos

MySQL 8.0+ (recomendado com InnoDB e utf8mb4)

Python 3.10+ (para gerar seeds)

(Opcional) Docker & docker-compose se quiser rodar MySQL rapidamente em container

5. Instalação rápida
Opção A — MySQL local

Criar banco:

mysql -u root -p -e "CREATE DATABASE habitae_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"


Importar schema:

mysql -u root -p habitae_db < schema.sql

Opção B — Docker (rápido)

Crie um docker-compose.yml com MySQL e execute:

version: '3.8'
services:
  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpass
      MYSQL_DATABASE: habitae_db
    ports:
      - "3306:3306"
    volumes:
      - ./mysql_data:/var/lib/mysql


Então:

docker-compose up -d
# esperar iniciar e então:
docker exec -i <container_name> mysql -u root -prootpass habitae_db < schema.sql

6. Importar schema e seeds
6.1 Rodar schema
mysql -u root -p habitae_db < schema.sql

6.2 Gerar CSVs com Faker (seed/generate_csvs.py)

Instalar dependências:

cd seed
python -m venv venv
source venv/bin/activate   # or venv\Scripts\activate on Windows
pip install -r requirements.txt


Gerar CSVs:

python generate_csvs.py
# gera arquivos em seed/csv/*.csv

6.3 Importar CSVs para MySQL (LOAD DATA INFILE)

Exemplo (ajuste caminhos/permissões):

LOAD DATA INFILE '/path/to/seed/csv/owners.csv'
INTO TABLE owners
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS (full_name, cpf_cnpj, email, phone);


Ou usar mysqlimport:

mysqlimport --local --fields-terminated-by=',' --ignore-lines=1 -u root -p habitae_db seed/csv/owners.csv

7. Scripts importantes

schema.sql — define todas as tabelas, PKs/FKs e índices.

triggers_procs.sql — contém:

trg_after_insert_contract (cria entrada em commissions),

trg_after_sale_contract (marca property como inativa / atualiza listings),

sp_create_contract (stored procedure transacional).

part2_queries.sql — queries comentadas que cobrem: SELECT/WHERE, JOINs, GROUP BY, subqueries, CTEs/window functions, triggers/procedures tests.

8. População de dados (Python + Faker)

O generate_csvs.py gera dados realistas (nomes, CPFs/CNPJs fictícios, endereços, valores, datas). Recomendações:

Geração parametrizável (n proprietários, n imóveis, n clients, n visits, etc).

Garantir integridade de FK: script gera CSVs na ordem correta ou gera inserts.sql com FKs respeitadas.

Forneço script que já contempla as quantidades sugeridas pelo TCC (ex.: 1000 properties, 1500 clients, 800 contracts).

9. Como demonstrar a Parte II / sugestões de execução na apresentação

Execute (e mostre prints):

Queries de agregação (vendas por corretor por mês).

Ranking de agentes (window function).

Visitas próximas e taxa de conversão (visita → contrato).

Triggers: inserir um contract e mostrar a comissão criada automaticamente.

Procedure: chamar CALL sp_create_contract(...) e demonstrar rollback em caso de conflito.

Exemplos já prontos em part2_queries.sql.

10. Contribuição e estilo

Fork → branch feature/<descrição> → PR.

Mensagens de commit: feat:, fix:, docs:, chore:.

Teste local antes de abrir PR (import schema, rodar seeds em DB de teste).

Se adicionar campos sensíveis, use dados fictícios.

11. Licença e contato

Projeto com licença MIT (arquivo LICENSE no repo).
Para dúvidas / apresentação: Victhor Félix — e-mail: seu-email@exemplo.com

Tags / topics sugeridos (GitHub)

real-estate, imobiliaria, mysql, sql, database, tcc, faker, python, docker

Exemplo rápido: snippet para schema.sql (trecho)
CREATE TABLE owners (
  id INT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  cpf_cnpj VARCHAR(20) UNIQUE,
  email VARCHAR(150),
  phone VARCHAR(30),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- ... restante do schema conforme especificado
