package br.edu.unifio.eventos.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "evento")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "nome", nullable = false, length = 100)
	private String nome;

	@Column(name = "descricao", length = 255)
	private String descricao;

	@Column(name = "data_inicio", nullable = false)
	private LocalDateTime dataInicio;

	@Column(name = "data_fim", nullable = false)
	private LocalDateTime dataFim;

	@Column(name = "capacidade", nullable = false)
	private Integer capacidade;

	@Column(name = "status", nullable = false, length = 20)
	private String status;

	// Uma Categoria possui varios Eventos
	@ManyToOne
	@JoinColumn(name = "categoria_id", nullable = false)
	private Categoria categoria;

	// Um Local recebe varios Eventos
	@ManyToOne
	@JoinColumn(name = "local_id", nullable = false)
	private Local local;

	// Um Palestrante participa de varios Eventos
	@ManyToOne
	@JoinColumn(name = "palestrante_id", nullable = false)
	private Palestrante palestrante;

}
