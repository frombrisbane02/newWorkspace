package com.pictory.springapp.dto;

import java.util.List;

public interface AlarmService {
	List<AlarmDTO> selectAlram(String id);
	void insertAlarm(AlarmDTO dto);
	void updateAlarm(int alarmNo, String id);
}
