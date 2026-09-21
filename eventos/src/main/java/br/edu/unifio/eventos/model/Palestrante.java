package br.edu.unifio.eventos.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "palestrante")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Palestrante {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "nome", nullable = false, length = 80)
	private String nome;

	@Column(name = "mini_bio", length = 255)
	private String miniBio;

	@Column(name = "email", nullable = false, length = 100)
	private String email;

}
