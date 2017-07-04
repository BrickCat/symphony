/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : brickcat

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 07/04/2017 20:36:34 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `brickcat_article`
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
--  Records of `brickcat_article`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community :hearts:', 'Sym,Announcement,测试', '1495610341604', '3', '27', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '0', '', '0.6151999366993907', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_book`
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
--  Table structure for `brickcat_character`
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
--  Table structure for `brickcat_client`
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
--  Table structure for `brickcat_comment`
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
--  Records of `brickcat_comment`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_comment` VALUES ('1497680377398', null, 'DFG ', '1497680377449', '1495610341604', '1497671086925', '/article/1497671086925#1497680377398', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1497680657261', null, 'fgd ', '1497680657333', '1495610341604', '1497671086925', '/article/1497671086925#1497680657261', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498479362526', null, ' :stuck_out_tongue_winking_eye: ', '1498479362639', '1495610341604', '1495610344271', '/article/1495610344271#1498479362526', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498480090211', null, ' :stuck_out_tongue: ', '1498480090305', '1495610341604', '1495610344271', '/article/1495610344271#1498480090211', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498480123150', null, ' :stuck_out_tongue_winking_eye: ', '1498480123200', '1495610341604', '1495610344271', '/article/1495610344271#1498480123150', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498481944536', null, ' :smile: ', '1498481944607', '1495610341604', '1495610344271', '/article/1495610344271#1498481944536', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498540023538', null, ' :weary: ', '1498540023588', '1495610341604', '1498458216708', '/article/1498458216708#1498540023538', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '1', '0', '1', ''), ('1498541328185', null, ' :expressionless: ', '1498541328236', '1498540198708', '1498458216708', '/article/1498458216708#1498541328185', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1498541336935', null, ' :heart: ', '1498541337003', '1498540198708', '1498458216708', '/article/1498458216708#1498541336935', '1498540023538', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '1', ''), ('1498556849193', null, ' :broken_heart: ', '1498556849260', '1495610341604', '1498458216708', '/article/1498458216708#1498556849193', '1498541336935', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_domain`
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
--  Table structure for `brickcat_domain_tag`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_domain_tag`;
CREATE TABLE `brickcat_domain_tag` (
  `oId` varchar(19) NOT NULL,
  `domain_oId` varchar(19) NOT NULL,
  `tag_oId` varchar(19) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `brickcat_emotion`
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
--  Table structure for `brickcat_follow`
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
--  Records of `brickcat_follow`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_follow` VALUES ('1497784346748', '1495610341604', '1497708701804', '5'), ('1498540212569', '1498540198708', '1495610342368', '1'), ('1498540978365', '1498540198708', '1495610344006', '1'), ('1498545496573', '1495610341604', '1498458216708', '5');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_invitecode`
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
--  Table structure for `brickcat_link`
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
--  Table structure for `brickcat_liveness`
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
--  Records of `brickcat_liveness`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_liveness` VALUES ('1495610344848', '1495610341604', '20170524', '0', '1', '0', '0', '0', '0', '0', '0'), ('1496665435341', '1495610341604', '20170605', '0', '0', '1', '0', '0', '0', '0', '1'), ('1497273001935', '1495610341604', '20170612', '0', '0', '0', '0', '0', '0', '0', '1'), ('1497451456107', '1495610341604', '20170614', '0', '0', '0', '0', '0', '0', '0', '1'), ('1497680464363', '1495610341604', '20170617', '0', '0', '3', '0', '0', '0', '0', '2'), ('1497718374674', '1495610341604', '20170618', '0', '0', '0', '0', '0', '20', '0', '1'), ('1498463420640', '1495610341604', '20170626', '0', '0', '26', '0', '0', '1', '0', '13'), ('1498525570844', '1495610341604', '20170627', '0', '0', '7', '1', '0', '5', '0', '6'), ('1498541328356', '1498540198708', '20170627', '0', '0', '2', '0', '0', '0', '0', '0'), ('1498811792804', '1495610341604', '20170630', '0', '0', '0', '0', '0', '0', '0', '2');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_mind`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mind`;
CREATE TABLE `brickcat_mind` (
  `oId` varchar(19) NOT NULL,
  `mindAuthorId` varchar(19) NOT NULL,
  `mindContent` mediumtext NOT NULL,
  `mindCreateTime` bigint(20) DEFAULT NULL,
  `mindUpdateTime` bigint(20) DEFAULT NULL,
  `mindType` int(11) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `brickcat_notification`
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
--  Records of `brickcat_notification`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_notification` VALUES ('1495610341916', '1495610341604', '', '16', '1'), ('1495610342165', '1495610341994', '', '16', '0'), ('1497278160776', '1497278160243', '', '16', '0'), ('1497347062874', '1497278160243', '1497347048591', '10', '0'), ('1497362496209', '1495610341604', '1497362494700', '10', '1'), ('1497362769802', '1495610341604', '1497362768685', '10', '1'), ('1497364137360', '1495610341604', '1497364120193', '10', '1'), ('1497617301363', '1495610341604', '1497617301301', '5', '1'), ('1497617309817', '1495610341604', '1497617309756', '29', '1'), ('1497680464435', '', '1497680377398', '3', '0'), ('1497680709426', '', '1497680657261', '3', '0'), ('1498123115389', '1495610341604', '1498123115334', '29', '1'), ('1498123188725', '1495610341604', '1498123188673', '29', '1'), ('1498123394622', '1495610341604', '1498123394565', '29', '1'), ('1498123518917', '1495610341604', '1498123518865', '29', '1'), ('1498540023731', '', '1498540023538', '3', '0'), ('1498540199300', '1498540198708', '', '16', '0'), ('1498541328455', '', '1498541328185', '3', '0'), ('1498556849446', '', '1498556849193', '3', '0'), ('1498556849502', '1498540198708', '1498556849193', '13', '0');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_option`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_option`;
CREATE TABLE `brickcat_option` (
  `oId` varchar(64) NOT NULL,
  `optionValue` text NOT NULL,
  `optionCategory` varchar(100) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_option`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_option` VALUES ('miscAllowAddArticle', '0', 'misc'), ('miscAllowAddComment', '0', 'misc'), ('miscAllowAnonymousView', '0', 'misc'), ('miscAllowRegister', '0', 'misc'), ('miscLanguage', '0', 'misc'), ('statisticArticleCount', '1', 'statistic'), ('statisticCmtCount', '13', 'statistic'), ('statisticDomainCount', '0', 'statistic'), ('statisticLinkCount', '0', 'statistic'), ('statisticMaxOnlineVisitorCount', '4', 'statistic'), ('statisticMemberCount', '4', 'statistic'), ('statisticTagCount', '4', 'statistic');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_permission`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_permission`;
CREATE TABLE `brickcat_permission` (
  `oId` varchar(32) NOT NULL,
  `permissionCategory` int(11) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_permission`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_permission` VALUES ('adminAddVideo', '11'), ('adminDeleteVideo', '11'), ('adminUpdateVideo', '11'), ('adUpdateADSide', '8'), ('adUpdateBanner', '8'), ('articleAddArticle', '2'), ('articleCancelStickArticle', '2'), ('articleReindexArticle', '2'), ('articleReindexArticles', '2'), ('articleRemoveArticle', '2'), ('articleStickArticle', '2'), ('articleUpdateArticleBasic', '2'), ('commentRemoveComment', '3'), ('commentUpdateCommentBasic', '3'), ('commonAddArticle', '0'), ('commonAddArticleAnonymous', '0'), ('commonAddComment', '0'), ('commonAddCommentAnonymous', '0'), ('commonAtParticipants', '0'), ('commonAtUser', '0'), ('commonBadArticle', '0'), ('commonBadComment', '0'), ('commonBadVideo', '11'), ('commonExchangeIC', '0'), ('commonFollowArticle', '0'), ('commonFollowVideo', '11'), ('commonGoodArticle', '0'), ('commonGoodComment', '0'), ('commonGoodVideo', '11'), ('commonRemoveArticle', '0'), ('commonRemoveComment', '0'), ('commonStickArticle', '0'), ('commonStickVideo', '11'), ('commonThankArticle', '0'), ('commonThankComment', '0'), ('commonUpdateArticle', '0'), ('commonUpdateComment', '0'), ('commonUseIL', '0'), ('commonViewArticleHistory', '0'), ('commonViewCommentHistory', '0'), ('commonWatchArticle', '0'), ('commonWatchVideo', '11'), ('domainAddDomain', '4'), ('domainAddDomainTag', '4'), ('domainRemoveDomain', '4'), ('domainRemoveDomainTag', '4'), ('domainUpdateDomainBasic', '4'), ('icGenIC', '7'), ('icUpdateICBasic', '7'), ('menuAdmin', '10'), ('menuAdminAD', '10'), ('menuAdminArticles', '10'), ('menuAdminComments', '10'), ('menuAdminDomains', '10'), ('menuAdminIcs', '10'), ('menuAdminMisc', '10'), ('menuAdminRoles', '10'), ('menuAdminRWs', '10'), ('menuAdminTags', '10'), ('menuAdminTrends', '10'), ('menuAdminUsers', '10'), ('menuAdminVideo', '10'), ('miscAllowAddArticle', '9'), ('miscAllowAddComment', '9'), ('miscAllowAnonymousView', '9'), ('miscLanguage', '9'), ('miscRegisterMethod', '9'), ('rwAddReservedWord', '6'), ('rwRemoveReservedWord', '6'), ('rwUpdateReservedWordBasic', '6'), ('tagUpdateTagBasic', '5'), ('userAddPoint', '1'), ('userAddTrends', '12'), ('userAddUser', '1'), ('userDeductPoint', '1'), ('userDeleteTrends', '12'), ('userExchangePoint', '1'), ('userExchangeSize', '11'), ('userInitSize', '11'), ('userUpdateTrends', '12'), ('userUpdateUserAdvanced', '1'), ('userUpdateUserBasic', '1'), ('userWatchVideo', '11'), ('userWatchVideoError', '11');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_pointtransfer`
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
--  Records of `brickcat_pointtransfer`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610341853', 'sys', '1495610341604', '500', '0', '500', '1495610341853', '0', '1495610341604'), ('1495610342103', 'sys', '1495610341994', '500', '0', '500', '1495610342087', '0', '1495610341994'), ('1495610344770', '1495610341604', 'sys', '20', '480', '0', '1495610344770', '1', '1495610344271'), ('1496665446608', '1495610341604', 'sys', '2', '478', '0', '1496665446603', '3', '1496665446466'), ('1497278160714', 'sys', '1497278160243', '500', '0', '500', '1497278160709', '0', '1497278160243'), ('1497347048591', '1497278160243', 'sys', '100', '400', '0', '1497347046966', '16', '0.0'), ('1497362494700', '1495610341604', 'sys', '100', '378', '0', '1497362493577', '16', '0.0'), ('1497362768685', '1495610341604', 'sys', '100', '278', '0', '1497362767403', '16', '0.0'), ('1497364120193', '1495610341604', 'sys', '100', '178', '0', '1497364118675', '33', '0.0'), ('1497452282848', 'sys', '1495610341604', '12', '0', '190', '1497452282844', '8', '1495610341604'), ('1497617301301', 'sys', '1495610341604', '5000000', '0', '5000190', '1497617301286', '13', '12345'), ('1497617309756', '1495610341604', 'sys', '2800', '4997390', '0', '1497617309750', '33', '5000'), ('1497680797806', '1495610341604', 'sys', '2', '4997383', '0', '1497680797801', '3', '1497680797673'), ('1497786504837', '1495610341604', 'sys', '100', '4997283', '0', '1497786504814', '19', '1497708701804'), ('1498123115334', '1495610341604', 'sys', '100', '4997183', '0', '1498123115321', '33', '100'), ('1498123188673', '1495610341604', 'sys', '2800', '4994383', '0', '1498123188669', '33', '5000'), ('1498123394565', '1495610341604', 'sys', '100', '4994283', '0', '1498123394554', '33', '100'), ('1498123518865', '1495610341604', 'sys', '2800', '4991483', '0', '1498123518851', '33', '5000'), ('1498464238094', '1495610341604', 'sys', '2', '4991476', '0', '1498464237388', '3', '1498464005614'), ('1498475329366', '1495610341604', 'sys', '2', '4991474', '0', '1498475329354', '3', '1498475329192'), ('1498476414365', '1495610341604', 'sys', '2', '4991472', '0', '1498476414361', '3', '1498476414243'), ('1498476968998', '1495610341604', 'sys', '2', '4991470', '0', '1498476968986', '3', '1498476968867'), ('1498477398192', '1495610341604', 'sys', '2', '4991468', '0', '1498477398182', '3', '1498477398063'), ('1498477456222', '1495610341604', 'sys', '2', '4991466', '0', '1498477456213', '3', '1498477456086'), ('1498477469436', '1495610341604', 'sys', '2', '4991464', '0', '1498477469424', '3', '1498477469302'), ('1498477585780', '1495610341604', 'sys', '2', '4991462', '0', '1498477585770', '3', '1498477585648'), ('1498477711718', '1495610341604', 'sys', '2', '4991460', '0', '1498477711714', '3', '1498477711593'), ('1498478436108', '1495610341604', 'sys', '2', '4991458', '0', '1498478436061', '3', '1498478435812'), ('1498478835435', '1495610341604', 'sys', '2', '4991456', '0', '1498478835430', '3', '1498478835308'), ('1498478887166', '1495610341604', 'sys', '2', '4991454', '0', '1498478887155', '3', '1498478887031'), ('1498479049187', '1495610341604', 'sys', '2', '4991452', '0', '1498479049178', '3', '1498479049057'), ('1498479154296', '1495610341604', 'sys', '2', '4991450', '0', '1498479154296', '3', '1498479154150'), ('1498479188127', '1495610341604', 'sys', '2', '4991448', '0', '1498479188127', '3', '1498479187967'), ('1498479251842', '1495610341604', 'sys', '2', '4991446', '0', '1498479251842', '3', '1498479251683'), ('1498479283771', '1495610341604', 'sys', '2', '4991444', '0', '1498479283766', '3', '1498479283639'), ('1498479362748', '1495610341604', 'sys', '2', '4991442', '0', '1498479362732', '3', '1498479362526'), ('1498480090367', '1495610341604', 'sys', '2', '4991440', '0', '1498480090367', '3', '1498480090211'), ('1498480123320', '1495610341604', 'sys', '2', '4991438', '0', '1498480123304', '3', '1498480123150'), ('1498481874490', '1495610341604', 'sys', '2', '4991436', '0', '1498481874487', '3', '1498481874375'), ('1498481944669', '1495610341604', 'sys', '2', '4991434', '0', '1498481944669', '3', '1498481944536'), ('1498482044491', '1495610341604', 'sys', '2', '4991432', '0', '1498482044491', '3', '1498482044346'), ('1498482125588', '1495610341604', 'sys', '2', '4991430', '0', '1498482125588', '3', '1498482125424'), ('1498482177783', '1495610341604', 'sys', '2', '4991428', '0', '1498482177783', '3', '1498482177601'), ('1498525580047', '1495610341604', 'sys', '2', '4991426', '0', '1498525580032', '3', '1498525579842'), ('1498527292655', '1495610341604', 'sys', '2', '4991424', '0', '1498527292641', '3', '1498527292494'), ('1498532797014', '1495610341604', 'sys', '2', '4991422', '0', '1498532796997', '3', '1498532796810'), ('1498535066875', '1495610341604', 'sys', '2', '4991420', '0', '1498535066862', '3', '1498535066740'), ('1498538713668', '1495610341604', 'sys', '2', '4991418', '0', '1498538713662', '3', '1498538713543'), ('1498540023656', '1495610341604', 'sys', '2', '4991416', '0', '1498540023652', '3', '1498540023538'), ('1498540199244', 'sys', '1498540198708', '500', '0', '500', '1498540199236', '0', '1498540198708'), ('1498541328302', '1498540198708', '1495610341604', '5', '495', '4991421', '1498541328296', '3', '1498541328185'), ('1498541337080', '1498540198708', '1495610341604', '5', '490', '4991426', '1498541337069', '3', '1498541336935'), ('1498556849338', '1495610341604', 'sys', '2', '4991424', '0', '1498556849335', '3', '1498556849193'), ('1498559072350', 'sys', '1495610341604', '5', '0', '4991429', '1498559072340', '8', '1495610341604');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_referral`
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
--  Table structure for `brickcat_revision`
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
--  Records of `brickcat_revision`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_revision` VALUES ('1495610344583', '0', '1495610344271', '{\"articleTitle\":\"Welcome to Sym community &hearts;\",\"articleContent\":\"Hello, everyone!\"}', '1495610341604'), ('1497680464281', '1', '1497680377398', '{\"commentContent\":\"DFG \"}', '1495610341604'), ('1497680690870', '1', '1497680657261', '{\"commentContent\":\"fgd \"}', '1495610341604'), ('1498479362670', '1', '1498479362526', '{\"commentContent\":\" :stuck_out_tongue_winking_eye: \"}', '1495610341604'), ('1498480090305', '1', '1498480090211', '{\"commentContent\":\" :stuck_out_tongue: \"}', '1495610341604'), ('1498480123214', '1', '1498480123150', '{\"commentContent\":\" :stuck_out_tongue_winking_eye: \"}', '1495610341604'), ('1498481944607', '1', '1498481944536', '{\"commentContent\":\" :smile: \"}', '1495610341604'), ('1498540023599', '1', '1498540023538', '{\"commentContent\":\" :weary: \"}', '1495610341604'), ('1498541328244', '1', '1498541328185', '{\"commentContent\":\" :expressionless: \"}', '1498540198708'), ('1498541337017', '1', '1498541336935', '{\"commentContent\":\" :heart: \"}', '1498540198708'), ('1498556849283', '1', '1498556849193', '{\"commentContent\":\" :broken_heart: \"}', '1495610341604');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_reward`
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
--  Table structure for `brickcat_role`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_role`;
CREATE TABLE `brickcat_role` (
  `oId` varchar(32) NOT NULL,
  `roleName` varchar(32) NOT NULL,
  `roleDescription` text NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_role`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_role` VALUES ('adminRole', 'Admin', ''), ('defaultRole', 'Default', ''), ('leaderRole', 'Leader', ''), ('memberRole', 'Member', ''), ('regularRole', 'Regular', ''), ('visitorRole', 'Visitor', '');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_role_permission`;
CREATE TABLE `brickcat_role_permission` (
  `oId` varchar(19) NOT NULL,
  `roleId` varchar(32) NOT NULL,
  `permissionId` varchar(32) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_role_permission` VALUES ('1495610331823', 'memberRole', 'commonGoodComment'), ('1495610331885', 'memberRole', 'commonAtUser'), ('1495610331947', 'memberRole', 'commonFollowArticle'), ('1495610332010', 'memberRole', 'commonBadComment'), ('1495610332072', 'memberRole', 'commonGoodArticle'), ('1495610332135', 'memberRole', 'commonUseIL'), ('1495610332197', 'memberRole', 'commonBadArticle'), ('1495610332259', 'memberRole', 'commonAddComment'), ('1495610332322', 'memberRole', 'commonUpdateArticle'), ('1495610332384', 'memberRole', 'commonWatchArticle'), ('1495610332447', 'memberRole', 'commonUpdateComment'), ('1495610332509', 'memberRole', 'commonAddArticle'), ('1495610332571', 'memberRole', 'commonThankArticle'), ('1495610332634', 'memberRole', 'commonRemoveArticle'), ('1495610332696', 'memberRole', 'commonRemoveComment'), ('1495610332759', 'memberRole', 'commonThankComment'), ('1496653002632', 'regularRole', 'commonAddArticle'), ('1496653002683', 'regularRole', 'commonAddArticleAnonymous'), ('1496653002733', 'regularRole', 'commonAddComment'), ('1496653002783', 'regularRole', 'commonAddCommentAnonymous'), ('1496653002833', 'regularRole', 'commonAtParticipants'), ('1496653002883', 'regularRole', 'commonAtUser'), ('1496653002933', 'regularRole', 'commonBadArticle'), ('1496653002983', 'regularRole', 'commonBadComment'), ('1496653003033', 'regularRole', 'commonExchangeIC'), ('1496653003083', 'regularRole', 'commonFollowArticle'), ('1496653003133', 'regularRole', 'commonGoodArticle'), ('1496653003183', 'regularRole', 'commonGoodComment'), ('1496653003233', 'regularRole', 'commonRemoveArticle'), ('1496653003283', 'regularRole', 'commonRemoveComment'), ('1496653003333', 'regularRole', 'commonStickArticle'), ('1496653003383', 'regularRole', 'commonThankArticle'), ('1496653003433', 'regularRole', 'commonThankComment'), ('1496653003483', 'regularRole', 'commonUpdateArticle'), ('1496653003533', 'regularRole', 'commonUpdateComment'), ('1496653003583', 'regularRole', 'commonUseIL'), ('1496653003633', 'regularRole', 'commonViewArticleHistory'), ('1496653003686', 'regularRole', 'commonViewCommentHistory'), ('1496653003736', 'regularRole', 'commonWatchArticle'), ('1496653003788', 'regularRole', 'tagUpdateTagBasic'), ('1496653003838', 'regularRole', 'menuAdmin'), ('1496653003888', 'regularRole', 'menuAdminTags'), ('1496653003938', 'regularRole', 'userWatchVideo'), ('1496653003988', 'regularRole', 'userWatchVideoError'), ('1496653012246', 'leaderRole', 'rwAddReservedWord'), ('1496653012299', 'leaderRole', 'rwRemoveReservedWord'), ('1496653012350', 'leaderRole', 'rwUpdateReservedWordBasic'), ('1496653012401', 'leaderRole', 'commentUpdateCommentBasic'), ('1496653012452', 'leaderRole', 'articleCancelStickArticle'), ('1496653012503', 'leaderRole', 'articleReindexArticle'), ('1496653012553', 'leaderRole', 'articleStickArticle'), ('1496653012603', 'leaderRole', 'articleUpdateArticleBasic'), ('1496653012653', 'leaderRole', 'commonAddArticle'), ('1496653012704', 'leaderRole', 'commonAddArticleAnonymous'), ('1496653012755', 'leaderRole', 'commonAddComment'), ('1496653012806', 'leaderRole', 'commonAddCommentAnonymous'), ('1496653012857', 'leaderRole', 'commonAtParticipants'), ('1496653012908', 'leaderRole', 'commonAtUser'), ('1496653012959', 'leaderRole', 'commonBadArticle'), ('1496653013010', 'leaderRole', 'commonBadComment'), ('1496653013061', 'leaderRole', 'commonExchangeIC'), ('1496653013112', 'leaderRole', 'commonFollowArticle'), ('1496653013163', 'leaderRole', 'commonGoodArticle'), ('1496653013214', 'leaderRole', 'commonGoodComment'), ('1496653013265', 'leaderRole', 'commonRemoveArticle'), ('1496653013316', 'leaderRole', 'commonRemoveComment'), ('1496653013366', 'leaderRole', 'commonStickArticle'), ('1496653013416', 'leaderRole', 'commonThankArticle'), ('1496653013467', 'leaderRole', 'commonThankComment'), ('1496653013518', 'leaderRole', 'commonUpdateArticle'), ('1496653013569', 'leaderRole', 'commonUpdateComment'), ('1496653013619', 'leaderRole', 'commonUseIL'), ('1496653013669', 'leaderRole', 'commonViewArticleHistory'), ('1496653013719', 'leaderRole', 'commonViewCommentHistory'), ('1496653013769', 'leaderRole', 'commonWatchArticle'), ('1496653013819', 'leaderRole', 'tagUpdateTagBasic'), ('1496653013870', 'leaderRole', 'userAddPoint'), ('1496653013921', 'leaderRole', 'userAddUser'), ('1496653013972', 'leaderRole', 'userDeductPoint'), ('1496653014023', 'leaderRole', 'userExchangePoint'), ('1496653014073', 'leaderRole', 'userUpdateUserAdvanced'), ('1496653014124', 'leaderRole', 'userUpdateUserBasic'), ('1496653014175', 'leaderRole', 'menuAdmin'), ('1496653014226', 'leaderRole', 'menuAdminArticles'), ('1496653014277', 'leaderRole', 'menuAdminComments'), ('1496653014328', 'leaderRole', 'menuAdminIcs'), ('1496653014379', 'leaderRole', 'menuAdminRWs'), ('1496653014430', 'leaderRole', 'menuAdminTags'), ('1496653014483', 'leaderRole', 'menuAdminUsers'), ('1496653014534', 'leaderRole', 'userWatchVideo'), ('1496653014585', 'leaderRole', 'userWatchVideoError'), ('1496653014636', 'leaderRole', 'icGenIC'), ('1496653014687', 'leaderRole', 'icUpdateICBasic'), ('1496653033444', 'defaultRole', 'commonAddArticle'), ('1496653033495', 'defaultRole', 'commonAddComment'), ('1496653033545', 'defaultRole', 'commonFollowArticle'), ('1496653033595', 'defaultRole', 'commonRemoveArticle'), ('1496653033645', 'defaultRole', 'commonRemoveComment'), ('1496653033695', 'defaultRole', 'commonThankArticle'), ('1496653033745', 'defaultRole', 'commonThankComment'), ('1496653033795', 'defaultRole', 'commonUpdateArticle'), ('1496653033845', 'defaultRole', 'commonUpdateComment'), ('1496653033895', 'defaultRole', 'commonWatchArticle'), ('1496653033945', 'defaultRole', 'userWatchVideo'), ('1496653033995', 'defaultRole', 'userWatchVideoError'), ('1498796360539', 'adminRole', 'rwAddReservedWord'), ('1498796360592', 'adminRole', 'rwRemoveReservedWord'), ('1498796360642', 'adminRole', 'rwUpdateReservedWordBasic'), ('1498796360692', 'adminRole', 'miscAllowAddArticle'), ('1498796360742', 'adminRole', 'miscAllowAddComment'), ('1498796360792', 'adminRole', 'miscAllowAnonymousView'), ('1498796360842', 'adminRole', 'miscLanguage'), ('1498796360892', 'adminRole', 'miscRegisterMethod'), ('1498796360942', 'adminRole', 'commentRemoveComment'), ('1498796360992', 'adminRole', 'commentUpdateCommentBasic'), ('1498796361042', 'adminRole', 'userAddTrends'), ('1498796361092', 'adminRole', 'userDeleteTrends'), ('1498796361142', 'adminRole', 'userUpdateTrends'), ('1498796361192', 'adminRole', 'articleAddArticle'), ('1498796361242', 'adminRole', 'articleCancelStickArticle'), ('1498796361293', 'adminRole', 'articleReindexArticle'), ('1498796361343', 'adminRole', 'articleReindexArticles'), ('1498796361393', 'adminRole', 'articleRemoveArticle'), ('1498796361443', 'adminRole', 'articleStickArticle'), ('1498796361493', 'adminRole', 'articleUpdateArticleBasic'), ('1498796361543', 'adminRole', 'commonAddArticle'), ('1498796361593', 'adminRole', 'commonAddArticleAnonymous'), ('1498796361643', 'adminRole', 'commonAddComment'), ('1498796361693', 'adminRole', 'commonAddCommentAnonymous'), ('1498796361750', 'adminRole', 'commonAtParticipants'), ('1498796361800', 'adminRole', 'commonAtUser'), ('1498796361851', 'adminRole', 'commonBadArticle'), ('1498796361901', 'adminRole', 'commonBadComment'), ('1498796361952', 'adminRole', 'commonExchangeIC'), ('1498796362003', 'adminRole', 'commonFollowArticle'), ('1498796362053', 'adminRole', 'commonGoodArticle'), ('1498796362103', 'adminRole', 'commonGoodComment'), ('1498796362153', 'adminRole', 'commonRemoveArticle'), ('1498796362206', 'adminRole', 'commonRemoveComment'), ('1498796362256', 'adminRole', 'commonStickArticle'), ('1498796362312', 'adminRole', 'commonThankArticle'), ('1498796362362', 'adminRole', 'commonThankComment'), ('1498796362412', 'adminRole', 'commonUpdateArticle'), ('1498796362462', 'adminRole', 'commonUpdateComment'), ('1498796362512', 'adminRole', 'commonUseIL'), ('1498796362562', 'adminRole', 'commonViewArticleHistory'), ('1498796362612', 'adminRole', 'commonViewCommentHistory'), ('1498796362662', 'adminRole', 'commonWatchArticle'), ('1498796362712', 'adminRole', 'adUpdateADSide'), ('1498796362762', 'adminRole', 'adUpdateBanner'), ('1498796362812', 'adminRole', 'tagUpdateTagBasic'), ('1498796362862', 'adminRole', 'userAddPoint'), ('1498796362912', 'adminRole', 'userAddUser'), ('1498796362962', 'adminRole', 'userDeductPoint'), ('1498796363012', 'adminRole', 'userExchangePoint'), ('1498796363062', 'adminRole', 'userUpdateUserAdvanced'), ('1498796363117', 'adminRole', 'userUpdateUserBasic'), ('1498796363167', 'adminRole', 'menuAdmin'), ('1498796363217', 'adminRole', 'menuAdminAD'), ('1498796363267', 'adminRole', 'menuAdminArticles'), ('1498796363318', 'adminRole', 'menuAdminComments'), ('1498796363368', 'adminRole', 'menuAdminDomains'), ('1498796363418', 'adminRole', 'menuAdminIcs'), ('1498796363468', 'adminRole', 'menuAdminMisc'), ('1498796363524', 'adminRole', 'menuAdminRoles'), ('1498796363574', 'adminRole', 'menuAdminRWs'), ('1498796363624', 'adminRole', 'menuAdminTags'), ('1498796363674', 'adminRole', 'menuAdminTrends'), ('1498796363724', 'adminRole', 'menuAdminUsers'), ('1498796363774', 'adminRole', 'menuAdminVideo'), ('1498796363824', 'adminRole', 'adminAddVideo'), ('1498796363874', 'adminRole', 'adminDeleteVideo'), ('1498796363924', 'adminRole', 'adminUpdateVideo'), ('1498796363974', 'adminRole', 'commonBadVideo'), ('1498796364024', 'adminRole', 'commonFollowVideo'), ('1498796364074', 'adminRole', 'commonGoodVideo'), ('1498796364124', 'adminRole', 'commonStickVideo'), ('1498796364174', 'adminRole', 'commonWatchVideo'), ('1498796364225', 'adminRole', 'userExchangeSize'), ('1498796364275', 'adminRole', 'userInitSize'), ('1498796364325', 'adminRole', 'userWatchVideo'), ('1498796364375', 'adminRole', 'userWatchVideoError'), ('1498796364425', 'adminRole', 'icGenIC'), ('1498796364476', 'adminRole', 'icUpdateICBasic'), ('1498796364526', 'adminRole', 'domainAddDomain'), ('1498796364576', 'adminRole', 'domainAddDomainTag'), ('1498796364626', 'adminRole', 'domainRemoveDomain'), ('1498796364676', 'adminRole', 'domainRemoveDomainTag'), ('1498796364726', 'adminRole', 'domainUpdateDomainBasic');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_tag`
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
--  Records of `brickcat_tag`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_tag` VALUES ('1495610342228', '1', '15', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.28562016788486544'), ('1495610342368', '1', '15', '1', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.23408250929246988'), ('1495610344006', '0', '0', '1', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.04573868736964004'), ('1498545630866', '1', '7', '0', '0', '测试', '%E6%B5%8B%E8%AF%95', '', '', '', '0', '0', '0', '测试', '测试', '', '0.5469872332199878');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_tag_article`
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
--  Records of `brickcat_tag_article`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_tag_article` VALUES ('1495610344334', '1495610344271', '1495610342368', '8', '1498525579838', '0', '0'), ('1495610344458', '1495610344271', '1495610342228', '8', '1498525579838', '0', '0'), ('1498545838958', '1495610344271', '1498545630866', '6', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_tag_tag`
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
--  Records of `brickcat_tag_tag`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_tag_tag` VALUES ('1495610344708', '1495610342368', '1495610342228', '1');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_tag_user_link`
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
--  Table structure for `brickcat_trends`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_trends`;
CREATE TABLE `brickcat_trends` (
  `oId` varchar(19) NOT NULL,
  `trendTitle` mediumtext NOT NULL,
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
--  Records of `brickcat_trends`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_trends` VALUES ('1498807747745', '这是一条测试圈子', '', '1495610341604', '0', '0', '哈哈哈哈或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或', '', '0', '', '1498807766464', '1498807766464', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '\'', '', '0', '1498807747745/a9b5ade08099467caddb03f80fb71a80.jpg,1498807747745/38490280ac094a4e8dc491f62f789e27.jpg,1498807747745/40dacf9b7f954dc5a0be68c3390ee36d.jpg,1498807747745/f696c4fc32234c549fbc398254fe295b.jpg,1498807747745/f693dea0190444daaaaa3baf160d323c.jpg'), ('1498810580526', '这是一条测试圈子', '', '1495610341604', '0', '0', '啦啦啦啦啦绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿绿', '', '0', '', '1498810592902', '1498810592902', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '\'', '', '0', '1498810580526/3b487e1976734aaebf44f7b1ff689d6a.jpg,1498810580526/546eaf5555884da6b723f647120df564.jpg,1498810580526/4a5cb71f0f8d467bae10a3bbe3122a8b.jpg,1498810580526/df943e68b3c14ab885be8441250bdd06.jpg,1498810580526/3cea1c1e4866466b9213c3b954b8e448.jpg'), ('1498811064319', '这是一条测试圈子', '', '1495610341604', '0', '0', '噢噢哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦', '', '0', '', '1498811095007', '1498811095007', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '\'', '', '0', '1498811064319/2abf2436183a4ed6b36c489f324b65b8.jpg,1498811064319/4b207d901fa34da7b5bfde5ed4750576.jpg,1498811064319/6926c8bad8e74742bc8db1de6fd3534e.jpg,1498811064319/da9f8ee89ce74e37b77034d1497e46d9.jpg,1498811064319/1ca0cb8c5c7d4b6aad4d199f1e4513eb.jpg,1498811064319/76a385bf21764e9cbad0056a106eabf0.jpg,1498811064319/bbd17977cba04b90aca13fcb1db382d6.jpg,1498811064319/b1bfe49452f04193963969cb2721ff58.jpg,1498811064319/dee8baf81ef64c0485c638a42e0ef609.jpg'), ('1498815198817', '这是一条测试圈子', '', '1495610341604', '0', '0', '梵蒂冈水电费个地方官的双方各电饭锅电饭锅单方事故电饭锅电饭锅', '', '0', '', '1498815218452', '1498815218452', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '\'', '', '0', '1498815198817/6344a25da12a444499ae51a0ae473481.jpg,1498815198817/5f12c3d3391243f48bc99aadac44819d.jpg,1498815198817/bc94cc7d9ca3437f8d7cb068740856a9.jpg,1498815198817/c55f69a08d464c5e8d6782c210f1c0e4.jpg,1498815198817/ba4caaa2a44944f09c01f8bc94e7de59.jpg,1498815198817/91649401a47a4a558ab0a1703c019088.jpg,1498815198817/2d71c5e9c5034cfe9bd910ce2dd7f072.jpg,1498815198817/85a13db4986f48df9d3c5fc29b30feb0.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_user`
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
--  Records of `brickcat_user`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'admin', '42857cfddb33f3fddb27fff9773683f3', '', '', '', '', '', '2', 'http://localhost:9090/upload/f1a4408ca14743438ba058a21d69a4c5_06a1751875c26f6409149f9380a7899c_b.jpg', '1', '', '', '', '', 'adminRole', '1', '7', '4', '0', '4991429', '9098', '0', '0', '1495610344193', '1498556849180', '1498815231211', '0:0:0:0:0:0:0:1', '0', '1498559072405', '20170614', '20170614', '20170627', '20170627', '1', '1', 'classic', 'mobile', '', '', '', '1498471722585', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0'), ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341994', '1', 'en_US', 'Asia/Shanghai', '0'), ('1497277766038', '3', '549595297@qq.com', 'viseosize', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/87a43004bbf74cbcad20972c03da2e66.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497277766036', '1', 'zh_CN', 'Asia/Shanghai', '1'), ('1497278160243', '3', '54959597@qq.com', 'viseosize1', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/59e6b136e37841bdb10e34a99b83e624.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '400', '100', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497278160241', '1', 'zh_CN', 'Asia/Shanghai', '1'), ('1498540198708', '4', '5495952971@qq.com', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '2', 'http://localhost:9090/upload/4dff22c6968a4b45a3312a1aff5ec979.jpg', '0', '', '', '', '', 'defaultRole', '0', '2', '0', '0', '490', '10', '0', '0', '0', '1498541336934', '1498542607985', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1498540198707', '1', 'zh_CN', 'Asia/Shanghai', '0');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_user_book_article`
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
--  Table structure for `brickcat_user_tag`
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
--  Records of `brickcat_user_tag`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_user_tag` VALUES ('1495610342306', '1495610341604', '1495610342228', '0'), ('1495610342430', '1495610341604', '1495610342368', '0'), ('1495610344084', '1495610341604', '1495610344006', '0'), ('1495610344396', '1495610341604', '1495610342368', '1'), ('1495610344521', '1495610341604', '1495610342228', '1'), ('1498545630922', '1495610341604', '1498545630866', '0'), ('1498545839012', '1495610341604', '1498545630866', '1');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_verifycode`
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
--  Table structure for `brickcat_video`
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
--  Records of `brickcat_video`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_video` VALUES ('1498458216708', '这个是一条测试', '0', '测试', '1495610341604', '4', '100', '823658abfe104d10b507bea60ede02bd/823658abfe104d10b507bea60ede02bd.m3u8', '', '0', '1498458216565', '1498458216565', '1498556849180', 'admin', '0', '1', '0', '1', '0', '0', '更更更更更过过过过过过方法反反复复付付', '823658abfe104d10b507bea60ede02bd.png', '311', '3215', '0', '0', '823658abfe104d10b507bea60ede02bd/3.mp4'), ('1498550761733', '这个是一条测试的视频', '0', '测试', '1495610341604', '0', '2', '586d740ed3d845db91ade433e8966936/586d740ed3d845db91ade433e8966936.m3u8', '', '0', '1498550761723', '1498550761723', '0', '0', '0', '0', '0', '0', '0', '0', '感受到梵蒂冈讽德诵功', '586d740ed3d845db91ade433e8966936.png', '311', '0', '0', '0', '586d740ed3d845db91ade433e8966936/3.mp4');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_videosize`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_videosize`;
CREATE TABLE `brickcat_videosize` (
  `oId` varchar(19) NOT NULL,
  `userId` varchar(19) DEFAULT NULL,
  `userMaxSize` int(11) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_videosize`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_videosize` VALUES ('1498123513347', '1495610341604', '3945'), ('1498540199140', '1498540198708', '500');
COMMIT;

-- ----------------------------
--  Table structure for `brickcat_vote`
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
--  Records of `brickcat_vote`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_vote` VALUES ('1497772343695', '1495610341604', '0', '4', '1497708701804'), ('1498545476218', '1495610341604', '1', '1', '1498540023538'), ('1498556862514', '1495610341604', '0', '4', '1498458216708');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
