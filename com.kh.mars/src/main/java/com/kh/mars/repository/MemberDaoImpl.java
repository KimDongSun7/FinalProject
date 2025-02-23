package com.kh.mars.repository;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AttachDao attachDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;

	@Override
	public void join(MemberDto memberDto) {
		int memberNo = sqlSession.selectOne("member.sequence");
		memberDto.setMemberNo(memberNo);
		
		String rawPassword = memberDto.getMemberPassword();
		String encryptPassword = passwordEncoder.encode(rawPassword);
		memberDto.setMemberPassword(encryptPassword);
		
		sqlSession.insert("member.join", memberDto);
	}

	@Override
	public MemberDto login(String memberEmail, String memberPassword) {
		MemberDto memberDto = sqlSession.selectOne("member.one", memberEmail);
		if(memberDto == null) {
			return null;
		}
		
//		boolean isPassword = memberDto.getMemberPassword().equals(memberPassword);
		boolean isPassword = passwordEncoder.matches(memberPassword, memberDto.getMemberPassword());
		if(isPassword) {
			return memberDto;
		}
		else {
			return null;
		}
	}

	//멤버 정보 조회 (비밀번호 정보 제외)
	@Override
	public MemberDto myInfo(int memberNo) {
		return sqlSession.selectOne("member.myInfo", memberNo);
	}
	
	//멤버 프로필사진 조회
	public int memberProfile(int memberNo) {
		if(sqlSession.selectOne("member.myProfile", memberNo) == null) return 0;
		int attachNo = sqlSession.selectOne("member.myProfile", memberNo);
		return attachNo;
	}
	@Override
	public MemberDto info(int memberNo) {
		return sqlSession.selectOne("member.info", memberNo);
	}

	@Override
	public boolean edit(MemberDto memberDto) {
		return sqlSession.update("member.edit", memberDto) >0;
	}

	@Override
	public boolean changePassword(int memberNo, String currentPassword, String changePassword) {
		MemberDto memberDto = this.info(memberNo);
		if(currentPassword == memberDto.getMemberPassword());
		String encodePassword = passwordEncoder.encode(changePassword);
		
		int count = sqlSession.update("member.changePassword", MemberDto.builder().memberNo(memberNo).memberPassword(encodePassword).build());
			
		
		return count >0;
		
	}

	@Override
	public void proFile(MultipartFile memberProfile, int memberNo) throws IllegalStateException, IOException {
		int attachNo = attachDao.save(memberProfile);
		memberProfileDao.insert(memberNo,attachNo);
		
	}
	
	@Override
	public String nick(int memberNo) {
		
		return sqlSession.selectOne("member.nick", memberNo);
	}

}











