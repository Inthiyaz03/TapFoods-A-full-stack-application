package com.tapfoods.dao;

import java.util.List;

import com.tapfoods.model.Menu;

public interface MenuDao {
	
	int addMenu(Menu menu);
	Menu getMenu(int menuId);
	void updateMenu(Menu menu);
	int deleteMenu(int menuId);
	List<Menu>getAll();
	List<Menu>getMenuByResto(int restauratId);
}
