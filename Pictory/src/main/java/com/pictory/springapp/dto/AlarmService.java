package com.pictory.springapp.dto;

import java.util.List;

public interface AlarmService {
	List<AlarmDTO> selectAlarm(int userNo);
	void insertAlarm(AlarmDTO dto);
	void updateAlarm(int alarmNo, int userNo);
}
