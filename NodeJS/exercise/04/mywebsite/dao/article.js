var article = {
	queryAll: 'select * from article where type = ? order by id desc', //获取全部文章
	queryRAll: 'select a.*,b.`name` as `type_name` from article a left join article_type b on a.type = b.id order by id desc', //获取全部文章带分类名称
	queryRTAll: 'select a.*,b.`name` as `type_name` from article a left join article_type b on a.type = b.id where a.type = ? order by id desc'
};

module.exports = article;