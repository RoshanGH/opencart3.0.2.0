SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `oc_blog`;
CREATE TABLE `oc_blog` (
`blog_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT '1',
  `count_read` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `oc_blog` (`blog_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`) VALUES
(16, 1, 9, 0, 1, 'John', '2015-08-11 00:46:06', 'no_slide.jpg'),
(17, 1, 10, 0, 1, 'John', '2015-08-11 00:47:57', 'no_slide.jpg'),
(18, 1, 15, 0, 1, 'John', '2015-08-11 00:55:25', 'no_slide.jpg'),
(19, 1, 8, 0, 1, 'John', '2015-08-11 00:57:06', 'no_slide.jpg');

DROP TABLE IF EXISTS `oc_blog_category`;
CREATE TABLE `oc_blog_category` (
`blog_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_blog_category` (`blog_category_id`, `parent_id`, `sort_order`, `date_added`, `status`) VALUES
(49, 0, 0, '2015-08-11 00:37:43', 1),
(50, 0, 0, '2015-08-11 00:57:34', 1);

DROP TABLE IF EXISTS `oc_blog_category_description`;
CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `page_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(49, 1, 'Fashion News', 'Fashion News', '', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(50, 1, 'Style Guides', 'Style Guides', 'styles', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;');

DROP TABLE IF EXISTS `oc_blog_category_to_layout`;
CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `oc_blog_category_to_store`;
CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(49, 0),
(50, 0);

DROP TABLE IF EXISTS `oc_blog_comment`;
CREATE TABLE `oc_blog_comment` (
`blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `oc_blog_description`;
CREATE TABLE `oc_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_blog_description` (`blog_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(16, 1, 'Inspired by 70''s', 'Inspired by 70''s', '', '', 'Proin ultrices, velit non varius sollicitudin, leo lorem ultricies dui, blandit feugiat augue massa sit amet dolor. Suspendisse vel diam sollicitudin, viverra nunc eu, tristique odio. Quisque id ipsum in nulla dignissim dignissim ut vel nisl. Integer nec pharetra ipsum.', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus convallis, dapibus massa sit amet, molestie arcu. Cras a massa scelerisque, lacinia sapien non, eleifend nisl. Integer euismod maximus lectus eget luctus. Suspendisse pharetra, lorem nec hendrerit aliquam, tortor ante posuere sem, et consequat lorem justo nec sapien. Praesent vehicula feugiat dolor id sagittis. Mauris sed nunc efficitur, fermentum dolor at, pretium neque. Ut vel mauris faucibus, elementum diam sit amet, blandit tellus. Cras id sagittis tellus. Nam nec rhoncus est. Duis pulvinar augue nisi, in placerat nibh ornare vitae. Pellentesque mattis molestie est ac tincidunt. Donec quis rutrum purus.&lt;/p&gt;&lt;blockquote&gt;Vivamus quis ligula eu ex maximus fermentum&lt;/blockquote&gt;&lt;p&gt;Proin ultrices, velit non varius sollicitudin, leo lorem ultricies dui, blandit feugiat augue massa sit amet dolor. Suspendisse vel diam sollicitudin, viverra nunc eu, tristique odio. Quisque id ipsum in nulla dignissim dignissim ut vel nisl. Integer nec pharetra ipsum. Vivamus quis ligula eu ex maximus fermentum. Curabitur varius semper commodo. Donec sed nibh lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod convallis ullamcorper.&lt;/p&gt;&lt;p&gt;Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt, quis ultrices quam scelerisque. Nulla facilisi. Fusce mollis vitae elit ac euismod. Sed felis nulla, varius sed iaculis ut, dapibus sed tellus. Pellentesque vitae dolor ac nibh aliquet tempor ac vitae mauris. Vivamus commodo arcu ut placerat auctor. Donec ornare imperdiet aliquam. Nam malesuada mi vitae ante fringilla, accumsan lacinia magna accumsan. Integer tellus leo, luctus vulputate congue et, tristique quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent auctor venenatis sagittis. Mauris fermentum ac orci ut sagittis.&lt;/p&gt;', '70''s, retro, styles'),
(17, 1, 'Summer most essential styles', 'Summer most essential styles', '', '', 'Proin ultrices, velit non varius sollicitudin, leo lorem ultricies dui, blandit feugiat augue massa sit amet dolor. Suspendisse vel diam sollicitudin, viverra nunc eu, tristique odio. Quisque id ipsum in nulla dignissim dignissim ut vel nisl.', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus convallis, dapibus massa sit amet, molestie arcu. Cras a massa scelerisque, lacinia sapien non, eleifend nisl. Integer euismod maximus lectus eget luctus. Suspendisse pharetra, lorem nec hendrerit aliquam, tortor ante posuere sem, et consequat lorem justo nec sapien. Praesent vehicula feugiat dolor id sagittis. Mauris sed nunc efficitur, fermentum dolor at, pretium neque. Ut vel mauris faucibus, elementum diam sit amet, blandit tellus. Cras id sagittis tellus. Nam nec rhoncus est. Duis pulvinar augue nisi, in placerat nibh ornare vitae. Pellentesque mattis molestie est ac tincidunt. Donec quis rutrum purus.&lt;/p&gt;&lt;p&gt;Integer nec pharetra ipsum. Vivamus quis ligula eu ex maximus fermentum. Curabitur varius semper commodo. Donec sed nibh lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod convallis ullamcorper.&lt;/p&gt;&lt;p&gt;Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt, quis ultrices quam scelerisque. Nulla facilisi. Fusce mollis vitae elit ac euismod. Sed felis nulla, varius sed iaculis ut, dapibus sed tellus. Pellentesque vitae dolor ac nibh aliquet tempor ac vitae mauris. Vivamus commodo arcu ut placerat auctor. Donec ornare imperdiet aliquam. Nam malesuada mi vitae ante fringilla, accumsan lacinia magna accumsan. Integer tellus leo, luctus vulputate congue et, tristique quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent auctor venenatis sagittis. Mauris fermentum ac orci ut sagittis.&lt;/p&gt;', 'summer, essentials'),
(18, 1, '5 must-have summer dresses', '5 must-have summer dresses', '', '', 'Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt, quis ultrices quam scelerisque. Nulla facilisi. Fusce mollis vitae elit ac euismod. Sed felis nulla, varius sed iaculis ut, dapibus sed tellus. ', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus convallis, dapibus massa sit amet, molestie arcu. Cras a massa scelerisque, lacinia sapien non, eleifend nisl. Integer euismod maximus lectus eget luctus. Suspendisse pharetra, lorem nec hendrerit aliquam, tortor ante posuere sem, et consequat lorem justo nec sapien. Praesent vehicula feugiat dolor id sagittis. Mauris sed nunc efficitur, fermentum dolor at, pretium neque. Ut vel mauris faucibus, elementum diam sit amet, blandit tellus. Cras id sagittis tellus. Nam nec rhoncus est. Duis pulvinar augue nisi, in placerat nibh ornare vitae. Pellentesque mattis molestie est ac tincidunt. Donec quis rutrum purus.&lt;/p&gt;&lt;p&gt;Proin ultrices, velit non varius sollicitudin, leo lorem ultricies dui, blandit feugiat augue massa sit amet dolor. Suspendisse vel diam sollicitudin, viverra nunc eu, tristique odio. Quisque id ipsum in nulla dignissim dignissim ut vel nisl. Integer nec pharetra ipsum. Vivamus quis ligula eu ex maximus fermentum. Curabitur varius semper commodo. Donec sed nibh lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod convallis ullamcorper.&lt;/p&gt;&lt;p&gt;Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt, quis ultrices quam scelerisque. Nulla facilisi. Fusce mollis vitae elit ac euismod. Sed felis nulla, varius sed iaculis ut, dapibus sed tellus. Pellentesque vitae dolor ac nibh aliquet tempor ac vitae mauris. Vivamus commodo arcu ut placerat auctor. Donec ornare imperdiet aliquam. Nam malesuada mi vitae ante fringilla, accumsan lacinia magna accumsan. Integer tellus leo, luctus vulputate congue et, tristique quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent auctor venenatis sagittis. Mauris fermentum ac orci ut sagittis.&lt;/p&gt;', 'dresses, summer, styles'),
(19, 1, 'Swim Trends Look Book', 'Swim Trends Look Book', 'swimming, styles, summer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus convallis, dapibus massa sit amet, molestie arcu. Cras a massa scelerisque, lacinia sapien non, eleifend nisl. Integer euismod maximus lectus eget luctus. ', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eu lectus convallis, dapibus massa sit amet, molestie arcu. Cras a massa scelerisque, lacinia sapien non, eleifend nisl. Integer euismod maximus lectus eget luctus. Suspendisse pharetra, lorem nec hendrerit aliquam, tortor ante posuere sem, et consequat lorem justo nec sapien. Praesent vehicula feugiat dolor id sagittis. Mauris sed nunc efficitur, fermentum dolor at, pretium neque. Ut vel mauris faucibus, elementum diam sit amet, blandit tellus. Cras id sagittis tellus. Nam nec rhoncus est. Duis pulvinar augue nisi, in placerat nibh ornare vitae. Pellentesque mattis molestie est ac tincidunt. Donec quis rutrum purus.&lt;/p&gt;&lt;p&gt;Proin ultrices, velit non varius sollicitudin, leo lorem ultricies dui, blandit feugiat augue massa sit amet dolor. Suspendisse vel diam sollicitudin, viverra nunc eu, tristique odio. Quisque id ipsum in nulla dignissim dignissim ut vel nisl. Integer nec pharetra ipsum. Vivamus quis ligula eu ex maximus fermentum. Curabitur varius semper commodo. Donec sed nibh lorem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod convallis ullamcorper.&lt;/p&gt;&lt;p&gt;Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt, quis ultrices quam scelerisque. Nulla facilisi. Fusce mollis vitae elit ac euismod. Sed felis nulla, varius sed iaculis ut, dapibus sed tellus. Pellentesque vitae dolor ac nibh aliquet tempor ac vitae mauris. Vivamus commodo arcu ut placerat auctor. Donec ornare imperdiet aliquam. Nam malesuada mi vitae ante fringilla, accumsan lacinia magna accumsan. Integer tellus leo, luctus vulputate congue et, tristique quis nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent auctor venenatis sagittis. Mauris fermentum ac orci ut sagittis.&lt;/p&gt;', '');

DROP TABLE IF EXISTS `oc_blog_related`;
CREATE TABLE `oc_blog_related` (
  `parent_blog_id` int(11) NOT NULL DEFAULT '0',
  `child_blog_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `oc_blog_related` (`parent_blog_id`, `child_blog_id`) VALUES
(17, 16),
(18, 17),
(18, 16),
(19, 17),
(19, 16),
(19, 18);

DROP TABLE IF EXISTS `oc_blog_to_category`;
CREATE TABLE `oc_blog_to_category` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_blog_to_category` (`blog_id`, `blog_category_id`) VALUES
(16, 49),
(16, 50),
(17, 49),
(17, 50),
(18, 49),
(18, 50),
(19, 49),
(19, 50);

DROP TABLE IF EXISTS `oc_blog_to_layout`;
CREATE TABLE `oc_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `oc_blog_to_store`;
CREATE TABLE `oc_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `oc_blog_to_store` (`blog_id`, `store_id`) VALUES
(16, 0),
(17, 0),
(18, 0),
(19, 0);


ALTER TABLE `oc_blog`
 ADD PRIMARY KEY (`blog_id`);

ALTER TABLE `oc_blog_category`
 ADD PRIMARY KEY (`blog_category_id`);

ALTER TABLE `oc_blog_category_description`
 ADD PRIMARY KEY (`blog_category_id`,`language_id`), ADD KEY `name` (`name`);

ALTER TABLE `oc_blog_category_to_layout`
 ADD PRIMARY KEY (`blog_category_id`,`store_id`);

ALTER TABLE `oc_blog_category_to_store`
 ADD PRIMARY KEY (`blog_category_id`,`store_id`);

ALTER TABLE `oc_blog_comment`
 ADD PRIMARY KEY (`blog_comment_id`);

ALTER TABLE `oc_blog_to_category`
 ADD PRIMARY KEY (`blog_id`,`blog_category_id`);

ALTER TABLE `oc_blog_to_layout`
 ADD PRIMARY KEY (`blog_id`,`store_id`);


ALTER TABLE `oc_blog`
MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
ALTER TABLE `oc_blog_category`
MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
ALTER TABLE `oc_blog_comment`
MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT;


TRUNCATE TABLE `oc_category`;

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('62', 'no_image.jpg', '69', '1', '1', '0', '1', '2015-07-07 20:27:49', '2017-07-18 17:05:26');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('63', 'no_image.jpg', '0', '1', '1', '0', '1', '2015-07-07 21:31:58', '2016-05-11 10:17:22');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('60', 'no_image.jpg', '63', '1', '1', '0', '1', '2015-07-07 18:06:20', '2017-07-18 17:06:10');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('64', 'no_image.jpg', '0', '1', '1', '0', '1', '2015-07-07 22:40:45', '2016-05-11 10:17:11');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('65', 'no_image.jpg', '64', '0', '1', '0', '1', '2015-07-07 22:41:20', '2017-07-18 17:04:06');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('66', 'no_image.jpg', '64', '1', '1', '0', '1', '2015-07-08 00:18:29', '2017-07-18 17:04:30');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('59', 'no_image.jpg', '0', '1', '1', '0', '1', '2015-07-07 16:30:56', '2016-05-11 10:16:19');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('67', 'no_image.jpg', '69', '1', '1', '0', '1', '2015-08-26 21:50:52', '2017-07-18 17:05:07');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('68', 'no_image.jpg', '69', '1', '1', '0', '1', '2015-08-26 22:33:50', '2017-07-18 17:04:51');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('69', 'no_image.jpg', '0', '1', '1', '0', '1', '2015-08-26 22:53:50', '2016-05-11 10:16:04');
INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES ('70', 'no_image.jpg', '0', '1', '1', '0', '1', '2015-08-27 13:33:18', '2016-05-11 10:15:49');


TRUNCATE TABLE `oc_category_description`;

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('60', '1', 'Shorts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shorts', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('62', '1', 'Woman Shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shirts &amp; Tops', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('65', '1', 'Handbags', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante.&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'Handbags', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('66', '1', 'Shoes', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shoes', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('67', '1', 'T-Shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'T-Shirts', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('68', '1', 'Polos', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Polos', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('70', '1', 'Watches', '&lt;p&gt;Fusce ultrices vitae mi nec venenatis. Fusce tempor sem eu lorem tincidunt.&lt;br&gt;&lt;/p&gt;', 'Watches', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('64', '1', 'Accessories', '&lt;p&gt;Aliquam fermentum porttitor tellus.&lt;br&gt;&lt;/p&gt;', 'Accessories', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('69', '1', 'Shirts &amp; Tops', '&lt;p&gt;Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.&lt;br&gt;&lt;/p&gt;', 'Shirts &amp; Tops', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('63', '1', 'Swimsuits', '&lt;p&gt;Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem.&amp;nbsp;&lt;br&gt;&lt;/p&gt;', 'Swimsuits', '', '');
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('59', '1', 'Dresses', '&lt;p&gt;Duis efficitur dui ligula, eget sagittis ante elementum sed.&lt;br&gt;&lt;/p&gt;', 'dresses', '', '');


TRUNCATE TABLE `oc_category_filter`;

INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('59', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('59', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('59', '5');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('62', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('62', '5');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('63', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('63', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('64', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('64', '2');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('64', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('64', '5');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('65', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('65', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('66', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('66', '2');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('68', '2');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('68', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('68', '5');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('69', '1');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('69', '2');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('69', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('69', '5');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('70', '2');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('70', '4');
INSERT INTO `oc_category_filter` (`category_id`, `filter_id`) VALUES ('70', '5');


TRUNCATE TABLE `oc_category_path`;

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('62', '62', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('60', '60', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('66', '66', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('65', '65', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('65', '64', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('64', '64', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('63', '63', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('59', '59', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('67', '67', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('68', '68', '1');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('67', '69', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('69', '69', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('68', '69', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('62', '69', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('60', '63', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('66', '64', '0');
INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('70', '70', '0');


TRUNCATE TABLE `oc_category_to_layout`;

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('59', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('60', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('62', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('63', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('64', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('65', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('66', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('67', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('68', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('69', '0', '0');
INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('70', '0', '0');


TRUNCATE TABLE `oc_category_to_store`;

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('59', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('60', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('62', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('63', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('64', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('65', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('66', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('67', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('68', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('69', '0');
INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES ('70', '0');


TRUNCATE TABLE `oc_extension`;

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('23', 'payment', 'cod');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('22', 'total', 'shipping');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('57', 'total', 'sub_total');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('58', 'total', 'tax');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('59', 'total', 'total');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('410', 'module', 'banner');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('426', 'module', 'carousel');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('390', 'total', 'credit');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('387', 'shipping', 'flat');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('349', 'total', 'handling');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('350', 'total', 'low_order_fee');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('389', 'total', 'coupon');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('413', 'module', 'category');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('408', 'module', 'account');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('393', 'total', 'reward');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('398', 'total', 'voucher');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('407', 'payment', 'free_checkout');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('427', 'module', 'featured');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('419', 'module', 'slideshow');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('447', 'module', 'testimonial');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('443', 'module', 'sellegance');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('430', 'module', 'tabbed_products');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('431', 'module', 'newsletter');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('433', 'module', 'category_accordion');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('442', 'module', 'latest');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('435', 'module', 'twittertl');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('436', 'module', 'revslideroutput');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('437', 'module', 'revslideropencart');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('438', 'module', 'html');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('439', 'module', 'information');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('440', 'module', 'blog_category');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('441', 'module', 'blog_latest');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('449', 'captcha', 'basic_captcha');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('39', 'module', 'featured_categories');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('40', 'module', 'latest');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('42', 'module', 'filter');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('43', 'module', 'bannerplus');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('52', 'module', 'live_options');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('53', 'module', 'live_search');
INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES ('54', 'module', 'countdown');


TRUNCATE TABLE `oc_filter`;

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('1', '1', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('2', '1', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('3', '1', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('4', '2', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('5', '2', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('6', '2', '0');
INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES ('7', '2', '0');


TRUNCATE TABLE `oc_filter_description`;

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('1', '1', '1', 'Women');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('1', '2', '1', 'Damas');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('2', '1', '1', 'Men');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('2', '2', '1', 'Caballeros');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('3', '1', '1', 'Kids');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('3', '2', '1', 'Niños');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('4', '1', '2', 'Basic');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('4', '2', '2', 'Basic');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('5', '1', '2', 'Casual');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('5', '2', '2', 'Casual');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('6', '1', '2', 'Athletic');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('6', '2', '2', 'Athletic');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('7', '1', '2', 'Formal');
INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES ('7', '2', '2', 'Formal');


TRUNCATE TABLE `oc_filter_group`;

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES ('1', '0');
INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES ('2', '0');


TRUNCATE TABLE `oc_filter_group_description`;

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES ('1', '2', 'Género');
INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES ('1', '1', 'Gender');
INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES ('2', '1', 'Style');
INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES ('2', '2', 'Style');


TRUNCATE TABLE `oc_information`;

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES ('3', '1', '3', '1');
INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES ('4', '1', '1', '1');
INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES ('5', '1', '4', '1');
INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES ('6', '1', '2', '1');


TRUNCATE TABLE `oc_information_description`;

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('5', '1', 'Terms &amp; Conditions', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius. Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/p&gt;&lt;p&gt;Phasellus accumsan dignissim massa. Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium. Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/p&gt;&lt;p&gt;Proin eu nisi a nisl molestie lacinia. Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;&lt;p&gt;Nulla vel porttitor tellus. Sed eget sem vestibulum, tincidunt ex non, hendrerit metus. Vestibulum at cursus lorem. Nam pharetra, urna sit amet pellentesque cursus, risus augue imperdiet felis, nec euismod tortor urna nec enim. Integer imperdiet sem augue, ut cursus risus aliquet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque accumsan finibus elit et efficitur. Praesent tincidunt accumsan dui, eget placerat orci bibendum bibendum. Sed nec facilisis mauris, non dapibus orci.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius. Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/p&gt;&lt;p&gt;Phasellus accumsan dignissim massa. Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium. Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/p&gt;&lt;p&gt;Proin eu nisi a nisl molestie lacinia. Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;&lt;p&gt;Nulla vel porttitor tellus. Sed eget sem vestibulum, tincidunt ex non, hendrerit metus. Vestibulum at cursus lorem. Nam pharetra, urna sit amet pellentesque cursus, risus augue imperdiet felis, nec euismod tortor urna nec enim. Integer imperdiet sem augue, ut cursus risus aliquet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque accumsan finibus elit et efficitur. Praesent tincidunt accumsan dui, eget placerat orci bibendum bibendum. Sed nec facilisis mauris, non dapibus orci.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius. Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/p&gt;&lt;p&gt;Phasellus accumsan dignissim massa. Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium. Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/p&gt;&lt;p&gt;Proin eu nisi a nisl molestie lacinia. Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;&lt;p&gt;Nulla vel porttitor tellus. Sed eget sem vestibulum, tincidunt ex non, hendrerit metus. Vestibulum at cursus lorem. Nam pharetra, urna sit amet pellentesque cursus, risus augue imperdiet felis, nec euismod tortor urna nec enim. Integer imperdiet sem augue, ut cursus risus aliquet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque accumsan finibus elit et efficitur. Praesent tincidunt accumsan dui, eget placerat orci bibendum bibendum. Sed nec facilisis mauris, non dapibus orci.&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('3', '1', 'Privacy Policy', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius. Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/p&gt;&lt;p&gt;Phasellus accumsan dignissim massa. Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium. Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/p&gt;&lt;p&gt;Proin eu nisi a nisl molestie lacinia. Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;&lt;p&gt;Nulla vel porttitor tellus. Sed eget sem vestibulum, tincidunt ex non, hendrerit metus. Vestibulum at cursus lorem. Nam pharetra, urna sit amet pellentesque cursus, risus augue imperdiet felis, nec euismod tortor urna nec enim. Integer imperdiet sem augue, ut cursus risus aliquet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque accumsan finibus elit et efficitur. Praesent tincidunt accumsan dui, eget placerat orci bibendum bibendum. Sed nec facilisis mauris, non dapibus orci.&lt;/p&gt;\r\n', 'Privacy Policy', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('6', '1', 'Delivery Information', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius. Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/p&gt;&lt;p&gt;Phasellus accumsan dignissim massa. Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium. Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/p&gt;&lt;p&gt;Proin eu nisi a nisl molestie lacinia. Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;&lt;p&gt;Nulla vel porttitor tellus. Sed eget sem vestibulum, tincidunt ex non, hendrerit metus. Vestibulum at cursus lorem. Nam pharetra, urna sit amet pellentesque cursus, risus augue imperdiet felis, nec euismod tortor urna nec enim. Integer imperdiet sem augue, ut cursus risus aliquet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque accumsan finibus elit et efficitur. Praesent tincidunt accumsan dui, eget placerat orci bibendum bibendum. Sed nec facilisis mauris, non dapibus orci.&lt;/p&gt;\r\n', 'Delivery Information', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('4', '1', 'About Us', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu condimentum felis. Aliquam vehicula placerat ante id rutrum. Quisque laoreet felis ante, nec luctus augue scelerisque nec. Vestibulum aliquam fermentum elit non molestie. Duis aliquet erat pretium dignissim gravida. Suspendisse laoreet nibh augue, non tempus mauris sodales et. Sed finibus lacus turpis. Nulla ultricies ipsum turpis, et aliquet purus tincidunt ac. Vestibulum sit amet elit faucibus leo cursus pretium. Mauris ultrices diam at nunc porta, at malesuada lorem varius.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://everthemes.com/demo/assets/slide3.jpg&quot; style=&quot;width: 100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt; &lt;/p&gt;&lt;blockquote&gt;Nulla facilisi. Vivamus a turpis blandit, feugiat orci eu, egestas odio. Morbi nec semper leo. Nunc suscipit dictum purus vitae facilisis.&lt;/blockquote&gt;&lt;h3&gt;&lt;span style=&quot;font-size: 12px; line-height: 18px;&quot;&gt;Praesent mattis dolor a enim suscipit consectetur. Etiam volutpat ex libero, vitae lacinia est maximus sit amet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas at dui a urna ultrices tempus eget vel elit.&lt;/span&gt;&lt;/h3&gt;&lt;h3&gt;&lt;span style=&quot;font-size: 12px; line-height: 18px;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/h3&gt;&lt;h3&gt;Phasellus accumsan dignissim massa. &lt;/h3&gt;&lt;p&gt;Quisque aliquet convallis sem, non facilisis dui mollis vitae. Vestibulum nec venenatis turpis. Morbi lacinia tincidunt sapien, sed eleifend lorem pellentesque eu. Aenean ultrices lectus vel nibh blandit pellentesque. Aenean dictum, libero vitae vehicula pellentesque, eros metus volutpat neque, ac accumsan libero lorem et erat. Pellentesque hendrerit mollis arcu sed iaculis. Fusce et suscipit velit, id blandit arcu. Aliquam erat volutpat. Nulla facilisi. Morbi dui est, vulputate eget faucibus a, fringilla sit amet nunc. In hac habitasse platea dictumst. Donec tortor metus, tempor vehicula felis commodo, malesuada facilisis ex. Vivamus vitae elit egestas, pellentesque ante in, viverra ipsum.&lt;/p&gt;&lt;p&gt;Nunc placerat condimentum ante, at cursus odio posuere volutpat. Integer maximus enim vel diam rhoncus, nec ullamcorper velit luctus. Quisque ac diam non diam bibendum pharetra sit amet eu ligula. Morbi aliquet eleifend ante ac pretium.&amp;nbsp;&lt;/p&gt;&lt;h3&gt;Proin eu nisi a nisl molestie lacinia.&lt;/h3&gt;&lt;p&gt;Curabitur in vestibulum augue, eu vestibulum est. Vivamus lacinia, enim vel pellentesque gravida, leo nisl aliquet risus, vel congue lectus nibh quis mauris. Mauris mollis purus ut pretium tristique. Praesent quis auctor velit, in elementum nunc. In ac lectus eget nisi blandit tincidunt. Vivamus rhoncus tempus aliquet. Aliquam est enim, facilisis vel efficitur auctor, ullamcorper sit amet sapien. Quisque blandit tincidunt mauris non fermentum. Vivamus tristique dolor at turpis pellentesque blandit.&lt;/p&gt;\r\n', 'About Us', '', '');


TRUNCATE TABLE `oc_information_to_layout`;

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES ('4', '0', '0');
INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES ('5', '0', '0');
INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES ('3', '0', '0');
INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES ('6', '0', '0');


TRUNCATE TABLE `oc_information_to_store`;

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES ('3', '0');
INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES ('4', '0');
INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES ('5', '0');
INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES ('6', '0');


TRUNCATE TABLE `oc_layout`;

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('1', 'Home');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('2', 'Product');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('3', 'Category');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('4', 'Default');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('5', 'Manufacturer');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('6', 'Account');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('7', 'Checkout');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('8', 'Contact');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('9', 'Sitemap');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('10', 'Affiliate');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('11', 'Information');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('12', 'Compare');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('13', 'Search');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('14', 'Footer');
INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES ('15', 'Blog');


TRUNCATE TABLE `oc_layout_module`;

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('2', '4', '0', 'content_top', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('3', '4', '0', 'content_top', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('20', '5', '0', 'column_left', '2');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('69', '10', 'affiliate', 'column_right', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('388', '3', 'category_accordion', 'column_left', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('389', '3', 'bannerplus.50', 'column_left', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('376', '13', 'bannerplus.50', 'content_top', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('104', '11', 'information', 'column_left', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('105', '9', 'information', 'column_left', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('106', '8', 'information', 'column_left', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('225', '14', 'newsletter.31', 'footer', '4');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('224', '14', 'testimonial.43', 'footer', '2');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('202', '15', 'blog_latest.37', 'column_left', '2');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('201', '15', 'blog_category', 'column_left', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('223', '14', 'html.35', 'footer', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('198', '7', 'testimonial.43', 'content_bottom', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('369', '1', 'testimonial.43', 'content_bottom', '3');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('370', '1', 'blog_latest.38', 'content_bottom', '4');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('368', '1', 'featured_categories.46', 'content_bottom', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('367', '1', 'tabbed_products.33', 'content_top', '3');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('366', '1', 'countdown.48', 'content_top', '2');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('365', '1', 'bannerplus.49', 'content_top', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('364', '1', 'bannerplus.47', 'content_top', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('375', '2', 'testimonial.43', 'content_bottom', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('392', '3', 'countdown.48', 'content_bottom', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('363', '1', 'revslideroutput.32', 'home_top', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('374', '2', 'bannerplus.49', 'content_bottom', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('391', '3', 'bannerplus.49', 'content_top', '0');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('383', '6', 'account', 'column_right', '1');
INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES ('390', '3', 'blog_latest.40', 'column_left', '2');


TRUNCATE TABLE `oc_layout_route`;

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('117', '6', '0', 'account/%');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('17', '10', '0', 'affiliate/%');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('119', '3', '0', 'product/category');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('110', '1', '0', 'common/home');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('112', '2', '0', 'product/product');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('62', '11', '0', 'information/information');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('86', '7', '0', 'checkout/%');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('64', '8', '0', 'information/contact');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('63', '9', '0', 'information/sitemap');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('34', '4', '0', '');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('45', '5', '0', 'product/manufacturer');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('52', '12', '0', 'product/compare');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('113', '13', '0', 'product/search');
INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES ('88', '15', '0', 'blog/%');


TRUNCATE TABLE `oc_manufacturer`;

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('12', 'Levi\'s', '', '0');
INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('11', 'Nike', '', '0');
INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('13', 'Puma', '', '0');
INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('14', 'Nautica', '', '0');
INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('15', 'Calvin Klein', '', '0');


TRUNCATE TABLE `oc_manufacturer_to_store`;

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('11', '0');
INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('12', '0');
INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('13', '0');
INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('14', '0');
INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('15', '0');


TRUNCATE TABLE `oc_module`;

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('30', 'Category', 'banner', 'a:5:{s:4:"name";s:17:"Banner - Category";s:9:"banner_id";s:1:"6";s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:6:"status";s:1:"1";}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('29', 'Home Page', 'carousel', 'a:5:{s:4:"name";s:20:"Carousel - Home Page";s:9:"banner_id";s:1:"8";s:5:"width";s:3:"130";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('28', 'Home Page', 'featured', '{"name":"Home Page","product_name":"","product":["59","90","83","97","74"],"limit":"5","width":"254","height":"254","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('27', 'Home Page', 'slideshow', 'a:5:{s:4:"name";s:21:"Slideshow - Home Page";s:9:"banner_id";s:1:"7";s:5:"width";s:4:"1140";s:6:"height";s:3:"380";s:6:"status";s:1:"1";}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('31', 'Newsletter Sign Up', 'newsletter', '{"name":"Newsletter Sign Up","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('32', 'Home Slider', 'revslideroutput', '{"name":"Home Slider","slider_id":"1","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('33', 'Tabbed Module', 'tabbed_products', '{"name":"Tabbed Module","limit":"5","width":"254","height":"254","status":"1","latest":"carousel","featured":"disabled","special":"carousel","bestseller":"carousel","product":["59","51","73","77"]}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('38', 'Latest Posts', 'blog_latest', '{"name":"Latest Posts","title":{"1":""},"limit":"5","category":"0","columns":"4","carousel":"1","characters":"100","thumb":"1","width":"330","height":"190","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('35', 'About Us', 'html', '{"name":"About Us","module_description":{"1":{"title":"About Us","description":"&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Aenean nec tempus diam. Nulla risus elit, efficitur ac diam ut, sollicitudin bibendum lorem. Vivamus quis sem metus.&lt;\\/span&gt;&lt;br&gt;&lt;\\/p&gt;&lt;p&gt;Cras a orci quis nibh finibus porttitor.&lt;br&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=&quot;http:\\/\\/themeforest.net\\/item\\/glade-responsive-opencart-theme\\/12320068&quot; class=&quot;btn btn-primary&quot;&gt;Buy theme&lt;\\/a&gt;&lt;\\/p&gt;"}},"status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('36', 'Payment', 'html', '{"name":"Payment","module_description":{"1":{"title":"How to buy?","description":"&lt;p&gt;Choose your preferred payment method and enjoy!&lt;\\/p&gt;&lt;p&gt;Nulla risus elit, efficitur ac diam ut, sollicitudin bibendum lorem. Vivamus quis sem metus.&lt;br&gt;&lt;\\/p&gt;&lt;p&gt;&lt;i class=&quot;fa fa-2x fa-cc-visa&quot;&gt;&lt;\\/i&gt; &lt;i class=&quot;fa fa-2x fa-cc-mastercard&quot;&gt;&lt;\\/i&gt; &lt;i class=&quot;fa fa-2x fa-cc-amex&quot;&gt;&lt;\\/i&gt; &lt;i class=&quot;fa fa-2x fa-paypal&quot;&gt;&lt;\\/i&gt; &lt;i class=&quot;fa fa-2x fa-cc-stripe&quot;&gt;&lt;\\/i&gt;&lt;\\/p&gt;"}},"status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('37', 'Latest Posts Sidebar', 'blog_latest', '{"name":"Latest Posts Sidebar","title":{"1":""},"limit":"3","category":"0","columns":"1","carousel":"0","characters":"100","thumb":"1","width":"290","height":"180","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('40', 'Latest Posts Category', 'blog_latest', '{"name":"Latest Posts Category","title":{"1":""},"limit":"1","category":"0","columns":"1","carousel":"0","characters":"100","thumb":"1","width":"290","height":"180","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('41', 'Latest Products', 'latest', '{"name":"Latest Products","limit":"5","width":"100","height":"100","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('43', 'Testimonials', 'testimonial', '{"name":"Testimonials","testimonial_title":{"1":"Testimonials"},"testimonial_limit":"5","testimonial_character_limit":"190","testimonial_columns":"1","testimonial_random":"1","testimonial_carousel":"1","testimonial_links":"1","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('46', 'Featured Categories', 'featured_categories', '{"name":"Featured Categories","category":["64","59","69","63","70","65","60"],"limit":"5","description_status":"1","description_length":"100","width":"200","height":"200","status":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('47', 'Home Banners', 'bannerplus', '{"save":"0","mod_id":"47","name":"Home Banners","status":"1","module_title":{"1":""},"title_visibility":"all","columns":"4","sections":{"1":{"visibility":"desktop","thumb_image":"","bgcolor":"","url":{"1":"index.php?route=product\\/category&amp;path=64"},"block":{"1":"&lt;i class=&quot;fa fa-check-circle-o fa-3x&quot;&gt;&lt;\\/i&gt;&lt;h4&gt;Secure shopping&lt;\\/h4&gt;&lt;p&gt;Secure payments&lt;\\/p&gt;"},"css":""},"2":{"visibility":"desktop","thumb_image":"","bgcolor":"","url":{"1":"index.php?route=product\\/category&amp;path=64"},"block":{"1":"&lt;i class=&quot;fa fa-heart-o fa-3x&quot;&gt;&lt;\\/i&gt;&lt;h4&gt;Your Favorites&lt;\\/h4&gt;&lt;p&gt;Buy your wish list&lt;\\/p&gt;"},"css":""},"3":{"visibility":"desktop","thumb_image":"","bgcolor":"","url":{"1":"index.php?route=product\\/category&amp;path=69"},"block":{"1":"&lt;i class=&quot;fa fa-shopping-bag fa-3x&quot;&gt;&lt;\\/i&gt;&lt;h4&gt;Shop Now!&lt;\\/h4&gt;&lt;p&gt;Great discounts!&lt;\\/p&gt;"},"css":""},"4":{"visibility":"desktop","thumb_image":"","bgcolor":"","url":{"1":"index.php?route=product\\/category&amp;path=64"},"block":{"1":"&lt;i class=&quot;fa fa-life-ring fa-3x&quot;&gt;&lt;\\/i&gt;&lt;h4&gt;Need help?&lt;\\/h4&gt;&lt;p&gt;FAQ&lt;\\/p&gt;"},"css":""}}}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('48', 'Special Deals', 'countdown', '{"name":"Special Deals","title":{"en-gb":{"title":"Special Deals"}},"status":"1","width":"210","height":"210","showlabel":"1","limit":"5","item":"4","speed":"3000","autoplay":"1"}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('49', 'Single Banner 1', 'bannerplus', '{"save":"0","mod_id":"49","name":"Single Banner 1","status":"1","module_title":{"1":""},"title_visibility":"all","columns":"1","sections":{"1":{"visibility":"all","thumb_image":"","bgcolor":"#DC6D6D","url":{"1":""},"block":{"1":"FREE DELIVERY ON ALL ORDERS OVER $50 | FREE 60 DAYS RETURNS"},"css":""}}}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES ('50', 'Single Banner 2', 'bannerplus', '{"save":"0","mod_id":"50","name":"Single Banner 2","status":"1","module_title":{"1":""},"title_visibility":"all","columns":"1","sections":{"1":{"visibility":"all","thumb_image":"","bgcolor":"#282828","url":{"1":"index.php?route=product\\/product&amp;product_id=90"},"block":{"1":"&lt;h3&gt;up to 50% off&lt;\\/h3&gt;\r\n&lt;p&gt;MORE LINES ADDED&lt;\\/p&gt;"},"css":""}}}');

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `oc_newsletter`;
CREATE TABLE `oc_newsletter` (
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_newsletter` (`email`) VALUES
('a297ou5s6mbcooo4la@thrott.com');


ALTER TABLE `oc_newsletter`
 ADD PRIMARY KEY (`email`);





TRUNCATE TABLE `oc_option`;

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('1', 'radio', '1');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('2', 'checkbox', '2');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('4', 'text', '3');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('5', 'select', '4');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('6', 'textarea', '5');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('7', 'file', '6');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('8', 'date', '7');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('9', 'time', '8');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('10', 'datetime', '9');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('11', 'select', '10');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('12', 'date', '11');
INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES ('13', 'image', '0');


TRUNCATE TABLE `oc_option_description`;

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('1', '1', 'Radio');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('2', '1', 'Checkbox');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('4', '1', 'Text');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('6', '1', 'Textarea');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('8', '1', 'Date');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('7', '1', 'File');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('5', '1', 'Select');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('9', '1', 'Time');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('10', '1', 'Date &amp; Time');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('12', '1', 'Delivery Date');
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES ('11', '1', 'Size');


TRUNCATE TABLE `oc_option_value`;

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('43', '1', '', '3');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('32', '1', '', '1');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('45', '2', '', '4');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('44', '2', '', '3');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('42', '5', '', '4');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('41', '5', '', '3');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('39', '5', '', '1');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('40', '5', '', '2');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('31', '1', '', '2');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('23', '2', '', '1');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('24', '2', '', '2');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('46', '11', '', '1');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('47', '11', '', '2');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('48', '11', '', '3');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('49', '13', 'no_image.jpg', '0');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('50', '13', 'no_image.jpg', '0');
INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES ('51', '13', 'no_image.jpg', '0');


TRUNCATE TABLE `oc_option_value_description`;

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('43', '1', '1', 'Large');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('32', '1', '1', 'Small');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('45', '1', '2', 'Checkbox 4');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('44', '1', '2', 'Checkbox 3');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('31', '1', '1', 'Medium');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('42', '1', '5', 'Yellow');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('41', '1', '5', 'Green');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('39', '1', '5', 'Red');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('40', '1', '5', 'Blue');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('23', '1', '2', 'Checkbox 1');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('24', '1', '2', 'Checkbox 2');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('48', '1', '11', 'Large');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('47', '1', '11', 'Medium');
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES ('46', '1', '11', 'Small');


TRUNCATE TABLE `oc_product`;

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('71', 'SWM-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '225.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '595', '2015-07-07 21:47:34', '2016-07-07 23:25:29');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('67', 'TOP-E', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '23.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '289', '2015-07-07 21:11:14', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('68', 'SWM-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '119.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '530', '2015-07-07 21:41:19', '2015-07-07 21:43:18');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('69', 'SWM-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '49.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '295', '2015-07-07 21:43:05', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('70', 'SWM-C', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '15', '1', '73.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '293', '2015-07-07 21:45:53', '2016-07-07 23:25:47');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('55', 'DRSS-F', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '45.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '288', '2015-07-07 17:34:52', '2015-07-07 19:02:59');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('56', 'DRSS-G', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '61.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '288', '2015-07-07 17:47:16', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('57', 'SHRT-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '23.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '541', '2015-07-07 18:06:29', '2015-07-07 18:51:55');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('58', 'SHRT-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '22.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '287', '2015-07-07 18:10:11', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('59', 'SHRT-C', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '35.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '683', '2015-07-07 18:12:52', '2015-07-07 20:33:56');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('60', 'SHRT-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '26.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '293', '2015-07-07 18:31:21', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('63', 'TOP-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '19.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '289', '2015-07-07 19:44:18', '2016-07-07 23:27:36');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('62', 'SHRT-E', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '34.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '535', '2015-07-07 18:35:21', '2015-07-07 19:02:31');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('64', 'TOP-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '43.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '544', '2015-07-07 19:48:17', '2015-08-26 22:55:49');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('65', 'TOP-C', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '15', '1', '34.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '295', '2015-07-07 20:20:47', '2015-08-26 22:56:25');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('66', 'TOP-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '34.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '529', '2015-07-07 21:09:12', '2017-07-18 12:46:08');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('50', 'DRSS-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '59.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '290', '2015-07-07 16:57:10', '2015-07-07 19:03:40');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('51', 'DRSS-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '53.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '454', '2015-07-07 17:08:22', '2015-07-07 17:24:35');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('52', 'DRSS-C', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '57.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '306', '2015-07-07 17:12:43', '2015-07-07 19:03:55');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('53', 'DRSS-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '73.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '525', '2015-07-07 17:22:27', '2015-07-07 17:23:32');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('54', 'DRSS-E', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '62.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '294', '2015-07-07 17:32:54', '2015-07-07 19:03:10');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('72', 'BAG-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '34.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '1026', '2015-07-07 23:45:59', '2015-07-07 23:48:22');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('73', 'BAG-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '128.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '883', '2015-07-07 23:48:08', '2017-07-18 18:16:33');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('74', 'BAG-C', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '49.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '802', '2015-07-07 23:50:11', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('75', 'BAG-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '79.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '804', '2015-07-07 23:51:24', '2016-07-07 23:28:05');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('76', 'BAG-E', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '39.0000', '0', '0', '2015-07-07', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '786', '2015-07-07 23:53:16', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('77', 'SHS-A', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '195.0000', '0', '0', '2015-07-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '590', '2015-07-08 11:28:27', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('78', 'SHS-B', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '139.0000', '0', '0', '2015-07-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '298', '2015-07-08 11:30:47', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('79', 'SHS-C', '', '', '', '', '', '', '', '100', '6', 'no_image.jpg', '0', '1', '79.0000', '0', '0', '2015-07-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '305', '2015-07-08 11:33:00', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('80', 'SHS-D', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '63.0000', '0', '0', '2015-07-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '326', '2015-07-08 11:34:41', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('81', 'SHS-E', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '129.0000', '0', '0', '2015-07-08', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '333', '2015-07-08 11:36:14', '0000-00-00 00:00:00');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('82', 'TOP-F', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '12', '1', '49.0000', '0', '0', '2015-07-29', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '617', '2015-07-29 23:09:48', '2015-07-29 23:11:51');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('83', 'SHIRT 1', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '12', '1', '22.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '44', '2015-08-26 21:55:04', '2015-08-26 23:06:40');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('84', 'SHIRT 2', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '12', '1', '32.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '9', '2015-08-26 21:58:36', '2017-07-18 12:49:16');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('85', 'SHIRT 3', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '11', '1', '42.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '7', '2015-08-26 22:03:15', '2015-08-26 22:18:38');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('86', 'SHIRT 4', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '34.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '25', '2015-08-26 22:05:27', '2016-07-07 23:24:35');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('87', 'SHIRT 4', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '11', '1', '42.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '8', '2015-08-26 22:08:48', '2016-07-07 23:27:19');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('88', 'Polo 1', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '38.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '22', '2015-08-26 22:32:41', '2016-07-07 23:24:59');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('89', 'Polo 2', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '13', '1', '64.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '15', '2015-08-26 22:39:13', '2015-08-26 22:40:36');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('90', 'Polo 3', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '68.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '79', '2015-08-26 22:40:56', '2017-07-18 18:18:27');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('91', 'Polo 4', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '14', '1', '72.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '7', '2015-08-26 22:42:48', '2015-08-26 23:00:03');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('92', 'Polo 5', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '15', '1', '38.0000', '0', '0', '2015-08-26', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '11', '2015-08-26 22:44:49', '2015-08-26 23:06:24');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('93', 'WATCH1', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '32.0000', '0', '0', '2015-08-27', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '6', '2015-08-27 13:46:20', '2015-08-27 13:47:30');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('94', 'WATCH2', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '43.0000', '0', '0', '2015-08-27', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '4', '2015-08-27 13:46:50', '2015-08-27 13:48:36');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('95', 'WATCH3', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '38.0000', '0', '0', '2015-08-27', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '6', '2015-08-27 13:49:21', '2017-07-18 18:17:50');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('96', 'WATCH3', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '62.0000', '0', '0', '2015-08-27', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '6', '2015-08-27 13:50:44', '2015-08-27 13:55:01');
INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES ('97', 'WATCH4', '', '', '', '', '', '', '', '1000', '6', 'no_image.jpg', '0', '1', '110.0000', '0', '0', '2015-08-27', '0.00000000', '1', '0.00000000', '0.00000000', '0.00000000', '1', '1', '1', '1', '1', '10', '2015-08-27 13:52:02', '2015-08-27 13:54:48');


TRUNCATE TABLE `oc_product_attribute`;



TRUNCATE TABLE `oc_product_description`;

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('65', '1', 'Michael Stars Front Halter', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Easy and unique style that is just for you!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wrap-style halter neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Sleeveless design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Button closure with keyhole accent at nape.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hemline hits at hips.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;95% rayon, 5% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made in the U.S.A. and Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Michael Stars Jersey Lycra Twist Front Halter', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('66', '1', 'Under Armour Tank', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Be ready to train at a moments notice in the Under Armour® Tech Tank.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Loose fit is a generous, full cut for ultimate comfort and unrestricted mobility.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;UA Tech™ fabric is extremely lightweight with an ultrasoft hand and four-way stretch capability.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Signature Moisture Transport System wicks sweat to keep you dry and light.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Anti-odor technology repels odor and inhibits bacterial growth for prolonged freshness.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Deep V-neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Metallic brand logo at left chest and nape.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Under Armour Tech Tank', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('67', '1', 'Triumph Tank Top', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Fabricated from a supersoft cotton knit blend.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Triumph checked graphic at front.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Scoop neckline and sleeveless construction.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Racerback design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shirttail hem.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;50% polyester, 37% cotton, 13% rayon.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Lucky Brand Triumph Badge Tank Top', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('68', '1', 'Skirted Mio Slimming Fit One-Piece', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Showcase your refined style in timeless LAUREN Ralph Lauren™ swimwear.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shirred detailing slims the silhouette.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Solid body with contrast trim at neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Adjustable halter ties.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Bandeau neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Soft cups and flexible boning provide shape and support.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Skirted detail at hip provides coverage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Attached bikini bottom.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;85% nylon, 15% elastane;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Contrast: 92% nylon, 8% elastane;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Contrast 2: 89% polyester, 11% elastane;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Top lining: 70% nylon, 30% Lycra® elastane;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Bottom lining: 100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, line dry.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'LAUREN by Ralph Lauren Bel Aire Shirred Bandeau Skirted Mio Slimming Fit One-Piece', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('69', '1', 'Zoot Swim Set', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dive into deep end with this high-performance Zoot Sports® swim set.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Two-piece suit is fabricated from durable, chlorine-resistant Xtra Life Lycra® and provides UPF 50+ sun protection.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Flatlock stitch construction ensures next-to-skin comfort and minimizes chafing.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Streamlined fit reduces drag and increases efficiency for better performance in the water.&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shoulder straps frame the scoop neckline and meet at high racerback.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Bikini bottom sports a flat elastic waistband that sits at the hips.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Full rear coverage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Small logo hits at bust and center back of brief.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Fully lined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;80% nylon, 20% Lycra® spandex;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, dry flat.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Zoot Sports Interval Swim Set', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('70', '1', 'One-Piece Geo Diamond', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Command attention at the beach in the sultry Billabong® GI Geo One-Piece.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Printed top and solid bottoms.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;High neckline with half-zip closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Racerback detailing.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Low cut bottoms.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Cheeky rear coverage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;87% polyamide, 13% elastane.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, drip dry in shade.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Billabong Gi Geo One-Piece Geo Diamond', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('71', '1', 'Celeste Maillot One-Piece', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;You\'ll smolder in this sultry Vitamin A™ maillot.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;A sophisticated one-piece flaunts a crocheted fabrication with sheer mesh detailing at sides for a sultry style.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Plunging V-neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Halter straps tie at neck.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Removable soft cups.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Moderate rear coverage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;81% micro polyester, 19% spandex;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 92% Repreve recycled nylon, 8% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, dry flat.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made in the U.S.A.&lt;/li&gt;&lt;li&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Vitamin A Swimwear Celeste Maillot One-Piece', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('57', '1', 'Joie Layana', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Take feminine to the next level with these Layana Shorts.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Relaxed fit short in a mid-rise.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Smooth silk shorts boast a fun elephant print throughout.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Elastic waist with drawstring adjustment.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Side hand pockets.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Notched side seams.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% silk.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dry clean only.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Joie Layana', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('58', '1', 'Maywood Short', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'The North Face Maywood Short', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('50', '1', 'Kathryn Shift Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: Verdana, Arial, sans;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Let your chic style shine in this gorgeously-chic dress!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Eye-catching paisley print featured throughout.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Round neckline with split detail.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Half sleeve design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shirttail hem.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, line dry.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made in the U.S.A. and Imported.&lt;/li&gt;&lt;li class=&quot;measurements&quot; style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Measurements:&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Length: 33 in&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Product measurements were taken using size SM. Please note that measurements may vary by size.&lt;/li&gt;&lt;/ul&gt;', '', 'Brigitte Bailey Kathryn Shift Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('54', '1', 'Calvin Klein Wrap Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: Verdana, Arial, sans;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Faux-wrap dress is fabricated from a soft stretch polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Gathering at side creates a surplice neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Sleeveless design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Mock wrap skirt creates a polished look.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Concealed side zip closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;95% polyester, 5% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;li class=&quot;measurements&quot; style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Measurements:&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Length: 37 in&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Calvin Klein Wrap Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('55', '1', 'Heartwood Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Perfect for a trip outside, or a night on the town, The North Face® Heartwood Dress is ready for anything.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Sleeveless dress with double-layer fixed wrap top and shirred band at waist.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Knee-length casual dress with bra-friendly straps is ready for a variety of activities.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Plunging V-neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Side-seam hand pockets.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;56% cotton, 37% modal, 7% elastane.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'The North Face Heartwood Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('56', '1', 'Toad&amp;Co Nena Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: Verdana, Arial, sans;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;From beach to bistro and everything in between, the Nena Dress from Toad&amp;amp;Co® morphs to fit any stop in your travels.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Comfortable cotton blend fabrication with subtle stretch.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Beautiful round neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Short sleeve design can be dressed up or down.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Elastic empire waist flatters your figure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Paneled skirt is perfect for activity and supporting your movement.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hem hits at the knee.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;91% cotton, 9% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Toad&amp;Co Nena Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('51', '1', 'Brigitte Crepe Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: Verdana, Arial, sans;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;This sweet and simple dress will easily move with you from day to night.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Draped shirtdress that flows away from the body for a superbly-flattering shape.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Breezy polyester fabrication flaunts a fun arrow pattern throughout.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Jewel neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Three-quarter length sleeves.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Removable belt at natural waist.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Slip-on design and exposed back zipper closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shirttail hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, line dry.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;li class=&quot;measurements&quot; style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Measurements:&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Length: 33 in&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Brigitte Bailey Print Crepe Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('52', '1', 'KAS Ofira Halter Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;KAS New York Size Chart&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Enjoy the youthfully bohemian style of the KAS New York™ Ofira Halter Dress!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lightweight and breezy polyester fabrication.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Flaunts a vibrant print throughout.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Features a sultry open-back design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;V-neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Adjustable halter ties.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Handkerchief hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Unlined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, hang dry.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'KAS New York Ofira Halter Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('53', '1', 'Shoshanna Rio Dress', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Feminine fit-and-flare dress offers that modern sophisticated look you desire.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lightweight stretch bodice with diamond laser cut details at the front and skirt.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Round neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Sleeveless design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Concealed back zip closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;65% polyester, 24% polyamide, 11% spandex;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Combo: 94% polyester, 6% spandex;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 92% polyester, 8% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dry clean only.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;li class=&quot;measurements&quot; style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Measurements:&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Length: 42 in&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Shoshanna Rio Dress', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('59', '1', ' Ace Court Short', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;It\'s a match point game in this Nike® Ace Court Short.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Your go-to short.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dri-FIT™ high-performance polyester fabric keeps you dry by wicking perspiration away from your body and towards the surface where it can evaporate.&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wide elastic waistband provides a comfortable fit.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Compression short adds comfort and support to this tennis short.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Curved cuffs.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Swoosh™ logo at left hip.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;88% recycled polyester, 12% spandex.&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 92% recycled polyester, 8% spandex.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Nike Ace Court Short', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('60', '1', 'Patagonia Baggies Short', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;An outdoor girl\'s best friend.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Slim fit has a modern cut that hugs the body while still leaving room for movement.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Durable Supplex® nylon construction.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Durable Water Repellent (DWR) finish sheds moisture and resists staining.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Elastic waist features an interior drawstring for a secure fit.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;On-seam hand pockets with mesh bags.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Split outseam for easy movement.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% Supplex® nylon.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash warm, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Patagonia Barely Baggies Short', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('64', '1', 'Hale Bob Blouse', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Cultivate a chic look in this majestic Hale Bob™ blouse.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Semi-sheer, silk blouse is printed throughout with an eye-catching medallion pattern.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Beaded detailing featured at neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Split, button-placket.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Three-quarter length, bell sleeves.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Shirttail hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Unlined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Base layer not included.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% silk.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Hand wash cold, dry flat.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;li class=&quot;measurements&quot; style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Measurements:&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Length: 28 in&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', '', 'Hale Bob From Morroco w/ Lux 3/4 Sleeve Blouse', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('62', '1', 'Remy Short in Riviera', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Add comfort to your next sweat sesh with the Gym Vintage Short from Nike®.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Ultrasoft fabric for a great feel.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wide waistband with adjustable drawstring.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Front hand pockets.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Vented hem.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Body: 60% certified organically grown, 40% recycled polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Rib: 60% cotton, 40% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Big Star Remy Fray Hem Short in Riviera', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('63', '1', 'Pleated Halter Blouse', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;You\'ll radiate exquisite beauty in this lovely Vince Camuto® blouse.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Accordion pleating all throughout lends to whimsiscal and soft style.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Halter neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Exposed back zip closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Fully lined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% polyester;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 100% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Vince Camuto Pleated Halter Blouse', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('72', '1', 'Wake Up. Kick Ass. Tote', '&lt;ul class=&quot;product-description&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wake up[, kick tail, take names . . . Lather, rinse repeat!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Canvas tote bag with positive affirmation printed on bag.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dual handles.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Each Dogeared Jewels necklace and bracelet is packaged in a sweet and sturdy gift box.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Handcrafted in California.&lt;/li&gt;&lt;/ul&gt;', '', 'Dogeared Wake Up. Kick Ass. Sleep. Repeat. Tote', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('73', '1', 'Havana Tote', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Accessorize as if you\'re on permanent vacation.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Striped tote bag in paper straw.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Gold-tone hardware.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Top snap-button closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Rope handles.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Starfish logo charm connected to the handles.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Logo plate on exterior.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Footed bottom.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Interior zip pocket.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lined.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;100% paper pulp;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Trim: 100% polyurethane;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Lining: 100% cotton.&amp;nbsp;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Spot clean.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Lilly Pulitzer Havana Tote', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('74', '1', 'Sak Classics Crossbody', '&lt;ul class=&quot;product-description&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;A spring-summer look isn\'t complete without the crocheted Casual Classics Crossbody from The Sak™!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made of crocheted synthetic fabric.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Single crossbody strap for comfort.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Secure top-zip closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Features one zipper and two elasticized slip pockets.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Interior lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'The Sak Casual Classics Crossbody', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('75', '1', 'LeSportsac Hailey Tote', '&lt;ul class=&quot;product-description&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;You won\'t have to pack light with this spacious Hailey Tote from LeSportsac™ Luggage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made of polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Zipper closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dual flat carrying straps.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Signature logo detail around top.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Flat base to provide upright structure.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lining made of polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Interior back-wall zip pocket.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Interior front slip pocket.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'LeSportsac Hailey Tote', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('76', '1', 'Volcom Destination Tote', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Grab your gear and go, the Volcom® Destination Tote is the perfect all-day bag!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Large cotton tote bag with faux leather trim.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Roomy main zip pocket for your daily essentials.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Textured canvas with allover print for superior style.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Two exterior slip pockets for additional storage.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Adjustable, removable shoulder strap.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dual carry handles.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Logo tab detailing.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Polyester lining with zip pocket.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Materials: 55% cotton, 45% polyester.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Volcom Destination Tote', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('77', '1', 'Badgley Mischka Pearla', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Celebrate in style with the Pearla from Badgley Mischka®.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Silky satin upper.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Slip-on entry.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Rhinestone embellishment at toe.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Peep toe.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Synthetic lining and footbed.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wrapped stiletto heel.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Leather outsole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Badgley Mischka Pearla', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('78', '1', 'Joe\'s Jeans Ghost', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Embrace chic fall fashion in the Joe\'s Jeans® Ghost bootie!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Suede upper.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Crisscrossing ankle strap with buckle closures.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Peep-toe silhouette.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Man-made lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lightly padded footbed.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Stacked heel.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Man-made sole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Joe\'s Jeans Ghost', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('79', '1', 'Reef Rover Hi', '&lt;ul class=&quot;product-description&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Take your feet on a journey in the Reef® Rover Hi!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Swellular technology provides superior comfort, support, and traction.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Durable textile upper.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Comfortable elastic goring ankle strap.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Slip-on construction.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lightly padded footbed for added comfort.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Durable traction rubber outsole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Reef Rover Hi', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('80', '1', 'Vidorreta Leo', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Embrace a versatile silhouette and contemporary design with the Leo sandal!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Leather and textile upper.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Slip-on design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Open-toe, slingback silhouette.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Dual contrasting straps over vamp.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Leather and textile lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Leather and textile footbed.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Jute-wrapped midsole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Synthetic sole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Made in Spain.&lt;/li&gt;&lt;/ul&gt;', '', 'Vidorreta Leo', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('81', '1', 'Nine West Cinema', '&lt;ul class=&quot;product-description&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Step out in style with these sweet&amp;nbsp;&lt;a class=&quot;zph&quot; href=&quot;http://www.zappos.com/d/sandals&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;sandals&lt;/a&gt;!&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Adjustable buckle closure at ankle strap.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Available in a variety of uppers.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Man-made lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Lightly cushioned man-made footbed.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Wrapped platform and heel.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Man-made sole.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Nine West Cinema', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('82', '1', 'Sleeveless Chiffon Zebra Fresco', '&lt;ul style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Relax in the hammock in style with this tropical TWO by Vince Camuto® tank.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Fabricated in a lightweight chiffon with safari-inspired zebra print at the front.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Scoop neckline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Sleeveless design.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Straight hemline.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Front body: 100% polyester;&lt;br style=&quot;margin: 0px; padding: 0px;&quot;&gt;Back body: 100% rayon.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;li style=&quot;margin: 0px 0px 6px 20px; padding: 0px;&quot;&gt;Imported.&lt;/li&gt;&lt;/ul&gt;', '', 'Sleeveless Chiffon Zebra Fresco Tank Top', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('83', '1', 'Lucky Brand Neptune Records Graphic Tee', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;/ul&gt;', 'shirt, tee, men, clothing', 'Lucky Brand Neptune Records Graphic Tee', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('84', '1', 'Diesel T-Masen T-Shirt', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;/ul&gt;', '', 'Diesel T-Masen T-Shirt', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('85', '1', 'Nike SB SB Dri-FIT Icon Logo Tee', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Machine wash cold, tumble dry low.&lt;/li&gt;&lt;/ul&gt;', '', 'Nike SB SB Dri-FIT Icon Logo Tee', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('86', '1', 'Billabong Siesta Republic Tee', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', 'shirt, tee, men, clothing', 'Billabong Siesta Republic Tee', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('87', '1', 'Nike Swoosh Fly Tee', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', '', 'Nike Swoosh Fly Tee', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('88', '1', 'Cinch Athletic Poly Spandex Tech Polo Striped', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', 'shirt, tee, men, clothing', 'Cinch Athletic Poly Spandex Tech Polo Striped', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('89', '1', 'PUMA Golf Heather Stripe Polo', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', '', 'PUMA Golf Heather Stripe Polo', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('90', '1', 'Calvin Klein Short Sleeve Jersey', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', 'shirt, tee, men, clothing', 'Calvin Klein Short Sleeve Refined Jersey Auto Stripe Polo', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('91', '1', 'Nautica Short Sleeve Bold Stripe Polo', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', '', 'Nautica Short Sleeve Bold Stripe Polo', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('92', '1', 'Cinch Modern Fit Polo Stripe', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;\r\n&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Iconic style in a classic T-shirt.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Short-sleeve basketball tee sports a swoosh fly design on front.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Cotton-poly Dri-FIT jersey fabric has natural stretch and wicks sweat from the skin.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Ribbed crew neckline.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Style #689119.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;65% cotton, 35% polyester.&lt;br&gt;&lt;/li&gt;\r\n&lt;li&gt;Machine wash cold, tumble dry low.&lt;br&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;&lt;/p&gt;', 'shirt, tee, men, clothing', 'Cinch Modern Fit Polo Stripe', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('93', '1', 'Nixon The Time Teller Digi', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;This super light timepiece from Timex™ allows you to go where you want to go and tracks every memorable step!&lt;br&gt;&lt;/li&gt;&lt;li&gt;Stainless steel case back.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Silicone strap with adjustable buckle closure.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Round face.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital display.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital dial features GPS, workout memory with dated summary, stopwatch, and automatic pace alerts.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Water resistant 5 ATM/50m.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Imported.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '', 'Nixon The Time Teller Digi', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('94', '1', 'Rip Curl Drift', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;This super light timepiece from Timex™ allows you to go where you want to go and tracks every memorable step!&lt;br&gt;&lt;/li&gt;&lt;li&gt;Stainless steel case back.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Silicone strap with adjustable buckle closure.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Round face.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital display.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital dial features GPS, workout memory with dated summary, stopwatch, and automatic pace alerts.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Water resistant 5 ATM/50m.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Imported.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '', 'Rip Curl Drift', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('95', '1', 'Neff Daily Watch', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;This super light timepiece from Timex™ allows you to go where you want to go and tracks every memorable step!&lt;br&gt;&lt;/li&gt;&lt;li&gt;Stainless steel case back.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Silicone strap with adjustable buckle closure.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Round face.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital display.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital dial features GPS, workout memory with dated summary, stopwatch, and automatic pace alerts.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Water resistant 5 ATM/50m.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Imported.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '', 'Neff Daily Watch', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('96', '1', 'Timex Ironman Run X20 GPS Watch', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;This super light timepiece from Timex™ allows you to go where you want to go and tracks every memorable step!&lt;br&gt;&lt;/li&gt;&lt;li&gt;Stainless steel case back.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Silicone strap with adjustable buckle closure.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Round face.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital display.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital dial features GPS, workout memory with dated summary, stopwatch, and automatic pace alerts.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Water resistant 5 ATM/50m.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Imported.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '', 'Timex Ironman Run X20 GPS Watch', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES ('97', '1', 'Freestyle Tide Trainer', '&lt;p&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/p&gt;&lt;p&gt;Aliquam a odio turpis. Duis efficitur dui ligula, eget sagittis ante elementum sed. Nunc rutrum semper magna, nec dictum purus fermentum eu. Sed eget interdum sem. Mauris porta lobortis ligula, a elementum velit bibendum pretium. Etiam et mi mauris.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;This super light timepiece from Timex™ allows you to go where you want to go and tracks every memorable step!&lt;br&gt;&lt;/li&gt;&lt;li&gt;Stainless steel case back.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Silicone strap with adjustable buckle closure.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Round face.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital display.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Digital dial features GPS, workout memory with dated summary, stopwatch, and automatic pace alerts.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Water resistant 5 ATM/50m.&lt;br&gt;&lt;/li&gt;&lt;li&gt;Imported.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;', '', 'Freestyle Tide Trainer', '', '');


TRUNCATE TABLE `oc_product_discount`;

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('1', '73', '1', '10', '0', '89.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('2', '73', '1', '30', '0', '75.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('3', '73', '1', '100', '0', '60.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('4', '95', '1', '20', '0', '29.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('5', '95', '1', '50', '0', '22.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('6', '90', '1', '20', '0', '49.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES ('7', '90', '1', '50', '0', '41.0000', '0000-00-00', '0000-00-00');


TRUNCATE TABLE `oc_product_filter`;

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('63', '1');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('63', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('63', '5');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('70', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('71', '1');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('71', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('71', '5');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('73', '1');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('73', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('73', '5');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('75', '1');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('75', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('86', '2');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('86', '5');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('87', '2');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('87', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('88', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('88', '5');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('90', '2');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('90', '4');
INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES ('90', '5');


TRUNCATE TABLE `oc_product_image`;

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2525', '68', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2524', '68', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2507', '67', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2506', '67', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2505', '67', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2758', '66', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2757', '66', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2756', '66', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2681', '65', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2680', '65', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2679', '65', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2672', '64', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2671', '64', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2670', '64', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2750', '63', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2749', '63', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2748', '63', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2432', '62', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2431', '62', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2430', '62', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2414', '60', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2413', '60', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2412', '60', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2492', '59', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2438', '54', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2437', '54', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2385', '51', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2386', '51', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2387', '51', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2444', '52', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2443', '52', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2442', '52', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2376', '53', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2377', '53', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2378', '53', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2491', '59', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2429', '57', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2428', '57', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2406', '58', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2407', '58', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2408', '58', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2490', '59', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2427', '57', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2399', '56', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2441', '50', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2440', '50', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2439', '50', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2436', '54', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2398', '56', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2397', '56', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2435', '55', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2434', '55', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2433', '55', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2523', '68', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2520', '69', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2521', '69', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2522', '69', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2744', '70', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2743', '70', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2742', '70', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2741', '71', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2740', '71', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2739', '71', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2543', '72', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2542', '72', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2541', '72', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2778', '73', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2777', '73', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2776', '73', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2544', '74', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2545', '74', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2755', '75', 'no_image.jpg', '1');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2548', '76', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2549', '76', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2550', '76', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2754', '75', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2555', '77', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2556', '77', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2557', '77', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2558', '77', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2559', '78', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2560', '78', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2561', '78', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2562', '79', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2563', '79', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2564', '79', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2565', '80', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2566', '80', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2567', '80', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2568', '81', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2569', '81', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2570', '81', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2585', '82', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2584', '82', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2583', '82', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2702', '83', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2701', '83', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2700', '83', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2769', '84', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2768', '84', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2767', '84', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2624', '85', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2623', '85', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2622', '85', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2732', '86', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2731', '86', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2730', '86', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2747', '87', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2746', '87', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2745', '87', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2738', '88', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2737', '88', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2736', '88', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2636', '89', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2635', '89', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2634', '89', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2783', '90', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2782', '90', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2781', '90', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2684', '91', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2683', '91', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2682', '91', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2699', '92', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2698', '92', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2697', '92', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2708', '93', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2707', '93', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2710', '94', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2709', '94', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2711', '94', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2780', '95', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2779', '95', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2729', '96', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2728', '96', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2727', '96', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2726', '97', 'no_image.jpg', '0');
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES ('2725', '97', 'no_image.jpg', '0');


TRUNCATE TABLE `oc_product_option`;

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('1', '86', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('2', '87', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('3', '84', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('4', '83', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('5', '85', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('6', '88', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('7', '89', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('8', '90', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('9', '91', '11', '', '1');
INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES ('10', '92', '11', '', '1');


TRUNCATE TABLE `oc_product_option_value`;

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('3', '1', '86', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('2', '1', '86', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('4', '2', '87', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('5', '2', '87', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('6', '2', '87', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('9', '3', '84', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('8', '3', '84', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('7', '3', '84', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('10', '4', '83', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('11', '4', '83', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('12', '4', '83', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('13', '5', '85', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('14', '5', '85', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('15', '5', '85', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('16', '6', '88', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('17', '6', '88', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('18', '6', '88', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('21', '7', '89', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('20', '7', '89', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('19', '7', '89', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('22', '8', '90', '11', '48', '1000', '1', '15.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('23', '8', '90', '11', '47', '1000', '1', '10.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('25', '9', '91', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('26', '9', '91', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('27', '9', '91', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('30', '10', '92', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('29', '10', '92', '11', '47', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('28', '10', '92', '11', '48', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('1', '1', '86', '11', '46', '1000', '1', '0.0000', '+', '0', '+', '0.00000000', '+');
INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES ('24', '8', '90', '11', '46', '1000', '1', '5.0000', '+', '0', '+', '0.00000000', '+');


TRUNCATE TABLE `oc_product_recurring`;



TRUNCATE TABLE `oc_product_related`;

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('50', '51');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('50', '52');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('50', '55');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('51', '50');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('51', '52');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('51', '82');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('52', '50');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('52', '51');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('53', '55');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('54', '55');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('55', '50');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('55', '53');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('55', '54');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('55', '56');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('56', '55');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('57', '58');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('57', '59');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('57', '60');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('57', '62');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('58', '57');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('59', '57');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('59', '62');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('60', '57');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('62', '57');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('62', '59');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('63', '64');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('64', '63');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('64', '66');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('64', '82');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('65', '66');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('65', '67');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('65', '82');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('66', '64');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('66', '65');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('66', '67');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('67', '65');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('67', '66');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('68', '69');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('68', '71');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('69', '68');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('69', '70');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('69', '71');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('70', '69');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('71', '68');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('71', '69');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('71', '82');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('72', '73');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('72', '74');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('72', '76');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('73', '72');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('73', '74');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('73', '76');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('74', '72');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('74', '73');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('75', '76');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('76', '72');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('76', '73');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('76', '75');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('77', '78');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('77', '79');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('77', '80');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('77', '81');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('78', '77');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('78', '79');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('78', '81');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('79', '77');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('79', '78');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('79', '80');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('80', '77');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('80', '79');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('80', '81');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('81', '77');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('81', '78');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('81', '80');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('82', '51');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('82', '64');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('82', '65');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('82', '71');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '84');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '86');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('83', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('84', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('84', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('84', '86');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('84', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('84', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '84');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '86');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('85', '90');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('86', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('86', '84');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('86', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('86', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '84');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '86');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('87', '91');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '84');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '90');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '91');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('88', '92');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '83');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '90');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '91');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('89', '92');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('90', '85');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('90', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('90', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('90', '91');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('90', '92');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('91', '87');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('91', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('91', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('91', '90');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('91', '92');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('92', '88');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('92', '89');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('92', '90');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('92', '91');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('93', '94');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('93', '95');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('93', '96');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('93', '97');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('94', '93');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('94', '95');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('94', '96');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('94', '97');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('95', '93');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('95', '94');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('95', '96');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('95', '97');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('96', '93');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('96', '94');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('96', '95');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('96', '97');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('97', '93');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('97', '94');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('97', '95');
INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES ('97', '96');


TRUNCATE TABLE `oc_product_reward`;



TRUNCATE TABLE `oc_product_special`;

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('453', '59', '1', '0', '23.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('445', '57', '1', '0', '19.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('440', '53', '1', '0', '59.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('446', '62', '1', '0', '23.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('469', '64', '1', '0', '33.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('482', '66', '1', '0', '29.0000', '0000-00-00', '2018-06-14');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('456', '68', '1', '0', '99.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('481', '71', '1', '0', '195.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('459', '72', '1', '0', '29.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('460', '77', '1', '0', '145.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('486', '84', '1', '0', '24.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('480', '88', '1', '0', '32.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('491', '90', '1', '0', '59.0000', '0000-00-00', '2018-05-11');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('490', '95', '1', '0', '32.0000', '0000-00-00', '2018-03-21');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('478', '97', '1', '0', '99.0000', '0000-00-00', '0000-00-00');
INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES ('489', '73', '1', '0', '99.0000', '0000-00-00', '2018-05-09');


DROP TABLE IF EXISTS `oc_product_tab`;
CREATE TABLE `oc_product_tab` (
  `product_id` int(11) NOT NULL,
  `tab_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `position` tinyint(1) DEFAULT NULL,
  `show_empty` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `oc_product_tab` (`product_id`, `tab_id`, `language_id`, `text`, `position`, `show_empty`) VALUES
(90, 1, 1, '&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Aliquam fermentum porttitor tellus. Duis a diam consectetur, vulputate felis id, aliquet turpis. &lt;/span&gt;&lt;/p&gt;&lt;p&gt;Morbi ac enim urna. Pellentesque tellus odio, consectetur nec malesuada non, dapibus nec ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent eu lobortis nunc, nec condimentum justo. &lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height: 1.42857;&quot;&gt;Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 0, 0),
(59, 1, 1, '&lt;p&gt;Accessorize as if you''re on permanent vacation.&lt;br&gt;&lt;/p&gt;', 0, 0);


ALTER TABLE `oc_product_tab`
 ADD PRIMARY KEY (`product_id`,`tab_id`,`language_id`);


TRUNCATE TABLE `oc_product_to_category`;

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('50', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('51', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('52', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('53', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('54', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('55', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('56', '59');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('57', '60');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('58', '60');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('59', '60');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('60', '60');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('62', '60');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('63', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('64', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('64', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('65', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('65', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('66', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('67', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('68', '63');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('69', '63');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('70', '63');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('71', '63');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('72', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('72', '65');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('73', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('73', '65');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('74', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('74', '65');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('75', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('75', '65');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('76', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('76', '65');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('77', '66');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('78', '66');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('79', '66');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('80', '66');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('81', '66');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('82', '62');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('83', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('83', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('84', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('84', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('85', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('86', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('86', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('87', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('88', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('88', '68');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('88', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('89', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('89', '68');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('90', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('90', '68');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('90', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('91', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('91', '68');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('92', '67');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('92', '68');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('92', '69');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('93', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('93', '70');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('94', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('94', '70');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('95', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('95', '70');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('96', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('96', '70');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('97', '64');
INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES ('97', '70');


TRUNCATE TABLE `oc_product_to_download`;



TRUNCATE TABLE `oc_product_to_layout`;

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('50', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('51', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('52', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('53', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('54', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('55', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('56', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('57', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('58', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('59', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('60', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('63', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('62', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('64', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('65', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('66', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('67', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('68', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('69', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('70', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('71', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('72', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('73', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('74', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('75', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('76', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('77', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('78', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('79', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('80', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('81', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('82', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('83', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('84', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('85', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('86', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('87', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('88', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('89', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('90', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('91', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('92', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('93', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('94', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('95', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('96', '0', '0');
INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES ('97', '0', '0');


TRUNCATE TABLE `oc_product_to_store`;

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('50', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('51', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('52', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('53', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('54', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('55', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('56', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('57', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('58', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('59', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('60', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('62', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('63', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('64', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('65', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('66', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('67', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('68', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('69', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('70', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('71', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('72', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('73', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('74', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('75', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('76', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('77', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('78', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('79', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('80', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('81', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('82', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('83', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('84', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('85', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('86', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('87', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('88', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('89', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('90', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('91', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('92', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('93', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('94', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('95', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('96', '0');
INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES ('97', '0');


TRUNCATE TABLE `oc_review`;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `oc_revslider_attachment_images`;
CREATE TABLE `oc_revslider_attachment_images` (
`ID` int(10) NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oc_revslider_css`;
CREATE TABLE `oc_revslider_css` (
`id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `settings` text,
  `hover` text,
  `params` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

INSERT INTO `oc_revslider_css` (`id`, `handle`, `settings`, `hover`, `params`) VALUES
(1, '.tp-caption.lightgrey_divider', '', '', '{"text-decoration":"none","background-color":"rgba(235, 235, 235, 1)","width":"370px","height":"3px","background-position":"initial initial","background-repeat":"initial initial","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(2, '.tp-caption.large_bold_grey', '', '', '{"font-size":"60px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","text-shadow":"none","margin":"0px","padding":"1px 4px 0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(3, '.tp-caption.medium_thin_grey', '', '', '{"font-size":"34px","line-height":"30px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(102, 102, 102)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(4, '.tp-caption.small_thin_grey', '', '', '{"font-size":"18px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(117, 117, 117)","text-decoration":"none","background-color":"transparent","padding":"1px 4px 0px","text-shadow":"none","margin":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(5, '.tp-caption.large_bold_darkblue', '', '', '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(52, 73, 94)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(6, '.tp-caption.medium_bg_darkblue', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(52, 73, 94)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(7, '.tp-caption.medium_bold_red', '', '', '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(8, '.tp-caption.medium_light_red', '', '', '{"font-size":"21px","line-height":"26px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(227, 58, 12)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(9, '.tp-caption.medium_bg_red', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(227, 58, 12)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(10, '.tp-caption.medium_bold_orange', '', '', '{"font-size":"24px","line-height":"30px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(243, 156, 18)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(11, '.tp-caption.medium_bg_orange', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(243, 156, 18)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(12, '.tp-caption.medium_bg_asbestos', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(127, 140, 141)","padding":"10px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(13, '.tp-caption.large_bold_white', '', '', '{"font-size":"58px","line-height":"60px","font-weight":"800","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(14, '.tp-caption.medium_light_white', '', '', '{"font-size":"30px","line-height":"36px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(15, '.tp-caption.grassfloor', '', '', '{"text-decoration":"none","background-color":"rgba(160, 179, 151, 1)","width":"4000px","height":"150px","border-width":"0px","border-color":"rgb(34, 34, 34)","border-style":"none"}'),
(16, '.tp-caption.mediumlarge_light_white', '', '', '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","padding":"0px","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(17, '.tp-caption.mediumlarge_light_white_center', '', '', '{"font-size":"34px","line-height":"40px","font-weight":"300","font-family":"\\"Open Sans\\"","color":"#ffffff","text-decoration":"none","background-color":"transparent","padding":"0px 0px 0px 0px","text-align":"center","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(18, '.tp-caption.black_heavy_60', '', '', '{"font-size":"60px","line-height":"60px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(19, '.tp-caption.black_bold_bg_20', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(0, 0, 0)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(20, '.tp-caption.green_bold_bg_20', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(134, 181, 103)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(21, '.tp-caption.greenishbg_heavy_70', '', '', '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","padding":"50px","text-shadow":"none","background-color":"rgba(40, 67, 62, 0.8)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(22, '.tp-caption.borderbox_725x130', '', '', '{"min-width":"725px","min-height":"130px","background-color":"transparent","text-decoration":"none","border-width":"2px","border-color":"rgb(255, 255, 255)","border-style":"solid"}'),
(23, '.tp-caption.black_heavy_70', '', '', '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(24, '.tp-caption.light_heavy_70', '', '', '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(25, '.tp-caption.black_bold_40', '', '', '{"font-size":"40px","line-height":"40px","font-weight":"800","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(26, '.tp-caption.white_bold_bg_20', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(0, 0, 0)","text-decoration":"none","background-color":"rgb(255, 255, 255)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(27, '.tp-caption.red_bold_bg_20', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(224, 51, 0)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(28, '.tp-caption.blue_bold_bg_20', '', '', '{"font-size":"20px","line-height":"20px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"rgb(53, 152, 220)","padding":"5px 8px","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(29, '.tp-caption.light_heavy_40', '', '', '{"font-size":"40px","line-height":"40px","font-weight":"900","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(30, '.tp-caption.white_thin_34', '', '', '{"font-size":"35px","line-height":"35px","font-weight":"200","font-family":"Raleway","color":"rgb(255, 255, 255)","text-decoration":"none","background-color":"transparent","text-shadow":"none","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(31, '.tp-caption.light_heavy_70_shadowed', '', '', '{"font-size":"70px","line-height":"70px","font-weight":"900","font-family":"Raleway","color":"#ffffff","text-decoration":"none","background-color":"transparent","text-shadow":"0px 0px 7px rgba(0, 0, 0, 0.25)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(32, '.tp-caption.light_medium_30_shadowed', '', '', '{"font-size":"30px","line-height":"40px","font-weight":"700","font-family":"Raleway","color":"#ffffff","text-decoration":"none","background-color":"transparent","text-shadow":"0px 0px 7px rgba(0, 0, 0, 0.25)","border-width":"0px","border-color":"rgb(0, 0, 0)","border-style":"none"}'),
(33, '.tp-caption.bignumbers_white', '', '', '{"color":"#ffffff","background-color":"rgba(0, 0, 0, 0)","font-size":"84px","line-height":"84px","font-weight":"800","font-family":"Raleway","text-decoration":"none","padding":"0px 0px 0px 0px","text-shadow":"rgba(0, 0, 0, 0.247059) 0px 0px 7px","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none solid none none"}'),
(34, '.tp-caption.bignumbers_whitefdf', '', '', '{"font-size":"92px","line-height":"61px","font-weight":"500","font-family":"Raleway","color":"rgb(43, 38, 38)","text-decoration":"none","padding":"0px","text-shadow":"rgba(0, 0, 0, 0.247059) 0px 0px 7px","background-color":"rgba(0, 0, 0, 0.00784314)","border-width":"0px","border-color":"rgb(255, 255, 255)","border-style":"none"}'),
(35, '.tp-caption.simplegreat_text', '', '', '{"font-size":"30px","line-height":"40px","font-weight":"normal","font-family":"\\"Open Sans\\"","color":"#ffffff","text-decoration":"none","background-color":"transparent","padding":"0px 0px 0px 0px","text-align":"center","text-transform":"uppercase","border-width":"0px","border-color":"rgb(255, 214, 88)","border-style":"none"}'),
(36, '.tp-caption.black', '', '', '{"color":"#000","text-shadow":"none"}');

DROP TABLE IF EXISTS `oc_revslider_layer_animations`;
CREATE TABLE `oc_revslider_layer_animations` (
`id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oc_revslider_settings`;
CREATE TABLE `oc_revslider_settings` (
`id` int(9) NOT NULL,
  `general` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oc_revslider_sliders`;
CREATE TABLE `oc_revslider_sliders` (
`id` int(9) NOT NULL,
  `title` tinytext NOT NULL,
  `alias` tinytext,
  `params` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `oc_revslider_sliders` (`id`, `title`, `alias`, `params`) VALUES
(1, 'Home Slider', 'homeslider', '{"title":"Home Slider","alias":"homeslider","source_type":"gallery","post_types":"product","post_category":"category_64","post_sortby":"ID","prd_img_width":"880","prd_img_height":"345","posts_sort_direction":"DESC","max_slider_posts":"30","excerpt_limit":"55","slider_template_id":"","posts_list":"","slider_type":"fullwidth","fullscreen_offset_container":"","fullscreen_offset_size":"","fullscreen_min_height":"","full_screen_align_force":"off","auto_height":"off","force_full_width":"off","min_height":"","width":"960","height":"580","responsitive_w1":"940","responsitive_sw1":"770","responsitive_w2":"780","responsitive_sw2":"500","responsitive_w3":"510","responsitive_sw3":"310","responsitive_w4":"0","responsitive_sw4":"0","responsitive_w5":"0","responsitive_sw5":"0","responsitive_w6":"0","responsitive_sw6":"0","delay":"9000","shuffle":"off","lazy_load":"off","use_wpml":"off","enable_static_layers":"off","next_slide_on_window_focus":"off","simplify_ie8_ios4":"off","stop_slider":"off","stop_after_loops":0,"stop_at_slide":2,"show_timerbar":"top","loop_slide":"loop","position":"center","margin_top":0,"margin_bottom":0,"margin_left":0,"margin_right":0,"shadow_type":"2","padding":0,"background_color":"#E9E9E9","background_dotted_overlay":"none","show_background_image":"false","background_image":"","bg_fit":"cover","bg_repeat":"no-repeat","bg_position":"center top","stop_on_hover":"on","keyboard_navigation":"off","navigation_style":"round","navigaion_type":"bullet","navigation_arrows":"solo","navigaion_always_on":"false","hide_thumbs":200,"navigaion_align_hor":"center","navigaion_align_vert":"bottom","navigaion_offset_hor":"0","navigaion_offset_vert":20,"leftarrow_align_hor":"left","leftarrow_align_vert":"center","leftarrow_offset_hor":20,"leftarrow_offset_vert":0,"rightarrow_align_hor":"right","rightarrow_align_vert":"center","rightarrow_offset_hor":20,"rightarrow_offset_vert":0,"thumb_width":100,"thumb_height":50,"thumb_amount":5,"use_spinner":"0","spinner_color":"#FFFFFF","use_parallax":"off","disable_parallax_mobile":"off","parallax_type":"mouse","parallax_bg_freeze":"off","parallax_level_1":"5","parallax_level_2":"10","parallax_level_3":"15","parallax_level_4":"20","parallax_level_5":"25","parallax_level_6":"30","parallax_level_7":"35","parallax_level_8":"40","parallax_level_9":"45","parallax_level_10":"50","touchenabled":"on","swipe_velocity":75,"swipe_min_touches":1,"drag_block_vertical":"false","disable_on_mobile":"off","disable_kenburns_on_mobile":"off","hide_slider_under":0,"hide_defined_layers_under":0,"hide_all_layers_under":0,"hide_arrows_on_mobile":"off","hide_bullets_on_mobile":"off","hide_thumbs_on_mobile":"off","hide_thumbs_under_resolution":0,"hide_thumbs_delay_mobile":1500,"start_with_slide":"1","first_transition_active":"false","first_transition_type":"fade","first_transition_duration":300,"first_transition_slot_amount":7,"reset_transitions":"","reset_transition_duration":0,"0":"Execute settings on all slides","jquery_noconflict":"off","js_to_body":"false","output_type":"none","custom_css":"","custom_javascript":"","template":"false"}');

DROP TABLE IF EXISTS `oc_revslider_slides`;
CREATE TABLE `oc_revslider_slides` (
`id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `oc_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(2, 1, 5, '{"background_type":"image","image":"http:\\/\\/everthemes.com\\/demo\\/assets\\/no_slide.jpg","title":"Slide","state":"unpublished","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"data-slidecolor=\\"dark\\"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone"}', '[{"text":"Swim Trends","type":"text","left":0,"top":-50,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"tp-fade","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":300,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_heavy_70_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":-1,"height":-1,"serial":"0","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Summer Style List","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"100","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_medium_30_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":225,"height":56,"serial":"1","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<a href=''index.php?route=account\\/login'' class=''tp-button orange small''>Explore Models<\\/a>","type":"text","left":3,"top":70,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"randomrotate","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"150","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"small_thin_grey","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":106,"height":56,"serial":"2","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(3, 1, 4, '{"background_type":"image","image":"http:\\/\\/everthemes.com\\/demo\\/assets\\/no_slide.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"data-slidecolor=\\"dark\\"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","0":"Remove"}', '[{"text":"Back to School","type":"text","left":0,"top":-50,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"tp-fade","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":300,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_heavy_70_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":310,"height":56,"serial":"0","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Versatile, comfy and fun styles","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"100","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_medium_30_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":452,"height":56,"serial":"1","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<a href=''index.php?route=checkout\\/cart'' class=''tp-button orange small''>Shop Now<\\/a>","type":"text","left":0,"top":70,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"150","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"small_thin_grey","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":91,"height":45,"serial":"2","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(4, 1, 2, '{"background_type":"image","image":"http:\\/\\/everthemes.com\\/demo\\/assets\\/no_slide.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"data-slidecolor=\\"dark\\"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","0":"Remove"}', '[{"text":"Wear Now, Wear Later","type":"text","left":0,"top":-50,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"tp-fade","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":300,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_heavy_70_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":550,"height":56,"serial":"0","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"A how-to guide","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfl","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"100","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_medium_30_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":187,"height":56,"serial":"1","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<a href=''index.php?route=product\\/product&product_id=59'' class=''tp-button blue small''>See Recommendations<\\/a>","type":"text","left":0,"top":74,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"150","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"small_thin_grey","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":167,"height":45,"serial":"2","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(5, 1, 3, '{"background_type":"image","image":"http:\\/\\/everthemes.com\\/demo\\/assets\\/no_slide.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","0":"Remove"}', '[{"text":"Swim Essentials","type":"text","left":0,"top":-50,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"tp-fade","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":300,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_heavy_70_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":532,"height":56,"serial":"0","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<a href=''index.php?route=product\\/category&path=63'' class=''tp-button red small''>Shop Now<\\/a>","type":"text","left":0,"top":70,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfb","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"150","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"small_thin_grey","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":91,"height":45,"serial":"1","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"See our top five","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lft","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"100","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_medium_30_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":189,"height":56,"serial":"2","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]'),
(6, 1, 1, '{"background_type":"image","image":"http:\\/\\/everthemes.com\\/demo\\/assets\\/no_slide.jpg","title":"Slide","state":"published","date_from":"","date_to":"","slide_transition":"random","0":"Remove","slot_amount":7,"transition_rotation":0,"transition_duration":300,"delay":"","save_performance":"off","enable_link":"false","link_type":"regular","link":"","link_open_in":"same","slide_link":"nothing","link_pos":"front","slide_thumb":"","class_attr":"","id_attr":"","attr_attr":"","data_attr":"data-slidecolor=\\"dark\\"","slide_bg_color":"#E7E7E7","slide_bg_external":"","bg_fit":"cover","bg_fit_x":"100","bg_fit_y":"100","bg_repeat":"no-repeat","bg_position":"center top","bg_position_x":"0","bg_position_y":"0","bg_end_position_x":"0","bg_end_position_y":"0","bg_end_position":"center top","kenburn_effect":"off","kb_start_fit":"100","kb_end_fit":"100","kb_duration":"9000","kb_easing":"Linear.easeNone","0":"Remove"}', '[{"text":"Casual Office Looks","type":"text","left":0,"top":-50,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"tp-fade","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"10","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":300,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_heavy_70_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":572,"height":56,"serial":"0","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"Create a polished look with one-of-a-kind styles","type":"text","left":0,"top":0,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfl","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"100","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"light_medium_30_shadowed","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":578,"height":56,"serial":"1","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""},{"text":"<a href=''index.php?route=product\\/special'' class=''tp-button green small''>Browse Styles<\\/a>","type":"text","left":0,"top":70,"loop_animation":"none","loop_easing":"Power3.easeInOut","loop_speed":"2","loop_startdeg":"-20","loop_enddeg":"20","loop_xorigin":"50","loop_yorigin":"50","loop_xstart":"0","loop_xend":"0","loop_ystart":"0","loop_yend":"0","loop_zoomstart":"1","loop_zoomend":"1","loop_angle":"0","loop_radius":"10","animation":"lfr","easing":"Power3.easeInOut","split":"none","endsplit":"none","splitdelay":"150","endsplitdelay":"10","max_height":"auto","max_width":"auto","2d_rotation":"0","2d_origin_x":"50","2d_origin_y":"50","parallax_level":"-","whitespace":"nowrap","static_start":"1","static_end":"2","speed":600,"align_hor":"center","align_vert":"middle","hiddenunder":false,"resizeme":true,"link":"","link_open_in":"same","link_slide":"nothing","scrollunder_offset":"","style":"small_thin_grey","time":500,"endtime":"8700","endspeed":300,"endanimation":"auto","endeasing":"nothing","corner_left":"nothing","corner_right":"nothing","width":116,"height":56,"serial":"2","endTimeFinal":8700,"endSpeedFinal":300,"realEndTime":9000,"timeLast":8500,"endWithSlide":true,"alt":"","scaleX":"","scaleY":"","scaleProportional":false,"attrID":"","attrClasses":"","attrTitle":"","attrRel":"","link_id":"","link_class":"","link_title":"","link_rel":""}]');

DROP TABLE IF EXISTS `oc_revslider_static_slides`;
CREATE TABLE `oc_revslider_static_slides` (
`id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `oc_revslider_attachment_images`
 ADD PRIMARY KEY (`ID`);

ALTER TABLE `oc_revslider_css`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `oc_revslider_layer_animations`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `oc_revslider_settings`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `oc_revslider_sliders`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `oc_revslider_slides`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `oc_revslider_static_slides`
 ADD PRIMARY KEY (`id`);


ALTER TABLE `oc_revslider_attachment_images`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `oc_revslider_css`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
ALTER TABLE `oc_revslider_layer_animations`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
ALTER TABLE `oc_revslider_settings`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
ALTER TABLE `oc_revslider_sliders`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `oc_revslider_slides`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
ALTER TABLE `oc_revslider_static_slides`
MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;



TRUNCATE TABLE `oc_setting`;

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('4', '0', 'tax', 'tax_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('7', '0', 'tax', 'tax_sort_order', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('34', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('35', '0', 'flat', 'flat_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('36', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('37', '0', 'flat', 'flat_tax_class_id', '9', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('41', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('146', '0', 'category', 'category_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('158', '0', 'account', 'account_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('159', '0', 'affiliate', 'affiliate_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('2271', '0', 'category_accordion', 'category_accordion_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5956', '0', 'blogsetting', 'blogsetting_post_thumbs_h', '570', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10858', '0', 'config', 'config_ajaxadvancedsearch_color_headinghover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10859', '0', 'config', 'config_ajaxadvancedsearch_color_model', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10860', '0', 'config', 'config_ajaxadvancedsearch_color_modelhover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10861', '0', 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10862', '0', 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10863', '0', 'config', 'config_ajaxadvancedsearch_color_price', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10864', '0', 'config', 'config_ajaxadvancedsearch_color_pricehover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10865', '0', 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10866', '0', 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10867', '0', 'config', 'config_ajaxadvancedsearch_color_quantity', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10868', '0', 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10869', '0', 'config', 'config_ajaxadvancedsearch_color_evenresult', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10870', '0', 'config', 'config_ajaxadvancedsearch_color_oddresult', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10871', '0', 'config', 'config_ajaxadvancedsearch_color_resulthover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10872', '0', 'config', 'config_ajaxadvancedsearch_displayallresults', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10873', '0', 'config', 'config_ajaxadvancedsearch_model', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10874', '0', 'config', 'config_ajaxadvancedsearch_manufacturer', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10875', '0', 'config', 'config_ajaxadvancedsearch_price', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10876', '0', 'config', 'config_ajaxadvancedsearch_pricelogin', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10877', '0', 'config', 'config_ajaxadvancedsearch_rating', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10878', '0', 'config', 'config_ajaxadvancedsearch_stock', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10879', '0', 'config', 'config_ajaxadvancedsearch_quantity', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10880', '0', 'config', 'config_ajaxadvancedsearch_model_search', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10881', '0', 'config', 'config_ajaxadvancedsearch_tag', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10882', '0', 'config', 'config_ajaxadvancedsearch_mpn', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10883', '0', 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10884', '0', 'config', 'config_ajaxadvancedsearch_isbn', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10885', '0', 'config', 'config_ajaxadvancedsearch_jan', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10886', '0', 'config', 'config_ajaxadvancedsearch_ean', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10887', '0', 'config', 'config_ajaxadvancedsearch_upc', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10888', '0', 'config', 'config_ajaxadvancedsearch_sku', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10889', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10890', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10891', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10857', '0', 'config', 'config_ajaxadvancedsearch_color_heading', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10856', '0', 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10855', '0', 'config', 'config_ajaxadvancedsearch_color_default', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10854', '0', 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10853', '0', 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10852', '0', 'config', 'config_ajaxadvancedsearch_highlight', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10851', '0', 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10850', '0', 'config', 'config_ajaxadvancedsearch_color_highlight', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10849', '0', 'config', 'config_ajaxadvancedsearch_result_view', 'border-bottom', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10848', '0', 'config', 'config_ajaxadvancedsearch_image_height', '50', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10847', '0', 'config', 'config_ajaxadvancedsearch_image_width', '50', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10846', '0', 'config', 'config_ajaxadvancedsearch_image', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10845', '0', 'config', 'config_ajaxadvancedsearch_charlimit', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10844', '0', 'config', 'config_ajaxadvancedsearch_limit', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10843', '0', 'config', 'config_ajaxadvancedsearch', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10842', '0', 'config', 'config_mail_alert', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10841', '0', 'config', 'config_mail_smtp_timeout', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10840', '0', 'config', 'config_mail_smtp_port', '25', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10839', '0', 'config', 'config_mail_smtp_password', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10838', '0', 'config', 'config_mail_smtp_username', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10837', '0', 'config', 'config_mail_smtp_hostname', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10836', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10835', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10834', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10833', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10832', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10831', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10830', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10829', '0', 'config', 'config_ftp_hostname', 'localhost', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10828', '0', 'config', 'config_image_location_height', '50', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10827', '0', 'config', 'config_image_location_width', '268', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10826', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10825', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10824', '0', 'config', 'config_image_wishlist_height', '47', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10823', '0', 'config', 'config_image_wishlist_width', '47', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10822', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10821', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10820', '0', 'config', 'config_image_related_height', '265', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10819', '0', 'config', 'config_image_related_width', '265', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10818', '0', 'config', 'config_image_additional_height', '74', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10817', '0', 'config', 'config_image_additional_width', '74', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10816', '0', 'config', 'config_image_product_height', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10815', '0', 'config', 'config_image_product_width', '260', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10814', '0', 'config', 'config_image_popup_height', '900', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10813', '0', 'config', 'config_image_popup_width', '900', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10812', '0', 'config', 'config_image_thumb_height', '650', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10811', '0', 'config', 'config_image_thumb_width', '550', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10810', '0', 'config', 'config_image_category_height', '80', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10809', '0', 'config', 'config_image_category_width', '80', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10808', '0', 'config', 'config_icon', 'catalog/cart.png', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10807', '0', 'config', 'config_logo', 'catalog/sellegance-logo.png', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10806', '0', 'config', 'config_captcha_page', '["register","review","return","contact"]', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10805', '0', 'config', 'config_captcha', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10804', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10803', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10802', '0', 'config', 'config_affiliate_mail', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10801', '0', 'config', 'config_affiliate_id', '4', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10800', '0', 'config', 'config_affiliate_commission', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10799', '0', 'config', 'config_affiliate_auto', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10798', '0', 'config', 'config_affiliate_approval', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10797', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10796', '0', 'config', 'config_stock_warning', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('706', '0', 'glade', 'glade_custom_icon', '{"1":{"class":"","url":"","target":"_self"},"2":{"class":"","url":"","target":"_self"},"3":{"class":"","url":"","target":"_self"},"4":{"class":"","url":"","target":"_self"},"5":{"class":"","url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('699', '0', 'glade', 'glade_header_info_text', '{"1":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('700', '0', 'glade', 'glade_footer_modules', '4', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('701', '0', 'glade', 'glade_footer_info_text', '{"1":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('702', '0', 'glade', 'glade_copyright', '{"1":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('703', '0', 'glade', 'glade_social_header', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('704', '0', 'glade', 'glade_social_footer', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('705', '0', 'glade', 'glade_social', '{"facebook":{"class":"facebook","url":"","target":"_self"},"twitter":{"class":"twitter","url":"","target":"_self"},"google-plus":{"class":"google-plus","url":"","target":"_self"},"rss":{"class":"rss","url":"","target":"_self"},"pinterest":{"class":"pinterest","url":"","target":"_self"},"instagram":{"class":"instagram","url":"","target":"_self"},"linkedin":{"class":"linkedin","url":"","target":"_self"},"vimeo":{"class":"vimeo","url":"","target":"_self"},"youtube":{"class":"youtube","url":"","target":"_self"},"flickr":{"class":"flickr","url":"","target":"_self"},"vk":{"class":"vk","url":"","target":"_self"},"dribbble":{"class":"dribbble","url":"","target":"_self"},"spotify":{"class":"spotify","url":"","target":"_self"},"tumblr":{"class":"tumblr","url":"","target":"_self"},"xing":{"class":"xing","url":"","target":"_self"},"wordpress":{"class":"wordpress","url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('698', '0', 'glade', 'glade_logo_position', 'center', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('697', '0', 'glade', 'glade_infopages_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('696', '0', 'glade', 'glade_infopages_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('695', '0', 'glade', 'glade_infopages_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('690', '0', 'glade', 'glade_custom_block_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('691', '0', 'glade', 'glade_custom_block_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('692', '0', 'glade', 'glade_custom_block_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('693', '0', 'glade', 'glade_custom_block', '{"1":{"status":"2","1":{"content":"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"}},"2":{"status":"2","1":{"content":"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"}},"3":{"status":"2","1":{"content":"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"}},"4":{"status":"2","1":{"content":"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"}}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('694', '0', 'glade', 'glade_menu_infopages', 'vertical', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('689', '0', 'glade', 'glade_custom_block_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('687', '0', 'glade', 'glade_menu_dropdown_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('688', '0', 'glade', 'glade_menu_dropdown', '{"1":{"status":"2","1":{"title":""},"url":"","target":"_self"},"2":{"status":"2","1":{"title":""},"url":"","target":"_self"},"3":{"status":"2","1":{"title":""},"url":"","target":"_self"},"4":{"status":"2","1":{"title":""},"url":"","target":"_self"},"5":{"status":"2","1":{"title":""},"url":"","target":"_self"},"6":{"status":"2","1":{"title":""},"url":"","target":"_self"},"7":{"status":"2","1":{"title":""},"url":"","target":"_self"},"8":{"status":"2","1":{"title":""},"url":"","target":"_self"},"9":{"status":"2","1":{"title":""},"url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('686', '0', 'glade', 'glade_menu_dropdown_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('685', '0', 'glade', 'glade_menu_dropdown_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('684', '0', 'glade', 'glade_menu_dropdown_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('683', '0', 'glade', 'glade_menu_link', '{"1":{"status":"2","1":{"title":"","url":""},"target":"_self"},"2":{"status":"2","1":{"title":"","url":""},"target":"_self"},"3":{"status":"2","1":{"title":"","url":""},"target":"_self"},"4":{"status":"2","1":{"title":"","url":""},"target":"_self"},"5":{"status":"2","1":{"title":"","url":""},"target":"_self"},"6":{"status":"2","1":{"title":"","url":""},"target":"_self"},"7":{"status":"2","1":{"title":"","url":""},"target":"_self"},"8":{"status":"2","1":{"title":"","url":""},"target":"_self"},"9":{"status":"2","1":{"title":"","url":""},"target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('682', '0', 'glade', 'glade_brands_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('681', '0', 'glade', 'glade_brands_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('680', '0', 'glade', 'glade_menu_brands_x_row', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('679', '0', 'glade', 'glade_brands_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('678', '0', 'glade', 'glade_menu_brands', 'logoname', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('677', '0', 'glade', 'glade_categories_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('676', '0', 'glade', 'glade_categories_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('675', '0', 'glade', 'glade_3rd_level_cat', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('674', '0', 'glade', 'glade_menu_categories_x_row', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('673', '0', 'glade', 'glade_menu_category_icons', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('672', '0', 'glade', 'glade_categories_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('671', '0', 'glade', 'glade_menu_categories', 'inline', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('670', '0', 'glade', 'glade_homepage_link_style', 'icon', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('652', '0', 'glade', 'glade_normal_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('653', '0', 'glade', 'glade_old_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('654', '0', 'glade', 'glade_new_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('655', '0', 'glade', 'glade_onsale_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('656', '0', 'glade', 'glade_pattern_overlay', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('657', '0', 'glade', 'glade_custom_pattern', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('658', '0', 'glade', 'glade_custom_image', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('659', '0', 'glade', 'glade_full_background', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('660', '0', 'glade', 'glade_title_font', 'Roboto', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('661', '0', 'glade', 'glade_title_font_size', '35', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('662', '0', 'glade', 'glade_body_font', 'Roboto', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('663', '0', 'glade', 'glade_body_font_size', '13', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('664', '0', 'glade', 'glade_small_font', 'Roboto', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('665', '0', 'glade', 'glade_small_font_size', '11', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('666', '0', 'glade', 'glade_cyrillic_fonts', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('667', '0', 'glade', 'glade_banners_overlay', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('668', '0', 'glade', 'glade_sticky_menu', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('669', '0', 'glade', 'glade_fullwidth_dropdown_menu', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('651', '0', 'glade', 'glade_product_name_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('650', '0', 'glade', 'glade_lighttext_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('649', '0', 'glade', 'glade_content_links_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('648', '0', 'glade', 'glade_bodytext_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('647', '0', 'glade', 'glade_title_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('646', '0', 'glade', 'glade_background_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('645', '0', 'glade', 'glade_2button_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('712', '0', 'glade_store_id', 'glade_store_id', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('644', '0', 'glade', 'glade_button_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('643', '0', 'glade', 'glade_footer_links_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('642', '0', 'glade', 'glade_footer_text_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('641', '0', 'glade', 'glade_footer_title_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('640', '0', 'glade', 'glade_footer_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('639', '0', 'glade', 'glade_footer_combination', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('638', '0', 'glade', 'glade_dropdown_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('637', '0', 'glade', 'glade_dropdown_menu_combination', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('636', '0', 'glade', 'glade_header_links_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('635', '0', 'glade', 'glade_header_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('618', '0', 'glade', 'glade_subcat_thumb_height', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('619', '0', 'glade', 'glade_product_details_layout', 'tabs', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('620', '0', 'glade', 'glade_product_image_position', 'left', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('621', '0', 'glade', 'glade_cloud_zoom', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('622', '0', 'glade', 'glade_zoom_position', 'right', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('623', '0', 'glade', 'glade_zoom_width', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('624', '0', 'glade', 'glade_zoom_height', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('625', '0', 'glade', 'glade_zoom_autosize', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('626', '0', 'glade', 'glade_quickview_categories', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('627', '0', 'glade', 'glade_quickview_modules', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('628', '0', 'glade', 'glade_quickview_mobile', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('629', '0', 'glade', 'glade_show_wishlist', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('630', '0', 'glade', 'glade_show_compare', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('631', '0', 'glade', 'glade_show_sale_tag', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('632', '0', 'glade', 'glade_carousel_autoplay', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('633', '0', 'glade', 'glade_custom_colors', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('634', '0', 'glade', 'glade_header_combination', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('614', '0', 'glade', 'glade_product_animation', 'static', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('615', '0', 'glade', 'glade_subcat_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('616', '0', 'glade', 'glade_subcat_thumbnails_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('617', '0', 'glade', 'glade_subcat_thumb_width', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('613', '0', 'glade', 'glade_category_image', 'left', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('612', '0', 'glade', 'glade_revslider_layout', 'regular', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('611', '0', 'glade', 'glade_main_layout', 'fullwidth', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('707', '0', 'glade', 'glade_custom_stylesheet', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('708', '0', 'glade', 'glade_custom_css_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('709', '0', 'glade', 'glade_custom_css', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('710', '0', 'glade', 'glade_custom_js_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('711', '0', 'glade', 'glade_custom_js', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('713', '0', 'basic_captcha', 'basic_captcha_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('714', '0', 'blog_category', 'blog_category_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10795', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10794', '0', 'config', 'config_api_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10793', '0', 'config', 'config_order_mail', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10792', '0', 'config', 'config_fraud_status_id', '7', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10791', '0', 'config', 'config_complete_status', '["5","3"]', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10790', '0', 'config', 'config_processing_status', '["5","1","2","12","3"]', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10789', '0', 'config', 'config_order_status_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10788', '0', 'config', 'config_checkout_id', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10787', '0', 'config', 'config_checkout_guest', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10786', '0', 'config', 'config_cart_weight', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10785', '0', 'config', 'config_invoice_prefix', 'INV-2013-00', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10784', '0', 'config', 'config_account_mail', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10783', '0', 'config', 'config_account_id', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10782', '0', 'config', 'config_login_attempts', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10781', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10780', '0', 'config', 'config_customer_group_display', '["1"]', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10779', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10778', '0', 'config', 'config_customer_online', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10777', '0', 'config', 'config_tax_customer', 'shipping', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10776', '0', 'config', 'config_tax_default', 'shipping', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10775', '0', 'config', 'config_tax', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10774', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10773', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10772', '0', 'config', 'config_review_mail', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10771', '0', 'config', 'config_review_guest', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10770', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10769', '0', 'config', 'config_limit_admin', '20', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10768', '0', 'config', 'config_product_description_length', '100', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10767', '0', 'config', 'config_product_limit', '15', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10766', '0', 'config', 'config_product_count', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10765', '0', 'config', 'config_weight_class_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10764', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10763', '0', 'config', 'config_currency_auto', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10762', '0', 'config', 'config_currency', 'USD', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10761', '0', 'config', 'config_admin_language', 'en', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10760', '0', 'config', 'config_language', 'en', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10759', '0', 'config', 'config_zone_id', '3563', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10758', '0', 'config', 'config_country_id', '222', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10754', '0', 'config', 'config_fax', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10755', '0', 'config', 'config_image', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10756', '0', 'config', 'config_open', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10757', '0', 'config', 'config_comment', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10745', '0', 'config', 'config_meta_keyword', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10746', '0', 'config', 'config_template', 'sellegance', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10747', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10748', '0', 'config', 'config_name', 'Sellegance - OpenCart Theme', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10749', '0', 'config', 'config_owner', 'Sellegance - OpenCart Theme', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10750', '0', 'config', 'config_address', 'Address 1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10751', '0', 'config', 'config_geocode', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10752', '0', 'config', 'config_email', 'sample@mail.com', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10753', '0', 'config', 'config_telephone', '123456789', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10744', '0', 'config', 'config_meta_description', 'Sellegance', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10743', '0', 'config', 'config_meta_title', 'Sellegance - OpenCart Theme', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5955', '0', 'blogsetting', 'blogsetting_post_thumbs_w', '1140', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5953', '0', 'blogsetting', 'blogsetting_share', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5954', '0', 'blogsetting', 'blogsetting_post_thumb', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5952', '0', 'blogsetting', 'blogsetting_post_author', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5951', '0', 'blogsetting', 'blogsetting_post_page_view', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5950', '0', 'blogsetting', 'blogsetting_post_comments_count', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5949', '0', 'blogsetting', 'blogsetting_post_date_added', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5948', '0', 'blogsetting', 'blogsetting_author', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5947', '0', 'blogsetting', 'blogsetting_page_view', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5946', '0', 'blogsetting', 'blogsetting_comments_count', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5945', '0', 'blogsetting', 'blogsetting_date_added', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5944', '0', 'blogsetting', 'blogsetting_thumbs_h', '430', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5943', '0', 'blogsetting', 'blogsetting_thumbs_w', '860', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5942', '0', 'blogsetting', 'blogsetting_layout', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5941', '0', 'blogsetting', 'blogsetting_blogs_per_page', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5940', '0', 'blogsetting', 'blogsetting_home_meta_keyword', 'a:1:{s:2:"en";s:0:"";}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5939', '0', 'blogsetting', 'blogsetting_home_meta_description', 'a:1:{s:2:"en";s:0:"";}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5938', '0', 'blogsetting', 'blogsetting_home_description', 'a:1:{s:2:"en";s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5937', '0', 'blogsetting', 'blogsetting_home_page_title', 'a:1:{s:2:"en";s:4:"Blog";}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5936', '0', 'blogsetting', 'blogsetting_home_title', 'a:1:{s:2:"en";s:4:"Blog";}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5935', '0', 'blog_category', 'blog_category_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5957', '0', 'blogsetting', 'blogsetting_rel_blog_per_row', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5958', '0', 'blogsetting', 'blogsetting_rel_thumb', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5959', '0', 'blogsetting', 'blogsetting_rel_thumbs_w', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5960', '0', 'blogsetting', 'blogsetting_rel_thumbs_h', '210', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5961', '0', 'blogsetting', 'blogsetting_rel_characters', '100', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5962', '0', 'blogsetting', 'blogsetting_comment_per_page', '6', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5963', '0', 'blogsetting', 'blogsetting_comment_approve', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5964', '0', 'blogsetting', 'blogsetting_comment_notification', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5965', '0', 'blogsetting', 'blogsetting_author_change', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10738', '0', 'sellegance', 'sellegance_custom_css_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10737', '0', 'sellegance', 'sellegance_custom_stylesheet', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10735', '0', 'sellegance', 'sellegance_facebook_widget', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10736', '0', 'sellegance', 'sellegance_custom_icon', '{"1":{"class":"","url":"","target":"_self"},"2":{"class":"","url":"","target":"_self"},"3":{"class":"","url":"","target":"_self"},"4":{"class":"","url":"","target":"_self"},"5":{"class":"","url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10733', '0', 'sellegance', 'sellegance_social_footer', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10734', '0', 'sellegance', 'sellegance_social', '{"facebook":{"class":"facebook","url":"https:\\/\\/www.facebook.com\\/home.php","target":"_self"},"twitter":{"class":"twitter","url":"https:\\/\\/twitter.com\\/everthemes","target":"_self"},"google-plus":{"class":"google-plus","url":"","target":"_self"},"rss":{"class":"rss","url":"","target":"_self"},"pinterest":{"class":"pinterest","url":"https:\\/\\/www.pinterest.com\\/everthemes","target":"_self"},"instagram":{"class":"instagram","url":"","target":"_self"},"linkedin":{"class":"linkedin","url":"","target":"_self"},"vimeo":{"class":"vimeo","url":"","target":"_self"},"youtube":{"class":"youtube","url":"","target":"_self"},"flickr":{"class":"flickr","url":"","target":"_self"},"vk":{"class":"vk","url":"","target":"_self"},"dribbble":{"class":"dribbble","url":"","target":"_self"},"spotify":{"class":"spotify","url":"","target":"_self"},"tumblr":{"class":"tumblr","url":"","target":"_self"},"xing":{"class":"xing","url":"","target":"_self"},"wordpress":{"class":"wordpress","url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10731', '0', 'sellegance', 'sellegance_copyright', '{"1":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10732', '0', 'sellegance', 'sellegance_social_header', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10729', '0', 'sellegance', 'sellegance_footer_modules', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10730', '0', 'sellegance', 'sellegance_footer_info_text', '{"1":"&lt;p&gt;Aenean nec tempus diam. Nulla risus elit, efficitur ac diam ut, sollicitudin bibendum lorem. Vivamus quis sem metus.&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10728', '0', 'sellegance', 'sellegance_header_info_text', '{"1":"&lt;p&gt;Order anytime and always receive &lt;span style=&quot;font-weight: bold;&quot;&gt;Fast, Free Shipping&lt;\\/span&gt; on all orders over $100!&lt;br&gt;&lt;\\/p&gt;"}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10727', '0', 'sellegance', 'sellegance_searchbox_regular', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10726', '0', 'sellegance', 'sellegance_logo_position', 'center', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10720', '0', 'sellegance', 'sellegance_custom_block_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10721', '0', 'sellegance', 'sellegance_custom_block', '{"1":{"status":"0","1":{"content":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}},"2":{"status":"0","1":{"content":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}},"3":{"status":"0","1":{"content":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}},"4":{"status":"0","1":{"content":"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;"}}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10725', '0', 'sellegance', 'sellegance_infopages_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10724', '0', 'sellegance', 'sellegance_infopages_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10723', '0', 'sellegance', 'sellegance_infopages_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10722', '0', 'sellegance', 'sellegance_menu_infopages', 'vertical', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10716', '0', 'sellegance', 'sellegance_menu_dropdown', '{"1":{"status":"0","1":{"title":""},"url":"","target":"_self"},"2":{"status":"0","1":{"title":""},"url":"","target":"_self"},"3":{"status":"0","1":{"title":""},"url":"","target":"_self"},"4":{"status":"0","1":{"title":""},"url":"","target":"_self"},"5":{"status":"0","1":{"title":""},"url":"","target":"_self"},"6":{"status":"0","1":{"title":""},"url":"","target":"_self"},"7":{"status":"0","1":{"title":""},"url":"","target":"_self"},"8":{"status":"0","1":{"title":""},"url":"","target":"_self"},"9":{"status":"0","1":{"title":""},"url":"","target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10719', '0', 'sellegance', 'sellegance_custom_block_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10718', '0', 'sellegance', 'sellegance_custom_block_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10717', '0', 'sellegance', 'sellegance_custom_block_status', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10715', '0', 'sellegance', 'sellegance_menu_dropdown_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10714', '0', 'sellegance', 'sellegance_menu_dropdown_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10713', '0', 'sellegance', 'sellegance_menu_dropdown_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10712', '0', 'sellegance', 'sellegance_menu_dropdown_status', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10711', '0', 'sellegance', 'sellegance_menu_link', '{"1":{"status":"1","1":{"title":"Blog","url":"index.php?route=blog\\/home"},"target":"_self"},"2":{"status":"0","1":{"title":"","url":""},"target":"_self"},"3":{"status":"0","1":{"title":"","url":""},"target":"_self"},"4":{"status":"0","1":{"title":"","url":""},"target":"_self"},"5":{"status":"0","1":{"title":"","url":""},"target":"_self"},"6":{"status":"0","1":{"title":"","url":""},"target":"_self"},"7":{"status":"0","1":{"title":"","url":""},"target":"_self"},"8":{"status":"0","1":{"title":"","url":""},"target":"_self"},"9":{"status":"0","1":{"title":"","url":""},"target":"_self"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10710', '0', 'sellegance', 'sellegance_brands_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10709', '0', 'sellegance', 'sellegance_brands_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10708', '0', 'sellegance', 'sellegance_menu_brands_x_row', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10707', '0', 'sellegance', 'sellegance_brands_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10706', '0', 'sellegance', 'sellegance_menu_brands', 'name', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10705', '0', 'sellegance', 'sellegance_categories_tag_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10704', '0', 'sellegance', 'sellegance_categories_tag', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10702', '0', 'sellegance', 'sellegance_menu_categories_x_row', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10703', '0', 'sellegance', 'sellegance_3rd_level_cat', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10701', '0', 'sellegance', 'sellegance_menu_category_icons', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10700', '0', 'sellegance', 'sellegance_categories_top_title', '{"1":""}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10699', '0', 'sellegance', 'sellegance_menu_categories', 'inline', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10698', '0', 'sellegance', 'sellegance_homepage_link_style', 'icon', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10697', '0', 'sellegance', 'sellegance_fullwidth_dropdown_menu', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10696', '0', 'sellegance', 'sellegance_sticky_menu', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10695', '0', 'sellegance', 'sellegance_cyrillic_fonts', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10694', '0', 'sellegance', 'sellegance_small_font_size', '11', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10693', '0', 'sellegance', 'sellegance_small_font', 'Lato', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10692', '0', 'sellegance', 'sellegance_body_font_size', '13', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10690', '0', 'sellegance', 'sellegance_title_font_size', '35', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10691', '0', 'sellegance', 'sellegance_body_font', 'Lato', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10689', '0', 'sellegance', 'sellegance_title_font', 'Lato', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10688', '0', 'sellegance', 'sellegance_full_background', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10687', '0', 'sellegance', 'sellegance_custom_image', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10686', '0', 'sellegance', 'sellegance_custom_pattern', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10683', '0', 'sellegance', 'sellegance_onsale_text_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10684', '0', 'sellegance', 'sellegance_categories_active_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10685', '0', 'sellegance', 'sellegance_pattern_overlay', '5', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10682', '0', 'sellegance', 'sellegance_onsale_background_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10681', '0', 'sellegance', 'sellegance_new_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10742', '0', 'sellegance_store_id', 'sellegance_store_id', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10680', '0', 'sellegance', 'sellegance_old_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10679', '0', 'sellegance', 'sellegance_normal_price_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10678', '0', 'sellegance', 'sellegance_product_name_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10677', '0', 'sellegance', 'sellegance_2button_text_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10676', '0', 'sellegance', 'sellegance_2button_hover_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10675', '0', 'sellegance', 'sellegance_2button_normal_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10674', '0', 'sellegance', 'sellegance_button_text_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10672', '0', 'sellegance', 'sellegance_button_normal_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10673', '0', 'sellegance', 'sellegance_button_hover_bg', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10671', '0', 'sellegance', 'sellegance_footer_links_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10670', '0', 'sellegance', 'sellegance_footer_text_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10669', '0', 'sellegance', 'sellegance_lighttext_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10668', '0', 'sellegance', 'sellegance_content_links_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10667', '0', 'sellegance', 'sellegance_bodytext_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10666', '0', 'sellegance', 'sellegance_title_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10665', '0', 'sellegance', 'sellegance_background_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10664', '0', 'sellegance', 'sellegance_dropdown_hover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10663', '0', 'sellegance', 'sellegance_dropdown_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10662', '0', 'sellegance', 'sellegance_menu_hover', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10661', '0', 'sellegance', 'sellegance_menu_color', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10660', '0', 'sellegance', 'sellegance_menu_accent', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10658', '0', 'sellegance', 'sellegance_menu_style', 'light', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10659', '0', 'sellegance', 'sellegance_custom_colors', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10655', '0', 'sellegance', 'sellegance_related_carousel', 'on', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10657', '0', 'sellegance', 'sellegance_skins', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10656', '0', 'sellegance', 'sellegance_carousel_autoplay', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10654', '0', 'sellegance', 'sellegance_featured_carousel', 'on', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10653', '0', 'sellegance', 'sellegance_show_sale_bubble', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10652', '0', 'sellegance', 'sellegance_show_compare', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10651', '0', 'sellegance', 'sellegance_show_wishlist', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10650', '0', 'sellegance', 'sellegance_quickview_mobile', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10649', '0', 'sellegance', 'sellegance_quickview_modules', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10648', '0', 'sellegance', 'sellegance_quickview_categories', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10646', '0', 'sellegance', 'sellegance_zoom_height', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10647', '0', 'sellegance', 'sellegance_zoom_autosize', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10644', '0', 'sellegance', 'sellegance_zoom_position', 'right', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10645', '0', 'sellegance', 'sellegance_zoom_width', '360', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10642', '0', 'sellegance', 'sellegance_product_details_layout', 'accordion', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10643', '0', 'sellegance', 'sellegance_cloud_zoom', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10641', '0', 'sellegance', 'sellegance_subcat_thumb_height', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10640', '0', 'sellegance', 'sellegance_subcat_thumb_width', '90', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10639', '0', 'sellegance', 'sellegance_subcat_thumbnails_status', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10637', '0', 'sellegance', 'sellegance_rollover_images', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10310', '0', 'newsletter', 'newsletter_global_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10638', '0', 'sellegance', 'sellegance_subcat_status', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10636', '0', 'sellegance', 'sellegance_responsive_layout', 'large', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10635', '0', 'sellegance', 'sellegance_main_layout', 'boxed', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10739', '0', 'sellegance', 'sellegance_custom_css', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10740', '0', 'sellegance', 'sellegance_custom_js_status', '2', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10741', '0', 'sellegance', 'sellegance_custom_js', '', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10892', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10893', '0', 'config', 'config_secure', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10894', '0', 'config', 'config_password', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10895', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10896', '0', 'config', 'config_encryption', 'mYn2BBIXgUQNWjNNfDXgldgUirnyAzYgItTUTsMAs3jba268MK2o1Cw7UVhuZD3FMQNWY9RbjnZmcTT7M3N1sP5SP92Hg1YbyBDi3CwebqNpjNbcLJC3S8iakHqq8KyVVxW1hB1dkrioFhZrvOqHdaTu4tEjkyaLKWteL4Mk3EV2lj2Q0uYYNQj7lRWfGHNE0xObIHy3cd66BQzyP4G1TnftfnTi6j2IO19ZPS6JW0NORJS7aGZJj4lhhNARgdGg6c4j1GEgQwdszCndUAApCfYoder2jvVMjyRT0bA2lg4avwSNKXfkxzqYWQKJVLMg9uH0jY4QVAB5mfy8naYaasa17h29FhPFnSvgIdvHUIsppWsuRQKGJ9FxuDaYYdhNdVLwGnvaKwhzgXyh9TV9mgorQRuI6wfevHoOj57mNIaoUjuAnTRkOCRlQk8J7GiHRHjQsq25LxSjT3luGP6IQxnCn4Pbd9BMVL9CycS1RZuDaKTR7rTqTUkwxpytRCET6q5n3EZg2ZLNaFAvk3XtQWDRqFj4fmB1O6I35MHJSE2FS5aQ8L5x012ehhFy7vOOES3s5P6DNK2gHXhXR82oo5PQKUEJczTlf7093zvR24AMHpzAgyjYvKa432SWCjX0OzhMgsvNpUr1szPA5gyWcNYpNhcYVKv5KmidBNqSb3HzgcmssAJz4OOn5DO6NULbOQ0f5i4C4XLV5k9oBxbsBMPF2XDQVXSiuqmsHQ399CbjLvHr9YRBs7lesxfipgeCtiH4cEso2a3472HOBCTMYIA5O8cqoG3GdEMUE11WGP3XcvjJF6Qmwy236A5n8D3UWqFBZxxhuoGuUjWnIUWvSgCCrcfz5gGoYYEm0eHbKHnQSeFGgFtJsy8cwlRBR2kzH6ICimgSUA9hUBhE3IVIN6fjnx7JLyTnYSaroU2AzveZGSh3rTp9VrVc1dvwSl1T7IjsNvGTyIeSZ5dTGstUENO4aRFRaPISPeSedkVPcc9yfgJ3DWDeAbNrH0A4AwoW', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10897', '0', 'config', 'config_file_max_size', '300000', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10898', '0', 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10899', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10900', '0', 'config', 'config_error_display', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10901', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10902', '0', 'config', 'config_error_filename', 'error.log', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('10903', '0', 'filter', 'filter_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5217', '0', 'live_options', 'live_options_show_type', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5218', '0', 'live_options', 'live_options_show_options_type', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5219', '0', 'live_options', 'live_options_use_cache', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5220', '0', 'live_options', 'live_options_calculate_quantity', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5221', '0', 'live_options', 'live_options_ajax_status', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5222', '0', 'live_options', 'live_options_container', '#content', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5223', '0', 'live_options', 'live_options_special_container', '.price-new-live', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5224', '0', 'live_options', 'live_options_price_container', '.price-old-live', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5225', '0', 'live_options', 'live_options_tax_container', '.price-tax-live', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5226', '0', 'live_options', 'live_options_points_container', '.spend-points-live', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5227', '0', 'live_options', 'live_options_reward_container', '.get-reward-live', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5228', '0', 'live_search', 'live_search_show_image', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5229', '0', 'live_search', 'live_search_show_price', '1', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5230', '0', 'live_search', 'live_search_show_description', '0', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5231', '0', 'live_search', 'live_search_view_all_results', '{"1":{"name":"View All"}}', '1');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5232', '0', 'live_search', 'live_search_limit', '10', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5233', '0', 'live_search', 'live_search_image_width', '50', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5234', '0', 'live_search', 'live_search_image_height', '50', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5235', '0', 'live_search', 'live_search_title_length', '100', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5236', '0', 'live_search', 'live_search_description_length', '100', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5237', '0', 'live_search', 'live_search_min_length', '3', '0');
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES ('5238', '0', 'live_search', 'live_search_ajax_status', '1', '0');


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `oc_testimonial`;
CREATE TABLE `oc_testimonial` (
`testimonial_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `rating` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `oc_testimonial` (`testimonial_id`, `name`, `city`, `email`, `status`, `rating`, `date_added`) VALUES
(1, 'Sarah', 'New York', 'sarah.ny@gmail.com', 1, 5, '2015-08-26 17:33:19'),
(2, 'Pedro', 'Madrid', 'pedro@gmail.com', 1, 5, '2015-08-26 17:34:28');

DROP TABLE IF EXISTS `oc_testimonial_description`;
CREATE TABLE `oc_testimonial_description` (
  `testimonial_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `oc_testimonial_description` (`testimonial_id`, `language_id`, `title`, `description`) VALUES
(1, 1, 'A great shopping experience!', 'Sed pellentesque hendrerit felis, eu rutrum turpis ultricies et. Nunc mollis justo vitae turpis porta, sed ultricies odio egestas. In et fermentum massa. Nam et magna ante. In vitae pretium mauris. '),
(2, 1, 'Will be buying more soon', 'Nam non malesuada ex, id ornare ex. Curabitur consectetur dolor ut vulputate volutpat. Suspendisse eu volutpat eros, sed cursus sapien. ');


ALTER TABLE `oc_testimonial`
 ADD PRIMARY KEY (`testimonial_id`);

ALTER TABLE `oc_testimonial_description`
 ADD PRIMARY KEY (`testimonial_id`,`language_id`);


ALTER TABLE `oc_testimonial`
MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;


TRUNCATE TABLE `oc_user_group`;

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES ('1', 'Administrator', '{"access":["analytics\\/google_analytics","blog\\/blog","blog\\/blog_category","blog\\/blog_comment","blog\\/blog_setting","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","catalog\\/tab","catalog\\/testimonial","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/theme","event\\/theme","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/module\\/live_options","extension\\/module\\/live_search","extension\\/newsletter","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/theme","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/advanced_slideshow","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bannerplus","module\\/bestseller","module\\/blog_category","module\\/blog_latest","module\\/brainyfilter","module\\/carousel","module\\/category","module\\/category_accordion","module\\/countdown","module\\/ebay_listing","module\\/featured","module\\/featured_categories","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/laybuy_layout","module\\/live_options","module\\/live_search","module\\/newsletter","module\\/pp_button","module\\/pp_login","module\\/revslideropencart","module\\/revslideroutput","module\\/sagepay_direct_cards","module\\/sagepay_server_cards","module\\/sellegance","module\\/slideshow","module\\/special","module\\/store","module\\/tabbed_products","module\\/testimonial","module\\/twittertl","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","openbay\\/fba","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cardinity","payment\\/cheque","payment\\/cod","payment\\/eway","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/laybuy","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","theme\\/theme_default","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission"],"modify":["analytics\\/google_analytics","blog\\/blog","blog\\/blog_category","blog\\/blog_comment","blog\\/blog_setting","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","catalog\\/tab","catalog\\/testimonial","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/language","design\\/layout","design\\/theme","event\\/theme","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/module\\/live_options","extension\\/module\\/live_search","extension\\/newsletter","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/theme","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/advanced_slideshow","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bannerplus","module\\/bestseller","module\\/blog_category","module\\/blog_latest","module\\/brainyfilter","module\\/carousel","module\\/category","module\\/category_accordion","module\\/countdown","module\\/ebay_listing","module\\/featured","module\\/featured_categories","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/laybuy_layout","module\\/live_options","module\\/live_search","module\\/newsletter","module\\/pp_button","module\\/pp_login","module\\/revslideropencart","module\\/revslideroutput","module\\/sagepay_direct_cards","module\\/sagepay_server_cards","module\\/sellegance","module\\/slideshow","module\\/special","module\\/store","module\\/tabbed_products","module\\/testimonial","module\\/twittertl","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","openbay\\/fba","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cardinity","payment\\/cheque","payment\\/cod","payment\\/eway","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/laybuy","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","theme\\/theme_default","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission"]}');
INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES ('10', 'Demonstration', '');