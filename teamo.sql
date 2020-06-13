/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : teamo

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 12/06/2020 21:51:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `a_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址详情',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '湖南长沙雨花区');
INSERT INTO `address` VALUES (2, '湖北武汉仙桃');
INSERT INTO `address` VALUES (3, '湖南长沙天心区');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `b_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客标题',
  `b_img` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客图片',
  `b_intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客导言',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `b_big_img` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客大图',
  PRIMARY KEY (`b_id`) USING BTREE,
  INDEX `fk_blog_user`(`u_id`) USING BTREE,
  CONSTRAINT `fk_blog_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '山居笔记 ', 'small-item-1', '既然大树上没有一片叶子敢于面对风的吹拂、露的浸润、霜的飘洒，整个树林也便成了没有风声鸟声的死林。', 1, 'big-item-1');
INSERT INTO `blog` VALUES (2, '把你交给时间', 'small-item-2', '我何尝不想设计自己的命运，但仅凭这 点任性，是撑不过余生的。', 1, 'big-item-2');
INSERT INTO `blog` VALUES (3, '倾城', 'small-item-3', '我笑，便面如春花，定是能感动人的，任他是谁。', 1, 'big-item-3');
INSERT INTO `blog` VALUES (4, '愿人生从容', 'small-item-4', '杭州的一个寺里有副门联，是：“是命也是运也，缓缓而行;为名乎为利乎，坐坐再去。”', 2, 'big-item-4');
INSERT INTO `blog` VALUES (5, '树忧如此', 'small-item-5', '我一向相信人定胜天，常常逆数而行，然而人力毕竟不敌天命，人生大限，无人能破。', 2, 'big-item-5');

