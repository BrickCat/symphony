/*
Navicat MySQL Data Transfer

Source Server         : xxl-job
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : brickcat

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-05-16 17:57:26
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
INSERT INTO `brickcat_article` VALUES ('1494905083237', 'Welcome to Sym community &hearts;', 'Sym,Announcement', '1494905080632', '0', '0', 'Hello, everyone!', '', '0', '/article/1494905083237', '1494905083156', '1494905083156', '0', '', '0.15055348261974022', '1', '0', '1494905083237', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');

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
INSERT INTO `brickcat_domain` VALUES ('1494905435204', '视频', '视频', '视频', '', '50', '0', '', '', '0', '', '', '');

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
INSERT INTO `brickcat_liveness` VALUES ('1494905083773', '1494905080632', '20170516', '0', '1', '0', '0', '0', '0', '0', '0');

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
INSERT INTO `brickcat_notification` VALUES ('1494905080919', '1494905080632', '', '16', '1');
INSERT INTO `brickcat_notification` VALUES ('1494905081131', '1494905080984', '', '16', '0');

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
INSERT INTO `brickcat_option` VALUES ('miscAllowRegister', '2', 'misc');
INSERT INTO `brickcat_option` VALUES ('miscLanguage', '0', 'misc');
INSERT INTO `brickcat_option` VALUES ('statisticArticleCount', '1', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticCmtCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticDomainCount', '1', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticLinkCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMaxOnlineVisitorCount', '3', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMemberCount', '2', 'statistic');
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
INSERT INTO `brickcat_permission` VALUES ('commonExchangeIC', '0');
INSERT INTO `brickcat_permission` VALUES ('commonFollowArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonGoodArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonGoodComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonRemoveArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonRemoveComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonStickArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonThankArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonThankComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUpdateArticle', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUpdateComment', '0');
INSERT INTO `brickcat_permission` VALUES ('commonUseIL', '0');
INSERT INTO `brickcat_permission` VALUES ('commonViewArticleHistory', '0');
INSERT INTO `brickcat_permission` VALUES ('commonViewCommentHistory', '0');
INSERT INTO `brickcat_permission` VALUES ('commonWatchArticle', '0');
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
INSERT INTO `brickcat_permission` VALUES ('userAddUser', '1');
INSERT INTO `brickcat_permission` VALUES ('userDeductPoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userExchangePoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userUpdateUserAdvanced', '1');
INSERT INTO `brickcat_permission` VALUES ('userUpdateUserBasic', '1');

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
INSERT INTO `brickcat_pointtransfer` VALUES ('1494905080864', 'sys', '1494905080632', '500', '0', '500', '1494905080854', '0', '1494905080632');
INSERT INTO `brickcat_pointtransfer` VALUES ('1494905081075', 'sys', '1494905080984', '500', '0', '500', '1494905081064', '0', '1494905080984');
INSERT INTO `brickcat_pointtransfer` VALUES ('1494905083683', '1494905080632', 'sys', '20', '480', '0', '1494905083671', '1', '1494905083237');

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
INSERT INTO `brickcat_revision` VALUES ('1494905083509', '0', '1494905083237', '{\"articleTitle\":\"Welcome to Sym community &hearts;\",\"articleContent\":\"Hello, everyone!\"}', '1494905080632');

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
INSERT INTO `brickcat_role_permission` VALUES ('1494905072121', 'defaultRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072174', 'defaultRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072225', 'defaultRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072276', 'defaultRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072327', 'defaultRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072384', 'defaultRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072434', 'defaultRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072485', 'defaultRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072536', 'defaultRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072587', 'defaultRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072638', 'memberRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072690', 'memberRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072741', 'memberRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072791', 'memberRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072841', 'memberRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072892', 'memberRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072943', 'memberRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905072994', 'memberRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073045', 'memberRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073096', 'memberRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073147', 'memberRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073198', 'memberRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073249', 'memberRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073300', 'memberRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073351', 'memberRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073402', 'memberRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073453', 'regularRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073504', 'regularRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073555', 'regularRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073606', 'regularRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073657', 'regularRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073708', 'regularRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073759', 'regularRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073810', 'regularRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073861', 'regularRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073912', 'regularRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905073963', 'regularRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074014', 'regularRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074065', 'regularRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074116', 'regularRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074167', 'regularRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074217', 'regularRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074267', 'regularRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074319', 'regularRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074370', 'regularRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074421', 'regularRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074472', 'regularRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074523', 'regularRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074574', 'regularRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074625', 'regularRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074676', 'regularRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074727', 'regularRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074778', 'leaderRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074829', 'leaderRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074880', 'leaderRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074931', 'leaderRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1494905074982', 'leaderRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075033', 'leaderRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075084', 'leaderRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075135', 'leaderRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075186', 'leaderRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075237', 'leaderRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075288', 'leaderRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075339', 'leaderRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075390', 'leaderRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075441', 'leaderRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075492', 'leaderRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075543', 'leaderRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075594', 'leaderRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075645', 'leaderRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075696', 'leaderRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075747', 'leaderRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075798', 'leaderRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075849', 'leaderRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075899', 'leaderRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075949', 'leaderRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905075999', 'leaderRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076050', 'leaderRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076101', 'leaderRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076152', 'leaderRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076202', 'leaderRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076253', 'leaderRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076304', 'leaderRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076355', 'leaderRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076406', 'leaderRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076457', 'leaderRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076508', 'leaderRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076559', 'leaderRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076610', 'leaderRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076661', 'leaderRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076712', 'leaderRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076763', 'leaderRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076814', 'leaderRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076865', 'leaderRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076916', 'leaderRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494905076967', 'leaderRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494905077019', 'leaderRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494905077070', 'leaderRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1494905077121', 'leaderRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1494927137851', 'adminRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1494927137905', 'adminRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1494927137956', 'adminRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138007', 'adminRole', 'miscAllowAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138058', 'adminRole', 'miscAllowAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138109', 'adminRole', 'miscAllowAnonymousView');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138160', 'adminRole', 'miscLanguage');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138211', 'adminRole', 'miscRegisterMethod');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138261', 'adminRole', 'commentRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138312', 'adminRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138363', 'adminRole', 'articleAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138413', 'adminRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138463', 'adminRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138513', 'adminRole', 'articleReindexArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138564', 'adminRole', 'articleRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138614', 'adminRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138664', 'adminRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138714', 'adminRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138764', 'adminRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138814', 'adminRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138865', 'adminRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138915', 'adminRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1494927138965', 'adminRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139016', 'adminRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139067', 'adminRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139118', 'adminRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139169', 'adminRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139220', 'adminRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139271', 'adminRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139322', 'adminRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139373', 'adminRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139424', 'adminRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139475', 'adminRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139529', 'adminRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139580', 'adminRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139631', 'adminRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139682', 'adminRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139733', 'adminRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139784', 'adminRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139834', 'adminRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139885', 'adminRole', 'adUpdateADSide');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139936', 'adminRole', 'adUpdateBanner');
INSERT INTO `brickcat_role_permission` VALUES ('1494927139987', 'adminRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140038', 'adminRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140089', 'adminRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140140', 'adminRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140191', 'adminRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140242', 'adminRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140293', 'adminRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140344', 'adminRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140395', 'adminRole', 'menuAdminAD');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140446', 'adminRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140497', 'adminRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140548', 'adminRole', 'menuAdminDomains');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140599', 'adminRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140650', 'adminRole', 'menuAdminMisc');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140701', 'adminRole', 'menuAdminRoles');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140752', 'adminRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140803', 'adminRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140854', 'adminRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140905', 'adminRole', 'menuAdminVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1494927140956', 'adminRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141007', 'adminRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141058', 'adminRole', 'domainAddDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141109', 'adminRole', 'domainAddDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141160', 'adminRole', 'domainRemoveDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141210', 'adminRole', 'domainRemoveDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1494927141262', 'adminRole', 'domainUpdateDomainBasic');

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
INSERT INTO `brickcat_tag` VALUES ('1494905081193', '1', '0', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.5614956465133555');
INSERT INTO `brickcat_tag` VALUES ('1494905081352', '1', '0', '0', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.7493851635373213');
INSERT INTO `brickcat_tag` VALUES ('1494905082995', '0', '0', '0', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.04017189940986354');
INSERT INTO `brickcat_tag` VALUES ('1494905482965', '0', '0', '0', '0', '视频', '%E8%A7%86%E9%A2%91', '', '', '', '0', '0', '0', '视频', '视频', '', '0.24136895688124516');

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
INSERT INTO `brickcat_tag_article` VALUES ('1494905083295', '1494905083237', '1494905081352', '0', '0', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1494905083399', '1494905083237', '1494905081193', '0', '0', '0', '0');

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
INSERT INTO `brickcat_tag_tag` VALUES ('1494905083617', '1494905081352', '1494905081193', '1');

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
INSERT INTO `brickcat_user` VALUES ('1494905080632', '1', 'sym@b3log.org', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://192.168.0.127:8080/upload/0d31c9bd33954911bd91477304ad2dcb.jpg', '0', '', '', '', '', 'adminRole', '1', '0', '4', '0', '480', '20', '0', '0', '1494905083156', '0', '1494927788559', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1494905080617', '1', 'zh_CN', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1494905080984', '2', 'default_commenter@b3log.org', 'Default Commenter', '286c6fc9b1e35da6b2f67754c0b359bb', '', '', '', '', '', '2', 'http://192.168.0.127:8080/upload/de32bdd854e64d0ba8b5fad584335545.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1494905080983', '1', 'en_US', 'Asia/Shanghai', '0');

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
INSERT INTO `brickcat_user_tag` VALUES ('1494905081264', '1494905080632', '1494905081193', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1494905081410', '1494905080632', '1494905081352', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1494905083062', '1494905080632', '1494905082995', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1494905083347', '1494905080632', '1494905081352', '1');
INSERT INTO `brickcat_user_tag` VALUES ('1494905083450', '1494905080632', '1494905081193', '1');
INSERT INTO `brickcat_user_tag` VALUES ('1494905483029', '1494905080632', '1494905482965', '0');

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
