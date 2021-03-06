package cn.it.hotel.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.hotel.model.Room;
import cn.it.hotel.service.RoomService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class RoomServiceImplTest {

	@Resource
	private RoomService roomService;
	
	@Test
	public void queryJoin(){
		for(Room temp:roomService.queryJoinRoomcategoryAndRoomsateAndClientAndUser("", 1, 5)){
			System.out.println(temp.toString());
		}
	}
	
	@Test
	public void getCount(){
		System.out.println(roomService.getCount(""));
	}
}
