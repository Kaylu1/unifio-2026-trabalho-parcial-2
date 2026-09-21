-- ============================================================
-- Carga inicial de dados - 2o Trabalho Parcial (Sistema de Eventos)
-- 6 entidades x 5 registros = 30 registros
-- Ordem: Categoria -> Local -> Palestrante -> Participante -> Evento -> Inscricao
-- Obs.: cada comando deve ocupar uma unica linha (formato do import.sql)
-- ============================================================

-- Categoria (5 registros)
INSERT INTO categoria (id, nome, descricao) VALUES (1, 'Tecnologia', 'Eventos sobre desenvolvimento, inovação e TI');
INSERT INTO categoria (id, nome, descricao) VALUES (2, 'Negócios', 'Eventos de empreendedorismo, gestão e mercado');
INSERT INTO categoria (id, nome, descricao) VALUES (3, 'Saúde', 'Eventos voltados à saúde e qualidade de vida');
INSERT INTO categoria (id, nome, descricao) VALUES (4, 'Educação', 'Eventos sobre ensino, metodologias e formação');
INSERT INTO categoria (id, nome, descricao) VALUES (5, 'Sustentabilidade', 'Eventos sobre meio ambiente e práticas sustentáveis');

-- Local (5 registros)
INSERT INTO `local` (id, nome, endereco, capacidade) VALUES (1, 'Auditório Central', 'Av. Paulista, 1000 - São Paulo/SP', 500);
INSERT INTO `local` (id, nome, endereco, capacidade) VALUES (2, 'Centro de Convenções Marília', 'Rua XV de Novembro, 250 - Marília/SP', 800);
INSERT INTO `local` (id, nome, endereco, capacidade) VALUES (3, 'Sala Multiuso Bloco B', 'Rua das Acácias, 45 - Marília/SP', 120);
INSERT INTO `local` (id, nome, endereco, capacidade) VALUES (4, 'Teatro Municipal', 'Praça da República, 30 - Bauru/SP', 350);
INSERT INTO `local` (id, nome, endereco, capacidade) VALUES (5, 'Espaço Inovação UNIFIO', 'Av. Vicente Ferreira, 1278 - Ourinhos/SP', 200);

-- Palestrante (5 registros)
INSERT INTO palestrante (id, nome, mini_bio, email) VALUES (1, 'Helena Campos', 'Doutora em Ciência da Computação e pesquisadora em inteligência artificial', 'helena.campos@email.com');
INSERT INTO palestrante (id, nome, mini_bio, email) VALUES (2, 'Rafael Nogueira', 'Arquiteto de software com 15 anos de experiência em sistemas corporativos', 'rafael.nogueira@email.com');
INSERT INTO palestrante (id, nome, mini_bio, email) VALUES (3, 'Juliana Prado', 'Consultora de gestão e inovação para startups de tecnologia', 'juliana.prado@email.com');
INSERT INTO palestrante (id, nome, mini_bio, email) VALUES (4, 'Marcos Antunes', 'Médico e professor universitário na área de saúde pública', 'marcos.antunes@email.com');
INSERT INTO palestrante (id, nome, mini_bio, email) VALUES (5, 'Patrícia Lemos', 'Engenheira ambiental especialista em energias renováveis', 'patricia.lemos@email.com');

-- Participante (5 registros)
INSERT INTO participante (id, nome, email, telefone) VALUES (1, 'Bruno Carvalho', 'bruno.carvalho@email.com', '(14) 99801-2233');
INSERT INTO participante (id, nome, email, telefone) VALUES (2, 'Letícia Fontes', 'leticia.fontes@email.com', '(14) 99712-4456');
INSERT INTO participante (id, nome, email, telefone) VALUES (3, 'Gustavo Teixeira', 'gustavo.teixeira@email.com', '(14) 99655-7788');
INSERT INTO participante (id, nome, email, telefone) VALUES (4, 'Camila Duarte', 'camila.duarte@email.com', '(14) 99544-9911');
INSERT INTO participante (id, nome, email, telefone) VALUES (5, 'Rodrigo Mendes', 'rodrigo.mendes@email.com', '(14) 99433-6677');

-- Evento (5 registros) - cada evento usa uma categoria, um local e um palestrante existentes
INSERT INTO evento (id, nome, descricao, data_inicio, data_fim, capacidade, status, categoria_id, local_id, palestrante_id) VALUES (1, 'Semana de Inovação Tecnológica', 'Cinco dias de palestras e oficinas sobre tecnologias emergentes', '2026-04-06 08:00:00', '2026-04-10 18:00:00', 400, 'CONFIRMADO', 1, 1, 1);
INSERT INTO evento (id, nome, descricao, data_inicio, data_fim, capacidade, status, categoria_id, local_id, palestrante_id) VALUES (2, 'Fórum de Negócios Digitais', 'Encontro sobre transformação digital e novos modelos de negócio', '2026-05-12 09:00:00', '2026-05-12 17:30:00', 600, 'CONFIRMADO', 2, 2, 3);
INSERT INTO evento (id, nome, descricao, data_inicio, data_fim, capacidade, status, categoria_id, local_id, palestrante_id) VALUES (3, 'Workshop de Saúde Preventiva', 'Oficina prática sobre hábitos saudáveis e prevenção de doenças', '2026-06-03 14:00:00', '2026-06-03 18:00:00', 100, 'ABERTO', 3, 3, 4);
INSERT INTO evento (id, nome, descricao, data_inicio, data_fim, capacidade, status, categoria_id, local_id, palestrante_id) VALUES (4, 'Congresso de Educação Ativa', 'Três dias de debates sobre metodologias ativas de ensino', '2026-07-21 08:30:00', '2026-07-23 17:00:00', 300, 'ABERTO', 4, 4, 2);
INSERT INTO evento (id, nome, descricao, data_inicio, data_fim, capacidade, status, categoria_id, local_id, palestrante_id) VALUES (5, 'Encontro de Sustentabilidade', 'Painéis sobre energias renováveis e economia circular', '2026-08-15 09:00:00', '2026-08-15 16:00:00', 180, 'PLANEJADO', 5, 5, 5);

-- Inscricao (5 registros) - cada inscricao usa um evento e um participante existentes
INSERT INTO inscricao (id, data_inscricao, status, evento_id, participante_id) VALUES (1, '2026-03-15 10:20:00', 'CONFIRMADA', 1, 1);
INSERT INTO inscricao (id, data_inscricao, status, evento_id, participante_id) VALUES (2, '2026-03-18 15:45:00', 'CONFIRMADA', 1, 2);
INSERT INTO inscricao (id, data_inscricao, status, evento_id, participante_id) VALUES (3, '2026-04-02 09:10:00', 'PENDENTE', 2, 3);
INSERT INTO inscricao (id, data_inscricao, status, evento_id, participante_id) VALUES (4, '2026-05-08 18:30:00', 'CONFIRMADA', 3, 4);
INSERT INTO inscricao (id, data_inscricao, status, evento_id, participante_id) VALUES (5, '2026-06-25 11:05:00', 'CANCELADA', 4, 5);
