package com.rongnan.dbutil.shopcart.service;

import java.util.List;
import java.util.Map;

public interface ShopcartService {
	public boolean add(List<Object> param);
	public List<Map<String,Object>> view(String str);

}
