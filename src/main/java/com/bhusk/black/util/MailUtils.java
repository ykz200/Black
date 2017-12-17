package com.bhusk.black.util;

import com.bhusk.black.model.CompanyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * Created by kzyuan on 2017/12/17 14:20
 */

public class MailUtils {

    public static String FROMEMAIL = "black@bhusk.com";

    @Autowired
    private JavaMailSender mailSender;

    public void sendSimpleMail(String toEmail, String subject, String text) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom(FROMEMAIL); //发送邮箱
        message.setTo(toEmail);  //收件邮箱
        message.setSubject(subject);
        message.setText(text);

        mailSender.send(message);
    }


    public void sendInlineMail(String toEmail, String subject, CompanyInfo companyInfo) {

        MimeMessage mimeMessage = mailSender.createMimeMessage();

        String emailinfo = "  " +
                " " +
                "<html> " +
                "  <body> " +
                "  <ul> " +
                "    <li>公司名称</li> " +

                "  </ul> " +
                "  </body> " +
                "</html>";
        MimeMessageHelper helper = null;
        try {
            helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom("black@bhusk.com");
            helper.setTo(toEmail);
            helper.setSubject("IT黑名单：申请反馈");
            helper.setText("<html><body>" +
                    "</body></html>", true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        mailSender.send(mimeMessage);
    }


}
