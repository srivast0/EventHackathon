package com.app.model;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


import lombok.Data;

@Data
@Entity
@Table(name = "EventRegister")
public class RegisterModel {
	
	@Id
	@GeneratedValue(generator = "regGen")
	@GenericGenerator(name="regGen", strategy = "com.app.gen.RegIdGen")
	@Column(name = "Reg_ID")
	private String regId;
	@Column(name = "Full_Name")
	private String fullname;
	
	@Column(name = "Mobile")
	private Long mobile;
	@Column(name = "Email")
	private String email;
	
	@Column(name = "Id_Card")
	@Lob
	private byte[] icardimg;
	@Column(name = "Reg_Type")
	private String rtype;
	@Column(name = "Number_Of_Tickets")
	private Integer tktNo;
	private String regDate;
	@Transient
	  public static String base64Image;
	  
	  @Transient
	  public String getBase64Image() {
	      base64Image = Base64.getEncoder().encodeToString(this.icardimg);
	      return base64Image;
	  }

	public void setBase64Image(String base64Image) {
		RegisterModel.base64Image = base64Image;
	}
}
