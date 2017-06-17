/*
 Navicat Premium Data Transfer

 Source Server         : brickcat
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : brickcat

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 06/18/2017 00:57:30 AM
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
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community &hearts;', 'Sym,Announcement', '1495610341604', '2', '5', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '1497680797672', 'admin', '0.45332993819421985', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');
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
INSERT INTO `brickcat_comment` VALUES ('1496665446466', null, ':smile: ', '1496665446523', '1495610341604', '1495610344271', '/article/1495610344271#1496665446466', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1497680377398', null, 'DFG ', '1497680377449', '1495610341604', '1497671086925', '/article/1497671086925#1497680377398', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1497680657261', null, 'fgd ', '1497680657333', '1495610341604', '1497671086925', '/article/1497671086925#1497680657261', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', ''), ('1497680797673', null, ':tada: ', '1497680797728', '1495610341604', '1495610344271', '/article/1495610344271#1497680797673', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
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
INSERT INTO `brickcat_liveness` VALUES ('1495610344848', '1495610341604', '20170524', '0', '1', '0', '0', '0', '0', '0', '0'), ('1496665435341', '1495610341604', '20170605', '0', '0', '1', '0', '0', '0', '0', '1'), ('1497273001935', '1495610341604', '20170612', '0', '0', '0', '0', '0', '0', '0', '1'), ('1497451456107', '1495610341604', '20170614', '0', '0', '0', '0', '0', '0', '0', '1'), ('1497680464363', '1495610341604', '20170617', '0', '0', '3', '0', '0', '0', '0', '2'), ('1497718374674', '1495610341604', '20170618', '0', '0', '0', '0', '0', '1', '0', '0');
COMMIT;

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
INSERT INTO `brickcat_notification` VALUES ('1495610341916', '1495610341604', '', '16', '1'), ('1495610342165', '1495610341994', '', '16', '0'), ('1497278160776', '1497278160243', '', '16', '0'), ('1497347062874', '1497278160243', '1497347048591', '10', '0'), ('1497362496209', '1495610341604', '1497362494700', '10', '1'), ('1497362769802', '1495610341604', '1497362768685', '10', '1'), ('1497364137360', '1495610341604', '1497364120193', '10', '1'), ('1497617301363', '1495610341604', '1497617301301', '5', '1'), ('1497617309817', '1495610341604', '1497617309756', '29', '1'), ('1497680464435', '', '1497680377398', '3', '0'), ('1497680709426', '', '1497680657261', '3', '0');
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
INSERT INTO `brickcat_option` VALUES ('miscAllowAddArticle', '0', 'misc'), ('miscAllowAddComment', '0', 'misc'), ('miscAllowAnonymousView', '0', 'misc'), ('miscAllowRegister', '0', 'misc'), ('miscLanguage', '0', 'misc'), ('statisticArticleCount', '1', 'statistic'), ('statisticCmtCount', '8', 'statistic'), ('statisticDomainCount', '0', 'statistic'), ('statisticLinkCount', '0', 'statistic'), ('statisticMaxOnlineVisitorCount', '4', 'statistic'), ('statisticMemberCount', '3', 'statistic'), ('statisticTagCount', '3', 'statistic');
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
INSERT INTO `brickcat_permission` VALUES ('adminAddVideo', '11'), ('adminDeleteVideo', '11'), ('adminUpdateVideo', '11'), ('adUpdateADSide', '8'), ('adUpdateBanner', '8'), ('articleAddArticle', '2'), ('articleCancelStickArticle', '2'), ('articleReindexArticle', '2'), ('articleReindexArticles', '2'), ('articleRemoveArticle', '2'), ('articleStickArticle', '2'), ('articleUpdateArticleBasic', '2'), ('commentRemoveComment', '3'), ('commentUpdateCommentBasic', '3'), ('commonAddArticle', '0'), ('commonAddArticleAnonymous', '0'), ('commonAddComment', '0'), ('commonAddCommentAnonymous', '0'), ('commonAtParticipants', '0'), ('commonAtUser', '0'), ('commonBadArticle', '0'), ('commonBadComment', '0'), ('commonExchangeIC', '0'), ('commonFollowArticle', '0'), ('commonGoodArticle', '0'), ('commonGoodComment', '0'), ('commonGoodVideo', '11'), ('commonRemoveArticle', '0'), ('commonRemoveComment', '0'), ('commonStickArticle', '0'), ('commonThankArticle', '0'), ('commonThankComment', '0'), ('commonUpdateArticle', '0'), ('commonUpdateComment', '0'), ('commonUseIL', '0'), ('commonViewArticleHistory', '0'), ('commonViewCommentHistory', '0'), ('commonWatchArticle', '0'), ('domainAddDomain', '4'), ('domainAddDomainTag', '4'), ('domainRemoveDomain', '4'), ('domainRemoveDomainTag', '4'), ('domainUpdateDomainBasic', '4'), ('icGenIC', '7'), ('icUpdateICBasic', '7'), ('menuAdmin', '10'), ('menuAdminAD', '10'), ('menuAdminArticles', '10'), ('menuAdminComments', '10'), ('menuAdminDomains', '10'), ('menuAdminIcs', '10'), ('menuAdminMisc', '10'), ('menuAdminRoles', '10'), ('menuAdminRWs', '10'), ('menuAdminTags', '10'), ('menuAdminUsers', '10'), ('menuAdminVideo', '10'), ('miscAllowAddArticle', '9'), ('miscAllowAddComment', '9'), ('miscAllowAnonymousView', '9'), ('miscLanguage', '9'), ('miscRegisterMethod', '9'), ('rwAddReservedWord', '6'), ('rwRemoveReservedWord', '6'), ('rwUpdateReservedWordBasic', '6'), ('tagUpdateTagBasic', '5'), ('userAddPoint', '1'), ('userAddUser', '1'), ('userDeductPoint', '1'), ('userExchangePoint', '1'), ('userExchangeSize', '11'), ('userInitSize', '11'), ('userUpdateUserAdvanced', '1'), ('userUpdateUserBasic', '1'), ('userWatchVideo', '11'), ('userWatchVideoError', '11');
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
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610341853', 'sys', '1495610341604', '500', '0', '500', '1495610341853', '0', '1495610341604'), ('1495610342103', 'sys', '1495610341994', '500', '0', '500', '1495610342087', '0', '1495610341994'), ('1495610344770', '1495610341604', 'sys', '20', '480', '0', '1495610344770', '1', '1495610344271'), ('1496665446608', '1495610341604', 'sys', '2', '478', '0', '1496665446603', '3', '1496665446466'), ('1497278160714', 'sys', '1497278160243', '500', '0', '500', '1497278160709', '0', '1497278160243'), ('1497347048591', '1497278160243', 'sys', '100', '400', '0', '1497347046966', '16', '0.0'), ('1497362494700', '1495610341604', 'sys', '100', '378', '0', '1497362493577', '16', '0.0'), ('1497362768685', '1495610341604', 'sys', '100', '278', '0', '1497362767403', '16', '0.0'), ('1497364120193', '1495610341604', 'sys', '100', '178', '0', '1497364118675', '33', '0.0'), ('1497452282848', 'sys', '1495610341604', '12', '0', '190', '1497452282844', '8', '1495610341604'), ('1497617301301', 'sys', '1495610341604', '5000000', '0', '5000190', '1497617301286', '13', '12345'), ('1497617309756', '1495610341604', 'sys', '2800', '4997390', '0', '1497617309750', '33', '5000'), ('1497680797806', '1495610341604', 'sys', '2', '4997383', '0', '1497680797801', '3', '1497680797673');
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
INSERT INTO `brickcat_revision` VALUES ('1495610344583', '0', '1495610344271', '{\"articleTitle\":\"Welcome to Sym community &hearts;\",\"articleContent\":\"Hello, everyone!\"}', '1495610341604'), ('1496665446549', '1', '1496665446466', '{\"commentContent\":\":smile: \"}', '1495610341604'), ('1497680464281', '1', '1497680377398', '{\"commentContent\":\"DFG \"}', '1495610341604'), ('1497680690870', '1', '1497680657261', '{\"commentContent\":\"fgd \"}', '1495610341604'), ('1497680797745', '1', '1497680797673', '{\"commentContent\":\":tada: \"}', '1495610341604');
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
INSERT INTO `brickcat_role_permission` VALUES ('1495610331823', 'memberRole', 'commonGoodComment'), ('1495610331885', 'memberRole', 'commonAtUser'), ('1495610331947', 'memberRole', 'commonFollowArticle'), ('1495610332010', 'memberRole', 'commonBadComment'), ('1495610332072', 'memberRole', 'commonGoodArticle'), ('1495610332135', 'memberRole', 'commonUseIL'), ('1495610332197', 'memberRole', 'commonBadArticle'), ('1495610332259', 'memberRole', 'commonAddComment'), ('1495610332322', 'memberRole', 'commonUpdateArticle'), ('1495610332384', 'memberRole', 'commonWatchArticle'), ('1495610332447', 'memberRole', 'commonUpdateComment'), ('1495610332509', 'memberRole', 'commonAddArticle'), ('1495610332571', 'memberRole', 'commonThankArticle'), ('1495610332634', 'memberRole', 'commonRemoveArticle'), ('1495610332696', 'memberRole', 'commonRemoveComment'), ('1495610332759', 'memberRole', 'commonThankComment'), ('1496653002632', 'regularRole', 'commonAddArticle'), ('1496653002683', 'regularRole', 'commonAddArticleAnonymous'), ('1496653002733', 'regularRole', 'commonAddComment'), ('1496653002783', 'regularRole', 'commonAddCommentAnonymous'), ('1496653002833', 'regularRole', 'commonAtParticipants'), ('1496653002883', 'regularRole', 'commonAtUser'), ('1496653002933', 'regularRole', 'commonBadArticle'), ('1496653002983', 'regularRole', 'commonBadComment'), ('1496653003033', 'regularRole', 'commonExchangeIC'), ('1496653003083', 'regularRole', 'commonFollowArticle'), ('1496653003133', 'regularRole', 'commonGoodArticle'), ('1496653003183', 'regularRole', 'commonGoodComment'), ('1496653003233', 'regularRole', 'commonRemoveArticle'), ('1496653003283', 'regularRole', 'commonRemoveComment'), ('1496653003333', 'regularRole', 'commonStickArticle'), ('1496653003383', 'regularRole', 'commonThankArticle'), ('1496653003433', 'regularRole', 'commonThankComment'), ('1496653003483', 'regularRole', 'commonUpdateArticle'), ('1496653003533', 'regularRole', 'commonUpdateComment'), ('1496653003583', 'regularRole', 'commonUseIL'), ('1496653003633', 'regularRole', 'commonViewArticleHistory'), ('1496653003686', 'regularRole', 'commonViewCommentHistory'), ('1496653003736', 'regularRole', 'commonWatchArticle'), ('1496653003788', 'regularRole', 'tagUpdateTagBasic'), ('1496653003838', 'regularRole', 'menuAdmin'), ('1496653003888', 'regularRole', 'menuAdminTags'), ('1496653003938', 'regularRole', 'userWatchVideo'), ('1496653003988', 'regularRole', 'userWatchVideoError'), ('1496653012246', 'leaderRole', 'rwAddReservedWord'), ('1496653012299', 'leaderRole', 'rwRemoveReservedWord'), ('1496653012350', 'leaderRole', 'rwUpdateReservedWordBasic'), ('1496653012401', 'leaderRole', 'commentUpdateCommentBasic'), ('1496653012452', 'leaderRole', 'articleCancelStickArticle'), ('1496653012503', 'leaderRole', 'articleReindexArticle'), ('1496653012553', 'leaderRole', 'articleStickArticle'), ('1496653012603', 'leaderRole', 'articleUpdateArticleBasic'), ('1496653012653', 'leaderRole', 'commonAddArticle'), ('1496653012704', 'leaderRole', 'commonAddArticleAnonymous'), ('1496653012755', 'leaderRole', 'commonAddComment'), ('1496653012806', 'leaderRole', 'commonAddCommentAnonymous'), ('1496653012857', 'leaderRole', 'commonAtParticipants'), ('1496653012908', 'leaderRole', 'commonAtUser'), ('1496653012959', 'leaderRole', 'commonBadArticle'), ('1496653013010', 'leaderRole', 'commonBadComment'), ('1496653013061', 'leaderRole', 'commonExchangeIC'), ('1496653013112', 'leaderRole', 'commonFollowArticle'), ('1496653013163', 'leaderRole', 'commonGoodArticle'), ('1496653013214', 'leaderRole', 'commonGoodComment'), ('1496653013265', 'leaderRole', 'commonRemoveArticle'), ('1496653013316', 'leaderRole', 'commonRemoveComment'), ('1496653013366', 'leaderRole', 'commonStickArticle'), ('1496653013416', 'leaderRole', 'commonThankArticle'), ('1496653013467', 'leaderRole', 'commonThankComment'), ('1496653013518', 'leaderRole', 'commonUpdateArticle'), ('1496653013569', 'leaderRole', 'commonUpdateComment'), ('1496653013619', 'leaderRole', 'commonUseIL'), ('1496653013669', 'leaderRole', 'commonViewArticleHistory'), ('1496653013719', 'leaderRole', 'commonViewCommentHistory'), ('1496653013769', 'leaderRole', 'commonWatchArticle'), ('1496653013819', 'leaderRole', 'tagUpdateTagBasic'), ('1496653013870', 'leaderRole', 'userAddPoint'), ('1496653013921', 'leaderRole', 'userAddUser'), ('1496653013972', 'leaderRole', 'userDeductPoint'), ('1496653014023', 'leaderRole', 'userExchangePoint'), ('1496653014073', 'leaderRole', 'userUpdateUserAdvanced'), ('1496653014124', 'leaderRole', 'userUpdateUserBasic'), ('1496653014175', 'leaderRole', 'menuAdmin'), ('1496653014226', 'leaderRole', 'menuAdminArticles'), ('1496653014277', 'leaderRole', 'menuAdminComments'), ('1496653014328', 'leaderRole', 'menuAdminIcs'), ('1496653014379', 'leaderRole', 'menuAdminRWs'), ('1496653014430', 'leaderRole', 'menuAdminTags'), ('1496653014483', 'leaderRole', 'menuAdminUsers'), ('1496653014534', 'leaderRole', 'userWatchVideo'), ('1496653014585', 'leaderRole', 'userWatchVideoError'), ('1496653014636', 'leaderRole', 'icGenIC'), ('1496653014687', 'leaderRole', 'icUpdateICBasic'), ('1496653033444', 'defaultRole', 'commonAddArticle'), ('1496653033495', 'defaultRole', 'commonAddComment'), ('1496653033545', 'defaultRole', 'commonFollowArticle'), ('1496653033595', 'defaultRole', 'commonRemoveArticle'), ('1496653033645', 'defaultRole', 'commonRemoveComment'), ('1496653033695', 'defaultRole', 'commonThankArticle'), ('1496653033745', 'defaultRole', 'commonThankComment'), ('1496653033795', 'defaultRole', 'commonUpdateArticle'), ('1496653033845', 'defaultRole', 'commonUpdateComment'), ('1496653033895', 'defaultRole', 'commonWatchArticle'), ('1496653033945', 'defaultRole', 'userWatchVideo'), ('1496653033995', 'defaultRole', 'userWatchVideoError'), ('1497715629857', 'adminRole', 'rwAddReservedWord'), ('1497715629911', 'adminRole', 'rwRemoveReservedWord'), ('1497715629966', 'adminRole', 'rwUpdateReservedWordBasic'), ('1497715630020', 'adminRole', 'miscAllowAddArticle'), ('1497715630074', 'adminRole', 'miscAllowAddComment'), ('1497715630129', 'adminRole', 'miscAllowAnonymousView'), ('1497715630182', 'adminRole', 'miscLanguage'), ('1497715630238', 'adminRole', 'miscRegisterMethod'), ('1497715630293', 'adminRole', 'commentRemoveComment'), ('1497715630346', 'adminRole', 'commentUpdateCommentBasic'), ('1497715630399', 'adminRole', 'articleAddArticle'), ('1497715630454', 'adminRole', 'articleCancelStickArticle'), ('1497715630509', 'adminRole', 'articleReindexArticle'), ('1497715630561', 'adminRole', 'articleReindexArticles'), ('1497715630612', 'adminRole', 'articleRemoveArticle'), ('1497715630668', 'adminRole', 'articleStickArticle'), ('1497715630722', 'adminRole', 'articleUpdateArticleBasic'), ('1497715630775', 'adminRole', 'commonAddArticle'), ('1497715630828', 'adminRole', 'commonAddArticleAnonymous'), ('1497715630882', 'adminRole', 'commonAddComment'), ('1497715630937', 'adminRole', 'commonAddCommentAnonymous'), ('1497715630989', 'adminRole', 'commonAtParticipants'), ('1497715631043', 'adminRole', 'commonAtUser'), ('1497715631097', 'adminRole', 'commonBadArticle'), ('1497715631151', 'adminRole', 'commonBadComment'), ('1497715631204', 'adminRole', 'commonExchangeIC'), ('1497715631258', 'adminRole', 'commonFollowArticle'), ('1497715631311', 'adminRole', 'commonGoodArticle'), ('1497715631364', 'adminRole', 'commonGoodComment'), ('1497715631419', 'adminRole', 'commonRemoveArticle'), ('1497715631474', 'adminRole', 'commonRemoveComment'), ('1497715631529', 'adminRole', 'commonStickArticle'), ('1497715631585', 'adminRole', 'commonThankArticle'), ('1497715631640', 'adminRole', 'commonThankComment'), ('1497715631693', 'adminRole', 'commonUpdateArticle'), ('1497715631749', 'adminRole', 'commonUpdateComment'), ('1497715631804', 'adminRole', 'commonUseIL'), ('1497715631858', 'adminRole', 'commonViewArticleHistory'), ('1497715631912', 'adminRole', 'commonViewCommentHistory'), ('1497715631966', 'adminRole', 'commonWatchArticle'), ('1497715632021', 'adminRole', 'adUpdateADSide'), ('1497715632076', 'adminRole', 'adUpdateBanner'), ('1497715632131', 'adminRole', 'tagUpdateTagBasic'), ('1497715632184', 'adminRole', 'userAddPoint'), ('1497715632236', 'adminRole', 'userAddUser'), ('1497715632292', 'adminRole', 'userDeductPoint'), ('1497715632346', 'adminRole', 'userExchangePoint'), ('1497715632401', 'adminRole', 'userUpdateUserAdvanced'), ('1497715632456', 'adminRole', 'userUpdateUserBasic'), ('1497715632512', 'adminRole', 'menuAdmin'), ('1497715632566', 'adminRole', 'menuAdminAD'), ('1497715632621', 'adminRole', 'menuAdminArticles'), ('1497715632676', 'adminRole', 'menuAdminComments'), ('1497715632732', 'adminRole', 'menuAdminDomains'), ('1497715632786', 'adminRole', 'menuAdminIcs'), ('1497715632838', 'adminRole', 'menuAdminMisc'), ('1497715632893', 'adminRole', 'menuAdminRoles'), ('1497715632949', 'adminRole', 'menuAdminRWs'), ('1497715633002', 'adminRole', 'menuAdminTags'), ('1497715633057', 'adminRole', 'menuAdminUsers'), ('1497715633108', 'adminRole', 'menuAdminVideo'), ('1497715633162', 'adminRole', 'adminAddVideo'), ('1497715633215', 'adminRole', 'adminDeleteVideo'), ('1497715633270', 'adminRole', 'adminUpdateVideo'), ('1497715633323', 'adminRole', 'commonGoodVideo'), ('1497715633378', 'adminRole', 'userExchangeSize'), ('1497715633432', 'adminRole', 'userInitSize'), ('1497715633487', 'adminRole', 'userWatchVideo'), ('1497715633542', 'adminRole', 'userWatchVideoError'), ('1497715633597', 'adminRole', 'icGenIC'), ('1497715633648', 'adminRole', 'icUpdateICBasic'), ('1497715633703', 'adminRole', 'domainAddDomain'), ('1497715633757', 'adminRole', 'domainAddDomainTag'), ('1497715633811', 'adminRole', 'domainRemoveDomain'), ('1497715633867', 'adminRole', 'domainRemoveDomainTag'), ('1497715633918', 'adminRole', 'domainUpdateDomainBasic');
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
INSERT INTO `brickcat_tag` VALUES ('1495610342228', '1', '2', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.401875487760331'), ('1495610342368', '1', '2', '0', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.8959140724890571'), ('1495610344006', '0', '0', '0', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.03975811477696456');
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
INSERT INTO `brickcat_tag_article` VALUES ('1495610344334', '1495610344271', '1495610342368', '2', '1497680797672', '0', '0'), ('1495610344458', '1495610344271', '1495610342228', '2', '1497680797672', '0', '0');
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
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/b9e29c04b8fb4265ba63bfbd9f2112b3_timg.jpeg', '1', '', '', '', '', 'adminRole', '1', '4', '3', '0', '4997383', '3129', '0', '0', '1495610344193', '1497680797672', '1497718639300', '192.168.0.105', '0', '1497452282901', '20170614', '20170614', '20170614', '20170614', '0', '0', 'classic', 'mobile', '', '', '', '1496672480785', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0'), ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341994', '1', 'en_US', 'Asia/Shanghai', '0'), ('1497277766038', '3', '549595297@qq.com', 'viseosize', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/87a43004bbf74cbcad20972c03da2e66.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497277766036', '1', 'zh_CN', 'Asia/Shanghai', '1'), ('1497278160243', '3', '54959597@qq.com', 'viseosize1', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/59e6b136e37841bdb10e34a99b83e624.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '400', '100', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497278160241', '1', 'zh_CN', 'Asia/Shanghai', '1');
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
INSERT INTO `brickcat_user_tag` VALUES ('1495610342306', '1495610341604', '1495610342228', '0'), ('1495610342430', '1495610341604', '1495610342368', '0'), ('1495610344084', '1495610341604', '1495610344006', '0'), ('1495610344396', '1495610341604', '1495610342368', '1'), ('1495610344521', '1495610341604', '1495610342228', '1');
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
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `brickcat_video`
-- ----------------------------
BEGIN;
INSERT INTO `brickcat_video` VALUES ('1497671086925', '告诉对方', '0', '测试', '1495610341604', '2', '29', '/upload/bc48a58de96942caa8eef17ea362f597.mp4', '', '0', '1497671086925', '1497671086925', '1497680657242', 'admin', '0', '0', '0', '0', '0', '0', 'afdsf', '', '130', null), ('1497707565034', 'Spring Boot之Hello World', '0', 'Spring Boot', '1495610341604', '0', '6', '/upload/629fbeb72ae44cb990d97e0d7341ff76.mp4', '', '0', '1497707565024', '1497707565024', '0', '0', '0', '0', '0', '0', '0', '0', 'Spring Boot之Hello World', '', '76', null), ('1497708440033', '并发上传', '0', '测试', '1495610341604', '0', '0', '/upload/453d03e34a3a40849d59dfed6b51cb04.mp4', '', '0', '1497708440029', '1497708440029', '0', '0', '0', '0', '0', '0', '0', '0', '高并发测试', '', '76', null), ('1497708475663', '  测试', '0', '测试', '1495610341604', '0', '0', '/upload/51d3d9e4f4bc4cd69ac71d547055d071.mp4', '', '0', '1497708475663', '1497708475663', '0', '0', '0', '0', '0', '0', '0', '0', '测试', '', '76', null), ('1497708540684', '  测试', '0', '测试', '1495610341604', '0', '2', '/upload/a041b8a940e74e3784ad7362f5cfa1ad.mp4', '', '0', '1497708540684', '1497708540684', '0', '0', '0', '0', '0', '0', '0', '0', 'bbbb6', '', '76', null), ('1497708695721', '  测试', '0', '测试', '1495610341604', '0', '2', '/upload/60175952fd9d42b5b9e6c224de4f28ae.mp4', '', '0', '1497708695721', '1497708695721', '0', '0', '0', '0', '0', '0', '0', '0', '嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或嘿嘿嘿嘿嘿或好哈哈哈', '', '119', null), ('1497708701804', 'springboot', '0', '测试', '1495610341604', '0', '0', '/upload/a82e051da49d41ce941573179d62f5a9.mp4', '', '0', '1497708701804', '1497708701804', '0', '0', '0', '1', '0', '0', '0', '0', '电风扇撒大声地法师打发斯蒂芬斯蒂芬是的发送到发的说法撒打发斯蒂芬水电费撒打发斯蒂芬', '', '130', '3199'), ('1497713896931', 'aaaaaaaaaaaaaaa', '0', 'a', '1495610341604', '0', '0', '/upload/4e61aae6763b43ecbf1d79bc5b0ebca9.mp4', '', '0', '1497713896929', '1497713896929', '0', '0', '0', '0', '0', '0', '0', '0', 'aaaaaaaaaaa', '/upload/4e61aae6763b43ecbf1d79bc5b0ebca9.png', '76', null);
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
INSERT INTO `brickcat_videosize` VALUES ('1497277766516', '1497277766038', '500'), ('1497278160651', '1497278160243', '100'), ('1497362139350', '1497278160243', '500'), ('1497362709010', '1495610341604', '5700');
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

SET FOREIGN_KEY_CHECKS = 1;
