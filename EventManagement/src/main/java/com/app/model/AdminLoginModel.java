package com.app.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Data;

@Entity
@Table(name = "AdminLogin",uniqueConstraints= @UniqueConstraint(columnNames={"userName", "mobile"}) )
@Data
public class AdminLoginModel {
	
	@Id
	@GeneratedValue
	private Integer Uid;
	
	private String userName;
	private String passWord;
	private Long mobile;
}
