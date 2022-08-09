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
	public List<AlarmDTO> selectAlram(String id) {
		
		return alarmDao.selectAlarm(id);
	}

	@Override
	public void insertAlarm(AlarmDTO dto) {
		alarmDao.insertAlarm(dto);

	}

	@Override
	public void updateAlarm(int alarmNo, String id) {
		List<AlarmDTO> list = this.selectAlram(id);
		AlarmDTO findDTO = list.stream().filter(alarm -> alarm.getAlarmNo() == alarmNo).findFirst().get();
		findDTO.setCheck(true);
		alarmDao.updateAlarmCheck(findDTO);
	}

}
