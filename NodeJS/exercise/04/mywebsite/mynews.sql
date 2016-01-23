/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : mynews

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-12-26 00:09:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '新闻标题',
  `source` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '新闻来源',
  `source_color` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '来源背景颜色',
  `intro` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '简介',
  `type` int(11) DEFAULT NULL COMMENT '文章类型',
  `show_type` int(11) DEFAULT '0' COMMENT '0.（标题+1图）  1.（标题+3图）',
  `thumbnail1` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `thumbnail2` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `thumbnail3` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `iscarousel` int(11) DEFAULT NULL,
  `ishot` int(11) DEFAULT '0' COMMENT '是否是热点新闻0不是1是',
  `publishtime` datetime DEFAULT NULL COMMENT '发表日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '用百度钱包支付，单单返现金1%起', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_01.jpg', null, null, '1', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('2', '航拍深圳山体滑坡现场', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/index_carousel_02.jpg', null, null, '1', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('3', '贾庆林走访考察福建连城', '百家原创', null, '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/index_carousel_03.jpg', null, null, '1', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('4', '扎克伯格库克李彦宏获全球科技企业领袖前三', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/index_carousel_04.jpg', null, null, '1', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('5', '地图揭深圳滑坡地点10年变迁', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/index_carousel_05.jpg', null, null, '1', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('6', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('7', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('8', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('9', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '1', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('10', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('11', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '1', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('12', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('13', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('14', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('15', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('16', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('17', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('18', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('19', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('20', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('21', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('22', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('23', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('24', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('25', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('26', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('27', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('28', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('29', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('30', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('31', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('32', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('33', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('34', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('35', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('36', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('37', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('38', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('39', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('40', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('41', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('42', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('43', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('44', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('45', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('46', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('47', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('48', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('49', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('50', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('51', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('52', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('53', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('54', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('55', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('56', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('57', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '7', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('58', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '8', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('59', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '9', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('60', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '10', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('61', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('62', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '2', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('63', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '3', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('64', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '4', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('65', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '5', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('66', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '6', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('67', '用百度钱包支付，单单返现金1%起', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_01.jpg', '', '', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('68', '航拍深圳山体滑坡现场', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_02.jpg', '', '', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('69', '贾庆林走访考察福建连城', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_03.jpg', '', '', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('70', '扎克伯格库克李彦宏获全球科技企业领袖前三', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_04.jpg', '', '', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('71', '地图揭深圳滑坡地点10年变迁', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/index_carousel_05.jpg', '', '', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('72', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('73', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('74', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('75', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('76', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('77', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('78', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('79', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('80', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('81', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('82', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('83', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('84', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('85', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('86', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('87', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('88', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('89', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('90', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('91', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '1', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('92', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('93', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('94', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('95', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('96', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('97', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('98', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('99', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('100', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('101', '万科安邦联手', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('102', '习近平经济会议讲话', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('103', '洪秀柱会见张志军', '搜狐头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('104', '李克强会见伊总理', '新浪头条', 'redbg', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news1.jpg', 'upload/news2.jpg', 'upload/news1.jpg', '0', '0', '2015-12-25 23:21:29');
INSERT INTO `article` VALUES ('105', '广州政府报告', '百家原创', '', '要优化提升东部城市群，在中西部地区培育发展一批城市群、区域性中心城市。', '1', '0', 'upload/news2.jpg', 'upload/news1.jpg', 'upload/news2.jpg', '0', '0', '2015-12-25 23:21:29');

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `width` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES ('1', '推荐', '1');
INSERT INTO `article_type` VALUES ('2', '百家', '1');
INSERT INTO `article_type` VALUES ('3', '图片', '1');
INSERT INTO `article_type` VALUES ('5', '娱乐', '1');
INSERT INTO `article_type` VALUES ('6', '社会', '1');
INSERT INTO `article_type` VALUES ('7', '军事', '1');
INSERT INTO `article_type` VALUES ('8', '科技', '1');
INSERT INTO `article_type` VALUES ('9', '互联网', '2');
INSERT INTO `article_type` VALUES ('10', '女人', '1');
INSERT INTO `article_type` VALUES ('11', '更多', '1');
INSERT INTO `article_type` VALUES ('4', '本地', '1');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '显示姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 'Robin');
INSERT INTO `manager` VALUES ('2', 'admin1', 'c3284d0f94606de1fd2af172aba15bf3', 'admin');
INSERT INTO `manager` VALUES ('3', 'admin2', 'c3284d0f94606de1fd2af172aba15bf3', 'admin1');
INSERT INTO `manager` VALUES ('4', 'admin3', 'c3284d0f94606de1fd2af172aba15bf3', 'admin2');
INSERT INTO `manager` VALUES ('5', 'admin4', 'c3284d0f94606de1fd2af172aba15bf3', 'admin3');
INSERT INTO `manager` VALUES ('6', 'admin5', 'c3284d0f94606de1fd2af172aba15bf3', 'admin4');
INSERT INTO `manager` VALUES ('7', 'admin6', 'c3284d0f94606de1fd2af172aba15bf3', 'admin5');
INSERT INTO `manager` VALUES ('8', 'admin7', 'c3284d0f94606de1fd2af172aba15bf3', 'admin6');
INSERT INTO `manager` VALUES ('9', 'admin8', 'c3284d0f94606de1fd2af172aba15bf3', 'admin7');
INSERT INTO `manager` VALUES ('10', 'admin9', 'c3284d0f94606de1fd2af172aba15bf3', 'admin8');
INSERT INTO `manager` VALUES ('11', 'admin10', 'c3284d0f94606de1fd2af172aba15bf3', 'admin9');
INSERT INTO `manager` VALUES ('12', 'admin11', 'c3284d0f94606de1fd2af172aba15bf3', 'admin10');
INSERT INTO `manager` VALUES ('13', 'admin12', 'c3284d0f94606de1fd2af172aba15bf3', 'admin11');
INSERT INTO `manager` VALUES ('15', 'admin14', 'c3284d0f94606de1fd2af172aba15bf3', 'admin13');
INSERT INTO `manager` VALUES ('16', 'admin15', 'c3284d0f94606de1fd2af172aba15bf3', 'admin14');
INSERT INTO `manager` VALUES ('17', 'admin16', 'c3284d0f94606de1fd2af172aba15bf3', 'admin15');
INSERT INTO `manager` VALUES ('18', 'admin17', 'c3284d0f94606de1fd2af172aba15bf3', 'admin16');
INSERT INTO `manager` VALUES ('19', 'admin18', 'c3284d0f94606de1fd2af172aba15bf3', 'admin17');
INSERT INTO `manager` VALUES ('20', 'admin19', 'c3284d0f94606de1fd2af172aba15bf3', 'admin18');
INSERT INTO `manager` VALUES ('21', 'admin20', 'c3284d0f94606de1fd2af172aba15bf3', 'admin19');
INSERT INTO `manager` VALUES ('22', 'admin21', 'c3284d0f94606de1fd2af172aba15bf3', 'admin20');
INSERT INTO `manager` VALUES ('23', 'admin22', 'c3284d0f94606de1fd2af172aba15bf3', 'admin21');
INSERT INTO `manager` VALUES ('24', 'admin23', 'c3284d0f94606de1fd2af172aba15bf3', 'admin22');
INSERT INTO `manager` VALUES ('25', 'admin24', 'c3284d0f94606de1fd2af172aba15bf3', 'admin23');
INSERT INTO `manager` VALUES ('26', 'admin25', 'c3284d0f94606de1fd2af172aba15bf3', 'admin24');
INSERT INTO `manager` VALUES ('27', 'admin26', 'c3284d0f94606de1fd2af172aba15bf3', 'admin25');
INSERT INTO `manager` VALUES ('28', 'admin27', 'c3284d0f94606de1fd2af172aba15bf3', 'admin26');
INSERT INTO `manager` VALUES ('29', 'admin28', 'c3284d0f94606de1fd2af172aba15bf3', 'admin27');
INSERT INTO `manager` VALUES ('30', 'admin29', 'c3284d0f94606de1fd2af172aba15bf3', 'admin28');
INSERT INTO `manager` VALUES ('31', 'admin30', 'c3284d0f94606de1fd2af172aba15bf3', 'admin29');
INSERT INTO `manager` VALUES ('32', 'admin31', 'c3284d0f94606de1fd2af172aba15bf3', 'admin30');
INSERT INTO `manager` VALUES ('33', 'admin32', 'c3284d0f94606de1fd2af172aba15bf3', 'admin31');
INSERT INTO `manager` VALUES ('34', 'admin33', 'c3284d0f94606de1fd2af172aba15bf3', 'admin32');
INSERT INTO `manager` VALUES ('35', 'admin34', 'c3284d0f94606de1fd2af172aba15bf3', 'admin33');
INSERT INTO `manager` VALUES ('36', 'admin35', 'c3284d0f94606de1fd2af172aba15bf3', 'admin34');
INSERT INTO `manager` VALUES ('37', 'admin36', 'c3284d0f94606de1fd2af172aba15bf3', 'admin35');
INSERT INTO `manager` VALUES ('38', 'admin37', 'c3284d0f94606de1fd2af172aba15bf3', 'admin36');
INSERT INTO `manager` VALUES ('39', 'admin38', 'c3284d0f94606de1fd2af172aba15bf3', 'admin37');
INSERT INTO `manager` VALUES ('40', 'admin39', 'c3284d0f94606de1fd2af172aba15bf3', 'admin38');
INSERT INTO `manager` VALUES ('41', 'admin40', 'c3284d0f94606de1fd2af172aba15bf3', 'admin39');
INSERT INTO `manager` VALUES ('42', 'admin41', 'c3284d0f94606de1fd2af172aba15bf3', 'admin40');
INSERT INTO `manager` VALUES ('43', 'admin42', 'c3284d0f94606de1fd2af172aba15bf3', 'admin41');
INSERT INTO `manager` VALUES ('44', 'admin43', 'c3284d0f94606de1fd2af172aba15bf3', 'admin42');
INSERT INTO `manager` VALUES ('45', 'admin44', 'c3284d0f94606de1fd2af172aba15bf3', 'admin43');
INSERT INTO `manager` VALUES ('46', 'admin45', 'c3284d0f94606de1fd2af172aba15bf3', 'admin44');
INSERT INTO `manager` VALUES ('47', 'admin46', 'c3284d0f94606de1fd2af172aba15bf3', 'admin45');
INSERT INTO `manager` VALUES ('48', 'admin47', 'c3284d0f94606de1fd2af172aba15bf3', 'admin46');
INSERT INTO `manager` VALUES ('49', 'admin48', 'c3284d0f94606de1fd2af172aba15bf3', 'admin47');
INSERT INTO `manager` VALUES ('50', 'admin49', 'c3284d0f94606de1fd2af172aba15bf3', 'admin48');
INSERT INTO `manager` VALUES ('51', 'admin50', 'c3284d0f94606de1fd2af172aba15bf3', 'admin49');
INSERT INTO `manager` VALUES ('52', 'admin51', 'c3284d0f94606de1fd2af172aba15bf3', 'admin50');
INSERT INTO `manager` VALUES ('53', 'admin52', 'c3284d0f94606de1fd2af172aba15bf3', 'admin51');
INSERT INTO `manager` VALUES ('54', 'admin53', 'c3284d0f94606de1fd2af172aba15bf3', 'admin52');
INSERT INTO `manager` VALUES ('55', 'admin54', 'c3284d0f94606de1fd2af172aba15bf3', 'admin53');
INSERT INTO `manager` VALUES ('56', 'admin55', 'c3284d0f94606de1fd2af172aba15bf3', 'admin54');
INSERT INTO `manager` VALUES ('57', 'admin56', 'c3284d0f94606de1fd2af172aba15bf3', 'admin55');
INSERT INTO `manager` VALUES ('58', 'admin57', 'c3284d0f94606de1fd2af172aba15bf3', 'admin56');
INSERT INTO `manager` VALUES ('59', 'admin58', 'c3284d0f94606de1fd2af172aba15bf3', 'admin57');
INSERT INTO `manager` VALUES ('60', 'admin59', 'c3284d0f94606de1fd2af172aba15bf3', 'admin58');
INSERT INTO `manager` VALUES ('61', 'admin60', 'c3284d0f94606de1fd2af172aba15bf3', 'admin59');
INSERT INTO `manager` VALUES ('62', 'admin61', 'c3284d0f94606de1fd2af172aba15bf3', 'admin60');
INSERT INTO `manager` VALUES ('63', 'admin62', 'c3284d0f94606de1fd2af172aba15bf3', 'admin61');
INSERT INTO `manager` VALUES ('64', 'admin63', 'c3284d0f94606de1fd2af172aba15bf3', 'admin62');
INSERT INTO `manager` VALUES ('65', 'admin64', 'c3284d0f94606de1fd2af172aba15bf3', 'admin63');
INSERT INTO `manager` VALUES ('66', 'admin65', 'c3284d0f94606de1fd2af172aba15bf3', 'admin64');
INSERT INTO `manager` VALUES ('67', 'admin66', 'c3284d0f94606de1fd2af172aba15bf3', 'admin65');
INSERT INTO `manager` VALUES ('68', 'admin67', 'c3284d0f94606de1fd2af172aba15bf3', 'admin66');
INSERT INTO `manager` VALUES ('69', 'admin68', 'c3284d0f94606de1fd2af172aba15bf3', 'admin67');
INSERT INTO `manager` VALUES ('70', 'admin69', 'c3284d0f94606de1fd2af172aba15bf3', 'admin68');
INSERT INTO `manager` VALUES ('71', 'admin70', 'c3284d0f94606de1fd2af172aba15bf3', 'admin69');
INSERT INTO `manager` VALUES ('72', 'admin71', 'c3284d0f94606de1fd2af172aba15bf3', 'admin70');
INSERT INTO `manager` VALUES ('73', 'admin72', 'c3284d0f94606de1fd2af172aba15bf3', 'admin71');
INSERT INTO `manager` VALUES ('74', 'admin73', 'c3284d0f94606de1fd2af172aba15bf3', 'admin72');
INSERT INTO `manager` VALUES ('75', 'admin74', 'c3284d0f94606de1fd2af172aba15bf3', 'admin73');
INSERT INTO `manager` VALUES ('76', 'admin75', 'c3284d0f94606de1fd2af172aba15bf3', 'admin74');
INSERT INTO `manager` VALUES ('77', 'admin76', 'c3284d0f94606de1fd2af172aba15bf3', 'admin75');
INSERT INTO `manager` VALUES ('78', 'admin77', 'c3284d0f94606de1fd2af172aba15bf3', 'admin76');
INSERT INTO `manager` VALUES ('79', 'admin78', 'c3284d0f94606de1fd2af172aba15bf3', 'admin77');
INSERT INTO `manager` VALUES ('80', 'admin79', 'c3284d0f94606de1fd2af172aba15bf3', 'admin78');
INSERT INTO `manager` VALUES ('81', 'admin80', 'c3284d0f94606de1fd2af172aba15bf3', 'admin79');
INSERT INTO `manager` VALUES ('82', 'admin81', 'c3284d0f94606de1fd2af172aba15bf3', 'admin80');
INSERT INTO `manager` VALUES ('83', 'admin82', 'c3284d0f94606de1fd2af172aba15bf3', 'admin81');
INSERT INTO `manager` VALUES ('84', 'admin83', 'c3284d0f94606de1fd2af172aba15bf3', 'admin82');
INSERT INTO `manager` VALUES ('85', 'admin84', 'c3284d0f94606de1fd2af172aba15bf3', 'admin83');
INSERT INTO `manager` VALUES ('86', 'admin85', 'c3284d0f94606de1fd2af172aba15bf3', 'admin84');
INSERT INTO `manager` VALUES ('87', 'admin86', 'c3284d0f94606de1fd2af172aba15bf3', 'admin85');
INSERT INTO `manager` VALUES ('88', 'admin87', 'c3284d0f94606de1fd2af172aba15bf3', 'admin86');
INSERT INTO `manager` VALUES ('89', 'admin88', 'c3284d0f94606de1fd2af172aba15bf3', 'admin87');
INSERT INTO `manager` VALUES ('90', 'admin89', 'c3284d0f94606de1fd2af172aba15bf3', 'admin88');
INSERT INTO `manager` VALUES ('91', 'admin90', 'c3284d0f94606de1fd2af172aba15bf3', 'admin89');
INSERT INTO `manager` VALUES ('92', 'admin91', 'c3284d0f94606de1fd2af172aba15bf3', 'admin90');
INSERT INTO `manager` VALUES ('93', 'admin92', 'c3284d0f94606de1fd2af172aba15bf3', 'admin91');
INSERT INTO `manager` VALUES ('94', 'admin93', 'c3284d0f94606de1fd2af172aba15bf3', 'admin92');
INSERT INTO `manager` VALUES ('95', 'admin94', 'c3284d0f94606de1fd2af172aba15bf3', 'admin93');
INSERT INTO `manager` VALUES ('96', 'admin95', 'c3284d0f94606de1fd2af172aba15bf3', 'admin94');
INSERT INTO `manager` VALUES ('97', 'admin96', 'c3284d0f94606de1fd2af172aba15bf3', 'admin95');
INSERT INTO `manager` VALUES ('98', 'admin97', 'c3284d0f94606de1fd2af172aba15bf3', 'admin96');
INSERT INTO `manager` VALUES ('99', 'admin98', 'c3284d0f94606de1fd2af172aba15bf3', 'admin97');
INSERT INTO `manager` VALUES ('100', 'admin99', 'c3284d0f94606de1fd2af172aba15bf3', 'admin98');
INSERT INTO `manager` VALUES ('101', 'admin100', 'c3284d0f94606de1fd2af172aba15bf3', 'admin99');
INSERT INTO `manager` VALUES ('102', 'admin101', 'c3284d0f94606de1fd2af172aba15bf3', 'admin100');
INSERT INTO `manager` VALUES ('103', 'admin102', 'c3284d0f94606de1fd2af172aba15bf3', 'admin101');
INSERT INTO `manager` VALUES ('104', 'admin103', 'c3284d0f94606de1fd2af172aba15bf3', 'admin102');
INSERT INTO `manager` VALUES ('105', 'admin104', 'c3284d0f94606de1fd2af172aba15bf3', 'admin103');
INSERT INTO `manager` VALUES ('106', 'admin105', 'c3284d0f94606de1fd2af172aba15bf3', 'admin104');
INSERT INTO `manager` VALUES ('107', 'admin106', 'c3284d0f94606de1fd2af172aba15bf3', 'admin105');
INSERT INTO `manager` VALUES ('108', 'admin107', 'c3284d0f94606de1fd2af172aba15bf3', 'admin106');
INSERT INTO `manager` VALUES ('109', 'admin108', 'c3284d0f94606de1fd2af172aba15bf3', 'admin107');
INSERT INTO `manager` VALUES ('110', 'admin109', 'c3284d0f94606de1fd2af172aba15bf3', 'admin108');
INSERT INTO `manager` VALUES ('111', 'admin110', 'c3284d0f94606de1fd2af172aba15bf3', 'admin109');
INSERT INTO `manager` VALUES ('112', 'admin111', 'c3284d0f94606de1fd2af172aba15bf3', 'admin110');
INSERT INTO `manager` VALUES ('113', 'admin112', 'c3284d0f94606de1fd2af172aba15bf3', 'admin111');
INSERT INTO `manager` VALUES ('114', 'admin113', 'c3284d0f94606de1fd2af172aba15bf3', 'admin112');
INSERT INTO `manager` VALUES ('115', 'admin114', 'c3284d0f94606de1fd2af172aba15bf3', 'admin113');
INSERT INTO `manager` VALUES ('116', 'admin115', 'c3284d0f94606de1fd2af172aba15bf3', 'admin114');
INSERT INTO `manager` VALUES ('117', 'admin116', 'c3284d0f94606de1fd2af172aba15bf3', 'admin115');
INSERT INTO `manager` VALUES ('118', 'admin117', 'c3284d0f94606de1fd2af172aba15bf3', 'admin116');
INSERT INTO `manager` VALUES ('119', 'admin118', 'c3284d0f94606de1fd2af172aba15bf3', 'admin117');
