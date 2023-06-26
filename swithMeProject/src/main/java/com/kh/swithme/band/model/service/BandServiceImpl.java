package com.kh.swithme.band.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.swithme.band.model.dao.BandDao;
import com.kh.swithme.band.model.vo.Band;
import com.kh.swithme.band.model.vo.BandAlarm;
import com.kh.swithme.band.model.vo.BandAttach;
import com.kh.swithme.band.model.vo.BandBoard;
import com.kh.swithme.band.model.vo.BandMember;
import com.kh.swithme.band.model.vo.BandReply;
import com.kh.swithme.band.model.vo.BandReport;

@Service
public class BandServiceImpl implements BandService {
	
	@Autowired
	private BandDao bandDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Band> selectTestBand(Band b) {
		return bandDao.selectTestBand(sqlSession, b);
	}
	
	@Override
	public ArrayList<BandBoard> selectBandList(int sno) {
		return bandDao.selectBandList(sqlSession, sno);
	}
	
	@Override
	public Band ajaxSelectBandSideBar(int sno) {
		return bandDao.ajaxSelectBandSideBar(sqlSession, sno);
	}
	@Override
	public int increaseCount(int sbBoardNo) {
		return bandDao.increaseCount(sqlSession, sbBoardNo);
	}
	@Override
	public BandBoard selectBandBoard(int sbBoardNo) {
		return bandDao.selectBandBoard(sqlSession, sbBoardNo);
	}
	@Override
	public int insertBandBoard(BandBoard bb) {
		return bandDao.insertBandBoard(sqlSession, bb);
	}
	@Override
	public BandBoard updateSelectBandBoard(BandBoard bb) {
		return bandDao.updateSelectBandBoard(sqlSession, bb);
	}
	@Override
	public int updateBandText(BandBoard bb) {
		return bandDao.updateBandText(sqlSession, bb);
	}
	@Override
	public int updateBoardPhoto(BandAttach bat) {
		return bandDao.updateBoardPhoto(sqlSession, bat);
	}
	@Override
	public int deleteBandBoard(int sbBoardNo) {
		return bandDao.deleteBandBoard(sqlSession, sbBoardNo);
	}
	@Override
	public ArrayList<BandReply> ajaxSelectBandReplyList(int sbBoardNo) {
		return bandDao.ajaxSelectBandReplyList(sqlSession, sbBoardNo);
	}
	@Override
	public int ajaxInsertBandReply(BandReply br) {
		return bandDao.ajaxInsertBandReply(sqlSession, br);
	}
	@Override
	public int updateBandReply(BandReply br) {
		return bandDao.updateBandReply(sqlSession, br);
	}
	@Override
	public int deleteBandReply(int sbReplyNo) {
		return bandDao.deleteBandReply(sqlSession, sbReplyNo);
	}
	@Override
	public ArrayList<BandBoard> selectBandSearchList(BandBoard bb) {
		return bandDao.selectBandSearchList(sqlSession, bb);
	}
	@Override
	public int banishComfirm(BandMember bm) {
		return bandDao.banishComfirm(sqlSession, bm);
	}
	@Override
	public int insertBandMember(BandMember bm) {
		return bandDao.insertBandMember(sqlSession, bm);
	}
	@Override
	public int enrollBandMember(int sbNo) {
		return bandDao.enrollBandMember(sqlSession, sbNo);
	}
	@Override
	public Band selectBandInfo(int sbNo) {
		return bandDao.selectBandInfo(sqlSession, sbNo);
	}
	@Override
	public int insertReport(BandReport br) {
		return bandDao.insertReport(sqlSession, br);
	}
	@Override
	public ArrayList<BandBoard> selectBandNoticeList(int sbNo) {
		return bandDao.selectBandNoticeList(sqlSession, sbNo);
	}
	@Override
	public int increaseNoticeCount(int sbBoardNo) {
		return bandDao.increaseNoticeCount(sqlSession, sbBoardNo);
	}
	@Override
	public BandBoard selectBandNoticeBoard(int sbBoardNo) {
		return bandDao.selectBandNoticeBoard(sqlSession, sbBoardNo);
	}
	@Override
	public ArrayList<BandMember> selectMemberList(int sbNo) {
		return bandDao.selectMemberList(sqlSession, sbNo);
	}
	@Override
	public int updateBandMember(BandMember bm) {
		return bandDao.updateBandMember(sqlSession, bm);
	}
	@Override
	public int deleteBandMemberCount(int sbNo) {
		return bandDao.deleteBandMemberCount(sqlSession, sbNo);
	}
	@Override
	public int deleteBandMember(BandMember bm) {
		return bandDao.deleteBandMember(sqlSession, bm);
	}
	@Override
	public int updateBand(Band b) {
		return bandDao.updateBand(sqlSession, b);
	}
	@Override
	public int updateBandProfile(Band b) {
		return bandDao.updateBandProfile(sqlSession, b);
	}
	@Override
	public int updateBandReader(Band b) {
		return bandDao.updateBandReader(sqlSession, b);
	}
	@Override
	public ArrayList<BandMember> readerList(int sno) {
		return bandDao.readerList(sqlSession, sno);
	}

	@Override
	public BandReply replyModifyView(int sbReplyNo) {
		return bandDao.replyModifyView(sqlSession, sbReplyNo);
	}

	@Override
	public BandMember selectTotalMember(BandMember bm) {
		return bandDao.selectTotalMember(sqlSession, bm);
	}

	@Override
	public ArrayList<BandMember> nickSearch(BandMember bm) {
		return bandDao.nickSearch(sqlSession, bm);
	}

	@Override
	public int insertBandAlarm(BandAlarm ba) {
		return bandDao.insertBandAlarm(sqlSession, ba);
	}

	@Override
	public int readerAlarm(BandAlarm ba) {
		return bandDao.readerAlarm(sqlSession, ba);
	}

	@Override
	public int insertPhoto(BandAttach bat) {
		return bandDao.insertPhoto(sqlSession, bat);
	}

	@Override
	public ArrayList<BandAttach> selectPhoto(int sbBoardNo) {
		return bandDao.selectPhoto(sqlSession, sbBoardNo);
	}

	@Override
	public int updateBandMemberCount(Band b) {
		return bandDao.updateBandMemberCount(sqlSession, b);
	}

	@Override
	public BandMember memberTotalTotal(BandMember bm) {
		return bandDao.memberTotalTotal(sqlSession, bm);
	}

	@Override
	public int deleteBand(int sbNo) {
		return bandDao.deleteBand(sqlSession, sbNo);
	}



}
