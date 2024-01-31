package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.model.MailInfo;
import com.poly.service.MailerService;
import com.poly.utils.MailerHelper;

@Controller
public class MailerController {

	@Autowired
	MailerService mailerService;

	@GetMapping("mailer")
	public String getMailer() {

		return "mailer";
	}

	@PostMapping("mailer/send")
	public String sendMail(Model model, @RequestParam String txtTo, @RequestParam String txtCC,
			@RequestParam String txtBCC, @RequestParam String txtSubject, @RequestParam String txtContent,
			@RequestParam("file") MultipartFile multipartFile) throws IOException {

		MailerHelper mailerHelper = new MailerHelper();

		List<File> files = new ArrayList<>();

		String[] emailCC = mailerHelper.parseStringEmailToArray(txtCC);
		String[] emailBCC = mailerHelper.parseStringEmailToArray(txtBCC);
		
		MailInfo mail = new MailInfo();

		if (txtTo.equals("")) {
			model.addAttribute("errorMessage", "Please enter recipient email!");
			return "mailer";
		} else {
			mail.setTo(txtTo);
		}
		
		mail.setCc(emailCC);
		mail.setBcc(emailBCC);
		mail.setSubject(txtSubject);
		mail.setBody(txtContent);

		// covert MultipartFile to File
		if (!multipartFile.isEmpty()) {
			File file = mailerHelper.convertMultipartFileToFile(multipartFile);
			files.add(file);
			
			// Set cho MailInfo
			mail.setFiles(files);
		}
		
		mailerService.queue(mail);
		model.addAttribute("message", "Send email successfully!");
		
		return "mailer";
	}
}
