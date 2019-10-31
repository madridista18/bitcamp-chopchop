package bitcamp.chopchop.web;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Resource
  private MemberService memberService;

  @GetMapping("signin")
  public void signin() {
  }
  
  @GetMapping("findPassword")
  public void findPassword() {
  }
  
  @PostMapping("login")
  public String login(
      HttpServletResponse response,
      HttpSession session,
      String email,
      String password) 
      throws Exception {

    // 응답할 때 클라이언트가 입력한 이메일을 쿠키로 보낸다.
    Cookie cookie = new Cookie("email", email);
    cookie.setMaxAge(60 * 60 * 24 * 15);
    response.addCookie(cookie);

    Member member = memberService.get(email, password);

    session.setAttribute("loginUser", member);
    return "redirect:../member/list";
  }
  
  @GetMapping("logout")
  public String logout(HttpSession session) 
      throws Exception {
    session.invalidate();
    return "redirect:signin";
  }
//  
//@RequestMapping(path = "getPassword",
//    method = RequestMethod.POST)
//public static void gGmailSend() {
//  String user = "bitcamp1234@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
//  String password = "kim1016!"; // 패스워드
//  
//
//  // SMTP 서버 정보를 설정한다.
//  Properties prop = new Properties();
//  prop.put("mail.smtp.host", "smtp.gmail.com");
//  prop.put("mail.smtp.port", 465);
//  prop.put("mail.smtp.auth", "true");
//  prop.put("mail.smtp.ssl.enable", "true");
//  prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//
//  Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
//    protected PasswordAuthentication getPasswordAuthentication() {
//      return new PasswordAuthentication(user, password);
//    }
//  });
//
//  try {
//    MimeMessage message = new MimeMessage(session);
//    message.setFrom(new InternetAddress(user));
//    
//    // 수신자메일주소
//    message.addRecipient(Message.RecipientType.TO, new InternetAddress("kimyoulim1016@gmail.com"));
//
//    // Subject
//    message.setSubject("[ChopChop] - Temporary Password"); // 메일 제목을 입력
//
//    // Text
//    message.setText("내용을 입력하세요"); // 메일 내용을 입력
//
//    // send the message
//    Transport.send(message); //// 전송
//    System.out.println("message sent successfully...");
//  } catch (AddressException e) {
//    e.printStackTrace();
//  } catch (MessagingException e) {
//    e.printStackTrace();
//  }
//}

}
