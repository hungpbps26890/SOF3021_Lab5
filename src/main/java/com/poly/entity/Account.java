package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@Column(columnDefinition = "varchar(50)")
	private String username;
	
	@Column(columnDefinition = "nvarchar(50)")
	private String firstName;
	
	@Column(columnDefinition = "nvarchar(50)")
	private String lastName;
	
	@Column(columnDefinition = "varchar(50)")
	private String password;
	
	@Column(columnDefinition = "varchar(150)")
	private String email;
	
	private String photo;
	
	private Boolean activated = true;
	
	private Boolean admin = false;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
