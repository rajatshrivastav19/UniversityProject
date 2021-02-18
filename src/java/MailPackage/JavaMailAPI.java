/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MailPackage;

/**
 *
 * @author Lenovo
 */
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;


class BabyOfAuthenticator extends Authenticator
{
	public PasswordAuthentication getPasswordAuthentication()
	{
		String id="mountainsstreet@gmail.com";
		String password="Rajat@123";
		PasswordAuthentication pa = new PasswordAuthentication(id,password);
		return pa;
	}
}

public class JavaMailAPI
{
	//Send Email Without Attachments
	public void SendEmailWithoutAttachment(String EmailAddress, String Code, String FirstName, String LastName, String working) //throws Exception
	{
			try
			{
			// create object of properties to provide mail server
			Properties p1 = new Properties();
			p1.put("mail.smtp.host","smtp.gmail.com");
			p1.put("mail.smtp.port","587");
			p1.put("mail.smtp.starttls.enable","true");
			//p.put("mail.smtp.ssl.trust","smtp.gmail.com");
			p1.put("mail.smtp.auth","true");
			//p.put("mail.debug","true");

			// create object of subclass of authenticator
			BabyOfAuthenticator baby = new BabyOfAuthenticator();
			
			// get a session
			Session session = Session.getInstance(p1, baby);
			
			// create object for actual message
			MimeMessage message = new MimeMessage(session);
			
			// set subject of this message
			message.setSubject("This Email Is Send By (Rajat Srivatsva MCA III Year) Your Verification Code Is - ");
				
			InternetAddress address = new InternetAddress
					(EmailAddress);
			
			// set type of RCVR
			message.setRecipient(RecipientType.TO, address);
                            
                            if(working.equals("StudentForgetPassword"))
                               message.setContent("HAY "+ EmailAddress +"  'Mr "+FirstName+" "+LastName+" THIS IS YOUR MJP Rohilkhand University Password' : "+Code+" Please Save It. ThankYou....!! "+FirstName+" ", "text/plain");
                            if(working.equals("TeacherUniqueID"))   
                                message.setContent("HAY "+ EmailAddress +" Please Enter This Unique ID To Verify Your Account 'Mr "+FirstName+" " + LastName +" THIS IS YOUR Unique~ID : "+Code+" Please Save It For Future USe. ThankYou..!! "+FirstName+ "", "text/plain");
                            if(working.equals("TearcherLogin")&&FirstName.equals("")&&LastName.equals(""))
                                message.setContent("HAY "+ EmailAddress +"  Your OTP For Loin IS : "+Code+" Please Enter & Login the Seesion. ThankYou..!!", "text/plain");
			Transport.send(message);
			
			System.out.println("Email Send Successfully");
			}
			catch(Exception e)
			{
				System.out.println("Mail Could Not Send"+e);
			}
	}
	
	//Send Email WithAttachments
	public static void sendEmailWithAttachment(String Attachment,String ReceiverEmail) throws AddressException, MessagingException 
        {
        // sets SMTP server properties
    	  try
    	  {
    				Properties p = new Properties();
    				p.put("mail.smtp.host", "smtp.gmail.com");//host
    				p.put("mail.smtp.port", "587");//port number
    				p.put("mail.smtp.auth", "true");
    				p.put("mail.smtp.starttls.enable", "true");
    				p.put("mail.user", "mountainsstreet@gmail.com"); //Sender email
    				p.put("mail.password", "Rajat@123"); 	//sender password
 
    				// creates a new session with an authenticator
    				Authenticator auth = new Authenticator()
    				{
    					public PasswordAuthentication getPasswordAuthentication()
    					{
    						//sender Email and password
    						return new PasswordAuthentication("mountainsstreet@gmail.com", "Rajat@123");
    					}
    				};
      
    				Session session = Session.getInstance(p, auth);
 
    				// creates a new e-mail message
    				Message msg = new MimeMessage(session);
 
    				msg.setFrom(new InternetAddress("hassancetpa@gmail.com"));
    				 /*receiver email address*/
    				InternetAddress[] toAddresses = { new InternetAddress(ReceiverEmail)};
    				msg.setRecipients(Message.RecipientType.TO,  toAddresses);
    				msg.setSubject("New email with Attachments");
    				msg.setSentDate(new Date());
 
    				// creates message part
    				MimeBodyPart messageBodyPart = new MimeBodyPart();
    				messageBodyPart.setContent("I have some attachments for you.", "text/html");
 
    				// creates multi-part
    				Multipart multipart = new MimeMultipart();
    				multipart.addBodyPart(messageBodyPart);
  
    				String attachFile = Attachment;	
    		
    				MimeBodyPart attachPart = new MimeBodyPart();
                		
    				attachPart.attachFile(attachFile);
        
    				multipart.addBodyPart(attachPart);
    				
    				// sets the multi-part as e-mail's content
    				msg.setContent(multipart);
 
    				// sends the e-mail
    				Transport.send(msg);
    				
    				System.out.println("Email Send With Attachment");
    		}
    		catch(Exception e)
    		{
    				System.out.println("Mail Could Not Send"+e);
    		}
    	}
}
