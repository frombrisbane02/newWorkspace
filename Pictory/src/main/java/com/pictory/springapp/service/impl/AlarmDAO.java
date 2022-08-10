package com.pictory.springapp.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AlarmDTO;

@Repository
public class AlarmDAO {
	@Autowired
	private SqlSessionTemplate template;
	

	public List<AlarmDTO> selectAlarm(int userNo) {
		return template.selectList("selectAlarm", userNo);
	}
	
	public void insertAlarm(AlarmDTO dto) {
		template.insert("insertAlarm", dto);
	}
	
	public void updateAlarmCheck(AlarmDTO dto) {
		template.update("updateAlarm", dto);
	}
}
