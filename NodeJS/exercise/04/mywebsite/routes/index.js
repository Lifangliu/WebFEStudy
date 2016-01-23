var express = require('express');
var async = require("async");
var Page = require("../util/page");
var sql = require("../dao/article");
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	var Article = DB.get("Article");
	var ArticleType = DB.get("ArticleType");
	var typeId = req.query.t || 1;
	async.waterfall([
		function(cb) { //全部分类
			var data = {};
			ArticleType.where([], {
				'id': 'asc'
			}, function(err, result) {
				if (!result) {
					cb(err, null);
				} else {
					data.types = result;
					cb(err, data);
				}
			});
		},
		function(data, cb) { //全部轮播图
			Article.where({
				'iscarousel': '1'
			}, {
				'id': 'desc'
			}, function(err, result) {
				if (!result) {
					cb(err, null);
				} else {
					data.carousel = result;
					cb(err, data);
				}
			});
		},
		function(data, cb) { //全部热点
			Article.where({
				'ishot': '1'
			}, {
				'id': 'desc'
			}, function(err, result) {
				if (!result) {
					cb(err, null);
				} else {
					data.hotword = result;
					cb(err, data);
				}
			});
		},
		function(data, cb) { //获取第一页的文章
			var page = new Page({
				page: 1,
				pageSize: 20
			});
			Article.queryPageBySql(sql.queryAll, page, [typeId], function(err) {
				data.articles = page;
				cb(err, data);
			});
		}
	], function(err, results) {
		var typeStartId = results.types[0].id; //第一个typeid
		results.typeStartId = typeStartId;
		results.curTypeId = typeId;

		if (err) {
			next(err);
		}
		res.render('index', results);
	});
});

router.get('/load', function(req, res, next) {
	var Article = DB.get("Article");
	var typeId = req.query.type || 1;
	var pn = req.query.pn || 2;
	async.waterfall([
		function(cb) { //获取第 x 页的文章
			var data = {};
			var page = new Page({
				page: pn,
				pageSize: 20
			});
			Article.queryPageBySql(sql.queryAll, page, [typeId], function(err) {
				data.articles = page;
				cb(err, data);
			});
		}
	], function(err, results) {
		res.render('load', results);
	});
});
module.exports = router;