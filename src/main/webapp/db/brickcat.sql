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

 Date: 05/24/2017 19:28:01 PM
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
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community &hearts;', 'Sym,Announcement', '1495610341604', '0', '0', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '0', '', '0.5893056492353235', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');
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
INSERT INTO `brickcat_liveness` VALUES ('1495610344848', '1495610341604', '20170524', '0', '1', '0', '0', '0', '0', '0', '0');
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
INSERT INTO `brickcat_notification` VALUES ('1495610341916', '1495610341604', '', '16', '0'), ('1495610342165', '1495610341994', '', '16', '0');
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
INSERT INTO `brickcat_option` VALUES ('miscAllowAddArticle', '0', 'misc'), ('miscAllowAddComment', '0', 'misc'), ('miscAllowAnonymousView', '0', 'misc'), ('miscAllowRegister', '0', 'misc'), ('miscLanguage', '0', 'misc'), ('statisticArticleCount', '1', 'statistic'), ('statisticCmtCount', '0', 'statistic'), ('statisticDomainCount', '0', 'statistic'), ('statisticLinkCount', '0', 'statistic'), ('statisticMaxOnlineVisitorCount', '2', 'statistic'), ('statisticMemberCount', '2', 'statistic'), ('statisticTagCount', '3', 'statistic');
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
INSERT INTO `brickcat_permission` VALUES ('adminAddVideo', '11'), ('adminDeleteVideo', '11'), ('adminUpdateVideo', '11'), ('adUpdateADSide', '8'), ('adUpdateBanner', '8'), ('articleAddArticle', '2'), ('articleCancelStickArticle', '2'), ('articleReindexArticle', '2'), ('articleReindexArticles', '2'), ('articleRemoveArticle', '2'), ('articleStickArticle', '2'), ('articleUpdateArticleBasic', '2'), ('commentRemoveComment', '3'), ('commentUpdateCommentBasic', '3'), ('commonAddArticle', '0'), ('commonAddArticleAnonymous', '0'), ('commonAddComment', '0'), ('commonAddCommentAnonymous', '0'), ('commonAtParticipants', '0'), ('commonAtUser', '0'), ('commonBadArticle', '0'), ('commonBadComment', '0'), ('commonExchangeIC', '0'), ('commonFollowArticle', '0'), ('commonGoodArticle', '0'), ('commonGoodComment', '0'), ('commonRemoveArticle', '0'), ('commonRemoveComment', '0'), ('commonStickArticle', '0'), ('commonThankArticle', '0'), ('commonThankComment', '0'), ('commonUpdateArticle', '0'), ('commonUpdateComment', '0'), ('commonUseIL', '0'), ('commonViewArticleHistory', '0'), ('commonViewCommentHistory', '0'), ('commonWatchArticle', '0'), ('domainAddDomain', '4'), ('domainAddDomainTag', '4'), ('domainRemoveDomain', '4'), ('domainRemoveDomainTag', '4'), ('domainUpdateDomainBasic', '4'), ('icGenIC', '7'), ('icUpdateICBasic', '7'), ('menuAdmin', '10'), ('menuAdminAD', '10'), ('menuAdminArticles', '10'), ('menuAdminComments', '10'), ('menuAdminDomains', '10'), ('menuAdminIcs', '10'), ('menuAdminMisc', '10'), ('menuAdminRoles', '10'), ('menuAdminRWs', '10'), ('menuAdminTags', '10'), ('menuAdminUsers', '10'), ('menuAdminVideo', '10'), ('miscAllowAddArticle', '9'), ('miscAllowAddComment', '9'), ('miscAllowAnonymousView', '9'), ('miscLanguage', '9'), ('miscRegisterMethod', '9'), ('rwAddReservedWord', '6'), ('rwRemoveReservedWord', '6'), ('rwUpdateReservedWordBasic', '6'), ('tagUpdateTagBasic', '5'), ('userAddPoint', '1'), ('userAddUser', '1'), ('userDeductPoint', '1'), ('userExchangePoint', '1'), ('userUpdateUserAdvanced', '1'), ('userUpdateUserBasic', '1');
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
INSERT INTO `brickcat_pointtransfer` VALUES ('1495610341853', 'sys', '1495610341604', '500', '0', '500', '1495610341853', '0', '1495610341604'), ('1495610342103', 'sys', '1495610341994', '500', '0', '500', '1495610342087', '0', '1495610341994'), ('1495610344770', '1495610341604', 'sys', '20', '480', '0', '1495610344770', '1', '1495610344271');
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
INSERT INTO `brickcat_revision` VALUES ('1495610344583', '0', '1495610344271', '{\"articleTitle\":\"Welcome to Sym community &hearts;\",\"articleContent\":\"Hello, everyone!\"}', '1495610341604');
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
INSERT INTO `brickcat_role_permission` VALUES ('1495610331199', 'defaultRole', 'commonUpdateArticle'), ('1495610331261', 'defaultRole', 'commonWatchArticle'), ('1495610331323', 'defaultRole', 'commonFollowArticle'), ('1495610331386', 'defaultRole', 'commonUpdateComment'), ('1495610331448', 'defaultRole', 'commonAddArticle'), ('1495610331511', 'defaultRole', 'commonThankArticle'), ('1495610331573', 'defaultRole', 'commonRemoveArticle'), ('1495610331635', 'defaultRole', 'commonRemoveComment'), ('1495610331698', 'defaultRole', 'commonThankComment'), ('1495610331760', 'defaultRole', 'commonAddComment'), ('1495610331823', 'memberRole', 'commonGoodComment'), ('1495610331885', 'memberRole', 'commonAtUser'), ('1495610331947', 'memberRole', 'commonFollowArticle'), ('1495610332010', 'memberRole', 'commonBadComment'), ('1495610332072', 'memberRole', 'commonGoodArticle'), ('1495610332135', 'memberRole', 'commonUseIL'), ('1495610332197', 'memberRole', 'commonBadArticle'), ('1495610332259', 'memberRole', 'commonAddComment'), ('1495610332322', 'memberRole', 'commonUpdateArticle'), ('1495610332384', 'memberRole', 'commonWatchArticle'), ('1495610332447', 'memberRole', 'commonUpdateComment'), ('1495610332509', 'memberRole', 'commonAddArticle'), ('1495610332571', 'memberRole', 'commonThankArticle'), ('1495610332634', 'memberRole', 'commonRemoveArticle'), ('1495610332696', 'memberRole', 'commonRemoveComment'), ('1495610332759', 'memberRole', 'commonThankComment'), ('1495610332821', 'regularRole', 'commonGoodComment'), ('1495610332883', 'regularRole', 'commonUseIL'), ('1495610332946', 'regularRole', 'commonBadArticle'), ('1495610333008', 'regularRole', 'commonAddComment'), ('1495610333071', 'regularRole', 'commonViewCommentHistory'), ('1495610333133', 'regularRole', 'commonUpdateArticle'), ('1495610333195', 'regularRole', 'commonWatchArticle'), ('1495610333258', 'regularRole', 'commonAtParticipants'), ('1495610333320', 'regularRole', 'tagUpdateTagBasic'), ('1495610333383', 'regularRole', 'commonAddArticle'), ('1495610333445', 'regularRole', 'commonExchangeIC'), ('1495610333507', 'regularRole', 'commonThankArticle'), ('1495610333570', 'regularRole', 'commonRemoveArticle'), ('1495610333632', 'regularRole', 'commonRemoveComment'), ('1495610333695', 'regularRole', 'commonThankComment'), ('1495610333757', 'regularRole', 'menuAdminTags'), ('1495610333819', 'regularRole', 'commonStickArticle'), ('1495610333882', 'regularRole', 'commonViewArticleHistory'), ('1495610333944', 'regularRole', 'menuAdmin'), ('1495610334007', 'regularRole', 'commonAtUser'), ('1495610334069', 'regularRole', 'commonFollowArticle'), ('1495610334131', 'regularRole', 'commonBadComment'), ('1495610334194', 'regularRole', 'commonGoodArticle'), ('1495610334256', 'regularRole', 'commonAddArticleAnonymous'), ('1495610334319', 'regularRole', 'commonUpdateComment'), ('1495610334381', 'regularRole', 'commonAddCommentAnonymous'), ('1495610334443', 'leaderRole', 'menuAdminIcs'), ('1495610334506', 'leaderRole', 'commonGoodComment'), ('1495610334568', 'leaderRole', 'userExchangePoint'), ('1495610334631', 'leaderRole', 'menuAdminComments'), ('1495610334693', 'leaderRole', 'articleReindexArticle'), ('1495610334755', 'leaderRole', 'icGenIC'), ('1495610334818', 'leaderRole', 'commonUseIL'), ('1495610334880', 'leaderRole', 'commonBadArticle'), ('1495610334943', 'leaderRole', 'commonAddComment'), ('1495610335005', 'leaderRole', 'rwAddReservedWord'), ('1495610335067', 'leaderRole', 'commonViewCommentHistory'), ('1495610335130', 'leaderRole', 'userAddUser'), ('1495610335192', 'leaderRole', 'commentUpdateCommentBasic'), ('1495610335255', 'leaderRole', 'commonUpdateArticle'), ('1495610335317', 'leaderRole', 'commonWatchArticle'), ('1495610335379', 'leaderRole', 'commonAtParticipants'), ('1495610335442', 'leaderRole', 'tagUpdateTagBasic'), ('1495610335504', 'leaderRole', 'menuAdminRWs'), ('1495610335567', 'leaderRole', 'commonAddArticle'), ('1495610335629', 'leaderRole', 'commonExchangeIC'), ('1495610335691', 'leaderRole', 'commonThankArticle'), ('1495610335754', 'leaderRole', 'commonRemoveArticle'), ('1495610335816', 'leaderRole', 'commonRemoveComment'), ('1495610335879', 'leaderRole', 'icUpdateICBasic'), ('1495610335941', 'leaderRole', 'commonThankComment'), ('1495610336003', 'leaderRole', 'menuAdminTags'), ('1495610336066', 'leaderRole', 'commonStickArticle'), ('1495610336128', 'leaderRole', 'commonViewArticleHistory'), ('1495610336191', 'leaderRole', 'menuAdmin'), ('1495610336253', 'leaderRole', 'userAddPoint'), ('1495610336315', 'leaderRole', 'commonAtUser'), ('1495610336378', 'leaderRole', 'commonFollowArticle'), ('1495610336440', 'leaderRole', 'commonBadComment'), ('1495610336503', 'leaderRole', 'commonGoodArticle'), ('1495610336565', 'leaderRole', 'userUpdateUserBasic'), ('1495610336627', 'leaderRole', 'articleUpdateArticleBasic'), ('1495610336690', 'leaderRole', 'articleCancelStickArticle'), ('1495610336752', 'leaderRole', 'commonAddArticleAnonymous'), ('1495610336815', 'leaderRole', 'userDeductPoint'), ('1495610336877', 'leaderRole', 'userUpdateUserAdvanced'), ('1495610336939', 'leaderRole', 'rwRemoveReservedWord'), ('1495610337002', 'leaderRole', 'articleStickArticle'), ('1495610337064', 'leaderRole', 'commonUpdateComment'), ('1495610337127', 'leaderRole', 'commonAddCommentAnonymous'), ('1495610337189', 'leaderRole', 'rwUpdateReservedWordBasic'), ('1495610337251', 'leaderRole', 'menuAdminUsers'), ('1495610337314', 'leaderRole', 'menuAdminArticles'), ('1495611569698', 'adminRole', 'rwAddReservedWord'), ('1495611569749', 'adminRole', 'rwRemoveReservedWord'), ('1495611569800', 'adminRole', 'rwUpdateReservedWordBasic'), ('1495611569851', 'adminRole', 'miscAllowAddArticle'), ('1495611569902', 'adminRole', 'miscAllowAddComment'), ('1495611569953', 'adminRole', 'miscAllowAnonymousView'), ('1495611570004', 'adminRole', 'miscLanguage'), ('1495611570055', 'adminRole', 'miscRegisterMethod'), ('1495611570106', 'adminRole', 'commentRemoveComment'), ('1495611570157', 'adminRole', 'commentUpdateCommentBasic'), ('1495611570208', 'adminRole', 'articleAddArticle'), ('1495611570258', 'adminRole', 'articleCancelStickArticle'), ('1495611570308', 'adminRole', 'articleReindexArticle'), ('1495611570359', 'adminRole', 'articleReindexArticles'), ('1495611570410', 'adminRole', 'articleRemoveArticle'), ('1495611570462', 'adminRole', 'articleStickArticle'), ('1495611570512', 'adminRole', 'articleUpdateArticleBasic'), ('1495611570562', 'adminRole', 'commonAddArticle'), ('1495611570612', 'adminRole', 'commonAddArticleAnonymous'), ('1495611570662', 'adminRole', 'commonAddComment'), ('1495611570712', 'adminRole', 'commonAddCommentAnonymous'), ('1495611570762', 'adminRole', 'commonAtParticipants'), ('1495611570812', 'adminRole', 'commonAtUser'), ('1495611570862', 'adminRole', 'commonBadArticle'), ('1495611570912', 'adminRole', 'commonBadComment'), ('1495611570963', 'adminRole', 'commonExchangeIC'), ('1495611571014', 'adminRole', 'commonFollowArticle'), ('1495611571065', 'adminRole', 'commonGoodArticle'), ('1495611571116', 'adminRole', 'commonGoodComment'), ('1495611571167', 'adminRole', 'commonRemoveArticle'), ('1495611571218', 'adminRole', 'commonRemoveComment'), ('1495611571270', 'adminRole', 'commonStickArticle'), ('1495611571321', 'adminRole', 'commonThankArticle'), ('1495611571372', 'adminRole', 'commonThankComment'), ('1495611571423', 'adminRole', 'commonUpdateArticle'), ('1495611571473', 'adminRole', 'commonUpdateComment'), ('1495611571524', 'adminRole', 'commonUseIL'), ('1495611571575', 'adminRole', 'commonViewArticleHistory'), ('1495611571626', 'adminRole', 'commonViewCommentHistory'), ('1495611571677', 'adminRole', 'commonWatchArticle'), ('1495611571727', 'adminRole', 'adUpdateADSide'), ('1495611571779', 'adminRole', 'adUpdateBanner'), ('1495611571830', 'adminRole', 'tagUpdateTagBasic'), ('1495611571881', 'adminRole', 'userAddPoint'), ('1495611571931', 'adminRole', 'userAddUser'), ('1495611571981', 'adminRole', 'userDeductPoint'), ('1495611572031', 'adminRole', 'userExchangePoint'), ('1495611572081', 'adminRole', 'userUpdateUserAdvanced'), ('1495611572132', 'adminRole', 'userUpdateUserBasic'), ('1495611572183', 'adminRole', 'menuAdmin'), ('1495611572234', 'adminRole', 'menuAdminAD'), ('1495611572285', 'adminRole', 'menuAdminArticles'), ('1495611572336', 'adminRole', 'menuAdminComments'), ('1495611572387', 'adminRole', 'menuAdminDomains'), ('1495611572438', 'adminRole', 'menuAdminIcs'), ('1495611572489', 'adminRole', 'menuAdminMisc'), ('1495611572540', 'adminRole', 'menuAdminRoles'), ('1495611572591', 'adminRole', 'menuAdminRWs'), ('1495611572642', 'adminRole', 'menuAdminTags'), ('1495611572693', 'adminRole', 'menuAdminUsers'), ('1495611572744', 'adminRole', 'menuAdminVideo'), ('1495611572795', 'adminRole', 'adminAddVideo'), ('1495611572846', 'adminRole', 'adminDeleteVideo'), ('1495611572897', 'adminRole', 'adminUpdateVideo'), ('1495611572948', 'adminRole', 'icGenIC'), ('1495611572999', 'adminRole', 'icUpdateICBasic'), ('1495611573050', 'adminRole', 'domainAddDomain'), ('1495611573100', 'adminRole', 'domainAddDomainTag'), ('1495611573150', 'adminRole', 'domainRemoveDomain'), ('1495611573200', 'adminRole', 'domainRemoveDomainTag'), ('1495611573250', 'adminRole', 'domainUpdateDomainBasic');
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
INSERT INTO `brickcat_tag` VALUES ('1495610342228', '1', '0', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.801050373090249'), ('1495610342368', '1', '0', '0', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.13205214558191636'), ('1495610344006', '0', '0', '0', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.4853211223637698');
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
INSERT INTO `brickcat_tag_article` VALUES ('1495610344334', '1495610344271', '1495610342368', '0', '0', '0', '0'), ('1495610344458', '1495610344271', '1495610342228', '0', '0', '0', '0');
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
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/18077b0e5baa4c10aee521b933a49db8.jpg', '0', '', '', '', '', 'adminRole', '1', '0', '3', '0', '480', '20', '0', '0', '1495610344193', '0', '1495611583270', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0'), ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341994', '1', 'en_US', 'Asia/Shanghai', '0');
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
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `symphony_video`
-- ----------------------------
DROP TABLE IF EXISTS `symphony_video`;
CREATE TABLE `symphony_video` (
  `oId` varchar(19) NOT NULL,
  `videoTitle` varchar(255) NOT NULL,
  `videoTags` varchar(255) NOT NULL,
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
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
