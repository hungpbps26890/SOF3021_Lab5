package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "accounts")
public class Account implements Serializable {
	@Id
	@Column(columnDefinition = "varchar(50)")
	@NotEmpty(message = "{NotEmpty.account.username}")
	private String username;
	
	@Column(columnDefinition = "nvarchar(50)", name = "first_name")
	@NotEmpty(message = "{NotEmpty.account.firstName}")
	private String firstName;
	
	@Column(columnDefinition = "nvarchar(50)", name = "last_name")
	@NotEmpty(message = "{NotEmpty.account.lastName}")
	private String lastName;
	
	@Column(columnDefinition = "varchar(50)")
	@NotEmpty(message = "{NotEmpty.account.password}")
	private String password;
	
	@Column(columnDefinition = "varchar(150)")
	@NotEmpty(message = "{NotEmpty.account.email}")
	@Email(message = "{Email.account.email}")
	private String email;
	
	private String image;
	
	private Boolean activated = true;
	
	private Boolean admin = false;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
