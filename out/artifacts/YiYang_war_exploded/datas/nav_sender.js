var navs = [{
	"title": "商城管理",
	"icon": "fa-cubes",
	"spread": true,
	"children": [ {
		"title": "待发货",
		"icon": "&#xe606;",
		"href": "sender/wait_send"
	}, {
		"title": "已发货信息",
		"icon": "&#xe61d;",
		"href": "sender/sent"
	}, {
		"title": "修改密码",
		"icon": "&#xe614;",
		"href": "user/setPassword"
	}]
}, {
	"title": "日志查询",
	"icon": "fa-cogs",
	"spread": false,
	"children": [{
		"title": "进货详情",
		"icon": "&#xe63c;",
		"href": "user/stockLog"
	}, {
		"title": "售货详情",
		"icon": "&#xe63c;",
		"href": "user/sellLog"
	}, {
		"title": "商品损坏信息",
		"icon": "&#xe63c;",
		"href": "user/badLog"
	}]
}];