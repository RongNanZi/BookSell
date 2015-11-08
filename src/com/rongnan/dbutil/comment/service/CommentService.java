package com.rongnan.dbutil.comment.service;

import java.util.List;
import java.util.Map;

public interface CommentService {

	public List<Map<String,Object>>  viewXML();
	public boolean addNode(List<Object> param);
}
