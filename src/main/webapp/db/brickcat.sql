/*
Navicat MySQL Data Transfer

Source Server         : xxl-job
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : brickcat

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-06-29 14:52:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brickcat_article`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_article`;
CREATE TABLE `brickcat_article` (
  `oId` varchar(19) NOT NULL,
  `articleTitle` varchar(255) NOT NULL,
  `articleTags` varchar(255) NOT NULL,
  `articleAuthorId` varchar(19) NOT NULL,
  `articleCommentCount` int(11) NOT NULL,
  `articleViewCount` int(11) NOT NULL,
  `articleContent` mediumtext NOT NULL,
  `articleRewardContent` mediumtext NOT NULL,
  `articleRewardPoint` int(11) NOT NULL,
  `articlePermalink` varchar(255) NOT NULL,
  `articleCreateTime` bigint(20) NOT NULL,
  `articleUpdateTime` bigint(20) NOT NULL,
  `articleLatestCmtTime` bigint(20) NOT NULL,
  `articleLatestCmterName` varchar(20) NOT NULL,
  `articleRandomDouble` double NOT NULL,
  `articleCommentable` char(1) NOT NULL,
  `syncWithSymphonyClient` char(1) NOT NULL,
  `clientArticleId` varchar(32) DEFAULT NULL,
  `clientArticlePermalink` varchar(255) DEFAULT NULL,
  `articleEditorType` int(11) NOT NULL,
  `articleStatus` int(11) NOT NULL,
  `articleType` int(11) NOT NULL,
  `articleGoodCnt` int(11) NOT NULL,
  `articleBadCnt` int(11) NOT NULL,
  `articleCollectCnt` int(11) NOT NULL,
  `articleWatchCnt` int(11) NOT NULL,
  `redditScore` double NOT NULL,
  `articleCity` varchar(32) NOT NULL,
  `articleIP` varchar(128) NOT NULL,
  `articleUA` varchar(255) NOT NULL,
  `articleStick` bigint(20) NOT NULL,
  `articleAnonymous` int(11) NOT NULL,
  `articlePerfect` int(11) NOT NULL,
  `articleAnonymousView` int(11) NOT NULL,
  `articleAudioURL` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_article
-- ----------------------------
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community :hearts:', 'Sym,Announcement,测试', '1495610341604', '6', '25', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '0', '', '0.4582691208742483', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `brickcat_book`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_book`;
CREATE TABLE `brickcat_book` (
  `oId` varchar(19) NOT NULL,
  `bookTitle` varchar(128) NOT NULL,
  `bookSubTitle` varchar(128) NOT NULL,
  `bookOriginalTitle` varchar(128) NOT NULL,
  `bookAltTitle` varchar(128) NOT NULL,
  `bookDoubanURL` varchar(128) NOT NULL,
  `bookAuthor` varchar(128) NOT NULL,
  `bookAuthorIntro` text NOT NULL,
  `bookBinding` varchar(32) NOT NULL,
  `bookCatalog` text NOT NULL,
  `bookImgURL` varchar(128) NOT NULL,
  `bookISBN10` varchar(10) NOT NULL,
  `bookISBN13` varchar(13) NOT NULL,
  `bookPages` varchar(4) NOT NULL,
  `bookPrice` varchar(32) NOT NULL,
  `bookPublishDate` varchar(32) NOT NULL,
  `bookPublisher` varchar(64) NOT NULL,
  `bookSeries` varchar(64) NOT NULL,
  `bookSummary` text NOT NULL,
  `bookTags` varchar(128) NOT NULL,
  `bookTranslator` varchar(128) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_book
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_character`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_character`;
CREATE TABLE `brickcat_character` (
  `oId` varchar(19) NOT NULL,
  `characterUserId` varchar(19) NOT NULL,
  `characterImg` mediumtext NOT NULL,
  `characterContent` varchar(16) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_character
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_client`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_client`;
CREATE TABLE `brickcat_client` (
  `oId` varchar(19) NOT NULL,
  `clientName` varchar(10) NOT NULL,
  `clientVersion` varchar(10) NOT NULL,
  `clientHost` varchar(50) NOT NULL,
  `clientRuntimeEnv` varchar(10) NOT NULL,
  `clientLatestAddArticleTime` bigint(20) NOT NULL,
  `clientLatestAddCommentTime` bigint(20) NOT NULL,
  `clientAdminEmail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_client
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_comment`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_comment`;
CREATE TABLE `brickcat_comment` (
  `oId` varchar(19) NOT NULL,
  `clientCommentId` varchar(32) DEFAULT NULL,
  `commentContent` text NOT NULL,
  `commentCreateTime` bigint(20) NOT NULL,
  `commentAuthorId` varchar(19) NOT NULL,
  `commentOnArticleId` varchar(19) NOT NULL,
  `commentSharpURL` varchar(255) NOT NULL,
  `commentOriginalCommentId` varchar(19) NOT NULL,
  `commentStatus` int(11) NOT NULL,
  `commentIP` varchar(128) NOT NULL,
  `commentUA` varchar(255) NOT NULL,
  `commentAnonymous` int(11) NOT NULL,
  `commentGoodCnt` int(11) NOT NULL,
  `commentBadCnt` int(11) NOT NULL,
  `commentScore` double NOT NULL,
  `commentReplyCnt` int(11) NOT NULL,
  `commentAudioURL` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_comment
-- ----------------------------
INSERT INTO `brickcat_comment` VALUES ('1497680377398', null, 'DFG ', '1497680377449', '1495610341604', '1497671086925', '/article/1497671086925#1497680377398', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1497680657261', null, 'fgd ', '1497680657333', '1495610341604', '1497671086925', '/article/1497671086925#1497680657261', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498479362526', null, ' :stuck_out_tongue_winking_eye: ', '1498479362639', '1495610341604', '1495610344271', '/article/1495610344271#1498479362526', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498480090211', null, ' :stuck_out_tongue: ', '1498480090305', '1495610341604', '1495610344271', '/article/1495610344271#1498480090211', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498480123150', null, ' :stuck_out_tongue_winking_eye: ', '1498480123200', '1495610341604', '1495610344271', '/article/1495610344271#1498480123150', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498481944536', null, ' :smile: ', '1498481944607', '1495610341604', '1495610344271', '/article/1495610344271#1498481944536', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498482044346', null, ' :hushed: ', '1498482044429', '1495610341604', '1495610344271', '/article/1495610344271#1498482044346', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498482125424', null, ' :hushed: ', '1498482125494', '1495610341604', '1495610344271', '/article/1495610344271#1498482125424', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498482177601', null, ' :smile: ', '1498482177690', '1495610341604', '1495610344271', '/article/1495610344271#1498482177601', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498540023538', null, ' :weary: ', '1498540023588', '1495610341604', '1498458216708', '/article/1498458216708#1498540023538', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '1', '0', '1', '');
INSERT INTO `brickcat_comment` VALUES ('1498541328185', null, ' :expressionless: ', '1498541328236', '1498540198708', '1498458216708', '/article/1498458216708#1498541328185', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1498541336935', null, ' :heart: ', '1498541337003', '1498540198708', '1498458216708', '/article/1498458216708#1498541336935', '1498540023538', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '1', '');
INSERT INTO `brickcat_comment` VALUES ('1498556849193', null, ' :broken_heart: ', '1498556849260', '1495610341604', '1498458216708', '/article/1498458216708#1498556849193', '1498541336935', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for `brickcat_domain`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_domain`;
CREATE TABLE `brickcat_domain` (
  `oId` varchar(19) NOT NULL,
  `domainTitle` varchar(50) NOT NULL,
  `domainURI` varchar(32) NOT NULL,
  `domainDescription` text NOT NULL,
  `domainType` varchar(16) NOT NULL,
  `domainSort` int(11) NOT NULL,
  `domainTagCnt` int(11) NOT NULL,
  `domainIconPath` text NOT NULL,
  `domainCSS` mediumtext NOT NULL,
  `domainStatus` int(11) NOT NULL,
  `domainSeoTitle` varchar(128) NOT NULL,
  `domainSeoKeywords` varchar(128) NOT NULL,
  `domainSeoDesc` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_domain
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_domain_tag`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_domain_tag`;
CREATE TABLE `brickcat_domain_tag` (
  `oId` varchar(19) NOT NULL,
  `domain_oId` varchar(19) NOT NULL,
  `tag_oId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_domain_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_emotion`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_emotion`;
CREATE TABLE `brickcat_emotion` (
  `oId` varchar(19) NOT NULL,
  `emotionUserId` varchar(19) NOT NULL,
  `emotionContent` varchar(64) NOT NULL,
  `emotionSort` int(11) NOT NULL,
  `emotionType` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_emotion
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_follow`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_follow`;
CREATE TABLE `brickcat_follow` (
  `oId` varchar(19) NOT NULL,
  `followerId` varchar(19) NOT NULL,
  `followingId` varchar(19) NOT NULL,
  `followingType` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_follow
-- ----------------------------
INSERT INTO `brickcat_follow` VALUES ('1497784346748', '1495610341604', '1497708701804', '5');
INSERT INTO `brickcat_follow` VALUES ('1498540212569', '1498540198708', '1495610342368', '1');
INSERT INTO `brickcat_follow` VALUES ('1498540978365', '1498540198708', '1495610344006', '1');
INSERT INTO `brickcat_follow` VALUES ('1498545496573', '1495610341604', '1498458216708', '5');

-- ----------------------------
-- Table structure for `brickcat_invitecode`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_invitecode`;
CREATE TABLE `brickcat_invitecode` (
  `oId` varchar(19) NOT NULL,
  `code` varchar(16) NOT NULL,
  `generatorId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `useTime` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `memo` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_invitecode
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_link`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_link`;
CREATE TABLE `brickcat_link` (
  `oId` varchar(19) NOT NULL,
  `linkAddr` text NOT NULL,
  `linkTitle` text NOT NULL,
  `linkType` int(11) NOT NULL,
  `linkSubmitCnt` int(11) NOT NULL,
  `linkClickCnt` int(11) NOT NULL,
  `linkGoodCnt` int(11) NOT NULL,
  `linkBadCnt` int(11) NOT NULL,
  `linkBaiduRefCnt` int(11) NOT NULL,
  `linkScore` double NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_link
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_liveness`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_liveness`;
CREATE TABLE `brickcat_liveness` (
  `oId` varchar(19) NOT NULL,
  `livenessUserId` varchar(19) NOT NULL,
  `livenessDate` varchar(8) NOT NULL,
  `livenessPoint` int(11) NOT NULL,
  `livenessArticle` int(11) NOT NULL,
  `livenessComment` int(11) NOT NULL,
  `livenessActivity` int(11) NOT NULL,
  `livenessThank` int(11) NOT NULL,
  `livenessVote` int(11) NOT NULL,
  `livenessReward` int(11) NOT NULL,
  `livenessPV` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_liveness
-- ----------------------------
INSERT INTO `brickcat_liveness` VALUES ('1495610344848', '1495610341604', '20170524', '0', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `brickcat_liveness` VALUES ('1496665435341', '1495610341604', '20170605', '0', '0', '1', '0', '0', '0', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1497273001935', '1495610341604', '20170612', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1497451456107', '1495610341604', '20170614', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1497680464363', '1495610341604', '20170617', '0', '0', '3', '0', '0', '0', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1497718374674', '1495610341604', '20170618', '0', '0', '0', '0', '0', '20', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1498463420640', '1495610341604', '20170626', '0', '0', '26', '0', '0', '1', '0', '13');
INSERT INTO `brickcat_liveness` VALUES ('1498525570844', '1495610341604', '20170627', '0', '0', '7', '1', '0', '5', '0', '6');
INSERT INTO `brickcat_liveness` VALUES ('1498541328356', '1498540198708', '20170627', '0', '0', '2', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `brickcat_notification`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_notification`;
CREATE TABLE `brickcat_notification` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `dataId` varchar(64) NOT NULL,
  `dataType` int(11) NOT NULL,
  `hasRead` char(1) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_notification
-- ----------------------------
INSERT INTO `brickcat_notification` VALUES ('1495610341916', '1495610341604', '', '16', '1');
INSERT INTO `brickcat_notification` VALUES ('1495610342165', '1495610341994', '', '16', '0');
INSERT INTO `brickcat_notification` VALUES ('1497278160776', '1497278160243', '', '16', '0');
INSERT INTO `brickcat_notification` VALUES ('1497347062874', '1497278160243', '1497347048591', '10', '0');
INSERT INTO `brickcat_notification` VALUES ('1497362496209', '1495610341604', '1497362494700', '10', '1');
INSERT INTO `brickcat_notification` VALUES ('1497362769802', '1495610341604', '1497362768685', '10', '1');
INSERT INTO `brickcat_notification` VALUES ('1497364137360', '1495610341604', '1497364120193', '10', '1');
INSERT INTO `brickcat_notification` VALUES ('1497617301363', '1495610341604', '1497617301301', '5', '1');
INSERT INTO `brickcat_notification` VALUES ('1497617309817', '1495610341604', '1497617309756', '29', '1');
INSERT INTO `brickcat_notification` VALUES ('1497680464435', '', '1497680377398', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1497680709426', '', '1497680657261', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498123115389', '1495610341604', '1498123115334', '29', '1');
INSERT INTO `brickcat_notification` VALUES ('1498123188725', '1495610341604', '1498123188673', '29', '1');
INSERT INTO `brickcat_notification` VALUES ('1498123394622', '1495610341604', '1498123394565', '29', '1');
INSERT INTO `brickcat_notification` VALUES ('1498123518917', '1495610341604', '1498123518865', '29', '1');
INSERT INTO `brickcat_notification` VALUES ('1498540023731', '', '1498540023538', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498540199300', '1498540198708', '', '16', '0');
INSERT INTO `brickcat_notification` VALUES ('1498541328455', '', '1498541328185', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498556849446', '', '1498556849193', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498556849502', '1498540198708', '1498556849193', '13', '0');

-- ----------------------------
-- Table structure for `brickcat_option`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_option`;
CREATE TABLE `brickcat_option` (
  `oId` varchar(64) NOT NULL,
  `optionValue` text NOT NULL,
  `optionCategory` varchar(100) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_option
-- ----------------------------
INSERT INTO `brickcat_option` VALUES ('miscAllowAddArticle', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('miscAllowAddComment', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('miscAllowAnonymousView', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('miscAllowRegister', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('miscLanguage', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('statisticArticleCount', '1', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticCmtCount', '16', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticDomainCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticLinkCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMaxOnlineVisitorCount', '4', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMemberCount', '4', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticTagCount', '4', 'statistic');

-- ----------------------------
-- Table structure for `brickcat_permission`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_permission`;
CREATE TABLE `brickcat_permission` (
  `oId` varchar(32) NOT NULL,
  `permissionCategory` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_permission
-- ----------------------------
INSERT INTO `brickcat_permission` VALUES ('adminAddVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('adminDeleteVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('adminUpdateVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('adUpdateADSide', '8');
INSERT INTO `brickcat_permission` VALUES ('adUpdateBanner', '8');
INSERT INTO `brickcat_permission` VALUES ('articleAddArticle', '2');
INSERT INTO `brickcat_permission` VALUES ('articleCancelStickArticle', '2');
INSERT INTO `brickcat_permission` VALUES ('articleReindexArticle', '2');
INSERT INTO `brickcat_permission` VALUES ('articleReindexArticles', '2');
INSERT INTO `brickcat_permission` VALUES ('articleRemoveArticle', '2');
INSERT INTO `brickcat_permission` VALUES ('articleStickArticle', '2');
INSERT INTO `brickcat_permission` VALUES ('articleUpdateArticleBasic', '2');
INSERT INTO `brickcat_permission` VALUES ('commentRemoveComment', '3');
INSERT INTO `brickcat_permission` VALUES ('commentUpdateCommentBasic', '3');
INSERT INTO `brickcat_permission` VALUES ('commonAddArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonAddArticleAnonymous', '0');
INSERT INTO `brickcat_permission` VALUES ('commonAddComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonAddCommentAnonymous', '0');
INSERT INTO `brickcat_permission` VALUES ('commonAtParticipants', '0');
INSERT INTO `brickcat_permission` VALUES ('commonAtUser', '0');
INSERT INTO `brickcat_permission` VALUES ('commonBadArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonBadComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonBadVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('commonExchangeIC', '0');
INSERT INTO `brickcat_permission` VALUES ('commonFollowArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonFollowVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('commonGoodArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonGoodComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonGoodVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('commonRemoveArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonRemoveComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonStickArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonStickVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('commonThankArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonThankComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUpdateArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUpdateComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUseIL', '0');
INSERT INTO `brickcat_permission` VALUES ('commonViewArticleHistory', '0');
INSERT INTO `brickcat_permission` VALUES ('commonViewCommentHistory', '0');
INSERT INTO `brickcat_permission` VALUES ('commonWatchArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonWatchVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('domainAddDomain', '4');
INSERT INTO `brickcat_permission` VALUES ('domainAddDomainTag', '4');
INSERT INTO `brickcat_permission` VALUES ('domainRemoveDomain', '4');
INSERT INTO `brickcat_permission` VALUES ('domainRemoveDomainTag', '4');
INSERT INTO `brickcat_permission` VALUES ('domainUpdateDomainBasic', '4');
INSERT INTO `brickcat_permission` VALUES ('icGenIC', '7');
INSERT INTO `brickcat_permission` VALUES ('icUpdateICBasic', '7');
INSERT INTO `brickcat_permission` VALUES ('menuAdmin', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminAD', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminArticles', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminComments', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminDomains', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminIcs', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminMisc', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminRoles', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminRWs', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminTags', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminTrends', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminUsers', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminVideo', '10');
INSERT INTO `brickcat_permission` VALUES ('miscAllowAddArticle', '9');
INSERT INTO `brickcat_permission` VALUES ('miscAllowAddComment', '9');
INSERT INTO `brickcat_permission` VALUES ('miscAllowAnonymousView', '9');
INSERT INTO `brickcat_permission` VALUES ('miscLanguage', '9');
INSERT INTO `brickcat_permission` VALUES ('miscRegisterMethod', '9');
INSERT INTO `brickcat_permission` VALUES ('rwAddReservedWord', '6');
INSERT INTO `brickcat_permission` VALUES ('rwRemoveReservedWord', '6');
INSERT INTO `brickcat_permission` VALUES ('rwUpdateReservedWordBasic', '6');
INSERT INTO `brickcat_permission` VALUES ('tagUpdateTagBasic', '5');
INSERT INTO `brickcat_permission` VALUES ('userAddPoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userAddTrends', '12');
INSERT INTO `brickcat_permission` VALUES ('userAddUser', '1');
INSERT INTO `brickcat_permission` VALUES ('userDeductPoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userDeleteTrends', '12');
INSERT INTO `brickcat_permission` VALUES ('userExchangePoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userExchangeSize', '11');
INSERT INTO `brickcat_permission` VALUES ('userInitSize', '11');
INSERT INTO `brickcat_permission` VALUES ('userUpdateTrends', '12');
INSERT INTO `brickcat_permission` VALUES ('userUpdateUserAdvanced', '1');
INSERT INTO `brickcat_permission` VALUES ('userUpdateUserBasic', '1');
INSERT INTO `brickcat_permission` VALUES ('userWatchVideo', '11');
INSERT INTO `brickcat_permission` VALUES ('userWatchVideoError', '11');

-- ----------------------------
-- Table structure for `brickcat_pointtransfer`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_pointtransfer`;
CREATE TABLE `brickcat_pointtransfer` (
  `oId` varchar(19) NOT NULL,
  `fromId` varchar(19) NOT NULL,
  `toId` varchar(19) NOT NULL,
  `sum` int(11) NOT NULL,
  `fromBalance` int(11) NOT NULL,
  `toBalance` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `dataId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_pointtransfer
-- ----------------------------
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610341853', 'sys', '1495610341604', '500', '0', '500', '1495610341853', '0', '1495610341604');
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610342103', 'sys', '1495610341994', '500', '0', '500', '1495610342087', '0', '1495610341994');
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610344770', '1495610341604', 'sys', '20', '480', '0', '1495610344770', '1', '1495610344271');
INSERT INTO `brickcat_pointtransfer` VALUES ('1496665446608', '1495610341604', 'sys', '2', '478', '0', '1496665446603', '3', '1496665446466');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497278160714', 'sys', '1497278160243', '500', '0', '500', '1497278160709', '0', '1497278160243');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497347048591', '1497278160243', 'sys', '100', '400', '0', '1497347046966', '16', '0.0');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497362494700', '1495610341604', 'sys', '100', '378', '0', '1497362493577', '16', '0.0');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497362768685', '1495610341604', 'sys', '100', '278', '0', '1497362767403', '16', '0.0');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497364120193', '1495610341604', 'sys', '100', '178', '0', '1497364118675', '33', '0.0');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497452282848', 'sys', '1495610341604', '12', '0', '190', '1497452282844', '8', '1495610341604');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497617301301', 'sys', '1495610341604', '5000000', '0', '5000190', '1497617301286', '13', '12345');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497617309756', '1495610341604', 'sys', '2800', '4997390', '0', '1497617309750', '33', '5000');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497680797806', '1495610341604', 'sys', '2', '4997383', '0', '1497680797801', '3', '1497680797673');
INSERT INTO `brickcat_pointtransfer` VALUES ('1497786504837', '1495610341604', 'sys', '100', '4997283', '0', '1497786504814', '19', '1497708701804');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498123115334', '1495610341604', 'sys', '100', '4997183', '0', '1498123115321', '33', '100');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498123188673', '1495610341604', 'sys', '2800', '4994383', '0', '1498123188669', '33', '5000');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498123394565', '1495610341604', 'sys', '100', '4994283', '0', '1498123394554', '33', '100');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498123518865', '1495610341604', 'sys', '2800', '4991483', '0', '1498123518851', '33', '5000');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498464238094', '1495610341604', 'sys', '2', '4991476', '0', '1498464237388', '3', '1498464005614');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498475329366', '1495610341604', 'sys', '2', '4991474', '0', '1498475329354', '3', '1498475329192');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498476414365', '1495610341604', 'sys', '2', '4991472', '0', '1498476414361', '3', '1498476414243');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498476968998', '1495610341604', 'sys', '2', '4991470', '0', '1498476968986', '3', '1498476968867');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498477398192', '1495610341604', 'sys', '2', '4991468', '0', '1498477398182', '3', '1498477398063');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498477456222', '1495610341604', 'sys', '2', '4991466', '0', '1498477456213', '3', '1498477456086');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498477469436', '1495610341604', 'sys', '2', '4991464', '0', '1498477469424', '3', '1498477469302');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498477585780', '1495610341604', 'sys', '2', '4991462', '0', '1498477585770', '3', '1498477585648');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498477711718', '1495610341604', 'sys', '2', '4991460', '0', '1498477711714', '3', '1498477711593');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498478436108', '1495610341604', 'sys', '2', '4991458', '0', '1498478436061', '3', '1498478435812');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498478835435', '1495610341604', 'sys', '2', '4991456', '0', '1498478835430', '3', '1498478835308');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498478887166', '1495610341604', 'sys', '2', '4991454', '0', '1498478887155', '3', '1498478887031');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479049187', '1495610341604', 'sys', '2', '4991452', '0', '1498479049178', '3', '1498479049057');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479154296', '1495610341604', 'sys', '2', '4991450', '0', '1498479154296', '3', '1498479154150');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479188127', '1495610341604', 'sys', '2', '4991448', '0', '1498479188127', '3', '1498479187967');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479251842', '1495610341604', 'sys', '2', '4991446', '0', '1498479251842', '3', '1498479251683');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479283771', '1495610341604', 'sys', '2', '4991444', '0', '1498479283766', '3', '1498479283639');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498479362748', '1495610341604', 'sys', '2', '4991442', '0', '1498479362732', '3', '1498479362526');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498480090367', '1495610341604', 'sys', '2', '4991440', '0', '1498480090367', '3', '1498480090211');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498480123320', '1495610341604', 'sys', '2', '4991438', '0', '1498480123304', '3', '1498480123150');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498481874490', '1495610341604', 'sys', '2', '4991436', '0', '1498481874487', '3', '1498481874375');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498481944669', '1495610341604', 'sys', '2', '4991434', '0', '1498481944669', '3', '1498481944536');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498482044491', '1495610341604', 'sys', '2', '4991432', '0', '1498482044491', '3', '1498482044346');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498482125588', '1495610341604', 'sys', '2', '4991430', '0', '1498482125588', '3', '1498482125424');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498482177783', '1495610341604', 'sys', '2', '4991428', '0', '1498482177783', '3', '1498482177601');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498525580047', '1495610341604', 'sys', '2', '4991426', '0', '1498525580032', '3', '1498525579842');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498527292655', '1495610341604', 'sys', '2', '4991424', '0', '1498527292641', '3', '1498527292494');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498532797014', '1495610341604', 'sys', '2', '4991422', '0', '1498532796997', '3', '1498532796810');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498535066875', '1495610341604', 'sys', '2', '4991420', '0', '1498535066862', '3', '1498535066740');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498538713668', '1495610341604', 'sys', '2', '4991418', '0', '1498538713662', '3', '1498538713543');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498540023656', '1495610341604', 'sys', '2', '4991416', '0', '1498540023652', '3', '1498540023538');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498540199244', 'sys', '1498540198708', '500', '0', '500', '1498540199236', '0', '1498540198708');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498541328302', '1498540198708', '1495610341604', '5', '495', '4991421', '1498541328296', '3', '1498541328185');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498541337080', '1498540198708', '1495610341604', '5', '490', '4991426', '1498541337069', '3', '1498541336935');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498556849338', '1495610341604', 'sys', '2', '4991424', '0', '1498556849335', '3', '1498556849193');
INSERT INTO `brickcat_pointtransfer` VALUES ('1498559072350', 'sys', '1495610341604', '5', '0', '4991429', '1498559072340', '8', '1495610341604');

-- ----------------------------
-- Table structure for `brickcat_referral`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_referral`;
CREATE TABLE `brickcat_referral` (
  `oId` varchar(19) NOT NULL,
  `referralUser` varchar(19) NOT NULL,
  `referralDataId` varchar(19) NOT NULL,
  `referralType` int(11) NOT NULL,
  `referralIP` varchar(128) NOT NULL,
  `referralClick` int(11) NOT NULL,
  `referralUserHasPoint` char(1) NOT NULL,
  `referralAuthorHasPoint` char(1) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_referral
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_revision`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_revision`;
CREATE TABLE `brickcat_revision` (
  `oId` varchar(19) NOT NULL,
  `revisionDataType` int(11) NOT NULL,
  `revisionDataId` varchar(19) NOT NULL,
  `revisionData` mediumtext NOT NULL,
  `revisionAuthorId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_revision
-- ----------------------------
INSERT INTO `brickcat_revision` VALUES ('1495610344583', '0', '1495610344271', '{\"articleTitle\":\"Welcome to Sym community &hearts;\",\"articleContent\":\"Hello, everyone!\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1497680464281', '1', '1497680377398', '{\"commentContent\":\"DFG \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1497680690870', '1', '1497680657261', '{\"commentContent\":\"fgd \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498479362670', '1', '1498479362526', '{\"commentContent\":\" :stuck_out_tongue_winking_eye: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498480090305', '1', '1498480090211', '{\"commentContent\":\" :stuck_out_tongue: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498480123214', '1', '1498480123150', '{\"commentContent\":\" :stuck_out_tongue_winking_eye: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498481944607', '1', '1498481944536', '{\"commentContent\":\" :smile: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498482044429', '1', '1498482044346', '{\"commentContent\":\" :hushed: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498482125525', '1', '1498482125424', '{\"commentContent\":\" :hushed: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498482177721', '1', '1498482177601', '{\"commentContent\":\" :smile: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498540023599', '1', '1498540023538', '{\"commentContent\":\" :weary: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498541328244', '1', '1498541328185', '{\"commentContent\":\" :expressionless: \"}', '1498540198708');
INSERT INTO `brickcat_revision` VALUES ('1498541337017', '1', '1498541336935', '{\"commentContent\":\" :heart: \"}', '1498540198708');
INSERT INTO `brickcat_revision` VALUES ('1498556849283', '1', '1498556849193', '{\"commentContent\":\" :broken_heart: \"}', '1495610341604');

-- ----------------------------
-- Table structure for `brickcat_reward`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_reward`;
CREATE TABLE `brickcat_reward` (
  `oId` varchar(19) NOT NULL,
  `senderId` varchar(19) NOT NULL,
  `dataId` varchar(19) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_role`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_role`;
CREATE TABLE `brickcat_role` (
  `oId` varchar(32) NOT NULL,
  `roleName` varchar(32) NOT NULL,
  `roleDescription` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_role
-- ----------------------------
INSERT INTO `brickcat_role` VALUES ('adminRole', 'Admin', '');
INSERT INTO `brickcat_role` VALUES ('defaultRole', 'Default', '');
INSERT INTO `brickcat_role` VALUES ('leaderRole', 'Leader', '');
INSERT INTO `brickcat_role` VALUES ('memberRole', 'Member', '');
INSERT INTO `brickcat_role` VALUES ('regularRole', 'Regular', '');
INSERT INTO `brickcat_role` VALUES ('visitorRole', 'Visitor', '');

-- ----------------------------
-- Table structure for `brickcat_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_role_permission`;
CREATE TABLE `brickcat_role_permission` (
  `oId` varchar(19) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  `permissionId` varchar(32) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_role_permission
-- ----------------------------
INSERT INTO `brickcat_role_permission` VALUES ('1495610331823', 'memberRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1495610331885', 'memberRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1495610331947', 'memberRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332010', 'memberRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332072', 'memberRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332135', 'memberRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332197', 'memberRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332259', 'memberRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332322', 'memberRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332384', 'memberRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332447', 'memberRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332509', 'memberRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332571', 'memberRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332634', 'memberRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332696', 'memberRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1495610332759', 'memberRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002632', 'regularRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002683', 'regularRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002733', 'regularRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002783', 'regularRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002833', 'regularRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002883', 'regularRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002933', 'regularRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653002983', 'regularRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003033', 'regularRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003083', 'regularRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003133', 'regularRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003183', 'regularRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003233', 'regularRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003283', 'regularRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003333', 'regularRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003383', 'regularRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003433', 'regularRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003483', 'regularRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003533', 'regularRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003583', 'regularRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003633', 'regularRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003686', 'regularRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003736', 'regularRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003788', 'regularRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003838', 'regularRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003888', 'regularRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003938', 'regularRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1496653003988', 'regularRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012246', 'leaderRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012299', 'leaderRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012350', 'leaderRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012401', 'leaderRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012452', 'leaderRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012503', 'leaderRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012553', 'leaderRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012603', 'leaderRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012653', 'leaderRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012704', 'leaderRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012755', 'leaderRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012806', 'leaderRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012857', 'leaderRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012908', 'leaderRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1496653012959', 'leaderRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013010', 'leaderRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013061', 'leaderRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013112', 'leaderRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013163', 'leaderRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013214', 'leaderRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013265', 'leaderRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013316', 'leaderRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013366', 'leaderRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013416', 'leaderRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013467', 'leaderRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013518', 'leaderRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013569', 'leaderRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013619', 'leaderRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013669', 'leaderRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013719', 'leaderRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013769', 'leaderRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013819', 'leaderRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013870', 'leaderRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013921', 'leaderRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1496653013972', 'leaderRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014023', 'leaderRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014073', 'leaderRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014124', 'leaderRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014175', 'leaderRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014226', 'leaderRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014277', 'leaderRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014328', 'leaderRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014379', 'leaderRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014430', 'leaderRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014483', 'leaderRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014534', 'leaderRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014585', 'leaderRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014636', 'leaderRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1496653014687', 'leaderRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033444', 'defaultRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033495', 'defaultRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033545', 'defaultRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033595', 'defaultRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033645', 'defaultRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033695', 'defaultRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033745', 'defaultRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033795', 'defaultRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033845', 'defaultRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033895', 'defaultRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033945', 'defaultRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1496653033995', 'defaultRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123538', 'adminRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123592', 'adminRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123643', 'adminRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123694', 'adminRole', 'miscAllowAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123745', 'adminRole', 'miscAllowAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123796', 'adminRole', 'miscAllowAnonymousView');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123847', 'adminRole', 'miscLanguage');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123898', 'adminRole', 'miscRegisterMethod');
INSERT INTO `brickcat_role_permission` VALUES ('1498565123949', 'adminRole', 'commentRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124000', 'adminRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124051', 'adminRole', 'userAddTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124102', 'adminRole', 'userDeleteTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124153', 'adminRole', 'userUpdateTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124204', 'adminRole', 'articleAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124255', 'adminRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124307', 'adminRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124358', 'adminRole', 'articleReindexArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124409', 'adminRole', 'articleRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124460', 'adminRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124511', 'adminRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124562', 'adminRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124613', 'adminRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124664', 'adminRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124715', 'adminRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124766', 'adminRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124817', 'adminRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124868', 'adminRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124919', 'adminRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565124970', 'adminRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125021', 'adminRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125072', 'adminRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125123', 'adminRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125174', 'adminRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125225', 'adminRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125276', 'adminRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125327', 'adminRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125378', 'adminRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125429', 'adminRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125480', 'adminRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125531', 'adminRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125582', 'adminRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125633', 'adminRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125684', 'adminRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125734', 'adminRole', 'adUpdateADSide');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125784', 'adminRole', 'adUpdateBanner');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125834', 'adminRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125884', 'adminRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125935', 'adminRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1498565125986', 'adminRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126037', 'adminRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126088', 'adminRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126139', 'adminRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126190', 'adminRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126241', 'adminRole', 'menuAdminAD');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126292', 'adminRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126343', 'adminRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126394', 'adminRole', 'menuAdminDomains');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126445', 'adminRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126496', 'adminRole', 'menuAdminMisc');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126547', 'adminRole', 'menuAdminRoles');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126601', 'adminRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126652', 'adminRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126703', 'adminRole', 'menuAdminTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126754', 'adminRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126805', 'adminRole', 'menuAdminVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126856', 'adminRole', 'adminAddVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126907', 'adminRole', 'adminDeleteVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565126958', 'adminRole', 'adminUpdateVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127009', 'adminRole', 'commonBadVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127060', 'adminRole', 'commonFollowVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127111', 'adminRole', 'commonGoodVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127162', 'adminRole', 'commonStickVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127213', 'adminRole', 'commonWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127264', 'adminRole', 'userExchangeSize');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127315', 'adminRole', 'userInitSize');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127366', 'adminRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127417', 'adminRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127468', 'adminRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127523', 'adminRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127574', 'adminRole', 'domainAddDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127625', 'adminRole', 'domainAddDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127676', 'adminRole', 'domainRemoveDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127727', 'adminRole', 'domainRemoveDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1498565127778', 'adminRole', 'domainUpdateDomainBasic');

-- ----------------------------
-- Table structure for `brickcat_tag`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_tag`;
CREATE TABLE `brickcat_tag` (
  `oId` varchar(19) NOT NULL,
  `tagReferenceCount` int(11) NOT NULL,
  `tagCommentCount` int(11) NOT NULL,
  `tagFollowerCount` int(11) NOT NULL,
  `tagLinkCount` int(11) NOT NULL,
  `tagTitle` varchar(50) NOT NULL,
  `tagURI` varchar(255) NOT NULL,
  `tagDescription` text NOT NULL,
  `tagIconPath` varchar(128) NOT NULL,
  `tagCSS` mediumtext NOT NULL,
  `tagStatus` int(11) NOT NULL,
  `tagGoodCnt` int(11) NOT NULL,
  `tagBadCnt` int(11) NOT NULL,
  `tagSeoTitle` varchar(128) NOT NULL,
  `tagSeoKeywords` varchar(128) NOT NULL,
  `tagSeoDesc` text NOT NULL,
  `tagRandomDouble` double NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_tag
-- ----------------------------
INSERT INTO `brickcat_tag` VALUES ('1495610342228', '1', '15', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.28562016788486544');
INSERT INTO `brickcat_tag` VALUES ('1495610342368', '1', '15', '1', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.414193157575671');
INSERT INTO `brickcat_tag` VALUES ('1495610344006', '0', '0', '1', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.00025770856113649376');
INSERT INTO `brickcat_tag` VALUES ('1498545630866', '1', '7', '0', '0', '测试', '%E6%B5%8B%E8%AF%95', '', '', '', '0', '0', '0', '测试', '测试', '', '0.5469872332199878');

-- ----------------------------
-- Table structure for `brickcat_tag_article`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_tag_article`;
CREATE TABLE `brickcat_tag_article` (
  `oId` varchar(19) NOT NULL,
  `article_oId` varchar(19) NOT NULL,
  `tag_oId` varchar(19) NOT NULL,
  `articleCommentCount` int(11) NOT NULL,
  `articleLatestCmtTime` bigint(20) NOT NULL,
  `redditScore` double NOT NULL,
  `articlePerfect` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_tag_article
-- ----------------------------
INSERT INTO `brickcat_tag_article` VALUES ('1495610344334', '1495610344271', '1495610342368', '8', '1498525579838', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1495610344458', '1495610344271', '1495610342228', '8', '1498525579838', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1498545838958', '1495610344271', '1498545630866', '6', '0', '0', '0');

-- ----------------------------
-- Table structure for `brickcat_tag_tag`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_tag_tag`;
CREATE TABLE `brickcat_tag_tag` (
  `oId` varchar(19) NOT NULL,
  `tag1_oId` varchar(19) NOT NULL,
  `tag2_oId` varchar(19) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_tag_tag
-- ----------------------------
INSERT INTO `brickcat_tag_tag` VALUES ('1495610344708', '1495610342368', '1495610342228', '1');

-- ----------------------------
-- Table structure for `brickcat_tag_user_link`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_tag_user_link`;
CREATE TABLE `brickcat_tag_user_link` (
  `oId` varchar(19) NOT NULL,
  `linkId` varchar(19) NOT NULL,
  `tagId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `linkScore` double NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_tag_user_link
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_trends`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_trends`;
CREATE TABLE `brickcat_trends` (
  `oId` varchar(19) NOT NULL,
  `trendTitle` varchar(255) NOT NULL,
  `trendTags` varchar(255) NOT NULL,
  `trendAuthorId` varchar(19) NOT NULL,
  `trendCommentCount` int(11) NOT NULL,
  `trendViewCount` int(11) NOT NULL,
  `trendContent` mediumtext NOT NULL,
  `trendRewardContent` mediumtext NOT NULL,
  `trendRewardPoint` int(11) NOT NULL,
  `trendPermalink` varchar(255) NOT NULL,
  `trendCreateTime` bigint(20) NOT NULL,
  `trendUpdateTime` bigint(20) NOT NULL,
  `trendLatestCmtTime` bigint(20) NOT NULL,
  `trendLatestCmterName` varchar(20) NOT NULL,
  `trendCommentable` int(1) NOT NULL,
  `trendStatus` int(11) NOT NULL,
  `trendType` int(11) NOT NULL,
  `trendGoodCnt` int(11) NOT NULL,
  `trendBadCnt` int(11) NOT NULL,
  `trendCollectCnt` int(11) NOT NULL,
  `trendWatchCnt` int(11) NOT NULL,
  `redditScore` double NOT NULL,
  `trendCity` varchar(32) NOT NULL,
  `trendIP` varchar(128) NOT NULL,
  `trendUA` varchar(255) NOT NULL,
  `trendPerfect` int(11) NOT NULL,
  `trendImageURL` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_trends
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_user`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_user`;
CREATE TABLE `brickcat_user` (
  `oId` varchar(19) NOT NULL,
  `userNo` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPassword` varchar(32) NOT NULL,
  `userNickname` varchar(20) NOT NULL,
  `userTags` varchar(128) NOT NULL,
  `userURL` varchar(100) NOT NULL,
  `userQQ` varchar(12) NOT NULL,
  `userIntro` varchar(255) NOT NULL,
  `userAvatarType` int(11) NOT NULL,
  `userAvatarURL` varchar(255) NOT NULL,
  `userOnlineFlag` char(1) NOT NULL,
  `userB3Key` varchar(20) NOT NULL,
  `userB3ClientAddArticleURL` varchar(150) NOT NULL,
  `userB3ClientUpdateArticleURL` varchar(150) NOT NULL,
  `userB3ClientAddCommentURL` varchar(150) NOT NULL,
  `userRole` varchar(20) NOT NULL,
  `userArticleCount` int(11) NOT NULL,
  `userCommentCount` int(11) NOT NULL,
  `userTagCount` int(11) NOT NULL,
  `userStatus` int(11) NOT NULL,
  `userPoint` int(11) NOT NULL,
  `userUsedPoint` int(11) NOT NULL,
  `userJoinPointRank` int(11) NOT NULL,
  `userJoinUsedPointRank` int(11) NOT NULL,
  `userLatestArticleTime` bigint(20) NOT NULL,
  `userLatestCmtTime` bigint(20) NOT NULL,
  `userLatestLoginTime` bigint(20) NOT NULL,
  `userLatestLoginIP` varchar(128) NOT NULL,
  `userAppRole` int(11) NOT NULL,
  `userCheckinTime` bigint(20) NOT NULL,
  `userLongestCheckinStreakStart` int(11) NOT NULL,
  `userLongestCheckinStreakEnd` int(11) NOT NULL,
  `userCurrentCheckinStreakStart` int(11) NOT NULL,
  `userCurrentCheckinStreakEnd` int(11) NOT NULL,
  `userLongestCheckinStreak` int(11) NOT NULL,
  `userCurrentCheckinStreak` int(11) NOT NULL,
  `userSkin` varchar(32) NOT NULL,
  `userMobileSkin` varchar(32) NOT NULL,
  `userCountry` varchar(32) NOT NULL,
  `userProvince` varchar(32) NOT NULL,
  `userCity` varchar(32) NOT NULL,
  `userUpdateTime` bigint(20) NOT NULL,
  `userGeoStatus` int(11) NOT NULL,
  `syncWithSymphonyClient` char(1) NOT NULL,
  `userCommentViewMode` int(11) NOT NULL,
  `userUAStatus` int(11) NOT NULL,
  `userNotifyStatus` int(11) NOT NULL,
  `userPointStatus` int(11) NOT NULL,
  `userFollowerStatus` int(11) NOT NULL,
  `userFollowingArticleStatus` int(11) NOT NULL,
  `userWatchingArticleStatus` int(11) NOT NULL,
  `userFollowingTagStatus` int(11) NOT NULL,
  `userFollowingUserStatus` int(11) NOT NULL,
  `userCommentStatus` int(11) NOT NULL,
  `userArticleStatus` int(11) NOT NULL,
  `userOnlineStatus` int(11) NOT NULL,
  `userTimelineStatus` int(11) NOT NULL,
  `userForgeLinkStatus` int(11) NOT NULL,
  `userListPageSize` int(11) NOT NULL,
  `userAvatarViewMode` int(11) NOT NULL,
  `userSubMailStatus` int(11) NOT NULL,
  `userSubMailSendTime` bigint(20) NOT NULL,
  `userKeyboardShortcutsStatus` int(11) NOT NULL,
  `userLanguage` varchar(64) NOT NULL,
  `userTimezone` varchar(64) NOT NULL,
  `userGuideStep` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_user
-- ----------------------------
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'admin', '42857cfddb33f3fddb27fff9773683f3', '', '', '', '', '', '2', 'http://localhost:9090/upload/f1a4408ca14743438ba058a21d69a4c5_06a1751875c26f6409149f9380a7899c_b.jpg', '0', '', '', '', '', 'adminRole', '1', '10', '4', '0', '4991429', '9098', '0', '0', '1495610344193', '1498556849180', '1498717538392', '0:0:0:0:0:0:0:1', '0', '1498559072405', '20170614', '20170614', '20170627', '20170627', '1', '1', 'classic', 'mobile', '', '', '', '1498471722585', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341994', '1', 'en_US', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1497277766038', '3', '549595297@qq.com', 'viseosize', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/87a43004bbf74cbcad20972c03da2e66.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497277766036', '1', 'zh_CN', 'Asia/Shanghai', '1');
INSERT INTO `brickcat_user` VALUES ('1497278160243', '3', '54959597@qq.com', 'viseosize1', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/59e6b136e37841bdb10e34a99b83e624.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '400', '100', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497278160241', '1', 'zh_CN', 'Asia/Shanghai', '1');
INSERT INTO `brickcat_user` VALUES ('1498540198708', '4', '5495952971@qq.com', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '2', 'http://localhost:9090/upload/4dff22c6968a4b45a3312a1aff5ec979.jpg', '0', '', '', '', '', 'defaultRole', '0', '2', '0', '0', '490', '10', '0', '0', '0', '1498541336934', '1498542607985', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1498540198707', '1', 'zh_CN', 'Asia/Shanghai', '0');

-- ----------------------------
-- Table structure for `brickcat_user_book_article`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_user_book_article`;
CREATE TABLE `brickcat_user_book_article` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `bookId` varchar(19) NOT NULL,
  `articleId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_user_book_article
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_user_tag`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_user_tag`;
CREATE TABLE `brickcat_user_tag` (
  `oId` varchar(19) NOT NULL,
  `user_oId` varchar(19) NOT NULL,
  `tag_oId` varchar(19) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_user_tag
-- ----------------------------
INSERT INTO `brickcat_user_tag` VALUES ('1495610342306', '1495610341604', '1495610342228', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1495610342430', '1495610341604', '1495610342368', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1495610344084', '1495610341604', '1495610344006', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1495610344396', '1495610341604', '1495610342368', '1');
INSERT INTO `brickcat_user_tag` VALUES ('1495610344521', '1495610341604', '1495610342228', '1');
INSERT INTO `brickcat_user_tag` VALUES ('1498545630922', '1495610341604', '1498545630866', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1498545839012', '1495610341604', '1498545630866', '1');

-- ----------------------------
-- Table structure for `brickcat_verifycode`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_verifycode`;
CREATE TABLE `brickcat_verifycode` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `type` int(11) NOT NULL,
  `bizType` int(11) NOT NULL,
  `receiver` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `status` int(11) NOT NULL,
  `expired` bigint(20) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_verifycode
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_video`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_video`;
CREATE TABLE `brickcat_video` (
  `oId` varchar(19) NOT NULL,
  `videoTitle` varchar(255) NOT NULL,
  `videoPoint` int(11) NOT NULL,
  `videoTag` varchar(255) NOT NULL,
  `videoAuthorId` varchar(19) NOT NULL,
  `videoCommentCount` int(11) NOT NULL,
  `videoViewCount` int(11) NOT NULL,
  `videoUrl` varchar(255) NOT NULL,
  `videoRewardContent` mediumtext NOT NULL,
  `videoRewardPoint` int(11) NOT NULL,
  `videoCreateTime` bigint(20) NOT NULL,
  `videoUpdateTime` bigint(20) NOT NULL,
  `videoLatestCmtTime` bigint(20) NOT NULL,
  `videoLatestCmterName` varchar(20) NOT NULL,
  `videoDownLoadCount` int(11) NOT NULL,
  `videoGoodCount` int(11) NOT NULL,
  `videoBadCount` int(11) NOT NULL,
  `videoWatchCount` int(11) NOT NULL,
  `videoType` int(11) NOT NULL,
  `videoStatus` int(11) NOT NULL,
  `videoRemarks` varchar(255) DEFAULT NULL,
  `videoImgPath` varchar(255) DEFAULT NULL,
  `videoSize` int(11) DEFAULT NULL,
  `redditScore` double DEFAULT NULL,
  `videoCollectCount` int(11) DEFAULT NULL,
  `videoStick` bigint(20) DEFAULT NULL,
  `videoDownPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_video
-- ----------------------------
INSERT INTO `brickcat_video` VALUES ('1498458216708', '这个是一条测试', '0', '测试', '1495610341604', '4', '100', '823658abfe104d10b507bea60ede02bd/823658abfe104d10b507bea60ede02bd.m3u8', '', '0', '1498458216565', '1498458216565', '1498556849180', 'admin', '0', '1', '0', '1', '0', '0', '更更更更更过过过过过过方法反反复复付付', '823658abfe104d10b507bea60ede02bd.png', '311', '3215', '0', '0', '823658abfe104d10b507bea60ede02bd/3.mp4');
INSERT INTO `brickcat_video` VALUES ('1498550761733', '这个是一条测试的视频', '0', '测试', '1495610341604', '0', '0', '586d740ed3d845db91ade433e8966936/586d740ed3d845db91ade433e8966936.m3u8', '', '0', '1498550761723', '1498550761723', '0', '0', '0', '0', '0', '0', '0', '0', '感受到梵蒂冈讽德诵功', '586d740ed3d845db91ade433e8966936.png', '311', '0', '0', '0', '586d740ed3d845db91ade433e8966936/3.mp4');

-- ----------------------------
-- Table structure for `brickcat_videosize`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_videosize`;
CREATE TABLE `brickcat_videosize` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) DEFAULT NULL,
  `userMaxSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_videosize
-- ----------------------------
INSERT INTO `brickcat_videosize` VALUES ('1498123513347', '1495610341604', '3945');
INSERT INTO `brickcat_videosize` VALUES ('1498540199140', '1498540198708', '500');

-- ----------------------------
-- Table structure for `brickcat_vote`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_vote`;
CREATE TABLE `brickcat_vote` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) NOT NULL,
  `type` int(11) NOT NULL,
  `dataType` int(11) NOT NULL,
  `dataId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_vote
-- ----------------------------
INSERT INTO `brickcat_vote` VALUES ('1497772343695', '1495610341604', '0', '4', '1497708701804');
INSERT INTO `brickcat_vote` VALUES ('1498545476218', '1495610341604', '1', '1', '1498540023538');
INSERT INTO `brickcat_vote` VALUES ('1498556862514', '1495610341604', '0', '4', '1498458216708');
