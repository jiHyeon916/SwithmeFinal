package com.kh.swithme.band.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.band.model.vo.BandAlarm;
import com.kh.swithme.band.model.vo.BandAttach;
import com.kh.swithme.band.model.vo.BandBoard;
import com.kh.swithme.band.model.vo.BandMember;
import com.kh.swithme.band.model.vo.BandReply;
import com.kh.swithme.band.model.vo.BandReport;

@Repository
public class BandDao {

	// test
	public ArrayList<Band> selectTestBand(SqlSessionTemplate sqlSession, Band b) {
		return (ArrayList)sqlSession.selectList("bandMapper.selectTestBand", b);
	}
	// test 끝

	public ArrayList<BandBoard> selectBandList(SqlSessionTemplate sqlSession, int sno) {
		// System.out.println((ArrayList)sqlSession.selectList("bandMapper.selectBandList", sno));
		return (ArrayList)sqlSession.selectList("bandMapper.selectBandList", sno);	
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return sqlSession.update("bandMapper.increaseCount", sbBoardNo);
	}
	
	public BandBoard selectBandBoard(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return sqlSession.selectOne("bandMapper.selectBandBoard", sbBoardNo);
	}
	
	public Band selectBandInfo(SqlSessionTemplate sqlSession, int sbNo) {
		return sqlSession.selectOne("bandMapper.selectBandInfo", sbNo);
	}
	/*
	 * 게시글 검색하기
	 * public ArrayList<Board> selectSearchList(SqlSession sqlSession, HashMap<String, String> map, PageInfo pi){
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() - 1) * pi.getBoardLimit()), pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map, rowBounds);
	} 
	 */

	public Band ajaxSelectBandSideBar(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("bandMapper.ajaxSelectBandSideBar", sno);
	}

	public int updateBand(SqlSessionTemplate sqlSession, Band b) {
		// System.out.println(sqlSession.update("bandMapper.updateBand", b));
		return sqlSession.update("bandMapper.updateBand", b);
	}

	public ArrayList<BandMember> selectMemberList(SqlSessionTemplate sqlSession, int sbNo) {
		// System.out.println((ArrayList)sqlSession.selectList("bandMapper.selectMemberList", sbNo));
		return (ArrayList)sqlSession.selectList("bandMapper.selectMemberList", sbNo);
	}

	public ArrayList<BandMember> readerList(SqlSessionTemplate sqlSession, int sno) {
		return (ArrayList)sqlSession.selectList("bandMapper.readerList", sno);
	}

	public int updateBandReader(SqlSessionTemplate sqlSession, Band b) {
		return sqlSession.update("bandMapper.updateBandReader", b);
	}

	public int enrollBandMember(SqlSessionTemplate sqlSession, int sbNo) {
		return sqlSession.update("bandMapper.enrollBandMember", sbNo);
	}

	public int insertBandMember(SqlSessionTemplate sqlSession, BandMember bm) {
		return sqlSession.insert("bandMapper.insertBandMember", bm);
	}

	public int deleteBandMemberCount(SqlSessionTemplate sqlSession, int sbNo) {
		return sqlSession.update("bandMapper.deleteBandMemberCount", sbNo);
	}

	public int deleteBandMember(SqlSessionTemplate sqlSession, BandMember bm) {
		return sqlSession.update("bandMapper.deleteBandMember", bm);
	}

	public int banishComfirm(SqlSessionTemplate sqlSession, BandMember bm) {
		return sqlSession.selectOne("bandMapper.banishComfirm", bm);
	}

	public int updateBandMember(SqlSessionTemplate sqlSession, BandMember bm) {
		return sqlSession.update("bandMapper.updateBandMember", bm);
	}

	public ArrayList<BandReply> ajaxSelectBandReplyList(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return (ArrayList)sqlSession.selectList("bandMapper.ajaxSelectBandReplyList", sbBoardNo);
	}

	public int ajaxInsertBandReply(SqlSessionTemplate sqlSession, BandReply br) {
		return sqlSession.insert("bandMapper.ajaxInsertBandReply", br);
	}