-- ----------------------------
-- Table structure for blog_bloglabel_relationships
-- ----------------------------
DROP TABLE IF EXISTS `blog_bloglabel_relationships`;
CREATE TABLE `blog_bloglabel_relationships`  (
  `bb_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NULL DEFAULT NULL,
  `bl_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bb_id`) USING BTREE,
  INDEX `fk_blog_blog_label`(`bl_id`) USING BTREE,
  INDEX `fk_blog_label_blog`(`b_id`) USING BTREE,
  CONSTRAINT `fk_blog_blog_label` FOREIGN KEY (`bl_id`) REFERENCES `blog_label` (`bl_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_blog_label_blog` FOREIGN KEY (`b_id`) REFERENCES `blog` (`b_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_bloglabel_relationships
-- ----------------------------
INSERT INTO `blog_bloglabel_relationships` VALUES (1, 1, 1);
INSERT INTO `blog_bloglabel_relationships` VALUES (2, 1, 2);
INSERT INTO `blog_bloglabel_relationships` VALUES (3, 2, 1);
INSERT INTO `blog_bloglabel_relationships` VALUES (4, 2, 2);
INSERT INTO `blog_bloglabel_relationships` VALUES (5, 3, 2);
INSERT INTO `blog_bloglabel_relationships` VALUES (6, 4, 3);
INSERT INTO `blog_bloglabel_relationships` VALUES (7, 5, 4);
INSERT INTO `blog_bloglabel_relationships` VALUES (8, 5, 5);
INSERT INTO `blog_bloglabel_relationships` VALUES (9, 5, 1);
INSERT INTO `blog_bloglabel_relationships` VALUES (10, 1, 6);
INSERT INTO `blog_bloglabel_relationships` VALUES (11, 1, 8);
INSERT INTO `blog_bloglabel_relationships` VALUES (12, 2, 9);
INSERT INTO `blog_bloglabel_relationships` VALUES (13, 2, 6);
INSERT INTO `blog_bloglabel_relationships` VALUES (14, 3, 4);
INSERT INTO `blog_bloglabel_relationships` VALUES (15, 3, 8);

-- ----------------------------
-- Table structure for blog_desc
-- ----------------------------
DROP TABLE IF EXISTS `blog_desc`;
CREATE TABLE `blog_desc`  (
  `bd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客详情id',
  `bd_desc_one` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '博客详情描述1',
  `bd_desc_two` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '博客详情描述2',
  `b_id` int(11) NULL DEFAULT NULL COMMENT '博客id',
  PRIMARY KEY (`bd_id`) USING BTREE,
  UNIQUE INDEX `uni_b_id`(`b_id`) USING BTREE,
  CONSTRAINT `fk_blog_desc_blog` FOREIGN KEY (`b_id`) REFERENCES `blog` (`b_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_desc
-- ----------------------------
INSERT INTO `blog_desc` VALUES (1, '成熟是一种明亮而不刺眼的光辉，一种圆润而不腻耳的声响，一种不再需要对别人察言观色的从容，一种终于停止向周围申诉求告的大气，一种不理会喧闹的微笑，一种洗刷了偏激的淡漠，一种无需声张的厚实，一种能够看的很远却并不陡峭的高度。', '最让人动心的是苦难中的高贵，最让人看出高贵之所以高贵的，也是这种高贵。凭着这种高贵，人们可以在生死存亡的边缘上吟诗作赋，可以用自己的一点温暖去化开别人心头的冰雪，继而，可以用屈辱之身去点燃文明的火种。\r\n', 1);
INSERT INTO `blog_desc` VALUES (2, '旅行就像是从一间因为暖气太足而缺氧的房间走到寒冷但空气新鲜的室外，异乡人的身份让我更加明显地看清自己的状态，无论是性格中的不成熟之处，还是对生活日益稳健的把控力：即便不被所有人理解，但我确实在按自己想要的方式走下去。', '我们又用了多少时间等待一座冰山融化？我们远赴重洋，义无反顾，因为世界太广大我们太渺小，我们可以掌握与支配时间总是不够。在我们无计可施的空间与时间的无尽汪洋里，我们曾一同置身于同一朵浪花。我们来这个世界不是被迫走个过场的，我们经历过，也改变了一些事。', 2);
INSERT INTO `blog_desc` VALUES (3, '说起不负，当然想到红楼梦。黛玉之不讨贾府众人喜欢，无非是她坚持为了自己的心而活。不肯做人周全——倒不一定是不会。宝钗从来不提心字，廉洁寡欲，只恐人前人后失了照应——这颗心才叫真苦。人都说黛玉命薄，我却不如此看法，起码对于自己，她是不负的。', '我们经历了过去，却不知道将来，因为不知，生命益发显得神奇而美丽。\r\n自得其乐这回事相信每一个人多少都能体会，独处的时光如果安排得自在，境界想来十分高妙。如果你相信，你的生命是野火烧不尽，春风吹又生，如果你愿意真正地从头再来过，诚诚恳恳地再活一次，那么，请你告诉我，你已从过去里释放出来。', 3);
INSERT INTO `blog_desc` VALUES (4, '把生与死看得过分严重是人的禀性，这禀性的表现出来就是所谓的感情，其实，这正是上天造人的阴谋处。识破这个阴谋的是那些哲学家，高人，真人，所以他们对死从容不迫。另外，对死没有恐惧的是那些糊里糊涂的人。最要命的是高不成低不就的人，他们最恐惧死，又最关心死，你说人来世上是旅游一趟的，旅游那么一遭就回去了，他就要问人是从哪儿来的又要回到哪儿去。道教来说死是乘云驾鹤去做仙了，佛教来说灵魂不生不死不来不往，死的只是躯体，唯物论讲师来说人来自泥土，最后又归于泥土。\r\n', '态是古时用语，态无法言说，类似当今人所谈的气质和风度。女人的漂亮不会永驻，女人的态却长伴终生。李渔讲女人有态，三分漂亮可增加到七分，女人无态，七分漂亮可降落到三分，它如火之有焰，如灯之有光，如金银之宝气。\r\n', 4);
INSERT INTO `blog_desc` VALUES (5, '春日负暄，我坐在园中靠椅上，品茗阅报，有百花相伴，暂且贪享人间瞬息繁华。美中不足的是，抬望眼，总看见园中西隅，剩下的那两棵意大利柏树中间，露出一块愣愣的空白来。缺口当中，映着湛湛青空，悠悠白云，那是一道女娲炼石也无法弥补的天裂。', '人心唯危，瞬息万变，一辈子长相厮守，要经过多大的考验及修为，才能参成正果。阿青，也许天长地久可以做如此解，你一生中只要有那么一刻，你全心投入去爱过一个人，那一刻也就是永恒。你一生中有那么一段路，有一个人与你互相扶持，共御风雨，那么那一段也就胜过重生了。\r\n', 5);

-- ----------------------------
-- Table structure for blog_label
-- ----------------------------
DROP TABLE IF EXISTS `blog_label`;
CREATE TABLE `blog_label`  (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客标签id',
  `bl_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客标签',
  PRIMARY KEY (`bl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_label
-- ----------------------------
INSERT INTO `blog_label` VALUES (1, '感伤');
INSERT INTO `blog_label` VALUES (2, '踌躇');
INSERT INTO `blog_label` VALUES (3, '文学');
INSERT INTO `blog_label` VALUES (4, '逃避');
INSERT INTO `blog_label` VALUES (5, '冷漠');
INSERT INTO `blog_label` VALUES (6, '跨越');
INSERT INTO `blog_label` VALUES (7, '思考');
INSERT INTO `blog_label` VALUES (8, '证明');
INSERT INTO `blog_label` VALUES (9, '朦胧');
INSERT INTO `blog_label` VALUES (10, '寻觅');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `c_author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论用户名称',
  `c_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `c_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `bd_id` int(11) NULL DEFAULT NULL COMMENT '博客详情id',
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `fk_comment_blog_desc`(`bd_id`) USING BTREE,
  CONSTRAINT `fk_comment_blog_desc` FOREIGN KEY (`bd_id`) REFERENCES `blog_desc` (`bd_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '余秋雨', '对于政治功业和文化情结的互相觊觎和生死与共；对于文化灵魂的流放、毁灭和复苏；对于商业文明与中华文化的狭路相逢和擦肩而过；对于千年科举留给社会历史的功绩和留给群体人格的祸害；对于稀有人格在中华文化中断绝的必然和祭奠的必要；对于君子和小人这条重要界线的无处不在和难于划分。随后，余秋雨便创作了这本《山居笔记》。\r\n', '2020-06-06 10:00:08', 1);
INSERT INTO `comment` VALUES (2, '陶立夏', '从冰岛到东京，呈现理想生活方式的美好可能。 世间情侣，大多是起初相见爱慕，思念震耳欲聋，随之而来的相知相伴都把对方当成最美的风景，而爱情有太多种面目，所有的情感都将流入最平凡的生活，“生活山高水阔，我喜欢我们各自坚守，并各自自由。”所以，不如将爱与想念都交托于时间，在时间的彼岸，我们从未失散。 陶立夏在书里说：“我们一起安静地看看，这个世界的光亮。”', '2020-06-08 10:00:52', 2);
INSERT INTO `comment` VALUES (3, '三毛', '张爱玲的倾城之恋发生在香港，三毛的倾城之恋在东柏林--- “那时的我，是一个美丽的女人，我知道，我笑，便如春花，必能感动人的----任他是谁。” 穿越时空，我们分享三毛生命种一段既美丽凄楚又仿若迁世记忆的情愁...\r\n', '2020-06-09 12:01:27', 3);
INSERT INTO `comment` VALUES (4, '贾平凹', '在这孤独的世间，你我都是生命的的朝圣者，也是生命的跋涉者，我们追寻人生的真意，难免失望和迷茫。贾平凹先生的文字，直指本心，洞彻心扉，无异于荒漠中一道清泉。\r\n真正的从容，不是躲避纷争与喧嚣，而是平静地面对困惑与烦恼。人生的旅途，苦与乐总是相随，禁得住多少曲折，才配得上多少幸福。\r\n贾平凹先生用诚挚朴素的笔触，写他所见、所感的人和事，字里行间，无不闪烁着灼目的智慧。', '2020-06-03 05:02:03', 4);
INSERT INTO `comment` VALUES (5, '白先勇', '书中作品多成于白先勇“五十知天命”之后，董桥曾“惊讶他已然像自在、放下的老僧，任由一朵落花在他的掌心默默散发瞬息灿烂”。写至友王国祥、三姊先明，平实中蕴藏波澜壮阔，人间悲悯。桂林、上海、南京、台北，文化乡愁叠加，难觅归处。在倾注心血和青春的同人杂志《现代文学》，白先勇以文会友，情笃一生。他也关心年轻人的成长困境，艾滋病患的挣扎和勇气。生命繁华之欢喜，伤逝消亡之不舍，白先勇的天真执着和无可奈何，在散文中化为真实的有情世界。', '2020-06-02 15:02:26', 5);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `g_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `g_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情',
  `g_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `g_size` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `g_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品颜色',
  `g_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `k_id` int(11) NULL DEFAULT NULL COMMENT '类型ID',
  PRIMARY KEY (`g_id`) USING BTREE,
  INDEX `fk_goods_kind`(`k_id`) USING BTREE,
  CONSTRAINT `fk_goods_kind` FOREIGN KEY (`k_id`) REFERENCES `kind` (`k_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2239 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '红宝石瀑布', 'Teamo生产的红宝石瀑布吊篮为您的房屋增添全年色彩。 它具有红宝石色的细嫩叶子，为您的露台或其他室外区域增添了欢快的感觉。 这些植物易于生长和维护。 是能在部分阴凉的空间中生长的耐旱植物。', 13.98, 'XL', '红色', 'hbspb', 1);
INSERT INTO `goods` VALUES (2, '什锦串珠挂篮', '就像一串精美的翡翠珍珠一样，这串珍珠串是家居装饰的宝贵资产。 简单而优雅，此篮子在室内和户外都一样好。 多肉植物易于护理，比传统的室内植物需要的水更少，并且对任何环境都具有吸引力。 品种会有所不同。', 19.98, 'L', '绿色', 'sjczgl', 1);
INSERT INTO `goods` VALUES (3, '马齿苋', '多肉植物是引人入胜、低维护、耐旱的植物，具有各种惊人的颜色、形状和纹理。 用这些装饰，为您的室外和室内空间提供了许多可能性。 每批货物均附有保养说明。 我们建议立即从包装中取出多肉植物，并将其放在光线充足的地方，例如露台。 Teamo公司是世界上最大的肉质植物和仙人掌种植者，并拥有许多知名的育种人员。 所有的多肉植物都生长在加利福尼亚州，这里气候适宜，可以优化我们植物的非凡颜色，耐用性和质量。', 22.59, 'L', '绿色', 'mcn', 1);
INSERT INTO `goods` VALUES (4, '雨滴挂篮', '多肉植物是引人入胜、低维护、耐旱的植物，具有各种惊人的颜色、形状和纹理。 用这些装饰，为您的室外和室内空间提供了许多可能性。 每批货物均附有保养说明。 我们建议立即从包装中取出多肉植物，并将其放在光线充足的地方，例如露台。 Teamo公司是世界上最大的肉质植物和仙人掌种植者，并拥有许多知名的育种人员。 所有的多肉植物都生长在加利福尼亚州，这里气候适宜，可以优化我们植物的非凡颜色，耐用性和质量。', 17.98, 'X', '绿色', 'ydgl', 1);
INSERT INTO `goods` VALUES (5, '巴西蔓藤', '这是一种非常耐寒的植物。其特性这使得巴西蔓藤成为最容易照料的植物之一。巴西费城人被认为是一个了不起的室内空气净化器。这种热带雨林原产于中美洲、南美洲和加勒比地区。使巴西蔓藤成为一个很好的选择，它的典型特性之一就是它能忍受相对较低的光照。', 19.98, 'S', '绿色', 'bxmt', 1);
INSERT INTO `goods` VALUES (6, '狐尾蕨', '狐尾蕨是一种耐旱、耐寒、易护理的常绿植物。狐尾蕨不是真正的蕨类植物。它通过种子而不是孢子繁殖。它直立的羽毛给狐尾蕨一个艺术，时尚的外观。这些植物有块茎状的主根，能储存水分。狐尾蕨可以在温暖的气候下在室外生长。它也使一个异国情调的房子植物。狐尾蕨喜欢光线充足的部分阴影。', 20.98, 'M', '绿色', 'hwj', 3);
INSERT INTO `goods` VALUES (7, '波士顿蕨', '波士顿蕨植物是一个有光泽的吊篮，可在任何露台上或任何光线明亮的房间中营造氛围。 它拥有葱郁，拱形，悬垂的叶子，微风拂过，营造出宁静的环境。 它们增加了优雅和美丽。', 20.17, 'XS', '绿色', 'bsdj', 3);
INSERT INTO `goods` VALUES (8, '埃尔克霍恩蕨', '原产于澳大利亚昆士兰州，也被称为凤头蕨。 这种蕨类植物适合遮荫至充满阳光。 它带有顶饰的充满活力的直立叶状体。 这种优雅的植物将为环境带来优雅独特的感觉。 这种强壮的植物非常适合桌面或桌面。', 14.48, 'L', '绿色', 'aekhej', 3);
INSERT INTO `goods` VALUES (9, '毛毛虫棕榈', '毛毛虫棕榈是一种有吸引力的密集的无茎植物，具有柔软、深色、绿色的叶子。是任何室内装饰的完美选择。这个棕榈树给任何一个房间都带来了独特的热带形象，让你离天堂更近了一步。', 29.89, 'XL', '绿色', 'mmczl', 4);
INSERT INTO `goods` VALUES (10, '棕榈皇后', '棕榈皇后是一种流行的室内棕榈树，将成为任何装饰的绝佳补充。 它制造出一流的室内装饰工厂。其美丽的拱形叶子增加了热带气息。', 29.55, 'XL', '绿色', 'zlhh', 4);
INSERT INTO `goods` VALUES (11, '马尾棕榈', '马尾巴棕榈的突出之处在于其独特的肿胀基部和细长细长的叶子，从顶部层叠起来就像经典发型一样。 这种植物非常容易生长，可以在室内繁盛，而实际上在疏忽下却繁盛。 无论是在何处种植，它都非常适合在温暖地区的家庭、办公室甚至室外区域使用。', 22.99, 'XXL', '绿色', 'mwzl', 4);
INSERT INTO `goods` VALUES (12, '虎尾兰', '虎尾兰是可爱的多肉新品种，拥有宽大的菱形深绿色叶子，有时边缘带有金黄色的窄带。在所有多肉中都是典型的，它们是防弹和令人惊叹的建筑植物。它能发出真正的深绿色光泽的陈述。', 17.55, 'S', '绿色', 'hwl', 2);
INSERT INTO `goods` VALUES (13, '芦荟', '芦荟是一个很酷的选择，它是潮流趋势。看起来很不错，长在窗台或架子上。芦荟是一种生长缓慢的无茎多肉植物，叶片厚厚，肉质，灰绿色，带有锯齿状边缘。尽管芦荟通常在赤道气候下在户外发现，但在我们更温和的气候下，将其种植在盆中非常高兴。这是一种易于护理的植物，并且以其愈合和空气净化特性而闻名。', 25.99, 'L', '绿色', 'lh', 2);
INSERT INTO `goods` VALUES (14, '螺旋仙人掌', '寻找酷，时髦，外星人的氛围？螺旋仙人掌仙人掌怎么样。蓝绿色和螺旋形的柱状形式已经脱离了这个世界，非常易于保养。较年轻的植物以约10厘米的直肋弯曲开始生活。肋骨上覆盖着刺，刺的长度可以变化。花为粉红色或白色，花瓣长而细腻。', 9.99, 'XS', '绿色', 'lxxrz', 2);
INSERT INTO `goods` VALUES (15, '玫瑰公主', '玫瑰clusia是一种观赏性多叶室内植物，非常坚固并且易于护理。它的坚硬，皮革状的叶子是深橄榄绿色，据说非常坚硬，可以在其中刻上自己的名字，因此而得名“Autograph Tree”。叶片状的叶片还因其空气过滤性能而闻名。', 9.89, 'XS', '绿色', 'mggz', 2);
INSERT INTO `goods` VALUES (16, '喜马拉雅', '喜马拉雅是千里光的直立变种，具有密集的，长的，针状的，鲜绿色的叶子和黄色管状花的芬芳簇。这些迷人，分布多汁的肉质植物在现代室内设计中营造了一种有趣和质感的感觉。', 14.00, 'M', '绿色', 'xmly', 2);
INSERT INTO `goods` VALUES (17, '矮秆芭蕉', '在大多数情况下，最适合在室内种植的是矮人品种，例如这种矮秆芭蕉。具有巨大的桨状叶片，质感十足。年轻的植物在其叶子上有褐红色或紫色斑点，随着叶子的成熟而消失。它们非常适合日光浴室，温室和花园房，因为这些植物喜欢大量的光线。请注意，芭蕉叶易碎，易被瘀伤和撕裂，经常因自身重量而折断。这被认为是它们魅力的一部分，新叶子的产生非常迅速。', 25.89, 'XL', '绿色', 'agbj', 5);
INSERT INTO `goods` VALUES (18, '巴豆冰豆', '巴豆冰豆是一种令人惊艳的美丽叶子植物，具有奇异的叶子颜色和杂色。中绿色的叶子有光泽，尖端尖，每个都有红色，粉红色，黄色或橙色的鲜艳飞溅。具有高度观赏性，几乎可以认为是艺术品。Codiaeum Iceton绝对引人注目，在高大的种植园主看来令人惊叹。', 31.89, 'L', '绿色', 'bdbd', 5);
INSERT INTO `goods` VALUES (19, '福禄桐', '福禄桐是多用途的小型室内分支树。它们以直立且紧凑的方式生长，即使在较小的空间中也适合使用。福禄从希腊语翻译为“许多”和“阴影”，指其丰富的叶子。福禄桐的叶子精美细腻，由许多小叶组成。它们看起来可能很脆弱，但是幸运的是，只要将其放在温暖，潮湿的环境中，它就是一种适应性强的植物。完美地为您的家增添东方风味和美感。', 23.59, 'L', '绿色', 'flt', 5);
INSERT INTO `goods` VALUES (20, '龙血树', '顾名思义，龙血树是一种充满活力的树，具有明亮的绿色，黄色和白色叶子。它广泛传播，在中央茎周围排列着令人愉悦的长而拱形，长矛状的叶子。叶子主要是柠檬石灰的背景颜色，有时趋向于黄色，中央条纹为深绿色，边缘为白色。', 59.99, 'M', '绿色', 'lxs', 5);
INSERT INTO `goods` VALUES (21, '丝兰', '丝兰可能是80年代经典的室内植物。并且，与当时的其他著名事物一样，由于其棱角分明的外观和悠闲的护理要求，它正在掀起一阵轰动的复古风。丝兰具有长的剑状，黄绿色，弓形的叶子，从裸露的树干顶部长成玫瑰花结。与其他丝兰品种不同，叶子无刺。丝兰作品非常适合添加一些增强生活的室内绿化，与其他沙漠植物（如龙血树属植物，博卡尼亚和虫草属）（同一个家族的一部分）一起很好地展示；添加一个或两个仙人掌，以营造出明显的“西方”风格氛围。', 14.89, 'S', '绿色', 'sl', 5);
INSERT INTO `goods` VALUES (22, '方形', '这种花盆得益于其底部独特的储水器，健康的植物易于生长，使植物可以在干燥条件下汲水，避免根系在潮湿时浸在浸水的土壤中。因此，这些种植者的工作效果最好，直接将植物重新栽种到它们中，而不是留在他们的花盆中。 ', 19.99, 'S', '黑色', 'fx', 6);
INSERT INTO `goods` VALUES (23, 'Esra', 'Esra适合在每个家庭中的任何一个地方。神秘灰色选项在棕色底上具有柔和的哑光灰色水洗效果，给人一种可爱的暖色调。', 17.89, 'S', '灰色', 'esra', 6);
INSERT INTO `goods` VALUES (24, '琥珀', '用途广泛，全部采用华丽的柔和色调和色调。此系列具有自然吸引力，当以小组形式组合在一起时，看起来简直令人赞叹。漆面粗糙且有纹理，小裂纹和缝隙是其破旧别致的吸引力的一部分。', 14.89, 'S', '灰色', 'hp', 6);
INSERT INTO `goods` VALUES (25, '萨尔', '具有优雅外观的水泥造型。深灰色的底色采用柔和的哑光绿灰色调，并被微妙的金色斑点提升。结合Saar Cement的免费色调，可轻松实现。', 26.00, 'S', '灰色', 'se', 6);
INSERT INTO `goods` VALUES (26, '伊芙琳', '伊芙琳花盆-淡紫色灰色，干净而现代。Evelyn花盆的简洁线条与光滑的灰色缎面水洗饰面以及淡淡的丁香味相结合，营造出现代简约的外观。', 29.59, 'S', '灰色', 'yfl', 6);

-- ----------------------------
-- Table structure for goods_label_relationships
-- ----------------------------
DROP TABLE IF EXISTS `goods_label_relationships`;
CREATE TABLE `goods_label_relationships`  (
  `gl_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `l_id` int(11) NULL DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`gl_id`) USING BTREE,
  INDEX `fk_glrelationships`(`g_id`) USING BTREE,
  INDEX `fk_glrelationships_label`(`l_id`) USING BTREE,
  CONSTRAINT `fk_glrelationships` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_glrelationships_label` FOREIGN KEY (`l_id`) REFERENCES `label` (`l_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_label_relationships
-- ----------------------------
INSERT INTO `goods_label_relationships` VALUES (1, 19, 8);
INSERT INTO `goods_label_relationships` VALUES (2, 1, 3);
INSERT INTO `goods_label_relationships` VALUES (3, 1, 12);
INSERT INTO `goods_label_relationships` VALUES (4, 2, 12);
INSERT INTO `goods_label_relationships` VALUES (5, 2, 5);
INSERT INTO `goods_label_relationships` VALUES (6, 2, 3);
INSERT INTO `goods_label_relationships` VALUES (7, 3, 12);
INSERT INTO `goods_label_relationships` VALUES (8, 3, 5);
INSERT INTO `goods_label_relationships` VALUES (9, 3, 1);
INSERT INTO `goods_label_relationships` VALUES (10, 4, 12);
INSERT INTO `goods_label_relationships` VALUES (11, 4, 5);
INSERT INTO `goods_label_relationships` VALUES (12, 4, 1);
INSERT INTO `goods_label_relationships` VALUES (13, 5, 2);
INSERT INTO `goods_label_relationships` VALUES (14, 5, 6);
INSERT INTO `goods_label_relationships` VALUES (15, 5, 3);
INSERT INTO `goods_label_relationships` VALUES (16, 6, 1);
INSERT INTO `goods_label_relationships` VALUES (17, 6, 2);
INSERT INTO `goods_label_relationships` VALUES (18, 6, 6);
INSERT INTO `goods_label_relationships` VALUES (19, 7, 3);
INSERT INTO `goods_label_relationships` VALUES (20, 7, 5);
INSERT INTO `goods_label_relationships` VALUES (21, 8, 4);
INSERT INTO `goods_label_relationships` VALUES (22, 8, 7);
INSERT INTO `goods_label_relationships` VALUES (23, 9, 5);
INSERT INTO `goods_label_relationships` VALUES (24, 9, 10);
INSERT INTO `goods_label_relationships` VALUES (25, 10, 10);
INSERT INTO `goods_label_relationships` VALUES (26, 10, 5);
INSERT INTO `goods_label_relationships` VALUES (27, 10, 8);
INSERT INTO `goods_label_relationships` VALUES (28, 11, 12);
INSERT INTO `goods_label_relationships` VALUES (29, 11, 5);
INSERT INTO `goods_label_relationships` VALUES (30, 12, 8);
INSERT INTO `goods_label_relationships` VALUES (31, 13, 4);
INSERT INTO `goods_label_relationships` VALUES (32, 13, 7);
INSERT INTO `goods_label_relationships` VALUES (33, 14, 4);
INSERT INTO `goods_label_relationships` VALUES (34, 14, 9);
INSERT INTO `goods_label_relationships` VALUES (35, 15, 6);
INSERT INTO `goods_label_relationships` VALUES (36, 16, 9);
INSERT INTO `goods_label_relationships` VALUES (37, 17, 5);
INSERT INTO `goods_label_relationships` VALUES (38, 17, 12);
INSERT INTO `goods_label_relationships` VALUES (39, 18, 8);
INSERT INTO `goods_label_relationships` VALUES (40, 1, 8);
INSERT INTO `goods_label_relationships` VALUES (41, 19, 5);
INSERT INTO `goods_label_relationships` VALUES (42, 20, 8);
INSERT INTO `goods_label_relationships` VALUES (43, 20, 5);
INSERT INTO `goods_label_relationships` VALUES (44, 21, 4);
INSERT INTO `goods_label_relationships` VALUES (45, 22, 11);
INSERT INTO `goods_label_relationships` VALUES (46, 23, 11);
INSERT INTO `goods_label_relationships` VALUES (47, 24, 11);
INSERT INTO `goods_label_relationships` VALUES (48, 25, 11);
INSERT INTO `goods_label_relationships` VALUES (49, 26, 11);
INSERT INTO `goods_label_relationships` VALUES (50, 26, 7);
INSERT INTO `goods_label_relationships` VALUES (51, 24, 8);

-- ----------------------------
-- Table structure for goods_shopping_relationships
-- ----------------------------
DROP TABLE IF EXISTS `goods_shopping_relationships`;
CREATE TABLE `goods_shopping_relationships`  (
  `sg_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NULL DEFAULT NULL COMMENT '购物车ID',
  `g_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `sg_sum` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`sg_id`) USING BTREE,
  INDEX `fk_gsrelationships_shoppingcat`(`s_id`) USING BTREE,
  INDEX `fk_gsrelationships_goods`(`g_id`) USING BTREE,
  CONSTRAINT `fk_gsrelationships_goods` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gsrelationships_shoppingcat` FOREIGN KEY (`s_id`) REFERENCES `shopping_cat` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_shopping_relationships
-- ----------------------------
INSERT INTO `goods_shopping_relationships` VALUES (6, 2, 3, 1);
INSERT INTO `goods_shopping_relationships` VALUES (7, 2, 25, 2);
INSERT INTO `goods_shopping_relationships` VALUES (8, 2, 11, 1);
INSERT INTO `goods_shopping_relationships` VALUES (9, 2, 24, 3);
INSERT INTO `goods_shopping_relationships` VALUES (10, 2, 16, 1);
INSERT INTO `goods_shopping_relationships` VALUES (11, 2, 8, 1);

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind`  (
  `k_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `k_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`k_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES (1, '悬挂植物');
INSERT INTO `kind` VALUES (2, '多肉');
INSERT INTO `kind` VALUES (3, '蕨类');
INSERT INTO `kind` VALUES (4, '棕榈植物');
INSERT INTO `kind` VALUES (5, '观叶植物');
INSERT INTO `kind` VALUES (6, '花盆');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `l_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `l_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`l_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, '耐干旱');
INSERT INTO `label` VALUES (2, '耐寒');
INSERT INTO `label` VALUES (3, '可悬挂');
INSERT INTO `label` VALUES (4, '桌面摆设');
INSERT INTO `label` VALUES (5, '室内');
INSERT INTO `label` VALUES (6, '易于打理');
INSERT INTO `label` VALUES (7, '简约');
INSERT INTO `label` VALUES (8, '华丽');
INSERT INTO `label` VALUES (9, '针状叶');
INSERT INTO `label` VALUES (10, '大型');
INSERT INTO `label` VALUES (11, '花盆');
INSERT INTO `label` VALUES (12, '室外');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `o_time` datetime(0) NULL DEFAULT NULL COMMENT '订单时间',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `a_id` int(11) NULL DEFAULT NULL COMMENT '地址ID',
  `o_dawk` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单邮政编码',
  `o_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单收件用户电话',
  PRIMARY KEY (`o_id`) USING BTREE,
  INDEX `fk_order_user`(`u_id`) USING BTREE,
  INDEX `fk_order_address`(`a_id`) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`a_id`) REFERENCES `address` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (2, '2020-06-12 14:29:15', 1, 1, '734', '123');
INSERT INTO `order` VALUES (3, '2020-06-12 13:29:11', 1, 1, '321', '123456');
INSERT INTO `order` VALUES (4, '2020-06-12 13:41:24', 1, 1, '1412312412', '3123123123');
INSERT INTO `order` VALUES (5, '2020-06-12 13:46:46', 1, 3, '123123123', '23123123');
INSERT INTO `order` VALUES (6, '2020-06-12 21:50:39', 1, 1, '1312323', '131231');

-- ----------------------------
-- Table structure for order_goods_realtionships
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_realtionships`;
CREATE TABLE `order_goods_realtionships`  (
  `og_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `g_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `o_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `og_sum` int(10) NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`og_id`) USING BTREE,
  INDEX `fk_og_goods`(`g_id`) USING BTREE,
  INDEX `fk_og_order`(`o_id`) USING BTREE,
  CONSTRAINT `fk_og_goods` FOREIGN KEY (`g_id`) REFERENCES `goods` (`g_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_og_order` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods_realtionships
-- ----------------------------
INSERT INTO `order_goods_realtionships` VALUES (1, 3, 2, 1);
INSERT INTO `order_goods_realtionships` VALUES (2, 12, 2, 6);
INSERT INTO `order_goods_realtionships` VALUES (3, 1, 2, 3);
INSERT INTO `order_goods_realtionships` VALUES (4, 1, 2, 1);
INSERT INTO `order_goods_realtionships` VALUES (5, 2, 2, 1);
INSERT INTO `order_goods_realtionships` VALUES (6, 6, 6, 1);

-- ----------------------------
-- Table structure for shopping_cat
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cat`;
CREATE TABLE `shopping_cat`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`s_id`) USING BTREE,
  UNIQUE INDEX `uni_u_id`(`u_id`) USING BTREE,
  CONSTRAINT `fk_shoppingcat_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cat
-- ----------------------------
INSERT INTO `shopping_cat` VALUES (1, 1);
INSERT INTO `shopping_cat` VALUES (2, 2);
INSERT INTO `shopping_cat` VALUES (3, 5);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `u_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `u_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '发哥哥', '/OqSD3QStdp74M9CuMk3WQ==', '888888@qq.com');
INSERT INTO `user` VALUES (2, '小于', '12345678', '666666@qq.com');
INSERT INTO `user` VALUES (4, 'aaa', '9bsMjeFGxntEurv05lhMwA==', '123@1.com');
INSERT INTO `user` VALUES (5, 'momo', '4QrcOUm6Wau+VuBX8g+IPg==', '194213097043@qq.com');

-- ----------------------------
-- Table structure for user_address_relationships
-- ----------------------------
DROP TABLE IF EXISTS `user_address_relationships`;
CREATE TABLE `user_address_relationships`  (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL COMMENT '用户ID',
  `a_id` int(11) NOT NULL COMMENT '地址ID',
  PRIMARY KEY (`ua_id`) USING BTREE,
  INDEX `fk_uarealtionships_address`(`a_id`) USING BTREE,
  INDEX `fk_uarealtionships_user`(`u_id`) USING BTREE,
  CONSTRAINT `fk_uarealtionships_address` FOREIGN KEY (`a_id`) REFERENCES `address` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uarealtionships_user` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address_relationships
-- ----------------------------
INSERT INTO `user_address_relationships` VALUES (1, 1, 1);
INSERT INTO `user_address_relationships` VALUES (2, 2, 2);
INSERT INTO `user_address_relationships` VALUES (3, 1, 3);

SET FOREIGN_KEY_CHECKS = 1;
