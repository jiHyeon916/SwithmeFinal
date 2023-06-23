package com.kh.swithme.band.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.swithme.band.model.service.BandService;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.band.model.vo.BandAlarm;
import com.kh.swithme.band.model.vo.BandAttach;
import com.kh.swithme.band.model.vo.BandBoard;
import com.kh.swithme.band.model.vo.BandMember;
import com.kh.swithme.band.model.vo.BandReply;
import com.kh.swithme.band.model.vo.BandReport;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class BandController {
	
	@Autowired
	private BandService bandService;
	
	// 밴드 리스트
	@RequestMapping("/studyBand.bo")
	public String selectTestBand(Band b, Model model) {
		model.addAttribute("list", bandService.selectTestBand(b));
		return "board/studyBandBoardListView";
	}
	
	// 밴드 사이드바
	@ResponseBody
	@RequestMapping(value="studyBand.bo/side.sb", produces="application/json; charset=UTF-8")
	public String ajaxSelectBandSideBar(int sno, HttpSession session) {
		
		Band bandInfomation = bandService.ajaxSelectBandSideBar(sno);
		session.setAttribute("bandInfomation", bandInfomation);
		
		return new Gson().toJson(bandInfomation);
	}
	
	// 밴드 사이드바 디테일
	@ResponseBody
	@RequestMapping(value="studyBand.bo/memberTotal.sb", produces="application/json; charset=UTF-8")
	public String selectTotalMember(@RequestParam(value="memberId", required=false, defaultValue="hello") String memberId,
									@RequestParam(value="sno", required=false, defaultValue="0")int sno, HttpSession session) {

		BandMember bm = new BandMember();
		bm.setSbNo(sno);
		bm.setMemId(memberId);
		
		BandMember bandMem = bandService.selectTotalMember(bm);
		session.setAttribute("bandMem", bandMem);
		return new Gson().toJson(bandMem); 

	}
	
	// 밴드 디테일
	@RequestMapping("studyBand.bo/detail.bo")
	public String selectList(HttpSession session, int sno) {
		
		session.setAttribute("list", bandService.selectBandList(sno));
		//System.out.println(bandService.selectBandList(sno));
		
		return "band/bandMain";
	}
	
	@ResponseBody
	@RequestMapping(value="studyBand.bo/photoSelect.sb", produces="application/json; charset=UTF-8")
	public String selectPhoto(Model model, int sbBoardNo) {
		
		return new Gson().toJson(bandService.selectPhoto(sbBoardNo));
	}
	
	// 밴드 게시글 디테일
	@ResponseBody
	@RequestMapping(value="studyBand.bo/detail.sb", produces="application/json; charset=UTF-8")
	public String ajaxSelectBandBoard(int sbBoardNo) {
		if(bandService.increaseCount(sbBoardNo) > 0) {			
			return new Gson().toJson(bandService.selectBandBoard(sbBoardNo));
		} else {
			return "band/bandMain";
		}
	}
	
	// 밴드 게시글
	// 섬머노트 사진
	@RequestMapping(value="studyBand.bo/SummerNoteImageFile" , method = RequestMethod.POST)
	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String fileRoot = "C:\\summernoteImg\\";
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
			
		File targetFile = new File(fileRoot+saveFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	
		return jsonObject;
	}
	// 밴드 게시글 작성
	@ResponseBody
	@RequestMapping(value="studyBand.bo/binsert.sb")
	public String insertBandBoard(BandBoard bb){
		return bandService.insertBandBoard(bb) > 0 ? "success" : "fail";
	}
	// 밴드 게시글 사진
	@ResponseBody
	@RequestMapping(value="studyBand.bo/photoInsert.sb", produces="application/json; charset=UTF-8")
	public String insertPhoto(HttpSession session, BandAttach bat, @RequestParam("file") MultipartFile file) {
		
			
			if(!file.getOriginalFilename().equals("")) {
				bat.setOriginName(file.getOriginalFilename());
				bat.setChangeName("/swithme/resources/uploadFiles/band/" + saveFile(file, session));
			}
			if(bandService.insertPhoto(bat) > 0) {
				session.setAttribute("photoList", bandService.insertPhoto(bat));	
			}
			return new Gson().toJson(bandService.insertPhoto(bat));
	}
	
	// 밴드 게시글 수정 
	
	// 밴드 게시글 삭제
	@ResponseBody
	@RequestMapping(value="studyBand.bo/deleteBoard.sb", produces="application/json; charset=UTF-8")
	public String deleteBandBoard(int sbBoardNo) {
		return new Gson().toJson(bandService.deleteBandBoard(sbBoardNo));
	}

	// 밴드 게시글 검색
	@RequestMapping("studyBand.bo/search.sb")
	public String selectBandSearchList(int sno, BandBoard bb, String keyword, Model model) {
		bb.setKeyword(keyword);
		bb.setSbNo(sno);

		model.addAttribute("list", bandService.selectBandSearchList(bb));
		model.addAttribute("keyword", keyword);
		return "band/bandMain";
	}
	
	// 밴드 게시글 댓글 리스트
	@ResponseBody
	@RequestMapping(value="studyBand.bo/rlist.sb", produces="application/json; charset=UTF-8")
	public String ajaxSelectBandReplyList(int sbBoardNo) {
		//System.out.println(sbBoardNo);
		return new Gson().toJson(bandService.ajaxSelectBandReplyList(sbBoardNo));
	}
	
	// 밴드 댓글 등록
	@ResponseBody
	@RequestMapping("studyBand.bo/rinsert.sb")
	public String ajaxInsertBandReply(BandReply br, BandAlarm ba, String sbReplyContent, int sbNo, int sbBoardNo, String writerId) {
		br.setSbReplyContent(sbReplyContent.replace(System.getProperty("line.separator"), "<br>"));
		br.setSbBoardNo(sbBoardNo);
		if(bandService.ajaxInsertBandReply(br) > 0) {
			// System.out.println(sbNo);
			ba.setAlarmSbNo(sbNo);
			ba.setAlarmMember(writerId);
			
			return bandService.insertBandAlarm(ba) > 0 ? "success" : "fail";
		} else {
			return "fail";
		}

	}
	
	// 밴드 댓글 수정 뷰
	@ResponseBody
	@RequestMapping(value="studyBand.bo/replyModifyView.sb", produces="application/json; charset=UTF-8")
	public String replyModifyView(int sbReplyNo) {
		return new Gson().toJson(bandService.replyModifyView(sbReplyNo));
	}
	
	// 밴드 댓글 수정
	@ResponseBody
	@RequestMapping(value="studyBand.bo/replyModify.sb")
	public String updateBandReply(BandReply br, String sbReplyContent) {
		br.setSbReplyContent(sbReplyContent.replace(System.getProperty("line.separator"), "<br>"));
		// System.out.println(bandService.updateBandReply(br));
		return bandService.updateBandReply(br) > 0 ? "success" : "fail";
	}
	
	// 밴드 댓글 삭제
	@ResponseBody
	@RequestMapping(value="studyBand.bo/deleteReply.sb", produces="application/json; charset=UTF-8")
	public String ajaxDeleteBandReply(int sbReplyNo) {
		return new Gson().toJson(bandService.deleteBandReply(sbReplyNo));
	}
	
	// 밴드 가입 - 현재인원 +1 / INSERT
	@RequestMapping("studyBand.bo/bandEnroll.sb")
	public String enrollBandMember(int sbNo, BandMember bm, HttpSession session, Model model) {
		
			
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertBand", "로그인 후 이용해주세요.");
			return "redirect:/loginForm.me";
		} else {
			
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			bm.setSbNo(sbNo);
			bm.setMemberId(memberId);
			
			
			if(bandService.banishComfirm(bm) > 0) {
				session.setAttribute("alertBand", "밴드에 가입 할 수 없습니다.");
				return "redirect:/studyBand.bo/detail.bo?sno=" + sbNo;
			} else {
				
				if(bandService.insertBandMember(bm) > 0) {
					if(bandService.enrollBandMember(sbNo) > 0) {
						session.setAttribute("alertBand", "밴드에 가입되었습니다.");
					};
					
				} else {
					session.setAttribute("alertBand", "밴드에 가입 할 수 없습니다.");
				}
				
				return "redirect:/studyBand.bo/detail.bo?sno=" + sbNo;
			}	
		}
	}
	
	// 밴드 탈퇴
	@RequestMapping("studyBand.bo/deleteBandMem.sb")
	public String deleteBandMember(int sbNo, BandMember bm, HttpSession session, Model model) {
		
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertBand", "로그인 후 이용해주세요.");
			return "redirect:/loginForm.me";
		} else {
			
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			bm.setSbNo(sbNo);
			bm.setMemberId(memberId);
			
			if(bandService.deleteBandMember(bm) > 0) {
				if(bandService.deleteBandMemberCount(sbNo) > 0) {
					session.setAttribute("alertDeleteBand", "밴드에 탈퇴되었습니다.");	
				};
				return "redirect:/studyBand.bo/detail.bo?sno=" + sbNo;
				
			} else {
				session.setAttribute("alertDeleteBand", "밴드를 탈퇴하지 못했습니다.");	
				
				return "redirect:/studyBand.bo/detail.bo?sno=" + sbNo;
			}
		}	
	}
	
	// 밴드 정보
	@RequestMapping("studyBand.bo/bandInfo.sb")
	public String selectBandInfo(Model model, int sno) {
		model.addAttribute("info", bandService.selectBandInfo(sno));
		return "band/bandInfo";
	}
	
	// 밴드 정보 변경
	@ResponseBody
	@RequestMapping(value="studyBand.bo/updateInfoBand.sb", produces="application/json; charset=UTF-8")
	public ModelAndView updateBand(Band b, ModelAndView mv) {
		if(bandService.updateBand(b) > 0) {
			mv.setViewName("redirect:bandInfo.sb?sno=" + b.getSbNo());	

		} else { 
			mv.addObject("errorMsg", "실패");
		}
		return mv;
	}
		
	// 밴드 사진 변경
	@RequestMapping("studyBand.bo/updateProfileBand.sb")
	public String updateBandProfile(Band b, MultipartFile reUpfile, HttpSession session) {
		
		if(!reUpfile.getOriginalFilename().equals("")){
			if(b.getSbChangeName() != null) {
				new File(session.getServletContext().getRealPath(b.getSbChangeName())).delete();
			}
			String changeName = saveFile(reUpfile, session);
			
			b.setSbChangeName("/swithme/resources/uploadFiles/band/" + changeName);
			// System.out.println(b);
		}
		
		if(bandService.updateBandProfile(b) > 0) {
			session.setAttribute("alert", "밴드 사진이 변경되었습니다.");
			return "redirect:bandInfo.sb?sno="+b.getSbNo();
		} else {
			session.setAttribute("alert", "밴드 사진 변경에 실패했습니다.");
			return "redirect:bandInfo.sb?sno="+b.getSbNo();
		}
	}
	
	// 사진 insert test
	
	
	// 사진 사용
	public String saveFile(MultipartFile upfile, HttpSession session) { 
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/band/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	// 밴드 공지사항
	@RequestMapping("studyBand.bo/bandNotice.sb")
	public String bandNotice(Model model, int sno) {	
		model.addAttribute("list", bandService.selectBandNoticeList(sno));
		return "band/bandNotice";
	}
	
	// 밴드 공지사항 디테일
	@ResponseBody
	@RequestMapping(value="studyBand.bo/noticeDetail.sb", produces="application/json; charset=UTF-8")
	public String ajaxSelectNoticeBand(int sbBoardNo) {
		if(bandService.increaseNoticeCount(sbBoardNo) > 0) {			
			return new Gson().toJson(bandService.selectBandNoticeBoard(sbBoardNo));
		} else {
			return "band/bandNotice";
		}
	}
	
	// 밴드 신고
	@RequestMapping("studyBand.bo/reportBand.sb")
	public String insertReport(BandReport br, HttpSession session) {
		
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("reportMsg", "로그인 후 이용해주세요.");
			return "redirect:/loginForm.me";
		} else {
			String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
	
			br.setReportMemberId(memberId);
			
			if(bandService.insertReport(br) > 0) {
				session.setAttribute("reportMsg", "신고접수가 완료되었습니다.");
			}
			return "redirect:/studyBand.bo/detail.bo?sno=" + br.getTotalNo();
		}
	}
	
	// 밴드 멤버 리스트
	@RequestMapping(value="studyBand.bo/bandMember.sb", produces="application/json; charset=UTF-8")
	public String selectMemberList(int sno, HttpSession session) {
		session.setAttribute("memList", bandService.selectMemberList(sno));
		return "band/bandMember";
	}
	
	// 리더 위임 목록
	@ResponseBody
	@RequestMapping(value="studyBand.bo/reader.sb", produces="application/json; charset=UTF-8")
	public String readerList(int sno, HttpSession session) {
		return new Gson().toJson(bandService.readerList(sno));
	}
	
	// 리더 위임 변경
	@RequestMapping("studyBand.bo/changeReader.sb")
	public String updateBandReader(Band b, int sbNo, BandAlarm ba, String memberId, Model model, HttpSession session) {
		b.setSbNo(sbNo);
		b.setMemberId(memberId);
		
		if(bandService.updateBandReader(b) > 0) {
			model.addAttribute("b", bandService.updateBandReader(b));
			
			ba.setAlarmSbNo(sbNo);
			ba.setAlarmMember(memberId);
			if(bandService.readerAlarm(ba) > 0) {
				session.setAttribute("finishMsg", "리더 변경에 성공했습니다.");								
			} else {
				session.setAttribute("finishMsg", "리더 변경에 실패했습니다.");	
			};
		} else {
			session.setAttribute("finishMsg", "리더 변경에 실패했습니다.");					
		}
		
		return "redirect:/studyBand.bo/detail.bo?sno=" + sbNo;
	}
	
	// 리더 위임 닉네임 검색
	@ResponseBody
	@RequestMapping(value="studyBand.bo/nickSearch.sb", produces="application/json; charset=UTF-8")
	public String nickSearch(String key, int sbNo, BandMember bm) {
		bm.setSbNo(sbNo);
		bm.setKey(key);
		System.out.println(bandService.nickSearch(bm));
		System.out.println(sbNo);
		System.out.println(key);
		return new Gson().toJson(bandService.nickSearch(bm));
	}

	// 밴드 강제 탈퇴
	@RequestMapping("studyBand.bo/deleteMem.sb")
	public String updateBandMember(int sbNo, String deleteMem, Model model, Band b, BandMember bm, HttpSession session) {

		bm.setSbNo(sbNo);
		bm.setMemId(deleteMem);
		
		if(bandService.updateBandMember(bm) > 0) {
			model.addAttribute("bm", bandService.updateBandMember(bm));
			b.setSbNo(sbNo);
			bandService.updateBandMemberCount(b);
			
			session.setAttribute("banishMsg", "강제탈퇴에 성공했습니다.");	
		} else{
			session.setAttribute("banishMsg", "강제탈퇴에 실패했습니다.");	
		};
		
		return "redirect:/studyBand.bo/bandMember.sb?sno=" + sbNo;
	}
	
	// 밴드 전체 멤버 조회(강제탈퇴된 멤버 포함)
	@ResponseBody
	@RequestMapping(value="studyBand.bo/memberTotal.me", produces="application/json; charset=UTF-8")
	public String memberTotalTotal(int sbNo, HttpSession session, BandMember bm, String memberId) {
		bm.setMemId(memberId);
		bm.setSbNo(sbNo);

		session.setAttribute("memTotalTotal", bandService.memberTotalTotal(bm));
		return new Gson().toJson(bandService.memberTotalTotal(bm));
	}
	
	// 방장 혼자 남았을 때 밴드 전체 삭제하기
	@ResponseBody
	@RequestMapping(value="studyBand.bo/deleteBand.sb", produces="application/json; charset=UTF-8")
	public String deleteBand(int sbNo) {
		return new Gson().toJson(bandService.deleteBand(sbNo));
	}

	// 밴드 일정
	@RequestMapping("studyBand.bo/bandSchedule.sb")
	public String bandSchedule() {
		return "band/bandSchedule";
	}
}
 