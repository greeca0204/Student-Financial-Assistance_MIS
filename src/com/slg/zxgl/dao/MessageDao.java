package com.slg.zxgl.dao;

import java.util.List;

import com.slg.zxgl.entity.Message;

public interface MessageDao {
	public List<Message> getAllMessages(int msgType,int target);
	public Message getMessageById(int id);
	public List<Message> getMessageByWord(int msgType, String word);
	public boolean addMessage(Message info, int type, int target);
}
