package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AlarmDTO;
import com.pictory.springapp.dto.AlarmService;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Autowired private AlarmDAO alarmDao;
	
	@Override
	public List<AlarmDTO> selectAlarm(int userNo) {
		
		return alarmDao.selectAlarm(userNo);
	}

	@Override
	public void insertAlarm(AlarmDTO dto) {
		alarmDao.insertAlarm(dto);

	}

	@Override
	public void updateAlarm(int alarmNo, int userNo) {
		List<AlarmDTO> list = this.selectAlarm(userNo);
		AlarmDTO findDTO = list.stream().filter(alarm -> alarm.getAlarmNo() == alarmNo).findFirst().get();
		findDTO.setChecked(true);
		alarmDao.updateAlarmCheck(findDTO);
	}

}
