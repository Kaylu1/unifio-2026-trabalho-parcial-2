# 2º Trabalho Parcial — Sistema de Gerenciamento de Eventos

```
Nome: Caio Eduardo Sapata Bruno
RA: 270667
Link do repositório: https://github.com/Kaylu1/unifio-2026-trabalho-parcial-2
```

Projeto desenvolvido a partir do projeto-base do professor
(<https://github.com/srdelfino/unifio-2026-02-modelo>), utilizando **Java 21, Spring Boot,
JPA/Hibernate, Lombok e MySQL**.

---

## Entidades implementadas

Todas em `eventos/src/main/java/br/edu/unifio/eventos/model/`:

| Entidade | Atributos |
|---|---|
| `Evento` | `id`, `nome`, `descricao`, `dataInicio`, `dataFim`, `capacidade`, `status`, `categoria`, `local`, `palestrante` |
| `Categoria` | `id`, `nome`, `descricao` |
| `Local` | `id`, `nome`, `endereco`, `capacidade` |
| `Palestrante` | `id`, `nome`, `miniBio`, `email` |
| `Participante` | `id`, `nome`, `email`, `telefone` |
| `Inscricao` | `id`, `dataInscricao`, `status`, `evento`, `participante` |

Todos os `id` são `Integer` com geração automática
(`@GeneratedValue(strategy = GenerationType.IDENTITY)`).

## Relacionamentos

| Origem | Anotação | Destino | Cardinalidade |
|---|---|---|---|
| `Evento` | `@ManyToOne` | `Categoria` | Categoria 1 ─ N Evento |
| `Evento` | `@ManyToOne` | `Local` | Local 1 ─ N Evento |
| `Evento` | `@ManyToOne` | `Palestrante` | Palestrante 1 ─ N Evento |
| `Inscricao` | `@ManyToOne` | `Evento` | Evento 1 ─ N Inscricao |
| `Inscricao` | `@ManyToOne` | `Participante` | Participante 1 ─ N Inscricao |

```
Categoria ─┐
Local ─────┼── N Evento 1 ─── N Inscricao N ─── 1 Participante
Palestrante┘
```

Os relacionamentos foram mapeados pelo lado "muitos" (`@ManyToOne`), que é o lado dono e o
único previsto na lista de atributos do enunciado.

## Lombok

Todas as entidades usam `@Data`, `@NoArgsConstructor` e `@AllArgsConstructor`, dispensando a
escrita manual de getters, setters e construtores.

## Carga inicial — `import.sql`

Arquivo: `eventos/src/main/resources/import.sql` — executado automaticamente pelo Hibernate
(`spring.jpa.hibernate.ddl-auto=create`).

| Entidade | Registros |
|---|---:|
| `Categoria` | 5 |
| `Local` | 5 |
| `Palestrante` | 5 |
| `Participante` | 5 |
| `Evento` | 5 |
| `Inscricao` | 5 |
| **Total** | **30** |

Os dados são inseridos na ordem `Categoria → Local → Palestrante → Participante → Evento →
Inscricao`, respeitando as chaves estrangeiras. Cada comando ocupa uma única linha, que é o
formato exigido pelo leitor de `import.sql` do Hibernate. A tabela `local` aparece entre
crases (`` `local` ``) porque `LOCAL` é palavra-chave do MySQL.

## Como executar

Abra o projeto no **GitHub Codespaces** (o `.devcontainer` já instala Java 21, Maven e MySQL,
e cria o usuário `aluno`). Em seguida:

```bash
cd eventos
./mvnw spring-boot:run
```

Para conferir os dados:

```bash
mysql -u aluno -p'123@Mudar' eventos -e "SELECT COUNT(*) FROM categoria; SELECT COUNT(*) FROM \`local\`; SELECT COUNT(*) FROM palestrante; SELECT COUNT(*) FROM participante; SELECT COUNT(*) FROM evento; SELECT COUNT(*) FROM inscricao;"
```

## Observações

- O projeto-base não foi recriado: foram adicionados apenas o pacote `model` e o `import.sql`.
- Em `application.properties` foi acrescentada uma única linha,
  `spring.jpa.properties.hibernate.hbm2ddl.charset_name=UTF-8`, para que a acentuação do
  `import.sql` seja lida corretamente.
