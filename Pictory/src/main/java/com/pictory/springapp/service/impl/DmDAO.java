package com.pictory.springapp.service.impl;


	import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.DmDTO;


@Repository("dmDAO")
public class DmDAO {

	
		
		@Autowired
		private SqlSessionTemplate template;
		
		
		
		
		String resource = Constants.RESOURCE.toString();
		
		public ArrayList<DmDTO> messageList(DmDTO dto) {

			String nick = dto.getUserId();
			
			// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
			ArrayList<DmDTO> list = (ArrayList) template.selectList("messageList", dto);
			for (DmDTO mto : list) {
				mto.setUserId(nick);
				// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
				int unread = template.selectOne("countUnread", mto);
				// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
				String profile = template.selectOne("getOtherProfile",mto);
				// 안읽은 메세지 갯수를 mto에 set한다.
				mto.setUnread(unread);
				// 메세지 상대의 프로필사진을 mto에 set한다.
				mto.setUserProfile(profile);
				// 메세지 상대 nick을 세팅한다. other_nick
				if (nick.equals(mto.getSendNick())) {
					mto.setOtherNick(mto.getReadNick());
				} else {
					mto.setOtherNick(mto.getSendNick());
				}
			}
			
			return list;
		}


		// room 별 메세지 내용을 가져온다.
		
		public ArrayList<DmDTO> roomContentList(DmDTO to) {
			
			// 메세지 내역을 가져온다
			ArrayList<DmDTO> clist = (ArrayList) template.selectList("roomContentList", to);

			// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
			template.update("messageReadChk", to);
			
			return clist;
		}
		
		// 메세지 list에서 메세지를 보낸다.
		public int dmSendList(DmDTO to) {
			// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
			if(to.getDmRoom() == 0) {	// room이 0이라면 프로필에서 보낸거다
				int existChat = template.selectOne("existChat", to);
				
				// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
				if(existChat == 0) {	// 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
					int maxRoom = template.selectOne("maxRoom", to);
					to.setDmRoom(maxRoom+1);
				}else {		// 메세지 내역이 있다면 해당 room 번호를 가져온다.
					int dmRoom = Integer.parseInt(template.selectOne("selectRoom", to) );
					to.setDmRoom(dmRoom);
				}
			}
			
			int flag = template.insert("dmSendList",to);
			
			return flag;
		}

	}

