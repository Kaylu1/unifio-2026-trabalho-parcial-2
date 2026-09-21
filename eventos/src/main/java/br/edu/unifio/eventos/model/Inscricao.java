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
@Table(name = "inscricao")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Inscricao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "data_inscricao", nullable = false)
	private LocalDateTime dataInscricao;

	@Column(name = "status", nullable = false, length = 20)
	private String status;

	// Um Evento possui varias Inscricoes
	@ManyToOne
	@JoinColumn(name = "evento_id", nullable = false)
	private Evento evento;

	// Um Participante realiza varias Inscricoes
	@ManyToOne
	@JoinColumn(name = "participante_id", nullable = false)
	private Participante participante;

}
