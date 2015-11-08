package com.rongnan.dbutil.book.service;

import java.util.List;
import java.util.Map;

public interface BookService {
	public List<Map<String,Object>>   findBooks(String params);

}
