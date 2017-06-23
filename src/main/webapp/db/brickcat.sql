/*
Navicat MySQL Data Transfer

Source Server         : xxl-job
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : brickcat

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-06-23 13:14:50
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
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community &hearts;', 'Sym,Announcement', '1495610341604', '2', '6', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '1497680797672', 'admin', '0.11498516530942893', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');

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
INSERT INTO `brickcat_comment` VALUES ('1496665446466', null, ':smile: ', '1496665446523', '1495610341604', '1495610344271', '/article/1495610344271#1496665446466', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1497680377398', null, 'DFG ', '1497680377449', '1495610341604', '1497671086925', '/article/1497671086925#1497680377398', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1497680657261', null, 'fgd ', '1497680657333', '1495610341604', '1497671086925', '/article/1497671086925#1497680657261', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');
INSERT INTO `brickcat_comment` VALUES ('1497680797673', null, ':tada: ', '1497680797728', '1495610341604', '1495610344271', '/article/1495610344271#1497680797673', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '0', '');

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
INSERT INTO `brickcat_option` VALUES ('statisticCmtCount', '8', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticDomainCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticLinkCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMaxOnlineVisitorCount', '4', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMemberCount', '3', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticTagCount', '3', 'statistic');

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
INSERT INTO `brickcat_permission` VALUES ('userExchangeSize', '11');
INSERT INTO `brickcat_permission` VALUES ('userInitSize', '11');
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
INSERT INTO `brickcat_revision` VALUES ('1496665446549', '1', '1496665446466', '{\"commentContent\":\":smile: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1497680464281', '1', '1497680377398', '{\"commentContent\":\"DFG \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1497680690870', '1', '1497680657261', '{\"commentContent\":\"fgd \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1497680797745', '1', '1497680797673', '{\"commentContent\":\":tada: \"}', '1495610341604');

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
INSERT INTO `brickcat_role_permission` VALUES ('1497785946087', 'adminRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946140', 'adminRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946195', 'adminRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946249', 'adminRole', 'miscAllowAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946302', 'adminRole', 'miscAllowAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946354', 'adminRole', 'miscAllowAnonymousView');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946409', 'adminRole', 'miscLanguage');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946464', 'adminRole', 'miscRegisterMethod');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946518', 'adminRole', 'commentRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946574', 'adminRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946625', 'adminRole', 'articleAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946678', 'adminRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946730', 'adminRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946784', 'adminRole', 'articleReindexArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946836', 'adminRole', 'articleRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946891', 'adminRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946945', 'adminRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785946997', 'adminRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947052', 'adminRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947107', 'adminRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947159', 'adminRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947213', 'adminRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947265', 'adminRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947320', 'adminRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947374', 'adminRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947429', 'adminRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947480', 'adminRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947532', 'adminRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947584', 'adminRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947638', 'adminRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947692', 'adminRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947747', 'adminRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947800', 'adminRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947852', 'adminRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947907', 'adminRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785947960', 'adminRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948015', 'adminRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948071', 'adminRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948125', 'adminRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948180', 'adminRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948235', 'adminRole', 'adUpdateADSide');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948289', 'adminRole', 'adUpdateBanner');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948342', 'adminRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948395', 'adminRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948448', 'adminRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948502', 'adminRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948557', 'adminRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948610', 'adminRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948662', 'adminRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948715', 'adminRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948768', 'adminRole', 'menuAdminAD');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948823', 'adminRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948878', 'adminRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948930', 'adminRole', 'menuAdminDomains');
INSERT INTO `brickcat_role_permission` VALUES ('1497785948986', 'adminRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949038', 'adminRole', 'menuAdminMisc');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949092', 'adminRole', 'menuAdminRoles');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949145', 'adminRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949198', 'adminRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949250', 'adminRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949304', 'adminRole', 'menuAdminVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949359', 'adminRole', 'adminAddVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949415', 'adminRole', 'adminDeleteVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949470', 'adminRole', 'adminUpdateVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949523', 'adminRole', 'commonBadVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949579', 'adminRole', 'commonFollowVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949634', 'adminRole', 'commonGoodVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949689', 'adminRole', 'commonStickVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949744', 'adminRole', 'commonWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949799', 'adminRole', 'userExchangeSize');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949852', 'adminRole', 'userInitSize');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949907', 'adminRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1497785949962', 'adminRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950018', 'adminRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950070', 'adminRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950123', 'adminRole', 'domainAddDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950179', 'adminRole', 'domainAddDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950230', 'adminRole', 'domainRemoveDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950284', 'adminRole', 'domainRemoveDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1497785950339', 'adminRole', 'domainUpdateDomainBasic');

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
INSERT INTO `brickcat_tag` VALUES ('1495610342228', '1', '2', '0', '0', 'Announcement', 'announcement', '', '', '', '0', '0', '0', 'Announcement', 'Announcement', '', '0.401875487760331');
INSERT INTO `brickcat_tag` VALUES ('1495610342368', '1', '2', '0', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.999439807319996');
INSERT INTO `brickcat_tag` VALUES ('1495610344006', '0', '0', '0', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.39283440976244566');

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
INSERT INTO `brickcat_tag_article` VALUES ('1495610344334', '1495610344271', '1495610342368', '2', '1497680797672', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1495610344458', '1495610344271', '1495610342228', '2', '1497680797672', '0', '0');

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
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'admin', '42857cfddb33f3fddb27fff9773683f3', '', '', '', '', '', '2', 'http://localhost:9090/upload/b9e29c04b8fb4265ba63bfbd9f2112b3_timg.jpeg', '1', '', '', '', '', 'adminRole', '1', '4', '3', '0', '4991483', '9029', '0', '0', '1495610344193', '1497680797672', '1498194788839', '0:0:0:0:0:0:0:1', '0', '1497452282901', '20170614', '20170614', '20170614', '20170614', '0', '0', 'classic', 'mobile', '', '', '', '1496672480785', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341994', '1', 'en_US', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1497277766038', '3', '549595297@qq.com', 'viseosize', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/87a43004bbf74cbcad20972c03da2e66.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497277766036', '1', 'zh_CN', 'Asia/Shanghai', '1');
INSERT INTO `brickcat_user` VALUES ('1497278160243', '3', '54959597@qq.com', 'viseosize1', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/59e6b136e37841bdb10e34a99b83e624.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '400', '100', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1497278160241', '1', 'zh_CN', 'Asia/Shanghai', '1');

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
INSERT INTO `brickcat_video` VALUES ('1497671086925', '告诉对方', '0', '测试', '1495610341604', '2', '29', '/upload/bc48a58de96942caa8eef17ea362f597.mp4', '', '0', '1497671086925', '1497671086925', '1497680657242', 'admin', '0', '0', '0', '0', '0', '0', 'afdsf', '', '130', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497707565034', 'Spring Boot之Hello World', '0', 'Spring Boot', '1495610341604', '0', '6', '/upload/629fbeb72ae44cb990d97e0d7341ff76.mp4', '', '0', '1497707565024', '1497707565024', '0', '0', '0', '0', '0', '0', '0', '0', 'Spring Boot之Hello World', '', '76', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497708440033', '并发上传', '0', '测试', '1495610341604', '0', '0', '/upload/453d03e34a3a40849d59dfed6b51cb04.mp4', '', '0', '1497708440029', '1497708440029', '0', '0', '0', '0', '0', '0', '0', '0', '高并发测试', '', '76', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497708475663', '  测试', '0', '测试', '1495610341604', '0', '2', '/upload/51d3d9e4f4bc4cd69ac71d547055d071.mp4', '', '0', '1497708475663', '1497708475663', '0', '0', '0', '0', '0', '0', '0', '0', '测试', '', '76', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497708540684', '  测试', '0', '测试', '1495610341604', '0', '4', '/upload/a041b8a940e74e3784ad7362f5cfa1ad.mp4', '', '0', '1497708540684', '1497708540684', '0', '0', '0', '0', '0', '0', '0', '0', 'bbbb6', '', '76', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497708695721', '  测试', '0', '测试', '1495610341604', '0', '12', '/upload/60175952fd9d42b5b9e6c224de4f28ae.mp4', '', '0', '1497708695721', '1497708695721', '0', '0', '0', '0', '0', '0', '0', '0', '嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或嘿嘿嘿嘿嘿或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或嘿嘿嘿嘿嘿或好哈哈哈', '', '119', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1497708701804', 'springboot', '0', '测试', '1495610341604', '0', '64', '/upload/a82e051da49d41ce941573179d62f5a9.mp4', '', '0', '1497708701804', '1497708701804', '0', '0', '0', '2', '2', '1', '0', '0', '电风扇撒大声地法师打发斯蒂芬斯蒂芬是的发送到发的说法撒打发斯蒂芬水电费撒打发斯蒂芬', '', '130', '0', '0', '1497786504794', null);
INSERT INTO `brickcat_video` VALUES ('1497713896931', 'aaaaaaaaaaaaaaa', '0', 'a', '1495610341604', '0', '0', '/upload/4e61aae6763b43ecbf1d79bc5b0ebca9.mp4', '', '0', '1497713896929', '1497713896929', '0', '0', '0', '0', '0', '0', '0', '0', 'aaaaaaaaaaa', '/upload/4e61aae6763b43ecbf1d79bc5b0ebca9.png', '76', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498118224758', '', '0', '', '1495610341604', '0', '0', '01d644d5901a4bdab7866411b6feb317/01d644d5901a4bdab7866411b6feb317.m3u8', '', '0', '1498118224758', '1498118224758', '0', '0', '0', '0', '0', '0', '0', '0', '', '01d644d5901a4bdab7866411b6feb317.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498118735901', '', '0', '', '1495610341604', '0', '0', 'd563bddbb197488aa140b7d8d52e0b9a/d563bddbb197488aa140b7d8d52e0b9a.m3u8', '', '0', '1498118735900', '1498118735900', '0', '0', '0', '0', '0', '0', '0', '0', '', 'd563bddbb197488aa140b7d8d52e0b9a.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498119189753', '', '0', '', '1495610341604', '0', '0', 'b376549e54af407e86e20df262a74033/b376549e54af407e86e20df262a74033.m3u8', '', '0', '1498119189752', '1498119189752', '0', '0', '0', '0', '0', '0', '0', '0', '', 'b376549e54af407e86e20df262a74033.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498120233252', '', '0', '', '1495610341604', '0', '0', '58ff29e9aaf14ae7ba126a89840b81d0/58ff29e9aaf14ae7ba126a89840b81d0.m3u8', '', '0', '1498120233252', '1498120233252', '0', '0', '0', '0', '0', '0', '0', '0', '', '58ff29e9aaf14ae7ba126a89840b81d0.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498121306597', '', '0', '', '1495610341604', '0', '0', '7144acb538a948d484b2c73beaa0c3ab/7144acb538a948d484b2c73beaa0c3ab.m3u8', '', '0', '1498121306597', '1498121306597', '0', '0', '0', '0', '0', '0', '0', '1', '', '7144acb538a948d484b2c73beaa0c3ab.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498121453835', '', '0', '', '1495610341604', '0', '0', '63edaa8ee68d4c7f92441baf3a7ad9df/63edaa8ee68d4c7f92441baf3a7ad9df.m3u8', '', '0', '1498121453835', '1498121453835', '0', '0', '0', '0', '0', '0', '0', '1', '', '63edaa8ee68d4c7f92441baf3a7ad9df.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498121648619', '', '0', '', '1495610341604', '0', '0', 'fcaebffe12354e4ca0f1a03c05de99af/fcaebffe12354e4ca0f1a03c05de99af.m3u8', '', '0', '1498121648618', '1498121648618', '0', '0', '0', '0', '0', '0', '0', '1', '', 'fcaebffe12354e4ca0f1a03c05de99af.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498122704234', '', '0', '', '1495610341604', '0', '0', 'aaca1026793e49ed8d954f5453d92932/aaca1026793e49ed8d954f5453d92932.m3u8', '', '0', '1498122704234', '1498122704234', '0', '0', '0', '0', '0', '0', '0', '1', '', 'aaca1026793e49ed8d954f5453d92932.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498123615355', '', '0', '', '1495610341604', '0', '0', 'acbac9a4ce2444eaae7d9e3d5e5e511d/acbac9a4ce2444eaae7d9e3d5e5e511d.m3u8', '', '0', '1498123615355', '1498123615355', '0', '0', '0', '0', '0', '0', '0', '1', '', 'acbac9a4ce2444eaae7d9e3d5e5e511d.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498124089943', '', '0', '', '1495610341604', '0', '0', '3a69175d3d9b45a99e35842282295dcd/3a69175d3d9b45a99e35842282295dcd.m3u8', '', '0', '1498124089943', '1498124089943', '0', '0', '0', '0', '0', '0', '0', '1', '', '3a69175d3d9b45a99e35842282295dcd.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498186066320', '', '0', '', '1495610341604', '0', '0', 'dddb71a0501a482d8f6a06e262c109fa/dddb71a0501a482d8f6a06e262c109fa.m3u8', '', '0', '1498186066276', '1498186066276', '0', '0', '0', '0', '0', '0', '0', '1', '', 'dddb71a0501a482d8f6a06e262c109fa.png', '311', '0', '0', '0', null);
INSERT INTO `brickcat_video` VALUES ('1498192712125', '', '0', '', '1495610341604', '0', '0', 'da9db3bcb2cc4abdaa650c3de574c975/da9db3bcb2cc4abdaa650c3de574c975.m3u8', '', '0', '1498192712066', '1498192712066', '0', '0', '0', '0', '0', '0', '0', '1', '', 'da9db3bcb2cc4abdaa650c3de574c975.png', '311', '0', '0', '0', null);

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
INSERT INTO `brickcat_videosize` VALUES ('1498123513347', '1495610341604', '4878');

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
