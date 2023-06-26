package com.kh.swithme.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.swithme.member.model.service.MemberService;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.Member;


@Controller
public class MemberControllerL {
   
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   
   @Autowired
   private JavaMailSenderImpl sender;
   
   
   //회원가입 작성 폼으로 이동
   @RequestMapping("memberEnrollForm.me")
   public String memberEnrollForm() {
      return "member/memberEnrollForm";
   }
   
   //로그인 폼으로 이동
   @RequestMapping("loginForm.me")
   public String loginMemberForm() {
      return "member/loginForm";
   }
   
   //아이디 찾기 폼으로 이동
   @RequestMapping("searchIdForm.me")
   public String searchIdForm() {
      return "member/searchIdForm";
   }
   
   //비밀번호 찾기 폼으로 이동
   @RequestMapping("searchPwdForm.me")
   public String searchPwdForm() {
      return "member/searchPwdForm";
   }
   
   //마이페이지 알람으로 가기
   @RequestMapping("alarm.me")
   public String myPageAlarm() {
      return "member/myPageAlarm";
   }
   //메일 작성폼으로 이동
   @RequestMapping("mail.me")
   public String myPageMail() {
      return "member/myPageMail";
   }
   //마이페이지 프로필로 이동
   @RequestMapping("profil.me")
   public String profilMember() {
      return "member/myPageProfil";
   }

   
   /**아이디 중복체크
    * @param checkId
    * @return
    */
   @ResponseBody
   @RequestMapping("idCheck.me")
   public String idCheck(String checkId) {
      return memberService.idCheck(checkId) > 0 ? "N" : "Y";

   }
   
   /**닉네임 중복체크
    * @param checkNick
    * @return
    */
   @ResponseBody
   @RequestMapping("nickCheck.me")
   public String nickCheck(String checkNick) {
      return memberService.nickCheck(checkNick) > 0 ? "N" : "Y";
   }
   
   /**이메일 중복체크
    * @param checkEmail
    * @return
    */
   @ResponseBody
   @RequestMapping("emailCheck.me")
   public String emailCheck(String checkEmail) {
      return memberService.emailCheck(checkEmail) > 0 ? "N" : "Y";
   }
   
   
   /**회원가입하기 + 500p
    * @param m
    * @return
    */
   @RequestMapping("join.mem")
   public ModelAndView joinMember(Member m, HttpSession session, ModelAndView mv) {
	   
      String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd()); //암호화
      m.setMemberPwd(encPwd);
      