	public ArrayList<BandBoard> selectBandNoticeList(SqlSessionTemplate sqlSession, int sbNo) {
		return (ArrayList)sqlSession.selectList("bandMapper.selectBandNoticeList", sbNo);
	}

	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return sqlSession.update("bandMapper.increaseNoticeCount", sbBoardNo);
	}

	public BandBoard selectBandNoticeBoard(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return sqlSession.selectOne("bandMapper.selectBandNoticeBoard", sbBoardNo);
	}

	public int updateBandProfile(SqlSessionTemplate sqlSession, Band b) {
		return sqlSession.update("bandMapper.updateBandProfile", b);
	}

	public int insertReport(SqlSessionTemplate sqlSession, BandReport br) {
		return sqlSession.insert("bandMapper.insertReport", br);
	}

	public int deleteBandBoard(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return sqlSession.update("bandMapper.deleteBandBoard", sbBoardNo);
	}

	public int deleteBandReply(SqlSessionTemplate sqlSession, int sbReplyNo) {
		return sqlSession.update("bandMapper.deleteBandReply", sbReplyNo);
	}

	public BandReply replyModifyView(SqlSessionTemplate sqlSession, int sbReplyNo) {
		return sqlSession.selectOne("bandMapper.replyModifyView", sbReplyNo);
	}

	public int updateBandReply(SqlSessionTemplate sqlSession, BandReply br) {
		return sqlSession.update("bandMapper.updateBandReply", br);
	}

	public int insertBandBoard(SqlSessionTemplate sqlSession, BandBoard bb) {
		return sqlSession.insert("bandMapper.insertBandBoard", bb);
	}

	public ArrayList<BandBoard> selectBandSearchList(SqlSessionTemplate sqlSession, BandBoard bb) {
		return (ArrayList)sqlSession.selectList("bandMapper.selectBandSearchList", bb);
	}

	public BandMember selectTotalMember(SqlSessionTemplate sqlSession, BandMember bm) {
		BandMember num = sqlSession.selectOne("bandMapper.selectTotalMember", bm);

		return num;
	}

	public ArrayList<BandMember> nickSearch(SqlSessionTemplate sqlSession, BandMember bm) {
		return (ArrayList)sqlSession.selectList("bandMapper.nickSearch", bm);
	}

	public int insertBandAlarm(SqlSessionTemplate sqlSession, BandAlarm ba) {
		return sqlSession.insert("bandMapper.insertBandAlarm", ba);
	}

	public int readerAlarm(SqlSessionTemplate sqlSession, BandAlarm ba) {
		return sqlSession.insert("bandMapper.readerAlarm", ba);
	}

	public int insertPhoto(SqlSessionTemplate sqlSession, BandAttach bat) {
		return sqlSession.insert("bandMapper.insertPhoto", bat);
	}

	public ArrayList<BandAttach> selectPhoto(SqlSessionTemplate sqlSession, int sbBoardNo) {
		return (ArrayList)sqlSession.selectList("bandMapper.selectPhoto", sbBoardNo);
	}

	public int updateBandMemberCount(SqlSessionTemplate sqlSession, Band b) {
		return sqlSession.update("bandMapper.updateBandMemberCount", b);
	}

	public BandMember memberTotalTotal(SqlSessionTemplate sqlSession, BandMember bm) {
		return sqlSession.selectOne("bandMapper.memberTotalTotal", bm);
	}

	public int deleteBand(SqlSessionTemplate sqlSession, int sbNo) {
		return sqlSession.delete("bandMapper.deleteBand", sbNo);
	}

	public BandBoard updateSelectBandBoard(SqlSessionTemplate sqlSession, BandBoard bb) {
		return sqlSession.selectOne("bandMapper.updateSelectBandBoard", bb);
	}

	public int updateBandText(SqlSessionTemplate sqlSession, BandBoard bb) {
		return sqlSession.update("bandMapper.updateBandText", bb);
	}

	public int updateBoardPhoto(SqlSessionTemplate sqlSession, BandAttach bat) {
		return sqlSession.update("bandMapper.updateBoardPhoto", bat);
	}



}
