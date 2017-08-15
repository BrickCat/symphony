/*
Navicat MySQL Data Transfer

Source Server         : Sym
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : brickcat

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-08-15 09:14:33
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
INSERT INTO `brickcat_article` VALUES ('1495610344271', 'Welcome to Sym community :hearts:', 'Sym,Announcement,测试', '1495610341604', '3', '34', 'Hello, everyone!', '', '0', '/article/1495610344271', '1495610344193', '1495610344193', '0', '', '0.9324582186955612', '1', '0', '1495610344271', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '0', '0', '0', '0', '');
INSERT INTO `brickcat_article` VALUES ('1499609443806', '关于板砖猫（BrickCat）', '测试', '1495610341604', '0', '7', '![546fc0499ece48a793f7aedf3c42d0bc_t01ae4a19ac3b456e47.jpg](http://localhost:9090/upload/546fc0499ece48a793f7aedf3c42d0bc_t01ae4a19ac3b456e47.jpg) \n测试显示呀\n\n', '', '0', '/article/1499609443806', '1499609443795', '1499609443795', '0', '', '0.1267116344790974', '1', '0', '1499609443806', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', '0', '0', '0', '0', '');
INSERT INTO `brickcat_article` VALUES ('1500469232629', 'brickcat', '测试', '1495610341604', '0', '4', '7/19 :smile:', '', '0', '/article/1500469232629', '1500469232617', '1500469232617', '0', '', '0.9632519188016672', '1', '0', '1500469232629', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '0', '0', '0', '0', '');
INSERT INTO `brickcat_article` VALUES ('1501034324864', '邀请码', '邀请码', '1495610341604', '0', '3', '0H3x5S95Ui38sLJt\nt68efQjgSwLHYWYS\nXdK1qq6nT6hDyQ3b\ng0N4pgwbZ7OAB3zj\nPLT5mi6UDdEl8sFm\nMZUi3CSRZw0RfSf6\nAKPK2vSpolXYMarB\nCrOjtHOpRQYa756Y\nIq8MSKWtvZic6Suu\n9U5BWVP55EibQcGR\n4GMbumFuuc5vU5Gp\nFV1UzjjfIaleH7Fn\n3XGB3vv40oDzJGOn\nd7eQwco3twtehpiQ\nmnDTYk4U5pPycqpX\ndQtFU8Dvih9Se5p9\nFniz9qrdKiXIzcnJ\niT70Dt5u24v9hX7T\nWKsM7CJb6ZzpEsa6\nGapF4ZrkJuDHt0oF\nsdrzFf7VBENMXxY2', '', '0', '/article/1501034324864', '1501034324857', '1501034324857', '0', '', '0.7915963359452095', '1', '0', '1501034324864', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '0', '0', '0', '0', '');
INSERT INTO `brickcat_article` VALUES ('1501057616840', '注册须知与条款', 'brickcat', '1495610341604', '1', '32', '**一、服务条款的确认和接纳**\r\n\r\n[http://brickcat.club]（以下简称搬砖猫）各项服务的所有权和运作权归简搬砖猫网。搬砖猫提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。会员必须完全同意所有服务条款并完成注册程序，才能成为搬砖猫的正式注册会员享受搬砖猫提供的更全面的服务。\r\n\r\n**二、权利及义务**\r\n\r\n搬砖猫的权利、义务：\r\n\r\n1、尊重会员隐私制度\r\n\r\n尊重会员个人隐私是搬砖猫的基本政策，搬砖猫不会公开、编辑或透露会员的注册资料，除非符合以下情况：\r\n\r\n(1) 根据中华人民共和国国家安全机构、公安部门的要求及根据相应的法律程序要求。\r\n\r\n(2) 维护搬砖猫的商标所有权及其它权益。\r\n\r\n(3) 在紧急情况下竭力维护会员个人、其它社会个体和社会大众的安全。\r\n\r\n(4) 符合其他相关的要求。\r\n\r\n(5) 在使用搬砖猫的某一项或多项服务时，会员同意公开自己的注册资料。\r\n\r\n如果会员提供的资料包含有不正确的信息，搬砖猫保留结束会员使用网络服务资格的权利。\r\n\r\n2、服务内容的所有权\r\n\r\n搬砖猫定义的服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；搬砖猫为会员提供的其他信息。所有这些内容受版权、商标及其它财产所有权法律的保护。所以，会员只能在搬砖猫和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。任何人需要转载搬砖猫的文章、数据，必须征得原文作者或搬砖猫授权。\r\n\r\n3、会员管理\r\n\r\n搬砖猫对会员的管理依据国家法律、地方法律和国际法律等标准。\r\n\r\n4、对会员信息的存储和限制\r\n\r\n搬砖猫不对会员所发布信息的删除或储存失败负责。搬砖猫有判定会员的行为是否符合搬砖猫服务条款的要求和精神的保留权利，如果会员违背了服务条款的规定，搬砖猫有权选择适当的处理方法直至中断对其提供网络服务的权利。\r\n\r\n会员权利义务：\r\n\r\n1、会员的权利：\r\n\r\n预订搬砖猫上的上传视频、图片、等服务，论坛发帖。\r\n\r\n2、会员必须遵循：\r\n\r\n(1)从中国境内向外或从中国境外向内传输资料时必须符合中国有关法规。\r\n\r\n(2)使用网络服务不作非法用途。\r\n\r\n(3)不干扰或混乱网络服务。\r\n\r\n(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。\r\n\r\n3、会员承诺：\r\n\r\n(1)不传输任何非法的、骚扰性的、中伤他人的、恐吓性的、庸俗的，淫秽等信息资料；\r\n\r\n(2)不传输任何教唆他人构成犯罪行为的资料；\r\n\r\n(3)不传输助长国内不利条件和涉及国家安全的资料；\r\n\r\n(4)不传输任何不符合当地法规、国家法律和国际法律的资料；\r\n\r\n(5)未经许可而非法进入其它电脑系统是禁止的；\r\n\r\n(6)法律规定的其他义务。\r\n\r\n若会员的行为不符合以上提到的服务条款，搬砖猫将作出独立判断立即取消会员服务帐号。会员需对自己在网上的行为承担法律责任。会员若在搬砖猫上散布和传播反动、色情或其他违反中国法律的信息，搬砖猫系统记录有可能作为会员违反法律的证据。\r\n\r\n4、基于网络服务的特性及重要性，会员同意：\r\n\r\n(1)不断更新注册资料，符合及时、详尽、准确的要求。\r\n\r\n(2)自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。\r\n\r\n(3)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。\r\n\r\n5、会员的帐号、密码和安全性\r\n\r\n会员一旦注册成功，成为搬砖猫的合法会员，将得到一个密码和会员名。会员对自己的会员名、密码和安全将负全部责任。另外，每个会员都要对以其会员名进行的所有活动和事件负全责。\r\n\r\n会员同意若发现任何非法使用该用户名或其它有损用户利益的情况，立即通告搬砖猫。搬砖猫在应用户要求并且确认用户个人信息的情况下，可以对用户密码进行更改并及时通知用户。用户亦可在输入正确资料后，自己更改密码。每个会员都要对以其会员名进行的所有活动和事件负全责。\r\n\r\n如因个人原因造成密码失窃而带来的任何损失，本公司概不承担责任。\r\n\r\n6、会员同意保障和维护搬砖猫全体成员的利益，负责支付由会员使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用等。\r\n\r\n**三****、关于责任**\r\n\r\n搬砖猫对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：他人的行为；会员不正当使用网络服务，在网上进行交易；用户传送的信息有所变动。这些行为都有可能会导致搬砖猫的形象受损，所以搬砖猫事先提出这种损害的可能性。会员同意保障和维护搬砖猫全体会员和搬砖猫的利益，承担由会员行为导致的一切后果损失。所有由用户违反相关法律法规产生的损害都由该用户自己承担。\r\n\r\n**五、服务条款的修改和服务修订**\r\n\r\n搬砖猫有权在必要时修改服务条款，搬砖猫服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，会员可以主动取消获得的网络服务。如果会员继续享用网络服务，则视为接受服务条款的变动。搬砖猫保留随时修改或中断服务而不需通知用户的权利，不需对用户或第三方负责。\r\n\r\n**六、通告**\r\n\r\n所有发给会员的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。\r\n\r\n**七、终止服务**\r\n\r\n会员或搬砖猫可随时根据实际情况中断一项或多项网络服务。搬砖猫不需对任何个人或第三方负责而随时中断服务。会员对后来的条款修改有异议，或对搬砖猫的服务不满，可以停止使用搬砖猫的网络服务。结束会员服务后，会员使用网络服务的权利马上中止。从那时起，用户没有权利，搬砖猫也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。\r\n\r\n**八、法律管辖**\r\n\r\n网络服务条款要与中华人民共和国的法律解释相一致，会员和搬砖猫一致同意服从中国法院管辖。如发生搬砖猫服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释。', '', '0', '/article/1501057616840', '1501057616830', '1501067222245', '1502455509907', 'brickcat', '0.040446615623490834', '1', '0', '1501057616840', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '0', '0', '1', '2', 'http://localhost:9090/upload/450c0481cf784d619502110a6a891a36.mp3');

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
  `commentType` int(1) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_comment
-- ----------------------------
INSERT INTO `brickcat_comment` VALUES ('1502455620997', null, ' :heart_eyes: ', '1502455629517', '1495610341604', '1501057616840', '/article/1501057616840#1502455620997', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `brickcat_comment` VALUES ('1502461446861', null, ' :yellow_heart: ', '1502461446933', '1495610341604', '1501250442813', '/article/1501250442813#1502461446861', '', '0', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '0', '0', '0', '0', '0', '', '2');

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
INSERT INTO `brickcat_follow` VALUES ('1500303677165', '1495610341604', '1498540198708', '0');
INSERT INTO `brickcat_follow` VALUES ('1500656299397', '1498540198708', '1495610341604', '0');
INSERT INTO `brickcat_follow` VALUES ('1501946274218', '1495610341604', '1501250442813', '6');
INSERT INTO `brickcat_follow` VALUES ('1502188965191', '1495610341604', '1501246772184', '6');
INSERT INTO `brickcat_follow` VALUES ('1502191552849', '1495610341604', '1500301319350', '6');
INSERT INTO `brickcat_follow` VALUES ('1502205800700', '1495610341604', '1501246964076', '6');
INSERT INTO `brickcat_follow` VALUES ('1502241071505', '1495610341604', '1500999668258', '6');

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
INSERT INTO `brickcat_invitecode` VALUES ('1500983275645', '0H3x5S95Ui38sLJt', 'sys', '1501033038675', '1501033038962', '1', '测试');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018370', 't68efQjgSwLHYWYS', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018426', 'XdK1qq6nT6hDyQ3b', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018477', 'g0N4pgwbZ7OAB3zj', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018529', 'PLT5mi6UDdEl8sFm', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018580', 'MZUi3CSRZw0RfSf6', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018631', 'AKPK2vSpolXYMarB', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018683', 'CrOjtHOpRQYa756Y', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018735', 'Iq8MSKWtvZic6Suu', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018790', '9U5BWVP55EibQcGR', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018844', '4GMbumFuuc5vU5Gp', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018897', 'FV1UzjjfIaleH7Fn', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034018953', '3XGB3vv40oDzJGOn', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019004', 'd7eQwco3twtehpiQ', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019058', 'mnDTYk4U5pPycqpX', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019112', 'dQtFU8Dvih9Se5p9', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019164', 'Fniz9qrdKiXIzcnJ', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019217', 'iT70Dt5u24v9hX7T', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019269', 'WKsM7CJb6ZzpEsa6', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019321', 'GapF4ZrkJuDHt0oF', 'sys', '', '0', '1', '注册');
INSERT INTO `brickcat_invitecode` VALUES ('1501034019375', 'sdrzFf7VBENMXxY2', 'sys', '', '0', '1', '注册');

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
INSERT INTO `brickcat_liveness` VALUES ('1498811792804', '1495610341604', '20170630', '0', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1499224377178', '1495610341604', '20170705', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1499609444343', '1495610341604', '20170709', '0', '1', '0', '0', '0', '0', '0', '4');
INSERT INTO `brickcat_liveness` VALUES ('1499944665660', '1495610341604', '20170713', '0', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1500199219513', '1495610341604', '20170716', '0', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1500455592364', '1495610341604', '20170719', '0', '1', '0', '0', '0', '0', '0', '3');
INSERT INTO `brickcat_liveness` VALUES ('1501034325372', '1495610341604', '20170726', '0', '2', '0', '0', '0', '0', '0', '8');
INSERT INTO `brickcat_liveness` VALUES ('1501139997701', '1495610341604', '20170727', '0', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `brickcat_liveness` VALUES ('1501835494513', '1495610341604', '20170804', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `brickcat_liveness` VALUES ('1501898223184', '1495610341604', '20170805', '0', '0', '0', '0', '0', '39', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1501954046640', '1495610341604', '20170806', '0', '0', '0', '0', '0', '0', '3', '0');
INSERT INTO `brickcat_liveness` VALUES ('1502108793818', '1495610341604', '20170807', '0', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO `brickcat_liveness` VALUES ('1502161195806', '1495610341604', '20170808', '0', '0', '17', '4', '0', '4', '1', '3');
INSERT INTO `brickcat_liveness` VALUES ('1502208441450', '1495610341604', '20170809', '0', '0', '0', '3', '0', '0', '0', '3');
INSERT INTO `brickcat_liveness` VALUES ('1502382509531', '1495610341604', '20170811', '0', '0', '3', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `brickcat_mall_address`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_address`;
CREATE TABLE `brickcat_mall_address` (
  `oId` varchar(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `area_id` varchar(64) DEFAULT NULL,
  `is_default` char(1) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_address
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_cart`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_cart`;
CREATE TABLE `brickcat_mall_cart` (
  `oId` varchar(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_cart_item`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_cart_item`;
CREATE TABLE `brickcat_mall_cart_item` (
  `oId` varchar(20) NOT NULL,
  `cart_id` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` varchar(64) NOT NULL,
  `is_ordered` char(1) NOT NULL DEFAULT '0',
  `is_selected` char(1) NOT NULL DEFAULT '1',
  `user_id` char(64) DEFAULT NULL,
  PRIMARY KEY (`oId`),
  KEY `FKCADACD250FB5F39` (`cart_id`),
  KEY `FKCADACD25CDF5619` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_cart_item_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_cart_item_attribute`;
CREATE TABLE `brickcat_mall_cart_item_attribute` (
  `oId` varchar(20) NOT NULL,
  `item_id` varchar(64) DEFAULT NULL,
  `attribute_item_id` varchar(64) DEFAULT NULL,
  `attribute_item_value_id` varchar(64) DEFAULT NULL,
  `attribute_idstring` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_cart_item_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_category`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_category`;
CREATE TABLE `brickcat_mall_category` (
  `id` varchar(64) NOT NULL,
  `featured` char(1) DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` varchar(64) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '999',
  `del_flag` char(1) NOT NULL DEFAULT '0',
  `create_date` date DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `app_featured_home` char(1) DEFAULT '0',
  `app_featured_home_sort` int(10) unsigned DEFAULT '999',
  `parent_ids` varchar(2000) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `is_audit` char(1) DEFAULT '1',
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL COMMENT '超链接地址，优先级“高”',
  `href_target` char(7) DEFAULT '_blank' COMMENT '超链接打开的目标窗口，新窗口打开，请填写：“_blank”, 目标（_blank、_self、_parent、_top）',
  `image_medium` varchar(1000) DEFAULT NULL,
  `image_large` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_category
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_collect_product`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_collect_product`;
CREATE TABLE `brickcat_mall_collect_product` (
  `oId` varchar(20) NOT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_collect_product
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_history_product`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_history_product`;
CREATE TABLE `brickcat_mall_history_product` (
  `oId` varchar(20) NOT NULL,
  `product_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_history_product
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_product`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_product`;
CREATE TABLE `brickcat_mall_product` (
  `oId` varchar(20) NOT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `featured_image` varchar(2000) DEFAULT NULL,
  `image_small` varchar(2000) DEFAULT NULL,
  `name` varchar(2000) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '999',
  `create_date` bigint(20) DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL,
  `update_date` bigint(20) DEFAULT NULL,
  `update_by` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `featured_price` decimal(10,2) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `is_audit` char(1) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `featured` char(1) DEFAULT '0',
  `description` text,
  `category_id` varchar(20) DEFAULT NULL,
  `image_large` varchar(1000) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT '1' COMMENT 'çŠ¶æ€ï¼Œ0:éšè—ï¼Œ1:æ˜¾ç¤º',
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_product
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_sale`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_sale`;
CREATE TABLE `brickcat_mall_sale` (
  `oId` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `duration_day` int(10) unsigned DEFAULT NULL,
  `duration_day_desc` varchar(20) DEFAULT NULL,
  `count_per_user` int(10) unsigned DEFAULT NULL,
  `used_type` char(1) DEFAULT NULL,
  `used_type_desc` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `type_desc` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_sale
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mall_sale_user`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mall_sale_user`;
CREATE TABLE `brickcat_mall_sale_user` (
  `oId` varchar(20) NOT NULL,
  `mall_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `has_used` char(1) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `type_desc` varchar(255) DEFAULT NULL,
  `duration_day` int(11) DEFAULT NULL,
  `duration_day_desc` varchar(255) DEFAULT NULL,
  `used_type` char(1) DEFAULT NULL,
  `used_type_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mall_sale_user
-- ----------------------------

-- ----------------------------
-- Table structure for `brickcat_mind`
-- ----------------------------
DROP TABLE IF EXISTS `brickcat_mind`;
CREATE TABLE `brickcat_mind` (
  `oId` varchar(19) NOT NULL,
  `mindAuthorId` varchar(19) NOT NULL,
  `mindContent` mediumtext NOT NULL,
  `mindCreateTime` bigint(20) DEFAULT NULL,
  `mindUpdateTime` bigint(20) DEFAULT NULL,
  `mindType` int(11) DEFAULT NULL,
  `mindName` varchar(255) NOT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_mind
-- ----------------------------
INSERT INTO `brickcat_mind` VALUES ('1499312537605', '1495610341604', '{\"root\":{\"data\":{\"id\":\"60645e0705ac\",\"created\":1498908369,\"text\":\"Sym · 新增功能\"},\"children\":[{\"data\":{\"id\":\"be07s08zcv40\",\"created\":1499046902934,\"text\":\"后台管理\"},\"children\":[{\"data\":{\"id\":\"be0dajcq7tc0\",\"created\":1499062460624,\"text\":\"用户管理\"},\"children\":[{\"data\":{\"id\":\"be0daqup9ew0\",\"created\":1499062476949,\"text\":\"用户注册初始化存储\",\"priority\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0d8unw6eo0\",\"created\":1499062328517,\"text\":\"视频管理\",\"progress\":8,\"priority\":1},\"children\":[{\"data\":{\"id\":\"be0dbek4fl40\",\"created\":1499062528553,\"text\":\"文件信息回滚\",\"progress\":1,\"priority\":1},\"children\":[{\"data\":{\"id\":\"be0dbl4yt8g0\",\"created\":1499062542873,\"text\":\"信息回滚\"},\"children\":[]},{\"data\":{\"id\":\"be0dbq1zpuo0\",\"created\":1499062553577,\"text\":\"文件回滚\"},\"children\":[]}]},{\"data\":{\"id\":\"be0dckxpp340\",\"created\":1499062620798,\"text\":\"增删改查\",\"progress\":9},\"children\":[]}]},{\"data\":{\"id\":\"be0d93l1wb40\",\"created\":1499062347935,\"text\":\"圈子管理\",\"progress\":8,\"priority\":2},\"children\":[{\"data\":{\"id\":\"be0dbek4fl40\",\"created\":1499062528553,\"text\":\"文件信息回滚\",\"progress\":1,\"priority\":1},\"children\":[{\"data\":{\"id\":\"be0dbwoswag0\",\"created\":1499062568017,\"text\":\"信息回滚\"},\"children\":[]},{\"data\":{\"id\":\"be0dbzszzmg0\",\"created\":1499062574801,\"text\":\"文件回滚\"},\"children\":[]}]},{\"data\":{\"id\":\"be0dct8h3eg0\",\"created\":1499062638863,\"text\":\"增删改查\",\"progress\":9},\"children\":[]}]},{\"data\":{\"id\":\"be0d979b46o0\",\"created\":1499062355932,\"text\":\"脑图管理\",\"progress\":1,\"priority\":3},\"children\":[]},{\"data\":{\"id\":\"be0d9mo2u600\",\"created\":1499062389477,\"text\":\"回帖管理\",\"progress\":6},\"children\":[{\"data\":{\"id\":\"be0d9r85mb40\",\"created\":1499062399398,\"text\":\"文章\",\"priority\":null,\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be0d9vmlbm80\",\"created\":1499062408978,\"text\":\"视频\",\"priority\":1,\"progress\":1},\"children\":[]},{\"data\":{\"id\":\"be0d9xv2vcg0\",\"created\":1499062413845,\"text\":\"圈子\",\"priority\":2,\"progress\":1},\"children\":[]}]}]},{\"data\":{\"id\":\"be07s6ifzso0\",\"created\":1499046916567,\"text\":\"前台展示\"},\"children\":[{\"data\":{\"id\":\"be0c9k8tgyo0\",\"created\":1499059563091,\"text\":\"页面样式\",\"layout_left_offset\":{\"x\":-150,\"y\":-25},\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0853wnyvc0\",\"created\":1499047929631,\"text\":\"视频\",\"expandState\":\"expand\",\"progress\":3,\"priority\":1},\"children\":[{\"data\":{\"id\":\"be08dvvwymo0\",\"created\":1499048617449,\"text\":\"热门视频\",\"expandState\":\"expand\"},\"children\":[{\"data\":{\"id\":\"be085h7ghdk0\",\"created\":1499047958582,\"text\":\"视频评论\",\"progress\":7},\"children\":[{\"data\":{\"id\":\"be08lpz9id40\",\"created\":1499049231504,\"text\":\"积分扣除\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be08lw1kr8g0\",\"created\":1499049244704,\"text\":\"通知\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be08m3s0n480\",\"created\":1499049261541,\"text\":\"我的评论\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be08zz74mcg0\",\"created\":1499050348669,\"text\":\"新增评论\",\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be0905jd6t40\",\"created\":1499050362469,\"text\":\"修改评论\",\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be090b5kr600\",\"created\":1499050374696,\"text\":\"删除评论\",\"progress\":9},\"children\":[]}]},{\"data\":{\"id\":\"be085lswwps0\",\"created\":1499047968586,\"text\":\"视频赞踩\",\"expandState\":\"expand\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be08j23zkbk0\",\"created\":1499049022818,\"text\":\"积分扣除\",\"progress\":5,\"priority\":2},\"children\":[]},{\"data\":{\"id\":\"be08j67gt5s0\",\"created\":1499049031736,\"text\":\"通知\",\"progress\":5,\"priority\":2},\"children\":[]}]},{\"data\":{\"id\":\"be0870u10w80\",\"created\":1499048079669,\"text\":\"视频置顶\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be08idnx7p40\",\"created\":1499048969604,\"text\":\"通知\",\"priority\":2,\"progress\":2},\"children\":[]},{\"data\":{\"id\":\"be08ii2fe940\",\"created\":1499048979188,\"text\":\"积分扣除\",\"priority\":2,\"progress\":3},\"children\":[]}]},{\"data\":{\"id\":\"be086tguujk0\",\"created\":1499048063636,\"text\":\"视频关注\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be08i4urrc80\",\"created\":1499048950427,\"text\":\"通知\",\"priority\":2,\"progress\":2},\"children\":[]},{\"data\":{\"id\":\"be08jlj21m80\",\"created\":1499049065088,\"text\":\"我关注的视频\",\"priority\":2,\"progress\":1},\"children\":[]}]},{\"data\":{\"id\":\"be088tmw91c0\",\"created\":1499048220729,\"text\":\"视频播放\",\"expandState\":\"expand\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be08d7qvkrk0\",\"created\":1499048564901,\"text\":\"nginx负载均衡\",\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be08djwb3400\",\"created\":1499048591351,\"text\":\"下载按钮样式\",\"progress\":2,\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be08hj5ylk80\",\"created\":1499048903215,\"text\":\"视频水印\",\"progress\":1,\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be08hsr11cg0\",\"created\":1499048924080,\"text\":\"视频加载样式\",\"priority\":1,\"progress\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0a62x76200\",\"created\":1499053648070,\"text\":\"视频下载\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be0a68deepk0\",\"created\":1499053659934,\"text\":\"是否可下载\",\"priority\":2,\"progress\":1},\"children\":[]},{\"data\":{\"id\":\"be0a6dycql40\",\"created\":1499053672085,\"text\":\"积分购买下载\",\"priority\":2,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0a6jzwevc0\",\"created\":1499053685239,\"text\":\"积分扣除\",\"priority\":2,\"progress\":1},\"children\":[]},{\"data\":{\"id\":\"be0a6q5yjgo0\",\"created\":1499053698666,\"text\":\"通知\",\"priority\":2,\"progress\":1},\"children\":[]}]}]}]},{\"data\":{\"id\":\"be08e80spdc0\",\"created\":1499048643865,\"text\":\"冷门视频\",\"progress\":1,\"priority\":3},\"children\":[{\"data\":{\"id\":\"be08eczijhc0\",\"created\":1499048654672,\"text\":\"冷门视频列表\",\"progress\":1,\"priority\":3},\"children\":[]},{\"data\":{\"id\":\"be08ekj7oo00\",\"created\":1499048671100,\"text\":\"进入视频详情\",\"priority\":3,\"progress\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0aafzbegw0\",\"created\":1499053989953,\"text\":\"发布视频\",\"priority\":1,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0aalxooh40\",\"created\":1499054002915,\"text\":\"视频错误回滚\",\"priority\":1,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0abr888680\",\"created\":1499054092801,\"text\":\"信息回滚\",\"priority\":1,\"progress\":1},\"children\":[]},{\"data\":{\"id\":\"be0abzvqdg00\",\"created\":1499054111636,\"text\":\"文件回滚\",\"priority\":1,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0ac91ow5s0\",\"created\":1499054131588,\"text\":\"video\"},\"children\":[]},{\"data\":{\"id\":\"be0acchjcu00\",\"created\":1499054139076,\"text\":\"image\"},\"children\":[]},{\"data\":{\"id\":\"be0ach0wky80\",\"created\":1499054148954,\"text\":\"m3u8\"},\"children\":[]},{\"data\":{\"id\":\"be0acmh7ppc0\",\"created\":1499054160824,\"text\":\"chunk\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0bb49imr40\",\"created\":1499056863923,\"text\":\"扣除积分\",\"progress\":2},\"children\":[]},{\"data\":{\"id\":\"be0bb9cjl3c0\",\"created\":1499056874990,\"text\":\"扣除存储\",\"progress\":9},\"children\":[{\"data\":{\"id\":\"be0bbelhv7s0\",\"created\":1499056886415,\"text\":\"积分购买存储\",\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be0bbzojbw80\",\"created\":1499056932311,\"text\":\"充值积分\",\"progress\":9},\"children\":[]},{\"data\":{\"id\":\"be0bchpf21s0\",\"created\":1499056971547,\"text\":\"消息\",\"priority\":1},\"children\":[]}]}]},{\"data\":{\"id\":\"be0deebzgkg0\",\"created\":1499062763152,\"text\":\"视频标签\"},\"children\":[{\"data\":{\"id\":\"be0dej6f1jk0\",\"created\":1499062773699,\"text\":\"聚合文章标签\"},\"children\":[]}]},{\"data\":{\"id\":\"be0dgwq6hgo0\",\"created\":1499062959921,\"text\":\"视频分类\"},\"children\":[{\"data\":{\"id\":\"be0dh10haeo0\",\"created\":1499062969251,\"text\":\"健身\"},\"children\":[]},{\"data\":{\"id\":\"be0dh6dctqg0\",\"created\":1499062980913,\"text\":\"IT\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0a8tdh53s0\",\"created\":1499053862380,\"text\":\"圈子\",\"priority\":2},\"children\":[{\"data\":{\"id\":\"be0a8yxm6rk0\",\"created\":1499053874481,\"text\":\"热门圈子\",\"priority\":1,\"progress\":5},\"children\":[{\"data\":{\"id\":\"be0aa56ofp40\",\"created\":1499053966454,\"text\":\"图片查看\",\"priority\":1,\"progress\":5},\"children\":[{\"data\":{\"id\":\"be0b75anjpk0\",\"created\":1499056552712,\"text\":\"GIF\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0b798rdgg0\",\"created\":1499056561304,\"text\":\"image\",\"priority\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0b6e0wflk0\",\"created\":1499056493349,\"text\":\"赞踩\",\"priority\":2,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0b7crid600\",\"created\":1499056568968,\"text\":\"通知\"},\"children\":[]}]},{\"data\":{\"id\":\"be0b6ug6d3k0\",\"created\":1499056529101,\"text\":\"评论\",\"priority\":2,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0b800hv4o0\",\"created\":1499056619578,\"text\":\"新增\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0b7hj3vmg0\",\"created\":1499056579344,\"text\":\"通知\",\"priority\":2},\"children\":[]},{\"data\":{\"id\":\"be0b7ptky5k0\",\"created\":1499056597392,\"text\":\"删除\",\"priority\":3},\"children\":[]},{\"data\":{\"id\":\"be0b7vkxax40\",\"created\":1499056609929,\"text\":\"修改\",\"priority\":4},\"children\":[]}]}]},{\"data\":{\"id\":\"be0a93pm77c0\",\"created\":1499053884881,\"text\":\"冷门圈子\",\"priority\":2,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0a99rkn9s0\",\"created\":1499053898060,\"text\":\"冷门圈子列表\",\"priority\":2},\"children\":[]}]},{\"data\":{\"id\":\"be0afskp1hk0\",\"created\":1499054409188,\"text\":\"圈子发布\",\"priority\":1,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0afyksdwg0\",\"created\":1499054422254,\"text\":\"信息文件回滚\",\"priority\":1},\"children\":[{\"data\":{\"id\":\"be0ag6bml7k0\",\"created\":1499054439115,\"text\":\"信息回滚\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0agki6gi80\",\"created\":1499054469986,\"text\":\"文件回滚\",\"expandState\":\"expand\",\"priority\":1},\"children\":[{\"data\":{\"id\":\"be0agfn926g0\",\"created\":1499054459409,\"text\":\"thumb\"},\"children\":[]},{\"data\":{\"id\":\"be0agbhpkts0\",\"created\":1499054450367,\"text\":\"image\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0b1uq6o540\",\"created\":1499056137885,\"text\":\"thumb生成\",\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0b3o6hgr40\",\"created\":1499056280362,\"text\":\"图片水印\",\"priority\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0b8r5pvi00\",\"created\":1499056678667,\"text\":\"我的圈子\",\"priority\":2,\"progress\":1},\"children\":[{\"data\":{\"id\":\"be0b8umrc3c0\",\"created\":1499056686227,\"text\":\"修改\"},\"children\":[]},{\"data\":{\"id\":\"be0b8yk22dc0\",\"created\":1499056694771,\"text\":\"删除\"},\"children\":[]}]},{\"data\":{\"id\":\"be0der16xy80\",\"created\":1499062790798,\"text\":\"圈子标签\"},\"children\":[{\"data\":{\"id\":\"be0deujruzc0\",\"created\":1499062798452,\"text\":\"聚合文章标签\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0bddc4xaw0\",\"created\":1499057040400,\"text\":\"商城\",\"priority\":5},\"children\":[{\"data\":{\"id\":\"be0bdiiogb40\",\"created\":1499057051680,\"text\":\"暂定\"},\"children\":[]}]},{\"data\":{\"id\":\"be0bds51qmw0\",\"created\":1499057072624,\"text\":\"个人主页\",\"priority\":2},\"children\":[{\"data\":{\"id\":\"be0bop910z40\",\"created\":1499057928340,\"text\":\"视频\"},\"children\":[{\"data\":{\"id\":\"be0bp01lwbk0\",\"created\":1499057951836,\"text\":\"我发布的视频\"},\"children\":[]},{\"data\":{\"id\":\"be0bpeptw680\",\"created\":1499057983775,\"text\":\"我评论的视频\"},\"children\":[]},{\"data\":{\"id\":\"be0br12wgdc0\",\"created\":1499058110819,\"text\":\"我关注的视频\"},\"children\":[]}]},{\"data\":{\"id\":\"be0bt75a2400\",\"created\":1499058280752,\"text\":\"圈子\"},\"children\":[{\"data\":{\"id\":\"be0btapi0kw0\",\"created\":1499058288505,\"text\":\"我发布的圈子\"},\"children\":[]},{\"data\":{\"id\":\"be0btegkjs80\",\"created\":1499058296672,\"text\":\"我评论的圈子\"},\"children\":[]}]},{\"data\":{\"id\":\"be0bvrolo5s0\",\"created\":1499058482184,\"text\":\"积分\"},\"children\":[{\"data\":{\"id\":\"be0bvwju9bc0\",\"created\":1499058492780,\"text\":\"积分类别\",\"priority\":1},\"children\":[]}]},{\"data\":{\"id\":\"be0c3axo0i00\",\"created\":1499059072640,\"text\":\"脑图\",\"priority\":2},\"children\":[{\"data\":{\"id\":\"be0c3iulwhk0\",\"created\":1499059089870,\"text\":\"我发布的脑图\"},\"children\":[{\"data\":{\"id\":\"be0dfxd4q540\",\"created\":1499062882944,\"text\":\"分类\",\"expandState\":\"expand\"},\"children\":[{\"data\":{\"id\":\"be0dfs1jh5c0\",\"created\":1499062871361,\"text\":\"IT\"},\"children\":[]},{\"data\":{\"id\":\"be0dfa9c6rs0\",\"created\":1499062832649,\"text\":\"健身\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0c3ohawrk0\",\"created\":1499059102126,\"text\":\"发布脑图\"},\"children\":[]},{\"data\":{\"id\":\"be0c3xwcxs00\",\"created\":1499059122627,\"text\":\"修改脑图\"},\"children\":[]},{\"data\":{\"id\":\"be0c42kxpxs0\",\"created\":1499059132820,\"text\":\"删除脑图\"},\"children\":[]},{\"data\":{\"id\":\"be0cn6uxpjc0\",\"created\":1499060631051,\"text\":\"是否公开\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0c8z2ix1c0\",\"created\":1499059516998,\"text\":\"logo\",\"layout_left_offset\":{\"x\":-153,\"y\":-3413},\"priority\":1},\"children\":[]},{\"data\":{\"id\":\"be0c8eimy340\",\"created\":1499059472259,\"text\":\"game\",\"priority\":3},\"children\":[{\"data\":{\"id\":\"be0c8iztmzs0\",\"created\":1499059482006,\"text\":\"更新game\"},\"children\":[]},{\"data\":{\"id\":\"be0c8ogfbqo0\",\"created\":1499059493893,\"text\":\"游戏赚去积分\"},\"children\":[]}]},{\"data\":{\"id\":\"be0ca9tdg4g0\",\"created\":1499059618753,\"text\":\"登录注册\",\"priority\":4},\"children\":[{\"data\":{\"id\":\"be0cafqlhy80\",\"created\":1499059631646,\"text\":\"登录\"},\"children\":[{\"data\":{\"id\":\"be0clc88zbs0\",\"created\":1499060486012,\"text\":\"登录页的网站介绍\"},\"children\":[]},{\"data\":{\"id\":\"be0clk5dd400\",\"created\":1499060503252,\"text\":\"样式\"},\"children\":[]}]},{\"data\":{\"id\":\"be0cajp46uo0\",\"created\":1499059640263,\"text\":\"注册\"},\"children\":[{\"data\":{\"id\":\"be0cln7zv7c0\",\"created\":1499060509941,\"text\":\"用户须知\"},\"children\":[]},{\"data\":{\"id\":\"be0clu5vnp40\",\"created\":1499060525051,\"text\":\"样式\"},\"children\":[]},{\"data\":{\"id\":\"be0dj4e9is80\",\"created\":1499063133343,\"text\":\"注册邮箱\"},\"children\":[]}]}]},{\"data\":{\"id\":\"be0cmeead140\",\"created\":1499060569095,\"text\":\"积分充值\",\"priority\":4},\"children\":[{\"data\":{\"id\":\"be0cmlc1bp40\",\"created\":1499060584196,\"text\":\"积分介绍\"},\"children\":[]},{\"data\":{\"id\":\"be0cmoqlq3k0\",\"created\":1499060591608,\"text\":\"充值二维码\"},\"children\":[]},{\"data\":{\"id\":\"be0cmt2x4o00\",\"created\":1499060601059,\"text\":\"是否接入支付宝、微信\"},\"children\":[]}]}]}]},\"template\":\"default\",\"theme\":\"fresh-blue\",\"version\":\"1.4.33\"}', '1499312537667', '1499312537730', '0', 'Sym · 新增功能');

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
INSERT INTO `brickcat_notification` VALUES ('1498540199300', '1498540198708', '', '16', '1');
INSERT INTO `brickcat_notification` VALUES ('1498541328455', '', '1498541328185', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498556849446', '', '1498556849193', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1498556849502', '1498540198708', '1498556849193', '13', '0');
INSERT INTO `brickcat_notification` VALUES ('1500303677232', '1498540198708', '1495610341604', '17', '1');
INSERT INTO `brickcat_notification` VALUES ('1500656299464', '1495610341604', '1498540198708', '17', '1');
INSERT INTO `brickcat_notification` VALUES ('1501034325772', '1498540198708', '1501034324864', '4', '0');
INSERT INTO `brickcat_notification` VALUES ('1501057623381', '1498540198708', '1501057616840', '4', '0');
INSERT INTO `brickcat_notification` VALUES ('1501954046078', '1495610341604', '1501954032561', '12', '1');
INSERT INTO `brickcat_notification` VALUES ('1501955965898', '1495610341604', '1501955889284', '12', '1');
INSERT INTO `brickcat_notification` VALUES ('1501956076596', '1495610341604', '1501956076533', '12', '1');
INSERT INTO `brickcat_notification` VALUES ('1502182112835', '', '1502182030178', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502182332148', '', '1502182331872', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502183630803', '', '1502183630494', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502184972981', '', '1502184972688', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502185393972', '', '1502185368411', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502185452135', '', '1502185451908', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502185918048', '', '1502185917808', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502185957155', '', '1502185956914', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502191532565', '', '1502191532298', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502191556450', '1495610341604', '1502191556390', '12', '1');
INSERT INTO `brickcat_notification` VALUES ('1502198221864', '', '1502198221599', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502209712564', '1495610341604', '1501057616840', '22', '1');
INSERT INTO `brickcat_notification` VALUES ('1502382509785', '', '1502382509327', '3', '0');
INSERT INTO `brickcat_notification` VALUES ('1502461447127', '', '1502461446861', '3', '0');

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
INSERT INTO `brickcat_option` VALUES ('statisticArticleCount', '5', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticCmtCount', '31', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticDomainCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticLinkCount', '0', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMaxOnlineVisitorCount', '4', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticMemberCount', '7', 'statistic');
INSERT INTO `brickcat_option` VALUES ('statisticTagCount', '6', 'statistic');

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
INSERT INTO `brickcat_permission` VALUES ('mallAddProduct', '14');
INSERT INTO `brickcat_permission` VALUES ('mallAdmin', '10');
INSERT INTO `brickcat_permission` VALUES ('mallDelProduct', '14');
INSERT INTO `brickcat_permission` VALUES ('mallUpdateProduct', '14');
INSERT INTO `brickcat_permission` VALUES ('menuAdmin', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminAD', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminArticles', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminComments', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminDomains', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminIcs', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminMind', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminMisc', '10');
INSERT INTO `brickcat_permission` VALUES ('menuAdminProduct', '10');
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
INSERT INTO `brickcat_permission` VALUES ('userCreateMind', '13');
INSERT INTO `brickcat_permission` VALUES ('userDeductPoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userDeleteMind', '13');
INSERT INTO `brickcat_permission` VALUES ('userDeleteTrends', '12');
INSERT INTO `brickcat_permission` VALUES ('userExchangePoint', '1');
INSERT INTO `brickcat_permission` VALUES ('userExchangeSize', '11');
INSERT INTO `brickcat_permission` VALUES ('userInitSize', '11');
INSERT INTO `brickcat_permission` VALUES ('userUpdateMind', '13');
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
INSERT INTO `brickcat_pointtransfer` VALUES ('1499609444284', '1495610341604', 'sys', '20', '4991409', '0', '1499609444247', '1', '1499609443806');
INSERT INTO `brickcat_pointtransfer` VALUES ('1500469232963', '1495610341604', 'sys', '20', '4991389', '0', '1500469232956', '1', '1500469232629');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501034325295', '1495610341604', 'sys', '21', '4991368', '0', '1501034325287', '1', '1501034324864');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501057617525', '1495610341604', 'sys', '21', '4991347', '0', '1501057617515', '1', '1501057616840');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501067054855', '1495610341604', 'sys', '6', '4991341', '0', '1501067054846', '2', '1501057616840');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501067222394', '1495610341604', 'sys', '6', '4991335', '0', '1501067222372', '2', '1501057616840');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501087831301', '1495610341604', 'sys', '100', '4991235', '0', '1501087831277', '23', '13');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501087840749', '1495610341604', 'sys', '100', '4991135', '0', '1501087840738', '23', '13');
INSERT INTO `brickcat_pointtransfer` VALUES ('1501139997610', 'sys', '1495610341604', '20', '0', '4991155', '1501139997593', '8', '1495610341604');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502182099862', '1495610341604', 'sys', '2', '499115528', '0', '1502182099232', '3', '1502182030178');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502182332020', '1495610341604', 'sys', '2', '499115526', '0', '1502182332015', '3', '1502182331872');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502183247438', '1495610341604', 'sys', '2', '499115524', '0', '1502183247434', '3', '1502183247307');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502183630669', '1495610341604', 'sys', '2', '499115522', '0', '1502183630661', '3', '1502183630494');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502184724000', '1495610341604', 'sys', '2', '499115520', '0', '1502184723994', '3', '1502184723863');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502184972831', '1495610341604', 'sys', '2', '499115518', '0', '1502184972820', '3', '1502184972688');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502185110401', '1495610341604', 'sys', '2', '499115516', '0', '1502185110384', '3', '1502185110242');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502185368550', '1495610341604', 'sys', '2', '499115514', '0', '1502185368542', '3', '1502185368411');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502185452040', '1495610341604', 'sys', '2', '499115512', '0', '1502185452034', '3', '1502185451908');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502185917944', '1495610341604', 'sys', '2', '499115510', '0', '1502185917932', '3', '1502185917808');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502185957053', '1495610341604', 'sys', '2', '499115508', '0', '1502185957045', '3', '1502185956914');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502186047105', '1495610341604', 'sys', '2', '499115506', '0', '1502186047099', '3', '1502186046970');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502191532453', '1495610341604', 'sys', '2', '499115504', '0', '1502191532444', '3', '1502191532298');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502198221742', '1495610341604', 'sys', '2', '499115512', '0', '1502198221736', '3', '1502198221599');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201035412', '1495610341604', 'sys', '2', '499115510', '0', '1502201035407', '3', '1502201035279');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201228814', '1495610341604', 'sys', '2', '499115508', '0', '1502201228809', '3', '1502201228683');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201291829', 'sys', '1495610341604', '18', '0', '499115526', '1502201291821', '8', '1495610341604');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201299344', 'sys', '1495610341604', '1', '0', '499115527', '1502201299336', '18', '1495610341604');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201311038', '1495610341604', 'sys', '20', '499115507', '0', '1502201311030', '26', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201331720', 'sys', '1495610341604', '5', '0', '499115512', '1502201331704', '27', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201379361', '1495610341604', 'sys', '5', '499115507', '0', '1502201379354', '26', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502201464324', 'sys', '1495610341604', '16', '0', '499115523', '1502201464314', '27', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502205725850', '1495610341604', 'sys', '2', '499115521', '0', '1502205725844', '3', '1502205725715');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502209712627', 'sys', '1495610341604', '100', '0', '499115621', '1502209712620', '29', '1501057616840');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502240813453', '1495610341604', 'sys', '10', '499115611', '0', '1502240813448', '26', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502240871147', 'sys', '1495610341604', '8', '0', '499115619', '1502240871127', '27', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502240904877', '1495610341604', 'sys', '9', '499115610', '0', '1502240904870', '26', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502241006988', 'sys', '1495610341604', '21', '0', '499115631', '1502241006970', '27', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502241759652', '1495610341604', 'sys', '12', '499115619', '0', '1502241759645', '26', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502241868997', 'sys', '1495610341604', '19', '0', '499115638', '1502241868991', '27', '');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502382509475', '1495610341604', 'sys', '2', '499115636', '0', '1502382509466', '3', '1502382509327');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502455663501', '1495610341604', 'sys', '2', '499115634', '0', '1502455663367', '3', '1502455620997');
INSERT INTO `brickcat_pointtransfer` VALUES ('1502461447001', '1495610341604', 'sys', '2', '499115632', '0', '1502461446997', '3', '1502461446861');

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
INSERT INTO `brickcat_revision` VALUES ('1498540023599', '1', '1498540023538', '{\"commentContent\":\" :weary: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1498541328244', '1', '1498541328185', '{\"commentContent\":\" :expressionless: \"}', '1498540198708');
INSERT INTO `brickcat_revision` VALUES ('1498541337017', '1', '1498541336935', '{\"commentContent\":\" :heart: \"}', '1498540198708');
INSERT INTO `brickcat_revision` VALUES ('1498556849283', '1', '1498556849193', '{\"commentContent\":\" :broken_heart: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1499609444091', '0', '1499609443806', '{\"articleTitle\":\"关于板砖猫（BrickCat）\",\"articleContent\":\"![546fc0499ece48a793f7aedf3c42d0bc_t01ae4a19ac3b456e47.jpg](http://localhost:9090/upload/546fc0499ece48a793f7aedf3c42d0bc_t01ae4a19ac3b456e47.jpg) \\n测试显示呀\\n\\n\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1500469232845', '0', '1500469232629', '{\"articleTitle\":\"brickcat\",\"articleContent\":\"7/19 :smile:\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1501034325173', '0', '1501034324864', '{\"articleTitle\":\"邀请码\",\"articleContent\":\"0H3x5S95Ui38sLJt\\nt68efQjgSwLHYWYS\\nXdK1qq6nT6hDyQ3b\\ng0N4pgwbZ7OAB3zj\\nPLT5mi6UDdEl8sFm\\nMZUi3CSRZw0RfSf6\\nAKPK2vSpolXYMarB\\nCrOjtHOpRQYa756Y\\nIq8MSKWtvZic6Suu\\n9U5BWVP55EibQcGR\\n4GMbumFuuc5vU5Gp\\nFV1UzjjfIaleH7Fn\\n3XGB3vv40oDzJGOn\\nd7eQwco3twtehpiQ\\nmnDTYk4U5pPycqpX\\ndQtFU8Dvih9Se5p9\\nFniz9qrdKiXIzcnJ\\niT70Dt5u24v9hX7T\\nWKsM7CJb6ZzpEsa6\\nGapF4ZrkJuDHt0oF\\nsdrzFf7VBENMXxY2\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1501057617402', '0', '1501057616840', '{\"articleTitle\":\"注册须知与条款\",\"articleContent\":\"**一、服务条款的确认和接纳**\\n\\nhttp://brickcat.club（以下简称搬砖猫）各项服务的所有权和运作权归简成都房联售房网。搬砖猫提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。会员必须完全同意所有服务条款并完成注册程序，才能成为搬砖猫的正式注册会员享受搬砖猫提供的更全面的服务。\\n\\n**二、权利及义务**\\n\\n搬砖猫的权利、义务：\\n\\n1、尊重会员隐私制度\\n\\n尊重会员个人隐私是搬砖猫的基本政策，搬砖猫不会公开、编辑或透露会员的注册资料，除非符合以下情况：\\n\\n(1) 根据中华人民共和国国家安全机构、公安部门的要求及根据相应的法律程序要求。\\n\\n(2) 维护搬砖猫的商标所有权及其它权益。\\n\\n(3) 在紧急情况下竭力维护会员个人、其它社会个体和社会大众的安全。\\n\\n(4) 符合其他相关的要求。\\n\\n(5) 在使用搬砖猫的某一项或多项服务时，会员同意公开自己的注册资料。\\n\\n如果会员提供的资料包含有不正确的信息，搬砖猫保留结束会员使用网络服务资格的权利。\\n\\n2、服务内容的所有权\\n\\n搬砖猫定义的服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；搬砖猫为会员提供的其他信息。所有这些内容受版权、商标及其它财产所有权法律的保护。所以，会员只能在搬砖猫和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。任何人需要转载搬砖猫的文章、数据，必须征得原文作者或搬砖猫授权。\\n\\n3、会员管理\\n\\n搬砖猫对会员的管理依据国家法律、地方法律和国际法律等标准。\\n\\n4、对会员信息的存储和限制\\n\\n搬砖猫不对会员所发布信息的删除或储存失败负责。搬砖猫有判定会员的行为是否符合搬砖猫服务条款的要求和精神的保留权利，如果会员违背了服务条款的规定，搬砖猫有权选择适当的处理方法直至中断对其提供网络服务的权利。\\n\\n会员权利义务：\\n\\n1、会员的权利：\\n\\n预订搬砖猫上的上传视频、图片、等服务，论坛发帖。\\n\\n2、会员必须遵循：\\n\\n(1)从中国境内向外或从中国境外向内传输资料时必须符合中国有关法规。\\n\\n(2)使用网络服务不作非法用途。\\n\\n(3)不干扰或混乱网络服务。\\n\\n(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。\\n\\n3、会员承诺：\\n\\n(1)不传输任何非法的、骚扰性的、中伤他人的、恐吓性的、庸俗的，淫秽等信息资料；\\n\\n(2)不传输任何教唆他人构成犯罪行为的资料；\\n\\n(3)不传输助长国内不利条件和涉及国家安全的资料；\\n\\n(4)不传输任何不符合当地法规、国家法律和国际法律的资料；\\n\\n(5)未经许可而非法进入其它电脑系统是禁止的；\\n\\n(6)法律规定的其他义务。\\n\\n若会员的行为不符合以上提到的服务条款，搬砖猫将作出独立判断立即取消会员服务帐号。会员需对自己在网上的行为承担法律责任。会员若在搬砖猫上散布和传播反动、色情或其他违反中国法律的信息，搬砖猫系统记录有可能作为会员违反法律的证据。\\n\\n4、基于网络服务的特性及重要性，会员同意：\\n\\n(1)不断更新注册资料，符合及时、详尽、准确的要求。\\n\\n(2)自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。\\n\\n(3)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。\\n\\n5、会员的帐号、密码和安全性\\n\\n会员一旦注册成功，成为搬砖猫的合法会员，将得到一个密码和会员名。会员对自己的会员名、密码和安全将负全部责任。另外，每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n会员同意若发现任何非法使用该用户名或其它有损用户利益的情况，立即通告搬砖猫。搬砖猫在应用户要求并且确认用户个人信息的情况下，可以对用户密码进行更改并及时通知用户。用户亦可在输入正确资料后，自己更改密码。每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n如因个人原因造成密码失窃而带来的任何损失，本公司概不承担责任。\\n\\n6、会员同意保障和维护搬砖猫全体成员的利益，负责支付由会员使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用等。\\n\\n**三****、关于责任**\\n\\n搬砖猫对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：他人的行为；会员不正当使用网络服务，在网上进行交易；用户传送的信息有所变动。这些行为都有可能会导致搬砖猫的形象受损，所以搬砖猫事先提出这种损害的可能性。会员同意保障和维护搬砖猫全体会员和搬砖猫的利益，承担由会员行为导致的一切后果损失。所有由用户违反相关法律法规产生的损害都由该用户自己承担。\\n\\n**五、服务条款的修改和服务修订**\\n\\n搬砖猫有权在必要时修改服务条款，搬砖猫服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，会员可以主动取消获得的网络服务。如果会员继续享用网络服务，则视为接受服务条款的变动。搬砖猫保留随时修改或中断服务而不需通知用户的权利，不需对用户或第三方负责。\\n\\n**六、通告**\\n\\n所有发给会员的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。\\n\\n**七、终止服务**\\n\\n会员或搬砖猫可随时根据实际情况中断一项或多项网络服务。搬砖猫不需对任何个人或第三方负责而随时中断服务。会员对后来的条款修改有异议，或对搬砖猫的服务不满，可以停止使用搬砖猫的网络服务。结束会员服务后，会员使用网络服务的权利马上中止。从那时起，用户没有权利，搬砖猫也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。\\n\\n**八、法律管辖**\\n\\n网络服务条款要与中华人民共和国的法律解释相一致，会员和搬砖猫一致同意服从中国法院管辖。如发生搬砖猫服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解解释\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1501067054735', '0', '1501057616840', '{\"articleTitle\":\"注册须知与条款\",\"articleContent\":\"**一、服务条款的确认和接纳**\\n\\n[http://brickcat.club]（以下简称搬砖猫）各项服务的所有权和运作权归简成都房联售房网。搬砖猫提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。会员必须完全同意所有服务条款并完成注册程序，才能成为搬砖猫的正式注册会员享受搬砖猫提供的更全面的服务。\\n\\n**二、权利及义务**\\n\\n搬砖猫的权利、义务：\\n\\n1、尊重会员隐私制度\\n\\n尊重会员个人隐私是搬砖猫的基本政策，搬砖猫不会公开、编辑或透露会员的注册资料，除非符合以下情况：\\n\\n(1) 根据中华人民共和国国家安全机构、公安部门的要求及根据相应的法律程序要求。\\n\\n(2) 维护搬砖猫的商标所有权及其它权益。\\n\\n(3) 在紧急情况下竭力维护会员个人、其它社会个体和社会大众的安全。\\n\\n(4) 符合其他相关的要求。\\n\\n(5) 在使用搬砖猫的某一项或多项服务时，会员同意公开自己的注册资料。\\n\\n如果会员提供的资料包含有不正确的信息，搬砖猫保留结束会员使用网络服务资格的权利。\\n\\n2、服务内容的所有权\\n\\n搬砖猫定义的服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；搬砖猫为会员提供的其他信息。所有这些内容受版权、商标及其它财产所有权法律的保护。所以，会员只能在搬砖猫和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。任何人需要转载搬砖猫的文章、数据，必须征得原文作者或搬砖猫授权。\\n\\n3、会员管理\\n\\n搬砖猫对会员的管理依据国家法律、地方法律和国际法律等标准。\\n\\n4、对会员信息的存储和限制\\n\\n搬砖猫不对会员所发布信息的删除或储存失败负责。搬砖猫有判定会员的行为是否符合搬砖猫服务条款的要求和精神的保留权利，如果会员违背了服务条款的规定，搬砖猫有权选择适当的处理方法直至中断对其提供网络服务的权利。\\n\\n会员权利义务：\\n\\n1、会员的权利：\\n\\n预订搬砖猫上的上传视频、图片、等服务，论坛发帖。\\n\\n2、会员必须遵循：\\n\\n(1)从中国境内向外或从中国境外向内传输资料时必须符合中国有关法规。\\n\\n(2)使用网络服务不作非法用途。\\n\\n(3)不干扰或混乱网络服务。\\n\\n(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。\\n\\n3、会员承诺：\\n\\n(1)不传输任何非法的、骚扰性的、中伤他人的、恐吓性的、庸俗的，淫秽等信息资料；\\n\\n(2)不传输任何教唆他人构成犯罪行为的资料；\\n\\n(3)不传输助长国内不利条件和涉及国家安全的资料；\\n\\n(4)不传输任何不符合当地法规、国家法律和国际法律的资料；\\n\\n(5)未经许可而非法进入其它电脑系统是禁止的；\\n\\n(6)法律规定的其他义务。\\n\\n若会员的行为不符合以上提到的服务条款，搬砖猫将作出独立判断立即取消会员服务帐号。会员需对自己在网上的行为承担法律责任。会员若在搬砖猫上散布和传播反动、色情或其他违反中国法律的信息，搬砖猫系统记录有可能作为会员违反法律的证据。\\n\\n4、基于网络服务的特性及重要性，会员同意：\\n\\n(1)不断更新注册资料，符合及时、详尽、准确的要求。\\n\\n(2)自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。\\n\\n(3)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。\\n\\n5、会员的帐号、密码和安全性\\n\\n会员一旦注册成功，成为搬砖猫的合法会员，将得到一个密码和会员名。会员对自己的会员名、密码和安全将负全部责任。另外，每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n会员同意若发现任何非法使用该用户名或其它有损用户利益的情况，立即通告搬砖猫。搬砖猫在应用户要求并且确认用户个人信息的情况下，可以对用户密码进行更改并及时通知用户。用户亦可在输入正确资料后，自己更改密码。每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n如因个人原因造成密码失窃而带来的任何损失，本公司概不承担责任。\\n\\n6、会员同意保障和维护搬砖猫全体成员的利益，负责支付由会员使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用等。\\n\\n**三****、关于责任**\\n\\n搬砖猫对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：他人的行为；会员不正当使用网络服务，在网上进行交易；用户传送的信息有所变动。这些行为都有可能会导致搬砖猫的形象受损，所以搬砖猫事先提出这种损害的可能性。会员同意保障和维护搬砖猫全体会员和搬砖猫的利益，承担由会员行为导致的一切后果损失。所有由用户违反相关法律法规产生的损害都由该用户自己承担。\\n\\n**五、服务条款的修改和服务修订**\\n\\n搬砖猫有权在必要时修改服务条款，搬砖猫服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，会员可以主动取消获得的网络服务。如果会员继续享用网络服务，则视为接受服务条款的变动。搬砖猫保留随时修改或中断服务而不需通知用户的权利，不需对用户或第三方负责。\\n\\n**六、通告**\\n\\n所有发给会员的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。\\n\\n**七、终止服务**\\n\\n会员或搬砖猫可随时根据实际情况中断一项或多项网络服务。搬砖猫不需对任何个人或第三方负责而随时中断服务。会员对后来的条款修改有异议，或对搬砖猫的服务不满，可以停止使用搬砖猫的网络服务。结束会员服务后，会员使用网络服务的权利马上中止。从那时起，用户没有权利，搬砖猫也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。\\n\\n**八、法律管辖**\\n\\n网络服务条款要与中华人民共和国的法律解释相一致，会员和搬砖猫一致同意服从中国法院管辖。如发生搬砖猫服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解解释\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1501067222256', '0', '1501057616840', '{\"articleTitle\":\"注册须知与条款\",\"articleContent\":\"**一、服务条款的确认和接纳**\\n\\n[http://brickcat.club]（以下简称搬砖猫）各项服务的所有权和运作权归简搬砖猫网。搬砖猫提供的服务将完全按照其发布的章程、服务条款和操作规则严格执行。会员必须完全同意所有服务条款并完成注册程序，才能成为搬砖猫的正式注册会员享受搬砖猫提供的更全面的服务。\\n\\n**二、权利及义务**\\n\\n搬砖猫的权利、义务：\\n\\n1、尊重会员隐私制度\\n\\n尊重会员个人隐私是搬砖猫的基本政策，搬砖猫不会公开、编辑或透露会员的注册资料，除非符合以下情况：\\n\\n(1) 根据中华人民共和国国家安全机构、公安部门的要求及根据相应的法律程序要求。\\n\\n(2) 维护搬砖猫的商标所有权及其它权益。\\n\\n(3) 在紧急情况下竭力维护会员个人、其它社会个体和社会大众的安全。\\n\\n(4) 符合其他相关的要求。\\n\\n(5) 在使用搬砖猫的某一项或多项服务时，会员同意公开自己的注册资料。\\n\\n如果会员提供的资料包含有不正确的信息，搬砖猫保留结束会员使用网络服务资格的权利。\\n\\n2、服务内容的所有权\\n\\n搬砖猫定义的服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；搬砖猫为会员提供的其他信息。所有这些内容受版权、商标及其它财产所有权法律的保护。所以，会员只能在搬砖猫和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。任何人需要转载搬砖猫的文章、数据，必须征得原文作者或搬砖猫授权。\\n\\n3、会员管理\\n\\n搬砖猫对会员的管理依据国家法律、地方法律和国际法律等标准。\\n\\n4、对会员信息的存储和限制\\n\\n搬砖猫不对会员所发布信息的删除或储存失败负责。搬砖猫有判定会员的行为是否符合搬砖猫服务条款的要求和精神的保留权利，如果会员违背了服务条款的规定，搬砖猫有权选择适当的处理方法直至中断对其提供网络服务的权利。\\n\\n会员权利义务：\\n\\n1、会员的权利：\\n\\n预订搬砖猫上的上传视频、图片、等服务，论坛发帖。\\n\\n2、会员必须遵循：\\n\\n(1)从中国境内向外或从中国境外向内传输资料时必须符合中国有关法规。\\n\\n(2)使用网络服务不作非法用途。\\n\\n(3)不干扰或混乱网络服务。\\n\\n(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。\\n\\n3、会员承诺：\\n\\n(1)不传输任何非法的、骚扰性的、中伤他人的、恐吓性的、庸俗的，淫秽等信息资料；\\n\\n(2)不传输任何教唆他人构成犯罪行为的资料；\\n\\n(3)不传输助长国内不利条件和涉及国家安全的资料；\\n\\n(4)不传输任何不符合当地法规、国家法律和国际法律的资料；\\n\\n(5)未经许可而非法进入其它电脑系统是禁止的；\\n\\n(6)法律规定的其他义务。\\n\\n若会员的行为不符合以上提到的服务条款，搬砖猫将作出独立判断立即取消会员服务帐号。会员需对自己在网上的行为承担法律责任。会员若在搬砖猫上散布和传播反动、色情或其他违反中国法律的信息，搬砖猫系统记录有可能作为会员违反法律的证据。\\n\\n4、基于网络服务的特性及重要性，会员同意：\\n\\n(1)不断更新注册资料，符合及时、详尽、准确的要求。\\n\\n(2)自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。\\n\\n(3)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。\\n\\n5、会员的帐号、密码和安全性\\n\\n会员一旦注册成功，成为搬砖猫的合法会员，将得到一个密码和会员名。会员对自己的会员名、密码和安全将负全部责任。另外，每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n会员同意若发现任何非法使用该用户名或其它有损用户利益的情况，立即通告搬砖猫。搬砖猫在应用户要求并且确认用户个人信息的情况下，可以对用户密码进行更改并及时通知用户。用户亦可在输入正确资料后，自己更改密码。每个会员都要对以其会员名进行的所有活动和事件负全责。\\n\\n如因个人原因造成密码失窃而带来的任何损失，本公司概不承担责任。\\n\\n6、会员同意保障和维护搬砖猫全体成员的利益，负责支付由会员使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用等。\\n\\n**三****、关于责任**\\n\\n搬砖猫对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害可能来自：他人的行为；会员不正当使用网络服务，在网上进行交易；用户传送的信息有所变动。这些行为都有可能会导致搬砖猫的形象受损，所以搬砖猫事先提出这种损害的可能性。会员同意保障和维护搬砖猫全体会员和搬砖猫的利益，承担由会员行为导致的一切后果损失。所有由用户违反相关法律法规产生的损害都由该用户自己承担。\\n\\n**五、服务条款的修改和服务修订**\\n\\n搬砖猫有权在必要时修改服务条款，搬砖猫服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，会员可以主动取消获得的网络服务。如果会员继续享用网络服务，则视为接受服务条款的变动。搬砖猫保留随时修改或中断服务而不需通知用户的权利，不需对用户或第三方负责。\\n\\n**六、通告**\\n\\n所有发给会员的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。\\n\\n**七、终止服务**\\n\\n会员或搬砖猫可随时根据实际情况中断一项或多项网络服务。搬砖猫不需对任何个人或第三方负责而随时中断服务。会员对后来的条款修改有异议，或对搬砖猫的服务不满，可以停止使用搬砖猫的网络服务。结束会员服务后，会员使用网络服务的权利马上中止。从那时起，用户没有权利，搬砖猫也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。\\n\\n**八、法律管辖**\\n\\n网络服务条款要与中华人民共和国的法律解释相一致，会员和搬砖猫一致同意服从中国法院管辖。如发生搬砖猫服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释。\"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502182091272', '1', '1502182030178', '{\"commentContent\":\" :cry: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502182331962', '1', '1502182331872', '{\"commentContent\":\" :disappointed_relieved: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502183247381', '1', '1502183247307', '{\"commentContent\":\"的 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502183630607', '1', '1502183630494', '{\"commentContent\":\" :tired_face: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502184723941', '1', '1502184723863', '{\"commentContent\":\" :cupid: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502184972766', '1', '1502184972688', '{\"commentContent\":\" :heart: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502185110317', '1', '1502185110242', '{\"commentContent\":\"分 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502185368486', '1', '1502185368411', '{\"commentContent\":\"好 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502185451981', '1', '1502185451908', '{\"commentContent\":\" :v: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502185917878', '1', '1502185917808', '{\"commentContent\":\"个 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502185956991', '1', '1502185956914', '{\"commentContent\":\"分 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502186047047', '1', '1502186046970', '{\"commentContent\":\" :information_desk_person: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502191532386', '1', '1502191532298', '{\"commentContent\":\"分 \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502198221684', '1', '1502198221599', '{\"commentContent\":\" :sob: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502205725792', '1', '1502205725715', '{\"commentContent\":\" :confused: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502382509412', '1', '1502382509327', '{\"commentContent\":\" :fearful: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502455662597', '1', '1502455620997', '{\"commentContent\":\" :heart_eyes: \"}', '1495610341604');
INSERT INTO `brickcat_revision` VALUES ('1502461446943', '1', '1502461446861', '{\"commentContent\":\" :yellow_heart: \"}', '1495610341604');

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
INSERT INTO `brickcat_reward` VALUES ('1501954032561', '1495610341604', '1501250442813', '4');
INSERT INTO `brickcat_reward` VALUES ('1501955889284', '1495610341604', '1501246964076', '4');
INSERT INTO `brickcat_reward` VALUES ('1501956076533', '1495610341604', '1501246772184', '4');
INSERT INTO `brickcat_reward` VALUES ('1502191556390', '1495610341604', '1500301319350', '4');

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
INSERT INTO `brickcat_role_permission` VALUES ('1500827952430', 'adminRole', 'rwAddReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952485', 'adminRole', 'rwRemoveReservedWord');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952536', 'adminRole', 'rwUpdateReservedWordBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952592', 'adminRole', 'miscAllowAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952650', 'adminRole', 'miscAllowAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952704', 'adminRole', 'miscAllowAnonymousView');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952757', 'adminRole', 'miscLanguage');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952809', 'adminRole', 'miscRegisterMethod');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952862', 'adminRole', 'mallAddProduct');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952915', 'adminRole', 'mallDelProduct');
INSERT INTO `brickcat_role_permission` VALUES ('1500827952967', 'adminRole', 'mallUpdateProduct');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953020', 'adminRole', 'commentRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953072', 'adminRole', 'commentUpdateCommentBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953125', 'adminRole', 'userAddTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953178', 'adminRole', 'userDeleteTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953233', 'adminRole', 'userUpdateTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953284', 'adminRole', 'articleAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953335', 'adminRole', 'articleCancelStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953387', 'adminRole', 'articleReindexArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953440', 'adminRole', 'articleReindexArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953494', 'adminRole', 'articleRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953547', 'adminRole', 'articleStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953601', 'adminRole', 'articleUpdateArticleBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953655', 'adminRole', 'commonAddArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953708', 'adminRole', 'commonAddArticleAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953763', 'adminRole', 'commonAddComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953815', 'adminRole', 'commonAddCommentAnonymous');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953867', 'adminRole', 'commonAtParticipants');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953920', 'adminRole', 'commonAtUser');
INSERT INTO `brickcat_role_permission` VALUES ('1500827953972', 'adminRole', 'commonBadArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954027', 'adminRole', 'commonBadComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954080', 'adminRole', 'commonExchangeIC');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954134', 'adminRole', 'commonFollowArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954188', 'adminRole', 'commonGoodArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954241', 'adminRole', 'commonGoodComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954296', 'adminRole', 'commonRemoveArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954349', 'adminRole', 'commonRemoveComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954402', 'adminRole', 'commonStickArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954458', 'adminRole', 'commonThankArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954510', 'adminRole', 'commonThankComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954564', 'adminRole', 'commonUpdateArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954617', 'adminRole', 'commonUpdateComment');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954675', 'adminRole', 'commonUseIL');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954728', 'adminRole', 'commonViewArticleHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954785', 'adminRole', 'commonViewCommentHistory');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954836', 'adminRole', 'commonWatchArticle');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954889', 'adminRole', 'adUpdateADSide');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954942', 'adminRole', 'adUpdateBanner');
INSERT INTO `brickcat_role_permission` VALUES ('1500827954995', 'adminRole', 'userCreateMind');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955047', 'adminRole', 'userDeleteMind');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955099', 'adminRole', 'userUpdateMind');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955157', 'adminRole', 'tagUpdateTagBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955210', 'adminRole', 'userAddPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955262', 'adminRole', 'userAddUser');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955314', 'adminRole', 'userDeductPoint');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955366', 'adminRole', 'userExchangePoint');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955419', 'adminRole', 'userUpdateUserAdvanced');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955472', 'adminRole', 'userUpdateUserBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955526', 'adminRole', 'mallAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955579', 'adminRole', 'menuAdmin');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955632', 'adminRole', 'menuAdminAD');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955687', 'adminRole', 'menuAdminArticles');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955739', 'adminRole', 'menuAdminComments');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955793', 'adminRole', 'menuAdminDomains');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955846', 'adminRole', 'menuAdminIcs');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955900', 'adminRole', 'menuAdminMind');
INSERT INTO `brickcat_role_permission` VALUES ('1500827955953', 'adminRole', 'menuAdminMisc');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956006', 'adminRole', 'menuAdminProduct');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956059', 'adminRole', 'menuAdminRoles');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956110', 'adminRole', 'menuAdminRWs');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956162', 'adminRole', 'menuAdminTags');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956214', 'adminRole', 'menuAdminTrends');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956269', 'adminRole', 'menuAdminUsers');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956322', 'adminRole', 'menuAdminVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956375', 'adminRole', 'adminAddVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956428', 'adminRole', 'adminDeleteVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956481', 'adminRole', 'adminUpdateVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956534', 'adminRole', 'commonBadVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956587', 'adminRole', 'commonFollowVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956640', 'adminRole', 'commonGoodVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956694', 'adminRole', 'commonStickVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956747', 'adminRole', 'commonWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956799', 'adminRole', 'userExchangeSize');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956852', 'adminRole', 'userInitSize');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956906', 'adminRole', 'userWatchVideo');
INSERT INTO `brickcat_role_permission` VALUES ('1500827956959', 'adminRole', 'userWatchVideoError');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957013', 'adminRole', 'icGenIC');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957066', 'adminRole', 'icUpdateICBasic');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957119', 'adminRole', 'domainAddDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957172', 'adminRole', 'domainAddDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957228', 'adminRole', 'domainRemoveDomain');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957281', 'adminRole', 'domainRemoveDomainTag');
INSERT INTO `brickcat_role_permission` VALUES ('1500827957334', 'adminRole', 'domainUpdateDomainBasic');

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
INSERT INTO `brickcat_tag` VALUES ('1495610342368', '1', '15', '1', '0', 'Sym', 'Sym', '[Sym](https://github.com/b3log/symphony) 是一个用 [Java] 实现的现代化社区（论坛/社交网络/博客）平台，“下一代的社区系统，为未来而构建”。', 'sym.png', '', '0', '0', '0', 'Sym', 'Sym', '', '0.9193361730123458');
INSERT INTO `brickcat_tag` VALUES ('1495610344006', '0', '0', '1', '0', 'B3log', 'B3log', '[B3log](http://b3log.org) 是一个开源组织，名字来源于“Bulletin Board Blog”缩写，目标是将独立博客与论坛结合，形成一种新的网络社区体验，详细请看 [B3log 构思](https://hacpai.com/b3log)。目前 B3log 已经开源了多款产品： [Solo] 、 [Sym] 、 [Wide] 。', 'b3log.png', '', '0', '0', '0', 'B3log', 'B3log', '', '0.3150950887171867');
INSERT INTO `brickcat_tag` VALUES ('1498545630866', '3', '7', '0', '0', '测试', '%E6%B5%8B%E8%AF%95', '', '', '', '0', '0', '0', '测试', '测试', '', '0.8888648765768309');
INSERT INTO `brickcat_tag` VALUES ('1501034324979', '1', '0', '0', '0', '邀请码', '%E9%82%80%E8%AF%B7%E7%A0%81', '', '', '', '0', '0', '0', '邀请码', '邀请码', '', '0.9146307271988595');
INSERT INTO `brickcat_tag` VALUES ('1501057617212', '1', '1', '0', '0', 'brickcat', 'brickcat', '', '', '', '0', '0', '0', 'brickcat', 'brickcat', '', '0.1668840083396833');

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
INSERT INTO `brickcat_tag_article` VALUES ('1499609443919', '1499609443806', '1498545630866', '0', '0', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1500469232699', '1500469232629', '1498545630866', '0', '0', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1501034325049', '1501034324864', '1501034324979', '0', '0', '0', '0');
INSERT INTO `brickcat_tag_article` VALUES ('1501057617274', '1501057616840', '1501057617212', '1', '1502455509907', '0', '1');

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
  `trendThumbURL` text,
  `trendGiftCnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brickcat_trends
-- ----------------------------
INSERT INTO `brickcat_trends` VALUES ('1500301319350', 'GIF', '', '1495610341604', '1', '66', '下一步完善圈子', '', '0', '', '1500301443702', '1500301443702', '1502191532296', 'brickcat', '0', '0', '0', '1', '0', '1', '0', '3256', '', '\'', '', '0', '1500301319350/d0a7ec34295a49fb9d911e928bb04925.gif,1500301319350/fb9e6f4c7d9f40de97ad89d7d7000ce9.gif,1500301319350/bbec393eb0a3490985069327f4aff3b0.png,1500301319350/dfe92522b6474786b024f29ed0d98345.gif', '', '1');
INSERT INTO `brickcat_trends` VALUES ('1500999668258', '', '', '1495610341604', '1', '3', '', '', '0', '', '1500999678309', '1500999678309', '1502382509318', 'brickcat', '0', '0', '0', '1', '0', '1', '0', '3272', '', '\'', '', '0', '1500999668258/a7cad70118694d79b12f110a28aeb5ad.png', '', '0');
INSERT INTO `brickcat_trends` VALUES ('1501246772184', '底部测试', '', '1495610341604', '2', '21', '底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试', '', '0', '', '1501246852624', '1501246852624', '1502198221589', 'brickcat', '0', '0', '0', '1', '0', '1', '0', '3277', '', '\'', '', '0', '1501246772184/524be0e10ae34258856fad407f4001df.jpg', '', '1');
INSERT INTO `brickcat_trends` VALUES ('1501246964076', '底部测试', '', '1495610341604', '1', '2', '底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试底部测试', '', '0', '', '1501246975661', '1501246975661', '1502205725706', 'brickcat', '0', '0', '0', '-1', '0', '1', '0', '-3277', '', '\'', '', '0', '1501246964076/7467b8226d03476ea337fa43d213fe2e.jpg', '', '1');
INSERT INTO `brickcat_trends` VALUES ('1501250442813', '好', '', '1495610341604', '12', '124', '好', '', '0', '', '1501250449541', '1501250449541', '1502461446849', 'brickcat', '0', '0', '0', '-1', '0', '1', '0', '-3277', '', '\'', '', '0', '1501250442813/35b6269fce014ab694307de26876417c.jpg', '', '1');

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
INSERT INTO `brickcat_user` VALUES ('1495610341604', '1', 'sym@b3log.org', 'brickcat', '42857cfddb33f3fddb27fff9773683f3', '', '', '', '', '', '2', 'http://localhost:9090/upload/5ff615f295da44aa9bbeae0546bb6e51_mario.gif', '0', '', '', '', '', 'adminRole', '5', '25', '6', '0', '499115632', '9488', '0', '0', '1501057616830', '1502461446849', '1502539284845', '0:0:0:0:0:0:0:1', '0', '1502201291883', '20170614', '20170614', '20170808', '20170808', '1', '1', 'classic', 'mobile', '', '', '', '1500301588719', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1495610341588', '1', 'zh_CN', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1495610341994', '2', 'default_commenter@b3log.org', 'Default Commenter', '9e30b1a9f57d2a0fc9c76fcc1e984b11', '', '', '', '', '', '2', 'http://localhost:9090/upload/0263e50c93364b059365ef95461f3848.jpg', '0', '', '', '', '', 'defaultCommenterRole', '0', '0', '0', '0', '500', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1502517406721', '1', 'en_US', 'Asia/Shanghai', '0');
INSERT INTO `brickcat_user` VALUES ('1497277766038', '3', '5495297@qq.com', 'viseosize', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/87a43004bbf74cbcad20972c03da2e66.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1501912699045', '1', 'zh_CN', 'Asia/Shanghai', '1');
INSERT INTO `brickcat_user` VALUES ('1497278160243', '3', '549597@qq.com', 'viseosize1', '21232f297a57a5a743894a0e4a801fc3', '', '', '', '', '', '2', 'http://localhost:9090/upload/59e6b136e37841bdb10e34a99b83e624.jpg', '0', '', '', '', '', 'defaultRole', '0', '0', '0', '0', '400', '100', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1502085360342', '1', 'zh_CN', 'Asia/Shanghai', '1');
INSERT INTO `brickcat_user` VALUES ('1498540198708', '4', '549571@qq.com', 'test', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '2', 'http://localhost:9090/upload/4dff22c6968a4b45a3312a1aff5ec979.jpg', '0', '', '', '', '', 'defaultRole', '0', '2', '0', '0', '490', '10', '0', '0', '0', '1498541336934', '1500696099895', '0:0:0:0:0:0:0:1', '0', '0', '0', '0', '0', '0', '0', '0', 'classic', 'mobile', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '1502171747397', '1', 'zh_CN', 'Asia/Shanghai', '0');

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
INSERT INTO `brickcat_user_tag` VALUES ('1500469232778', '1495610341604', '1498545630866', '1');
INSERT INTO `brickcat_user_tag` VALUES ('1501034325109', '1495610341604', '1501034324979', '0');
INSERT INTO `brickcat_user_tag` VALUES ('1501057617327', '1495610341604', '1501057617212', '0');

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
INSERT INTO `brickcat_video` VALUES ('1498458216708', '这个是一条测试', '0', '测试', '1495610341604', '4', '118', '823658abfe104d10b507bea60ede02bd/823658abfe104d10b507bea60ede02bd.m3u8', '', '0', '1498458216565', '1498458216565', '1498556849180', 'admin', '0', '1', '0', '1', '0', '0', '更更更更更过过过过过过方法反反复复付付', '823658abfe104d10b507bea60ede02bd.png', '311', '3215', '0', '0', '823658abfe104d10b507bea60ede02bd/3.mp4');
INSERT INTO `brickcat_video` VALUES ('1498550761733', '这个是一条测试的视频', '0', '测试', '1495610341604', '0', '22', '586d740ed3d845db91ade433e8966936/586d740ed3d845db91ade433e8966936.m3u8', '', '0', '1498550761723', '1498550761723', '0', '0', '0', '0', '0', '0', '0', '0', '感受到梵蒂冈讽德诵功', '586d740ed3d845db91ade433e8966936.png', '311', '0', '0', '0', '586d740ed3d845db91ade433e8966936/3.mp4');

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
INSERT INTO `brickcat_videosize` VALUES ('1500983305242', '1500983305134', '500');
INSERT INTO `brickcat_videosize` VALUES ('1500999183331', '1500999183225', '500');
INSERT INTO `brickcat_videosize` VALUES ('1501033038823', '1501033038675', '500');

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
INSERT INTO `brickcat_vote` VALUES ('1501906192296', '1495610341604', '0', '5', '');
INSERT INTO `brickcat_vote` VALUES ('1501934205879', '1495610341604', '0', '5', '1501246772184');
INSERT INTO `brickcat_vote` VALUES ('1501939601878', '1495610341604', '0', '5', '1500999668258');
INSERT INTO `brickcat_vote` VALUES ('1502188927843', '1495610341604', '1', '1', '1502185956914');
INSERT INTO `brickcat_vote` VALUES ('1502191551545', '1495610341604', '0', '5', '1500301319350');