         if(memberService.joinMember(m) > 0) { //회원가입 성공
            memberService.joinPoint(m);
            
            if(memberService.defaultCharacter(m) > 0) {
            	memberService.defaultBackground(m);
            };
               session.setAttribute("alertMsg","회원가입을 축하합니다 ! 500p가 지급되었습니다 !");   
               mv.setViewName("member/loginForm");
            }else {
            	session.setAttribute("alertMsg","회원가입에 실패했습니다.");   
                mv.setViewName("member/memberEnrollForm");
            }
         return mv;
      }
   
   
   /**로그인하기 + 30p
    * @param m
    * @return
    */
   @PostMapping("login.me")
   public ModelAndView loginMember(Member m, ModelAndView model, HttpSession session) {
      
      Member loginMember = memberService.loginMember(m); // DB에 저장되어있는 회원정보 가져오기
     
      //복화
      if(loginMember != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
    	  					
    	  					//point체크하기
            if(memberService.loginPointChk(m) == 0 && !loginMember.getMemberId().equals("admin")) { //관리자는 포인트 지급하지 않음.
            	memberService.loginPointInsert(m);
            	session.setAttribute("alertMsg", "환영합니다 ! 30p가 지급되었습니다 !");
            }
            session.setAttribute("loginMember", loginMember);
            model.setViewName("redirect:/");
      }else {
    	  	session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
            model.setViewName("member/loginForm");
      }
         return model;
   }
   
   
	   /**로그아웃
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping("logout.me")
	 public String logoutMember(Member m, HttpSession session) {
		   session.invalidate();
		   return "redirect:/";
	   }
	
	
	
	/** 아이디 찾기
	 * @return
	 */
	@RequestMapping("searchId.me")
	public ModelAndView memberSerchId(Member m, HttpSession session, ModelAndView model) {
		
		Member searchMember = memberService. memberSerchId(m);
		session.setAttribute("searchMember", searchMember);
		model.setViewName("member/searchIdResult");
		
		return model;
		
	}
	
	/**회원탈퇴
	 * @param m
	 * @return
	 */
	@RequestMapping("delete.mem")
	public String deleteMember(String memberPwd, HttpSession session) {
		
			String encPwd = ((Member)session.getAttribute("loginMember")).getMemberPwd();// DB에 기록된 암호화된 비밀번호
		
			if(bcryptPasswordEncoder.matches(memberPwd, encPwd)) { //사용자가 입력한 평문과 암호가 맞을 경우.  
				
				//위에가 맞아야 아이디 검사를 하는거임.
				
				String userId = ((Member)session.getAttribute("loginMember")).getMemberId();
				
					if(memberService.deleteMember(userId) > 0) { //탈퇴성공
						session.removeAttribute("loginMember");
						session.setAttribute("alertMsg", "탈퇴되었습니다.");
						return "redirect:/";
						
					}else { //탈퇴실패
						session.setAttribute("alertMsg", "탈퇴 실패");
						return "redirect:profil.me";
					}
				
			}else { //비번 잘못침.
					session.setAttribute("alertMsg", "비밀번호를 다시 입력해주세요.");
					return "redirect:profil.me";
			}
		
		
	}
	
	
	/*
	//기존 비밀번호 확인
	@ResponseBody
	@RequestMapping("memberPwdChk.me")
		public void memberPwdChk(Member m, String memberPwd, ModelAndView mv) {
			
			m.setMemberPwd(memberPwd); //사용자가 입력한 비밀번호 멤버 pwd에 담기
			Member loginMember = memberService.loginMember(m); //아이디를 이용하여 사용자의 Member정보 가져오기
			
			//가져온 사용자의 정보의 비밀번호와 사용자가 입력한 비밀번호가 맞는지 확인.
			if(loginMember != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
				
				//맞을 시
				
				
				return "true";
				
			}else { //틀릴시
				
			}
			//int passwordChk = memberService.memberPwdChk(m);
			//System.out.println(passwordChk);
		
		
		
	
				
	}
	
	 */
	
	
	/**정보수정폼으로 이동
	 * @param m
	 * @return
	 */
	@RequestMapping("updateEnrollForm.mem")
	public String updateMemberEnrollForm(String memberPwdUpdate, HttpSession session) {
		
		String encPwd = ((Member)session.getAttribute("loginMember")).getMemberPwd();// DB에 기록된 암호화된 비밀번호
		
		System.out.println(memberPwdUpdate);
		if(bcryptPasswordEncoder.matches(memberPwdUpdate, encPwd)) { //사용자가 입력한 평문과 암호가 맞을 경우.  
			
			//위에가 맞아야 아이디 검사를 하는거임.
			
				return "member/updateEnrollForm";
				
				}else { //비번 잘못침.
				
					session.setAttribute("alertMsg", "비밀번호를 다시 입력해주세요.");
					return "redirect:mypage.me";
		}
	
		//암호화하기 
		
		/*
		if(memberService.updateMember(m) > 0 ) { //update성공
			session.setAttribute("alertMsg", "정보가 수정되었습니다.");
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "정보수정 실패");
			return "member/updateEnrollForm";
		}
		*/
		
	}
	
	
	/** 정보수정
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping("update.mem")
	public String updateMember(Member m, HttpSession session) {
		
		 String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd()); //암호화
	      m.setMemberPwd(encPwd);
	      //System.out.println(encPwd);
		
		if(memberService.updateMember(m) > 0 ) { //update성공
			session.setAttribute("alertMsg", "정보가 수정되었습니다.");
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "정보수정 실패");
			return "member/updateEnrollForm";
		}
		
	}
	
	
	
	@GetMapping("searchPwd.mem") //get으로 요청오면 반환 ( 밑에 포스트로 왔을 때 오버로딩해서 메일보내기)
	public String memberSearchPwd() {
		return "member/searchPwdForm";
	}
	
	
	//비밀번호 찾기 
	
	@PostMapping("searchPwd.mem")
	public ModelAndView memberSearchPwd(Member m,
										ModelAndView mv,
										HttpServletRequest request) throws MessagingException {
		
		Member mem = memberService.memberSearchPwd(m);
		//System.out.println(mem);
		
			if(mem != null) { //성공 => 이메일 인증으로 넘어가기
				
					
				MimeMessage message = sender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
				
				
				String secret = generateSecret(); // 인증번호 만들기 메소드 호출
				
				
				/*
				Mail mail = Mail.builder() // 매개변수 생성자 같은 존재
									  .who(ip)
									  .secret(secret)
									  .build();
				*/
				
				// 메일보내기 (DB갔다오기)
				helper.setTo(mem.getMemberEmail()); // 사용자가 입력한 이메일(m에서 가져오기)
				helper.setSubject("스윗미 임시 비밀번호입니다.");
				helper.setText("<h3>임시 비밀번호 안내<h3><br> "
								+ "<h5>안녕하세요^^ 회원님의 임시 비밀번호는 " + secret + " 입니다.<h5>"
								+ "<h5> 로그인 후에 비밀번호를 변경해주시기 바랍니다.<h5>", true);
				
				sender.send(message);
				
				//임시비밀번호 암호화
				String encPwd = bcryptPasswordEncoder.encode(secret); 
			      m.setMemberPwd(encPwd); //사용자의 비밀번호 다시 set
				
				//m에 담겨져있는 사용자의 이메일을 이용하여 비번변경
				memberService.sendMailInsert(m); 
				
				
				mv.setViewName("member/searchPwdEmailResult");
			
			
			}else { // 회원이 입력한 값이  DB에 있는 값들이랑 일치하지 않았을 때
				mv.addObject("alertMsg","사용자 정보를 다시 입력해주세요.");
				mv.addObject("memberName",m.getMemberName());
				mv.addObject("memberId", m.getMemberId());
				mv.addObject("memberEmail", m.getMemberEmail());
				mv.setViewName("member/searchPwdForm");
			}
			return mv;
		
		
		
	}
	
	
	
	//인증번호 랜덤으로 만들기
	public String generateSecret() {
		
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000"); //0으로된 공백 채우기
		String secret = f.format(i);
		
		return secret;
	}
	
	
	
		//알람 조회
		@ResponseBody
		@RequestMapping(value="alarmList.me", produces="application/json; charset=UTF-8")
		public String selectAlarmList(String memberId) {  
			
			ArrayList<Alarm> list = memberService.selectAlarmList(memberId);
			 return new Gson().toJson(list);
		}
	
		//보드, 밴드 읽음 표시 
		@ResponseBody
		@RequestMapping("readAlarm")
		public char readAlarm(int boardNo, Integer alarmNo) {
			
		HashMap<String, Integer> map = new HashMap();
		map.put("alarmNo", alarmNo);
		map.put("boardNo", boardNo);
		return	memberService.readAlarm(map) > 0 ? 'Y' : 'N';
		}
		
		
		@ResponseBody
		@RequestMapping("readAlarmB")
		public char readAlarmB(int boardNo, int alarmNo) {
			
			HashMap<String, Integer> map = new HashMap();
			map.put("boardNo", boardNo);
			map.put("alarmNo", alarmNo);
			
			return memberService.readAlarmB(map) > 0 ?  'Y' : 'N';
		}
		
	
		
		
	
	
	
	
	
	
 }