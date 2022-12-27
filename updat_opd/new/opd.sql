-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2022 at 02:28 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(22, 'HEALTH & NUTRITION', 'Health & Nutrition', '2021-11-28 17:54:19'),
(23, 'SKIN CARE', 'Skin Care', '2021-11-29 22:26:16'),
(24, 'URBAN COLOR', 'Urban Color', '2021-11-29 22:26:49'),
(26, 'AGRICULTURE', 'Agriculture', '2021-11-29 22:29:29'),
(27, 'AUTO CARE', 'Auto Care', '2021-11-29 22:30:05'),
(28, 'FOOD & BEVERAGES', 'Food & Beverages', '2021-11-29 22:31:42'),
(29, 'DIVINE', 'Divine', '2021-11-29 22:37:04'),
(31, 'PERSONAL-CARE', 'Personal-Care', '2021-11-29 22:38:18'),
(32, 'JEWELLERY', 'Jewellery', '2021-11-29 22:38:55'),
(33, 'HOME CARE & BABY CARE', 'Home Care & Baby Care', '2021-12-02 20:43:18'),
(34, 'WATCH', 'Watch Men Women', '2022-02-18 15:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(255) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `giftdetails`
--

CREATE TABLE `giftdetails` (
  `id` int(255) NOT NULL,
  `orderId` int(255) NOT NULL,
  `gift` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(180, 126, 69, 1),
(181, 127, 161, 1),
(182, 128, 70, 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `username1` varchar(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `code` varchar(25) NOT NULL,
  `mca` int(9) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `giftStatus` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0-No gift 1-gift taken',
  `payStatus` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '0=Incomepleted  1=online 2=Cash',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `username1`, `userId`, `code`, `mca`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `giftStatus`, `payStatus`, `orderStatus`, `orderDate`) VALUES
(126, 'Naim', 50, 'bayad123', 78945612, 'bayad, ', 0, 9876543210, 205, '0', '0', '2', '0', '2022-03-24 19:46:49'),
(127, 'Chagan', 50, 'bayad123', 98798700, 'bayad, ', 0, 7845963210, 32, '0', '0', '0', '0', '2022-03-24 21:16:38'),
(128, 'Neel NikunjKumar Soni', 52, 'bayad123', 87945612, 'Bayad, ', 0, 7874866543, 4625, '0', '0', '0', '0', '2022-03-26 15:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `paydetails`
--

CREATE TABLE `paydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pay` int(255) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paydetails`
--

INSERT INTO `paydetails` (`id`, `orderId`, `pay`, `datetime`) VALUES
(19, 126, 150, '2022-03-24 19:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaPrice1` float NOT NULL,
  `pizzaPrice2` float NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaPrice1`, `pizzaPrice2`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(69, 'Well Amla', 205, 123, 4.56, 'Code: HL2025   Shade Name: \r\nDP: 205.00   BV: 123.00   PV: 4.56\r\nWeight(gm): 55.00', 22, '2021-11-28 17:57:40'),
(70, 'Well Turmeric', 925, 555, 20.56, 'Code: HL2053   Shade Name: \r\nDP: 925.00   BV: 555.00   PV: 20.56\r\nWeight(gm): 55.00', 22, '2021-11-28 18:01:23'),
(71, 'Well Brahmi', 400, 240, 8.89, 'Code: HL2029   Shade Name: \r\nDP: 400.00   BV: 240.00   PV: 8.89\r\nWeight(gm): 55.00', 22, '2021-11-29 22:44:52'),
(72, 'Well Brain Activ', 1030, 618, 22.89, 'Code: HL2054   Shade Name: \r\nDP: 1030.00   BV: 618.00   PV: 22.89\r\nWeight(gm): 43.00', 22, '2021-11-29 22:45:59'),
(74, 'Well Multivitamin Multimineral', 350, 210, 7.78, 'Code: HL2009   Shade Name: Well Multivitamin-Multimineral Tablets (New MRP)\r\nDP: 350.00   BV: 210.00   PV: 7.78\r\nWeight(gm): 78.00', 22, '2021-12-02 14:43:32'),
(86, 'Well Amrit Shakti', 380, 228.62, 8.47, 'Code: HL2003   Shade Name: Well Amrit Shakti (Pack Of 100 Soft Gels) (New MRP)\r\nDP: 380.00   BV: 228.62   PV: 8.47\r\nWeight(gm): 75.00', 22, '2021-12-02 18:47:55'),
(87, 'Well Ashwagandha', 400, 240, 8.89, 'Code: HL2026   Shade Name: \r\nDP: 400.00   BV: 240.00   PV: 8.89\r\nWeight(gm): 60.00', 22, '2021-12-02 19:59:21'),
(88, 'Modicare Well Calcium Complex (60 Tablets) (New MRP)', 440, 264, 9.78, 'Code: HL2014   Shade Name: \r\nDP: 440.00   BV: 264.00   PV: 9.78\r\nWeight(gm): 138.00', 22, '2021-12-02 20:00:44'),
(89, 'Well Cardio Activ', 450, 270, 10, 'Code: HL2001   Shade Name: \r\nDP: 450.00   BV: 270.00   PV: 10.00\r\nWeight(gm): 75.00', 22, '2021-12-02 20:01:29'),
(90, 'Well intellecte', 800, 480, 17.78, 'Code: HL1006   Shade Name: Well Intellecte (30 Capsules) (New MRP)\r\nDP: 800.00   BV: 480.00   PV: 17.78\r\nWeight(gm): 56.00', 22, '2021-12-02 20:02:41'),
(91, 'Well Omega 3 Antarctic Krill Oil', 1350, 810, 30, 'Code: HL2024   Shade Name: \r\nDP: 1350.00   BV: 810.00   PV: 30.00\r\nWeight(gm): 46.00', 22, '2021-12-02 20:03:41'),
(93, 'Well D tox', 470, 282, 10.44, 'Code: HL2002   Shade Name: Modicare Well D-Tox (60 Tablets) (New MRP)\r\nDP: 470.00   BV: 282.00   PV: 10.44\r\nWeight(gm): 76.00\r\n', 22, '2021-12-02 20:04:44'),
(94, 'Well Shilajit Ojas Gold With Kesar & Safed Musli', 525, 262.5, 9.72, 'Code: HL2015   Shade Name: \r\nDP: 525.00   BV: 262.50   PV: 9.72\r\nWeight(gm): 42.00', 22, '2021-12-02 20:05:55'),
(95, 'Well Vitamin D3', 434, 260.4, 9.64, 'Code: HL2068   Shade Name: \r\nDP: 434.00   BV: 260.40   PV: 9.64\r\nWeight(gm): 130.00', 22, '2021-12-02 20:06:44'),
(96, 'Well Vitamin C', 434, 260.4, 9.64, 'Code: HL2066   Shade Name: \r\nDP: 434.00   BV: 260.40   PV: 9.64\r\nWeight(gm): 130.00', 22, '2021-12-02 20:07:45'),
(97, 'Well Triphala', 260, 156, 5.78, 'Code: HL2074   Shade Name: \r\nDP: 260.00   BV: 156.00   PV: 5.78\r\nWeight(gm): 83.00', 22, '2021-12-02 20:09:05'),
(98, 'Well Vitamin B-Complex', 434, 260.4, 9.64, 'Code: HL2072   Shade Name: \r\nDP: 434.00   BV: 260.40   PV: 9.64\r\nWeight(gm): 90.00', 22, '2021-12-02 20:10:49'),
(100, 'Well Protein Crest (Velvet Chocolate)', 1225, 735, 27.22, 'Code: HL1003   Shade Name: \r\nDP: 1225.00   BV: 735.00   PV: 27.22\r\nWeight(gm): 688.00', 22, '2021-12-02 20:14:20'),
(101, 'Well Korean Red Ginseng (6 Years Old)', 2000, 1200, 44.44, 'Code: HL1008   Shade Name: \r\nDP: 2000.00   BV: 1200.00   PV: 44.44\r\nWeight(gm): 58.00\r\n', 22, '2021-12-02 20:15:43'),
(102, 'Well Chyawanprash', 187, 74.8, 2.77, 'Code: HL2058   Shade Name: \r\nDP: 187.00   BV: 74.80   PV: 2.77\r\nWeight(gm): 570.00', 22, '2021-12-02 20:17:40'),
(104, 'Well Noni Juice Concentrate', 499, 199.6, 7.39, 'Code: HL2006   Shade Name: Well Noni Juice Concentrate (1 L) (New MRP)\r\nDP: 499.00   BV: 199.60   PV: 7.39\r\nWeight(gm): 1253.00', 22, '2021-12-02 20:25:39'),
(105, 'Well Iron Folic Acid', 283, 169.8, 6.29, 'Code: HL2067   Shade Name: \r\nDP: 283.00   BV: 169.80   PV: 6.29\r\nWeight(gm): 80.00', 22, '2021-12-02 20:26:56'),
(107, 'Well Aloe Vera Juice', 300, 120, 4.44, 'Code: HL2011   Shade Name: \r\nDP: 300.00   BV: 120.00   PV: 4.44\r\nWeight(gm): 1110.00', 22, '2021-12-02 20:29:55'),
(111, 'Fruit Of The Earth Instant Blended Coffee', 150, 60, 2.22, 'Code: FP3009   Shade Name: Fruit of the Earth Blended Instant Coffee\r\nDP: 150.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 239.00', 22, '2021-12-02 20:57:09'),
(112, 'Well Karela Jamun Juice', 315, 126, 4.67, 'Code: HL2071   Shade Name: \r\nDP: 315.00   BV: 126.00   PV: 4.67\r\nWeight(gm): 1215.00\r\n', 22, '2021-12-02 20:59:02'),
(113, 'Well Glucosamine', 1290, 774, 28.67, 'Code: HL1005   Shade Name: \r\nDP: 1290.00   BV: 774.00   PV: 28.67\r\nWeight(gm): 146.00', 22, '2021-12-02 21:00:51'),
(114, 'Well Garlic Pearls', 335, 201.54, 7.46, 'Code: HL2005   Shade Name: Well Garlic Pearls (Pack Of 100 Soft Gels) (New MRP)\r\nDP: 335.00   BV: 201.54   PV: 7.46\r\nWeight(gm): 75.00', 22, '2021-12-02 21:01:31'),
(115, 'WELL GILOY 60 N', 199, 119.4, 4.42, 'Code: HL2065   Shade Name: \r\nDP: 199.00   BV: 119.40   PV: 4.42\r\nWeight(gm): 55.00', 22, '2021-12-02 21:03:21'),
(119, 'Baby Spa Nourishing Soap', 63, 34.65, 1.28, 'Baby Spa Nourishing Soap\r\nCode: BC0002   Shade Name: \r\nDP: 63.00   BV: 34.65   PV: 1.28\r\nWeight(gm): 79.00', 33, '2021-12-02 21:10:05'),
(121, 'Baby Talc Powder', 80, 44, 1.63, 'Code: BC0009   Shade Name: \r\nDP: 80.00   BV: 44.00   PV: 1.63\r\nWeight(gm): 128.00', 33, '2021-12-02 21:11:03'),
(123, 'Essensual Hand & Body Lotion (Allantoin & Vit. E)', 160, 95.24, 3.53, 'Code: PC5243   Shade Name: \r\nDP: 160.00   BV: 95.24   PV: 3.53\r\nWeight(gm): 117.00', 31, '2021-12-02 21:13:18'),
(124, 'Fresh Moments Blue Toothpaste PC2000', 70, 35, 1.3, 'Code: PC2000   Shade Name: Modicare Fresh Moments 2 Tooth Paste - 100G (New MRP)\r\nDP: 70.00   BV: 35.00   PV: 1.30\r\nWeight(gm): 131.00', 31, '2021-12-02 21:15:05'),
(125, 'Modicare Environ Chip Laptop', 1250, 750, 27.78, 'Code: HL2070   Shade Name: \r\nDP: 1250.00   BV: 750.00   PV: 27.78\r\nWeight(gm): 23.00', 31, '2021-12-02 21:16:46'),
(126, 'Modicare Environ Router Chip', 865, 519, 19.22, 'Code: HL2069   Shade Name: \r\nDP: 865.00   BV: 519.00   PV: 19.22\r\nWeight(gm): 20.00\r\n', 31, '2021-12-02 21:18:38'),
(127, 'Modicare Environ Pink Magneta Chip', 600, 360, 13.33, 'Code: HL0002   Shade Name: \r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 20.00', 31, '2021-12-02 21:19:36'),
(128, 'Modicare Anti Radiation Environ Blue Chip', 600, 360, 13.33, 'Code: HL0002   Shade Name: \r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 20.00', 31, '2021-12-02 21:20:27'),
(129, 'Modicare Anti Radiation Environ Black Chip', 600, 360, 13.33, 'Code: HL0002   Shade Name: \r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 20.00', 31, '2021-12-02 21:21:06'),
(130, 'Modicare Anti Radiation Environ Silver Chip', 600, 360, 13.33, 'Code: HL0002   Shade Name: \r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 20.00', 31, '2021-12-02 21:21:55'),
(131, 'Sofwash Glycerine & Honey Bar  Orange Soap', 155, 77.5, 2.87, 'Code: PC4003   Shade Name: Sofwash Glycerin & Honey Bar ( 100G X 2) (New MRP)\r\nDP: 155.00   BV: 77.50   PV: 2.87\r\nWeight(gm): 237.00', 31, '2021-12-02 21:23:25'),
(132, 'Salon Professional Advance Formula Nourish & Shine Hair Oil', 115, 57.5, 2.13, 'Code: PC5280   Shade Name: \r\nDP: 115.00   BV: 57.50   PV: 2.13\r\nWeight(gm): 102.00', 31, '2021-12-03 14:00:24'),
(133, 'Sofwash Anti-Bacterial Soap New', 49, 24.5, 0.91, 'Code: PC4014   Shade Name: \r\nDP: 49.00   BV: 24.50   PV: 0.91\r\nWeight(gm): 84.00', 31, '2021-12-03 14:02:17'),
(134, 'Washmate Popular Detergent Powder 1Kg', 160, 56, 2.07, 'Code: LC1018   Shade Name: \r\nDP: 160.00   BV: 56.00   PV: 2.07\r\nWeight(gm): 1012.00', 31, '2021-12-03 14:04:51'),
(135, 'Well Tulsi ', 400, 240, 8.89, 'Code: HL2028   Shade Name: \r\nDP: 400.00   BV: 240.00   PV: 8.89\r\nWeight(gm): 55.00', 22, '2022-02-18 14:15:04'),
(136, 'Soul Flavours Premium Basmati Rice ', 750, 150, 5.56, 'Code: FP3107   Shade Name: \r\nDP: 750.00   BV: 150.00   PV: 5.56\r\nWeight(gm): 5050.00', 28, '2022-02-18 14:32:18'),
(137, ' Soul Flavours Shahi Paneer - FP3079', 195, 39, 1.44, 'Code: FP3079   Shade Name: \r\nDP: 195.00   BV: 39.00   PV: 1.44\r\nWeight(gm): 334.00', 28, '2022-02-18 14:37:52'),
(138, 'Soul Flavours Malai Kofta FP3081  ', 173, 34.6, 1.28, 'Code: FP3081   Shade Name: \r\nDP: 173.00   BV: 34.60   PV: 1.28\r\nWeight(gm): 340.00', 28, '2022-02-18 14:41:18'),
(139, 'Soul Flavours Rajma  FP3085 ', 93, 18.69, 3.69, 'Code: FP3085   Shade Name: \r\nDP: 93.00   BV: 18.69   PV: 0.69\r\nWeight(gm): 334.00', 28, '2022-02-18 14:48:09'),
(140, 'Fruit Of The Earth 100% Pure Instant Coffee FP3008  ', 150, 60, 2.22, 'Code: FP3008   Shade Name: Fruit of the Earth 100% Pure Instant Coffee\r\nDP: 150.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 239.00', 28, '2022-02-18 14:52:09'),
(141, 'Soul Flavours Honey', 315, 126, 4.67, 'Code: FP0010   Shade Name: \r\nDP: 315.00   BV: 126.00   PV: 4.67\r\nWeight(gm): 550.00', 28, '2022-02-18 14:54:47'),
(142, 'Fruit Of The Earth Coconut Oil', 199, 39.8, 1.47, 'Code: FP0006   Shade Name: \r\nDP: 199.00   BV: 39.80   PV: 1.47\r\nWeight(gm): 523.00', 28, '2022-02-18 14:59:11'),
(144, 'Soul Flavours Chatpata Amla Candy', 265, 106, 3.93, 'Code: FP0009   Shade Name: \r\nDP: 265.00   BV: 106.00   PV: 3.93\r\nWeight(gm): 580.00', 28, '2022-02-18 15:07:20'),
(146, 'Soul Flavours Cow Ghee', 625, 62.5, 2.31, 'Code: FP0016   Shade Name: \r\nDP: 625.00   BV: 62.50   PV: 2.31\r\nWeight(gm): 945.00', 28, '2022-02-18 15:15:37'),
(149, 'Washmate Matic Concentrated Detergent - LC2015 Powder ', 145, 50.75, 1.88, 'Code: LC2015   Shade Name: \r\nDP: 145.00   BV: 50.75   PV: 1.88\r\nWeight(gm): 507.00', 31, '2022-02-18 15:33:39'),
(150, 'SM LADIES  SILVER PLATED DIAL GOLD WATCH - WAT027', 2608, 1303.91, 48.29, 'Code: WAT027   Shade Name: \r\nDP: 2608.00   BV: 1303.91   PV: 48.29\r\nWeight(gm): 240.00\r\n', 34, '2022-02-18 15:37:44'),
(151, 'Beyond Blue - HC0027 ', 160, 80, 2.96, 'Makes your toilet clean, germ - free & hygienically fresh in just 90 seconds. Unique colour changing formula shows the product working.. Convenient and easy to use.', 33, '2022-02-18 15:41:09'),
(152, 'Fresh Moments Gel Toothpaste  ', 90, 45, 1.67, 'Green ToothPaste  Code: PC2004    \r\nDP: 90.00   BV: 45.00   PV: 1.67', 33, '2022-02-18 16:08:24'),
(153, 'Fresh Moments Ayurvedic Herbal Toothpaste - PC0036', 55, 13.75, 0.51, 'Orange ToothPaste', 33, '2022-02-18 16:10:28'),
(156, 'Sofwash 3 In 1 Hand Wash, Shower Gel & Bubble Bath - Citrusy Lime ', 160, 96, 3.56, 'Code: PC4002   Shade Name: \r\nDP: 160.00   BV: 96.00   PV: 3.56\r\nWeight(gm): 326.00', 33, '2022-02-18 16:22:33'),
(157, 'Velocity Men Oil Clear Face Wash (50Gm)', 125, 75, 2.78, 'PC5009 DP: 125.00   BV: 75.00   PV: 2.78', 31, '2022-02-18 16:25:28'),
(159, 'Fresh Moments Toothbrush', 150, 75, 2.78, 'Code: PC2002   Shade Name: Fresh Moments Tooth Brush (Pack Of 4) (New MRP)\r\nDP: 150.00   BV: 75.00   PV: 2.78', 31, '2022-02-18 16:30:20'),
(160, 'Sofwash Aloe Vera, Neem & Tulsi soap', 33, 8.25, 0.31, 'Code: PC4010    \r\nDP: 33.00   BV: 8.25   PV: 0.31', 23, '2022-02-18 16:34:54'),
(161, 'Sofwash Sandal Soap New', 32, 8, 0.3, 'Code: PC4011    \r\nDP: 32.00   BV: 8.00   PV: 0.30', 23, '2022-02-18 16:35:57'),
(162, 'Sofwash White Pearl Soap', 183, 91.5, 3.39, 'Code: PC5229   Shade Name: SOFWASH WHITE PEARL SOAP (75G X 4)\r\nDP: 183.00   BV: 91.50   PV: 3.39', 31, '2022-02-18 16:37:04'),
(163, 'Baby Spa Diaper Rash Cream', 150, 82.5, 3.06, 'Code: BC0007   Shade Name: \r\nDP: 150.00   BV: 82.50   PV: 3.06\r\nWeight(gm): 58.00', 33, '2022-02-18 16:38:03'),
(165, 'Essensual Cold Cream', 173, 86.52, 3.2, 'Code: PC0078    \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nEssensual Cold Cream with the goodness of Shea Butter, Olive Oil & Aloe Vera deeply nourishes and moisturizes dry, rough & flaky skin leaving it soft, supple and nourished.', 24, '2022-02-18 16:41:36'),
(167, 'Essensual Soft & Smooth Intensive Foot Care Cream', 210, 125.66, 4.65, 'Code: PC5244   Shade Name: \r\nDP: 210.00   BV: 125.66   PV: 4.65\r\nWeight(gm): 115.00', 31, '2022-02-18 16:44:18'),
(168, 'Salon Professional Amla Hair Oil', 60, 24, 0.89, 'Code: PC0034   Shade Name: \r\nDP: 60.00   BV: 24.00   PV: 0.89\r\nWeight(gm): 103.00', 33, '2022-02-18 16:45:39'),
(169, 'Salon Professional Advance Formula Dandruff Care Shampoo - 288ml(6ml*48 sachets) Blue', 168, 67.2, 2.49, 'Code: PC0047   Shade Name: Blue\r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00', 31, '2022-02-18 16:46:49'),
(170, 'Salon Professional Advance Formula Hair Fall Defense Shampoo - 288ml(6ml*48 sachets) Green', 168, 67.2, 2.49, 'Code: PC0048   Shade Name: Green \r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00', 31, '2022-02-18 16:48:08'),
(171, 'Salon Professional Advance Formula Smooth & Shine Shampoo - 288ml(6ml*48 sachets) Pink', 168, 67.2, 2.49, 'Code: PC0049   Shade Name: Pink\r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00\r\n', 31, '2022-02-18 16:49:31'),
(172, 'Fruit Of The Earth Shampoo With Arnica & Tea Tree Oil (Dandruff Control) ', 175, 87.5, 3.24, 'Code: PC1005   Shade Name: Fote-Shampoo With Arnica And Tea Tree Oil 200 (New MRP)\r\nDP: 175.00   BV: 87.50   PV: 3.24\r\nWeight(gm): 262.00\r\n', 31, '2022-02-18 16:50:35'),
(173, 'Salon Professional Hair Color-Chocolate (4)', 415, 166, 6.15, 'Code: PC5235   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00\r\nMade in Italy, Ammonia & Paraben Free, Enriched with Argan Oil, Olive Oil & Ayurvedic Mix Salon Professional Hair Colouring Crème with the goodness of Argan Oil, Olive Oil & an Ayurvedic Ingredient mix is perfect for complete grey coverage, luster and a vibrant long-lasting color. Ayurvedic ingredients like Sesame, Brahmi and Neem are ideal to protect and nourish the hair shaft.', 24, '2022-02-18 16:52:28'),
(176, 'Salon Professional Argan Oil of Morocco - Shampoo', 405, 243, 9, 'Code: PC5284   Shade Name: \r\nDP: 405.00   BV: 243.00   PV: 9.00\r\nWeight(gm): 236.00', 31, '2022-02-18 17:38:40'),
(181, 'Well Amla Juice', 320, 128, 4.74, 'Code: HL2012   Shade Name: \r\nDP: 320.00   BV: 128.00   PV: 4.74\r\nWeight(gm): 1090.00', 22, '2022-02-18 17:48:17'),
(182, 'Medium / Large (1Navy Blue Mask + 1 Black Mask) New', 199, 99.5, 3.69, 'Code: HL2032  HL2031\r\nShade Name: \r\nDP: 199.00   BV: 99.50   PV: 3.69\r\nWeight(gm): 48.00', 22, '2022-02-18 17:51:15'),
(183, 'Orange', 173, 103.83, 3.85, 'Code: UCL002   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.85\r\nWeight(gm): 21.00', 24, '2022-02-18 17:52:51'),
(184, 'Rosewood', 299, 179.5, 6.65, 'Code: UCL101   Shade Name: Rosewood\r\nDP: 299.00   BV: 179.50   PV: 6.65\r\nWeight(gm): 26.00', 24, '2022-02-18 17:54:30'),
(185, 'Power Matte Transfer Proof Liquid Lip Color', 435, 260.87, 9.66, 'Code: UCL601   Shade Name: Ruby Shock\r\nDP: 435.00   BV: 260.87   PV: 9.66\r\nWeight(gm): 28.00', 24, '2022-02-18 17:55:55'),
(186, 'Nail Enamel Remover', 175, 105, 3.89, 'Code: UC3999   Shade Name: \r\nDP: 175.00   BV: 105.00   PV: 3.89\r\nWeight(gm): 135.00', 24, '2022-02-18 17:57:49'),
(187, 'Ivory Light 01', 999, 599.4, 22.2, 'Code: UC4305   Shade Name: Ivory Light 01\r\nDP: 999.00   BV: 599.40   PV: 22.20\r\nWeight(gm): 505.00', 24, '2022-02-18 18:48:30'),
(188, 'Real Red', 99, 59.4, 2.2, 'Code: UCL701   Shade Name: \r\nDP: 99.00   BV: 59.40   PV: 2.20\r\nWeight(gm): 3.00\r\n', 24, '2022-02-18 18:49:22'),
(191, 'JET BLACK 001', 582, 349, 12.93, 'Code: UC9013   Shade Name: JET BLACK 001\r\nDP: 582.00   BV: 349.20   PV: 12.93\r\nWeight(gm): 10.00', 24, '2022-02-18 18:55:39'),
(192, 'Dark Brown -01', 548, 328.8, 12.18, 'Code: UC9017   Shade Name: \r\nDP: 548.00   BV: 328.80   PV: 12.18\r\nWeight(gm): 11.00', 24, '2022-02-18 18:57:28'),
(193, 'Black', 520, 312, 11.56, 'Code: UC9999   Shade Name: \r\nDP: 520.00   BV: 312.00   PV: 11.56\r\nWeight(gm): 41.00', 24, '2022-02-18 18:59:14'),
(194, 'Pro White Replenishing Night Cream', 1460, 876, 32.44, 'Code: UC4902   Shade Name: \r\nDP: 1460.00   BV: 876.00   PV: 32.44\r\nWeight(gm): 119.00', 24, '2022-02-18 19:00:43'),
(195, 'Pro White Anti-Spot Radiance Serum', 456, 273.6, 10.13, 'Code: UC4904   Shade Name: \r\nDP: 456.00   BV: 273.60   PV: 10.13\r\nWeight(gm): 52.00\r\n', 24, '2022-02-18 19:01:45'),
(196, 'Pro White Advance Anti-Wrinkle & Nourishing Tencel Sheet Mask with Collagen (New)', 182, 109.2, 4.04, 'Code: UC4905   Shade Name: \r\nDP: 182.00   BV: 109.20   PV: 4.04\r\nWeight(gm): 35.00\r\n', 24, '2022-02-18 19:02:37'),
(197, 'Pro White Super Soothing & Anti - Ageing Tencel Sheet Mask with Aloe (New)', 182, 109.2, 4.04, 'Code: UC4906   Shade Name: \r\nDP: 182.00   BV: 109.20   PV: 4.04\r\nWeight(gm): 35.00', 24, '2022-02-18 19:03:38'),
(198, 'Fine Tip Pencil Sharpener', 125, 62.5, 2.31, 'Code: UC9016   Shade Name: \r\nDP: 125.00   BV: 62.50   PV: 2.31\r\nWeight(gm): 8.00', 24, '2022-02-18 19:05:47'),
(199, 'Flawless Finish Beauty Sponge-Black', 173, 86.52, 3.2, 'Code: UC9021   Shade Name: \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nWeight(gm): 19.00\r\n', 24, '2022-02-18 19:06:45'),
(200, 'Fruit Of The Earth Red Obsession Hydrating Mist New', 520, 312, 11.56, 'Code: PC1014   Shade Name: \r\nDP: 520.00   BV: 312.00   PV: 11.56\r\nWeight(gm): 146.00', 23, '2022-02-18 19:19:17'),
(201, 'Fruit Of The Earth Moor Mud Facial Bar', 295, 147.5, 5.46, 'Code: PC5224   Shade Name: \r\nDP: 295.00   BV: 147.50   PV: 5.46\r\nWeight(gm): 159.00', 23, '2022-02-18 19:20:34'),
(202, 'Schloka Purifying Neem & Gotukola Face Wash', 180, 108, 4, 'Code: SC0019   Shade Name: \r\nDP: 180.00   BV: 108.00   PV: 4.00\r\nWeight(gm): 96.00', 23, '2022-02-18 19:21:41'),
(203, 'Schloka 3 In 1 Cleanser, Toner And Make Up Remover With Green Tea & Chamomile Extract', 290, 174, 6.44, 'Code: SC0003   Shade Name: Schloka 3 In 1 Cleanser, Toner And Make Up Remover (New MRP)\r\nDP: 290.00   BV: 174.00   PV: 6.44\r\nWeight(gm): 265.00', 23, '2022-02-18 19:22:31'),
(204, 'Schloka Moroccan Argan Oil Scrub', 200, 120, 4.44, 'Schloka Moroccan Argan Oil Scrub\r\nCode: SC0024   Shade Name: \r\nDP: 200.00   BV: 120.00   PV: 4.44\r\nWeight(gm): 93.00', 23, '2022-02-18 19:23:57'),
(205, 'Schloka Avocado Face Scrub With Oatmeal & Neroli', 260, 156, 5.78, 'Code: SC0028   Shade Name: \r\nDP: 260.00   BV: 156.00   PV: 5.78\r\nWeight(gm): 94.00', 23, '2022-02-18 19:25:38'),
(206, 'Fruit Of The Earth Face Pack With Neem & Rosemary (Sensitive & Acne Prone Skin)', 330, 198, 7.33, 'Code: PC1004   Shade Name: \r\nDP: 330.00   BV: 198.00   PV: 7.33\r\nWeight(gm): 219.00', 23, '2022-02-18 19:26:31'),
(207, 'Schloka Gold Facial Kit', 225, 135, 5, 'Code: PC1023   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 75.00', 23, '2022-02-18 19:27:18'),
(208, 'Schloka D Tan Face Pack With Tulsi & Clove', 180, 108, 4, 'Code: SC0022   Shade Name: \r\nDP: 180.00   BV: 108.00   PV: 4.00\r\nWeight(gm): 94.00', 23, '2022-02-18 19:28:33'),
(209, 'Schloka Glow Face Pack With Orange Peel And White Clay', 200, 120, 4.44, 'Code: SC0026   Shade Name: \r\nDP: 200.00   BV: 120.00   PV: 4.44\r\nWeight(gm): 94.00', 23, '2022-02-18 19:29:28'),
(210, 'Schloka Moroccan Argan Oil Facial Kit', 225, 135, 5, 'Code: SC3023   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 75.00', 23, '2022-02-18 19:30:28'),
(211, 'Schloka Body Butter With Shea Butter & Almond Oil', 290, 174, 6.44, 'Code: SC0006   Shade Name: \r\nDP: 290.00   BV: 174.00   PV: 6.44\r\nWeight(gm): 207.00', 23, '2022-02-18 19:31:37'),
(212, 'Schloka Hydra - Nourish Facial Cream With Shea Butter, Almond & Olive Oil', 285, 171, 6.33, 'Code: SC0009   Shade Name: \r\nDP: 285.00   BV: 171.00   PV: 6.33\r\nWeight(gm): 213.00', 23, '2022-02-18 19:32:56'),
(214, 'Fruit Of The Earth Cleansing Gel With Apricot & Tea Tree Oil (Ph Balanced)', 315, 189, 7, 'Code: PC1001   Shade Name: \r\nDP: 315.00   BV: 189.00   PV: 7.00\r\nWeight(gm): 203.00', 23, '2022-02-18 19:34:54'),
(215, 'Fruit Of The Earth Fairness Gel With Liquorice & Aloe Vera (Spf14)', 230, 115, 4.26, 'Code: PC5260   Shade Name: \r\nDP: 230.00   BV: 115.00   PV: 4.26\r\nWeight(gm): 115.00\r\n', 23, '2022-02-18 19:36:08'),
(217, 'Schloka Fairness Cream With Rose & Honey', 240, 144, 5.33, 'Code: SC0008   Shade Name: Schloka Fairness Cream With Rose & Honey (New MRP)\r\nDP: 240.00   BV: 144.00   PV: 5.33\r\nWeight(gm): 131.00', 23, '2022-02-18 19:38:50'),
(218, 'Schloka Whitening Cream With Lemon And Turmeric', 245, 147, 5.44, 'Code: SC0017   Shade Name: Schloka Whitening Cream With Lemon And Turmeric (New MRP)\r\nDP: 245.00   BV: 147.00   PV: 5.44\r\nWeight(gm): 129.00', 23, '2022-02-18 19:39:36'),
(219, 'Schloka Anti Ageing Night Cream With Collagen And Vitamin E', 240, 144, 5.33, 'Code: SC0004   Shade Name: Schloka Anti Ageing Night Cream (New MRP)\r\nDP: 240.00   BV: 144.00   PV: 5.33\r\nWeight(gm): 131.007\r\nWeight(gm): 131.00\r\n', 23, '2022-02-18 19:40:59'),
(220, 'Modicare Premium Agarbatti - Lavender', 55, 16.5, 0.61, 'Code: AB0008   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:37:29'),
(221, 'Modicare Premium Agarbatti - Sandal', 55, 16.5, 0.61, 'Code: AB0009   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:38:26'),
(222, 'Modicare Premium Agarbatti - Champa', 55, 16.5, 0.61, 'Code: AB0010   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:39:15'),
(223, 'Modicare Premium Agarbatti - Jasmine', 55, 16.5, 0.61, 'Code: AB0011   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:40:01'),
(224, 'Modicare Premium Agarbatti - Kewda', 55, 16.5, 0.61, 'Code: AB0012   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:40:45'),
(225, 'Modicare Premium Agarbatti - Rose', 55, 16.5, 0.61, 'Code: AB0007   Shade Name: \r\nDP: 55.00   BV: 16.50   PV: 0.61\r\nWeight(gm): 110.00', 29, '2022-02-26 10:41:44'),
(226, 'Modicare Cuckoo Air Purifier 3-in-1 Filter', 3999, 799.8, 29.62, 'Code: AP0002   Shade Name: \r\nDP: 3999.00   BV: 799.80   PV: 29.62\r\nWeight(gm): 5800.00\r\n', 33, '2022-02-26 10:47:57'),
(227, 'Modicare Cuckoo Air Purifier', 17999, 8999, 333.31, 'Code: AP0001   Shade Name: \r\nDP: 17999.00   BV: 8999.50   PV: 333.31\r\nWeight(gm): 6000.00\r\n', 33, '2022-02-26 10:48:48'),
(228, 'Modicare 3in1 Fast Charging cable', 451, 135, 5, 'Code: AX0140   Shade Name: \r\nDP: 451.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 82.00\r\n', 31, '2022-02-26 10:54:32'),
(229, 'Mighty Guard Mobile Security', 667, 400.2, 14.82, 'Code: MG0001   Shade Name: \r\nDP: 667.00   BV: 400.20   PV: 14.82\r\nWeight(gm): 0.00\r\n', 31, '2022-02-26 10:57:42'),
(230, 'SM MENS  GOLD INDEX DIAL ( DATE )  TWO TONE WATCH', 3477, 1738.7, 64.4, 'Code: WAT014   Shade Name: \r\nDP: 3477.00   BV: 1738.70   PV: 64.40\r\nWeight(gm): 240.00', 34, '2022-02-26 11:00:05'),
(231, 'SM MENS (DAY & DATE) BLUE BEZEL WITH  SILVER METAL STRAP WATCH', 3043, 1521.3, 56.34, 'Code: WAT018   Shade Name: \r\nDP: 3043.00   BV: 1521.30   PV: 56.34\r\nWeight(gm): 240.00', 34, '2022-02-26 11:01:14'),
(232, 'SM MENS (DAY & DATE ) BLUE BEZEL WITH  LEATHER STRAP WATCH', 3477, 1738.7, 64.4, 'Code: WAT019   Shade Name: \r\nDP: 3477.00   BV: 1738.70   PV: 64.40\r\nWeight(gm): 240.00', 34, '2022-02-26 11:02:04'),
(233, 'SM MENS BLACK DOUBLE MOVEMENT (TWO TIME ZONES) WITH  SILICON STRAP WATCH', 3477, 1738.7, 64.4, 'Code: WAT021   Shade Name: \r\nDP: 3477.00   BV: 1738.70   PV: 64.40\r\nWeight(gm): 240.00', 34, '2022-02-26 11:02:55'),
(234, 'SM LADIES SILVER DIAL STRAP WATCH', 2608, 1303.91, 48.29, 'Code: WAT023   Shade Name: \r\nDP: 2608.00   BV: 1303.91   PV: 48.29\r\nWeight(gm): 240.00', 34, '2022-02-26 11:03:45'),
(235, 'SM LADIES OVAL SHAPED WITH STONE EMBEDDED DIAL  GOLD TWO TONE WATCH', 2608, 1303.91, 48.29, 'Code: WAT024   Shade Name: \r\nDP: 2608.00   BV: 1303.91   PV: 48.29\r\nWeight(gm): 240.00', 34, '2022-02-26 11:04:40'),
(236, 'SM LADIES  SILVER PLATED DIAL GOLD WATCH', 2608, 1303.91, 48.29, 'Code: WAT027   Shade Name: \r\nDP: 2608.00   BV: 1303.91   PV: 48.29\r\nWeight(gm): 240.00', 34, '2022-02-26 12:41:26'),
(237, 'SM LADIES WITH DOUBLE RING STONE EMBEDDED BEZEL TWO TONE GOLD WATCH', 3043, 1521.3, 56.34, 'Code: WAT028   Shade Name: \r\nDP: 3043.00   BV: 1521.30   PV: 56.34\r\nWeight(gm): 240.00', 34, '2022-02-26 12:42:19'),
(238, 'Sm His N Her Rose Gold Combo Watch Pack', 5044, 2521.74, 93.4, 'Code: WAT006   Shade Name: \r\nDP: 5044.00   BV: 2521.74   PV: 93.40\r\nWeight(gm): 306.00', 34, '2022-02-26 12:49:26'),
(239, 'Sm Ladies Stone Embedded Two Tone Gold Watch', 2521, 1260.43, 46.68, 'Code: WAT010   Shade Name: \r\nDP: 2521.00   BV: 1260.43   PV: 46.68\r\nWeight(gm): 184.00', 34, '2022-02-26 12:51:57'),
(240, 'Sm Ladies Stone Embedded Two Tone Gold Watch With Mesh Metal Strap', 2599, 1299.5, 48.13, 'Code: WAT011   Shade Name: \r\nDP: 2599.00   BV: 1299.50   PV: 48.13\r\nWeight(gm): 218.00', 34, '2022-02-26 12:52:45'),
(241, 'Sm Ladies Stone Embedded Black Dial Watch', 2869, 1434.35, 53.12, 'Code: WAT009   Shade Name: \r\nDP: 2869.00   BV: 1434.35   PV: 53.12\r\nWeight(gm): 206.00', 34, '2022-02-26 12:53:41'),
(242, 'Sm Ladies Rose Gold Watch', 2869, 1434.35, 53.12, 'Code: WAT007   Shade Name: \r\nDP: 2869.00   BV: 1434.35   PV: 53.12\r\nWeight(gm): 226.00', 34, '2022-02-26 12:54:56'),
(243, 'Sm Ladies Rose Gold Watch', 2249, 1124.5, 41.65, 'Code: WAT008   Shade Name: \r\nDP: 2249.00   BV: 1124.50   PV: 41.65\r\nWeight(gm): 225.00', 34, '2022-02-26 13:01:14'),
(244, 'Auto Wash Advanced-Auto Shampoo With Colour Protectants', 120, 60, 2.22, 'Code: AC3005   Shade Name: Auto Wash Advanced Concentrated Auto Shampoo (New MRP)\r\nDP: 120.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 310.00', 27, '2022-02-26 13:14:16'),
(246, 'Sm MenS (Day & Date) Square Two Tone Gold Watch', 2869, 1434.35, 53.12, 'Code: WAT005   Shade Name: \r\nDP: 2869.00   BV: 1434.35   PV: 53.12\r\nWeight(gm): 249.00', 34, '2022-02-26 13:20:34'),
(247, 'Sm MenS (Date) Gold Watch New', 2599, 1299.5, 48.13, 'Code: WAT004   Shade Name: \r\nDP: 2599.00   BV: 1299.50   PV: 48.13\r\nWeight(gm): 249.00', 34, '2022-02-26 13:22:07'),
(248, 'Sm MenS (Day & Date) Black Dial Leather Strap Watch', 2521, 1260.43, 46.68, 'Code: WAT003   Shade Name: \r\nDP: 2521.00   BV: 1260.43   PV: 46.68\r\nWeight(gm): 205.00', 34, '2022-02-26 13:23:07'),
(249, 'Sm MenS (Day & Date) Two Tone Gold Watch', 2999, 1499.5, 55.54, 'Code: WAT002   Shade Name: \r\nDP: 2999.00   BV: 1499.50   PV: 55.54\r\nWeight(gm): 286.00', 34, '2022-02-26 13:24:14'),
(250, 'Sm MenS (Day & Date) Two Tone Rose Gold Watch', 3260, 1630, 60.37, 'Code: WAT001   Shade Name: \r\nDP: 3260.00   BV: 1630.00   PV: 60.37\r\nWeight(gm): 284.00', 34, '2022-02-26 13:25:11'),
(251, 'Activmax (500 ml)', 665, 399, 14.78, 'Code: AG0009   Shade Name: \r\nDP: 665.00   BV: 399.00   PV: 14.78\r\nWeight(gm): 620.00', 26, '2022-02-26 14:04:45'),
(254, 'Active - 80 Gold (500 ml)', 640, 384, 14.22, 'Code: AG0004   Shade Name: \r\nDP: 640.00   BV: 384.00   PV: 14.22\r\nWeight(gm): 603.00', 26, '2022-02-26 14:08:42'),
(255, 'Activzyme (500 ml)', 570, 342, 12.67, 'Code: AG0006   Shade Name: \r\nDP: 570.00   BV: 342.00   PV: 12.67\r\nWeight(gm): 721.00', 26, '2022-02-26 14:09:31'),
(256, 'Activzyme (100ml * 3)', 415, 249, 9.22, 'Code: AG0005   Shade Name: Active-80\r\nDP: 415.00   BV: 249.00   PV: 9.22\r\nWeight(gm): 495.00', 26, '2022-02-26 14:10:05'),
(257, 'Activmax (100ml *3)', 490, 294, 10.89, 'Code: AG0008   Shade Name: \r\nDP: 490.00   BV: 294.00   PV: 10.89\r\nWeight(gm): 436.00', 26, '2022-02-26 14:10:53'),
(258, 'Active - 80 ( 100ml * 3 )', 390, 234, 8.67, 'Code: AG0001   Shade Name: Active-80\r\nDP: 390.00   BV: 234.00   PV: 8.67\r\nWeight(gm): 447.00', 26, '2022-02-26 14:13:29'),
(259, 'Active - 80  (500ml)', 560, 336, 12.44, 'Code: AG0002   Shade Name: Active-80\r\nDP: 560.00   BV: 336.00   PV: 12.44\r\nWeight(gm): 631.00', 26, '2022-02-26 14:14:29'),
(260, 'Active - 80 (5 l) ', 4235, 2541, 94.11, 'Code: AG0003   Shade Name: Active-80\r\nDP: 4235.00   BV: 2541.00   PV: 94.11\r\nWeight(gm): 5730.00', 26, '2022-02-26 14:16:26'),
(261, 'Washmate Powerclean Detergent Bar', 100, 35, 1.3, 'Code: LC4004   Shade Name: \r\nDP: 100.00   BV: 35.00   PV: 1.30\r\nWeight(gm): 630.00', 31, '2022-02-26 14:21:50'),
(262, 'Washmate Pre Wash Dirt & Stain Remover', 165, 57.75, 2.14, 'Code: LC3021   Shade Name: \r\nDP: 165.00   BV: 57.75   PV: 2.14\r\nWeight(gm): 279.00', 31, '2022-02-26 14:23:43'),
(263, 'Washmate 5 In 1 Liquid Detergent With Powerzyme & Natural Softener (Biosafe Formula)', 350, 210, 7.78, 'Code: LC2018   Shade Name: \r\nDP: 350.00   BV: 210.00   PV: 7.78\r\nWeight(gm): 553.00', 31, '2022-02-26 14:24:47'),
(264, 'Washmate Delicate Liquid Detergent For Woolen & Delicate Fabrics (Biosafe Formula)', 325, 195, 7.22, 'Code: LC2017   Shade Name: \r\nDP: 325.00   BV: 195.00   PV: 7.22\r\nWeight(gm): 555.00', 31, '2022-02-26 14:26:07'),
(265, 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil', 245, 24.5, 0.91, 'Code: FP3056   Shade Name: \r\nDP: 245.00   BV: 24.50   PV: 0.91\r\nWeight(gm): 925.00', 28, '2022-02-26 14:29:25'),
(266, 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil - 5 Litre', 910, 91, 3.37, 'Code: FP3071   Shade Name: \r\nDP: 910.00   BV: 91.00   PV: 3.37\r\nWeight(gm): 4750.00', 28, '2022-02-26 14:34:48'),
(267, 'SOUL FLAVOURS ACTIVE RICE BRAN OIL - 5 Litre', 1150, 230, 8.52, 'Code: FP3072   Shade Name: \r\nDP: 1150.00   BV: 230.00   PV: 8.52\r\nWeight(gm): 4750.00', 28, '2022-02-26 14:35:27'),
(268, 'Soul Flavours Active Rice Bran Oil (Pouch)', 225, 45, 1.67, 'Code: FP3050   Shade Name: \r\nDP: 225.00   BV: 45.00   PV: 1.67\r\nWeight(gm): 920.00', 28, '2022-02-26 14:36:37'),
(269, 'Soul Flavours Strong CTC Tea', 110, 27.5, 1.02, 'Code: FP0033   Shade Name: \r\nDP: 110.00   BV: 27.50   PV: 1.02\r\nWeight(gm): 255.00', 28, '2022-02-26 14:41:55'),
(270, 'Soul Flavours Shahi Mukhwas', 115, 46, 1.7, 'Code: FP3113   Shade Name: \r\nDP: 115.00   BV: 46.00   PV: 1.70\r\nWeight(gm): 77.00', 28, '2022-02-26 14:43:03'),
(271, 'Soul Flavours Penne Rigate (Pasta)', 178, 71.2, 2.64, 'Code: FP3007   Shade Name: \r\nDP: 178.00   BV: 71.20   PV: 2.64\r\nWeight(gm): 508.00', 28, '2022-02-26 14:46:28'),
(272, 'Soul Flavours Shahi Pan', 200, 80, 2.96, 'Code: FP0027   Shade Name: \r\nDP: 200.00   BV: 80.00   PV: 2.96\r\nWeight(gm): 120.00', 28, '2022-02-26 14:47:10'),
(273, 'Soul Flavours All Natural Stevia Powder', 445, 178, 6.59, 'Code: FP0013   Shade Name: \r\nDP: 445.00   BV: 178.00   PV: 6.59\r\nWeight(gm): 245.00\r\n', 28, '2022-02-26 14:48:07'),
(274, 'Soul Flavours Shahi Mukhwas', 160, 64, 2.37, 'Code: FP0026   Shade Name: \r\nDP: 160.00   BV: 64.00   PV: 2.37\r\nWeight(gm): 117.00', 28, '2022-02-26 14:49:13'),
(275, 'Soul Flavours Honey With Tulsi', 380, 152, 5.63, 'Code: FP0011   Shade Name: \r\nDP: 380.00   BV: 152.00   PV: 5.63\r\nWeight(gm): 550.00', 28, '2022-02-26 14:51:40'),
(276, 'Soul Flavours Honey With Ginger', 380, 152, 5.63, 'Code: FP0012   Shade Name: \r\nDP: 380.00   BV: 152.00   PV: 5.63\r\nWeight(gm): 550.00', 28, '2022-02-26 14:52:24'),
(277, 'Soul Flavours Amla Candy Sweet', 265, 106, 3.93, 'Code: FP0008   Shade Name: \r\nDP: 265.00   BV: 106.00   PV: 3.93\r\nWeight(gm): 580.00', 28, '2022-02-26 14:58:40'),
(278, 'Soul Flavours Cardamom Seeds', 50, 30, 1.11, 'Code: FP0005   Shade Name: \r\nDP: 50.00   BV: 30.00   PV: 1.11\r\nWeight(gm): 23.00', 28, '2022-02-26 14:59:51'),
(279, 'Fruit Of The Earth Power Green Tea', 185, 73.29, 2.73, 'Code: FP0002   Shade Name: \r\nDP: 185.00   BV: 73.79   PV: 2.73\r\nWeight(gm): 83.00', 28, '2022-02-26 15:00:41'),
(280, 'Fruit Of The Earth C.T.C & Long Leaf Tea', 165, 66, 2.44, 'Code: FP0003   Shade Name: \r\nDP: 165.00   BV: 66.00   PV: 2.44\r\nWeight(gm): 294.00', 28, '2022-02-26 15:03:37'),
(281, 'Soul Flavours Garam Masala', 73, 18.25, 0.68, 'Code: FP3034   Shade Name: \r\nDP: 73.00   BV: 18.25   PV: 0.68\r\nWeight(gm): 109.00', 28, '2022-02-26 15:07:07'),
(282, 'Soul Flavours Kali Mirch Powder', 170, 42.5, 1.57, 'Code: FP3029   Shade Name: \r\nDP: 170.00   BV: 42.50   PV: 1.57\r\nWeight(gm): 109.00', 28, '2022-02-26 15:08:23'),
(283, 'Soul Flavours Jeera Powder', 68, 17, 0.63, 'Code: FP3025   Shade Name: \r\nDP: 68.00   BV: 17.00   PV: 0.63\r\nWeight(gm): 109.00', 28, '2022-02-26 15:09:48'),
(284, 'Soul Flavours Lal Mirch Powder', 52, 13, 0.48, 'Code: FP3023   Shade Name: \r\nDP: 52.00   BV: 13.00   PV: 0.48\r\nWeight(gm): 109.00', 28, '2022-02-26 15:10:30'),
(285, 'Soul Flavours Haldi Powder', 35, 8.75, 0.32, 'Code: FP3030   Shade Name: \r\nDP: 35.00   BV: 8.75   PV: 0.32\r\nWeight(gm): 109.00', 28, '2022-02-26 15:11:46'),
(286, 'Soul Flavours Dhania Powder', 35, 8.75, 0.32, 'Code: FP3027   Shade Name: \r\nDP: 35.00   BV: 8.75   PV: 0.32\r\nWeight(gm): 109.00', 28, '2022-02-26 15:12:39'),
(287, 'Soul Flavours Lal Mirch Powder', 102, 25.5, 0.94, 'Code: FP3054   Shade Name: \r\nDP: 102.00   BV: 25.50   PV: 0.94\r\nWeight(gm): 200.00', 28, '2022-02-26 15:15:19'),
(288, 'Soul Flavours Pav Bhaji Masala', 70, 17.5, 0.65, 'Code: FP3066   Shade Name: \r\nDP: 70.00   BV: 17.50   PV: 0.65\r\nWeight(gm): 100.00', 28, '2022-02-26 15:17:56'),
(290, 'Soul Flavours Chhole Masala', 81, 20.25, 0.75, 'Code: FP3067   Shade Name: \r\nDP: 81.00   BV: 20.25   PV: 0.75\r\nWeight(gm): 100.00', 28, '2022-02-26 15:20:25'),
(291, 'Soul Flavours Chaat Masala', 70, 17.5, 0.65, 'Code: FP3065   Shade Name: \r\nDP: 70.00   BV: 17.50   PV: 0.65\r\nWeight(gm): 104.00', 28, '2022-02-26 15:30:55'),
(292, 'Soul Flavours Haldi Powder', 68, 17, 0.63, 'Code: FP3053   Shade Name: \r\nDP: 68.00   BV: 17.00   PV: 0.63\r\nWeight(gm): 200.00\r\n', 28, '2022-02-26 15:31:44'),
(293, 'Soul Flavours Dhania Powder', 70, 17, 0.63, 'Code: FP3055   Shade Name: \r\nDP: 70.00   BV: 17.00   PV: 0.63\r\nWeight(gm): 200.00\r\n', 28, '2022-02-26 15:32:55'),
(294, 'Soul Pops Freaky Fruity Lollipops', 105, 63, 2.33, 'Code: FP0028   Shade Name: \r\nDP: 105.00   BV: 63.00   PV: 2.33\r\nWeight(gm): 197.00', 28, '2022-02-26 15:33:53'),
(295, 'Soul Flavours Rawal Pindi Chana', 103, 20.6, 0.76, 'Code: FP3083   Shade Name: \r\nDP: 103.00   BV: 20.60   PV: 0.76\r\nWeight(gm): 332.00', 28, '2022-02-26 15:36:55'),
(296, 'Soul Flavours Chicken Biryani', 229, 45.8, 1.7, 'Code: FP3082   Shade Name: \r\nDP: 229.00   BV: 45.80   PV: 1.70\r\nWeight(gm): 282.00', 28, '2022-02-26 15:37:50'),
(298, 'Soul Flavours Chicken Curry Boneless', 229, 45.8, 1.7, 'Code: FP3078   Shade Name: \r\nDP: 229.00   BV: 45.80   PV: 1.70\r\nWeight(gm): 330.00', 28, '2022-02-26 15:39:33'),
(300, 'Soul Flavours Dal Makhni', 93, 18.6, 0.69, 'Code: FP3084   Shade Name: \r\nDP: 93.00   BV: 18.60   PV: 0.69\r\nWeight(gm): 332.00', 28, '2022-02-26 15:41:17'),
(301, 'Soul Flavours Plain Rice', 93, 18.6, 0.69, 'Code: FP3080   Shade Name: \r\nDP: 93.00   BV: 18.60   PV: 0.69\r\nWeight(gm): 284.00', 28, '2022-02-26 15:42:10'),
(302, 'Soul Flavours Soya Tikka Masala', 150, 30, 1.11, 'Code: FP3077   Shade Name: \r\nDP: 150.00   BV: 30.00   PV: 1.11\r\nWeight(gm): 332.00', 28, '2022-02-26 15:43:17'),
(303, 'Soul Flavours Quinoa', 250, 125, 4.63, 'Code: FP0032   Shade Name: \r\nDP: 250.00   BV: 125.00   PV: 4.63\r\nWeight(gm): 510.00', 28, '2022-02-26 15:44:16'),
(304, 'Soul Flavours Active Rice Bran Oil Dispenser', 125, 50, 1.85, 'Code: 606000   Shade Name: \r\nDP: 125.00   BV: 50.00   PV: 1.85\r\nWeight(gm): 86.00', 28, '2022-02-26 15:46:33'),
(305, 'Soul Flavours Fish Masala', 71, 17.75, 0.66, 'Code: FP3062   Shade Name: \r\nDP: 71.00   BV: 17.75   PV: 0.66\r\nWeight(gm): 100.00', 28, '2022-02-26 15:48:54'),
(306, 'Soul Flavours Meat Masala', 71, 17.75, 0.66, 'Code: FP3061   Shade Name: \r\nDP: 71.00   BV: 17.75   PV: 0.66\r\nWeight(gm): 100.00', 28, '2022-02-26 15:49:41'),
(307, 'Soul Flavours Hing', 50, 12.5, 0.46, 'Code: FP3070   Shade Name: \r\nDP: 50.00   BV: 12.50   PV: 0.46\r\nWeight(gm): 22.00\r\n', 28, '2022-02-26 15:50:25'),
(308, 'Soul Flavours Kitchen King Masala', 70, 17.5, 0.65, 'Code: FP3069   Shade Name: \r\nDP: 70.00   BV: 17.50   PV: 0.65\r\nWeight(gm): 100.00', 28, '2022-02-26 15:53:06'),
(310, 'Soul Pops Fruit Chaat Candy', 47, 9.4, 0.35, 'Code: FP3058   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:55:02'),
(311, 'Soul Pops Masala Soda Candy', 47, 9.4, 0.35, 'Code: FP3057   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:55:40'),
(312, 'Soul Pops Gazab Guava Candy', 47, 9.4, 0.35, 'Code: FP3052   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:56:24'),
(313, 'Soul Pops Chatpata Orange Candy', 47, 9.4, 0.35, 'Code: FP3051   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:57:21'),
(314, 'Soul Pops Kaccha Aam Candy', 47, 9.4, 0.35, 'Code: FP3044   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:58:10'),
(315, 'One Der Scrub', 130, 65, 2.41, 'Code: HC5005   Shade Name: \r\nDP: 130.00   BV: 65.00   PV: 2.41\r\nWeight(gm): 99.00', 33, '2022-02-26 17:04:52'),
(316, 'Mighty In-One Shine & Protect', 475, 237.5, 8.8, 'Code: HC3031   Shade Name: \r\nDP: 475.00   BV: 237.50   PV: 8.80\r\nWeight(gm): 280.00', 33, '2022-02-26 17:05:53'),
(317, 'Mighty In-One Multipurpose Cleaner', 125, 62.5, 2.31, 'Code: HC3030   Shade Name: \r\nDP: 125.00   BV: 62.50   PV: 2.31\r\nWeight(gm): 312.00', 33, '2022-02-26 17:06:44'),
(318, 'Spic â€˜Nâ€™ Span Scale And Bathroom Cleaner', 174, 87, 3.22, 'Code: HC3028   Shade Name: \r\nDP: 174.00   BV: 87.00   PV: 3.22\r\nWeight(gm): 372.00', 33, '2022-02-26 17:08:46'),
(319, 'Duz All Advanced Concentrated Multi Purpose Cleaner (Biosafe Formula)', 245, 122.5, 4.54, 'Code: HC2025   Shade Name: DUZ ALL ADVANCED - CONCENTRATED MULTIPURPOSE CLEANER (New MRP)\r\nDP: 245.00   BV: 122.50   PV: 4.54\r\nWeight(gm): 560.00', 33, '2022-02-26 17:09:49'),
(320, 'Sparkle Advanced Concentrated Glass Cleaner With Antifog Effect(Biosafe Formula)', 170, 85, 3.15, 'Code: HC2024   Shade Name: \r\nDP: 170.00   BV: 85.00   PV: 3.15\r\nWeight(gm): 537.00', 33, '2022-02-26 17:10:38'),
(321, 'Hd Heavy Duty Floor Cleaner', 150, 75, 2.78, 'Code: HC2021   Shade Name: \r\nDP: 150.00   BV: 75.00   PV: 2.78\r\nWeight(gm): 618.00', 33, '2022-02-26 17:13:21'),
(322, 'Stericlean Powerful Disinfectant Cleaner Original', 222, 111, 4.11, 'Code: HC2019   Shade Name: SteriClean - Disinfectant Cleaner\r\nDP: 222.00   BV: 111.00   PV: 4.11\r\nWeight(gm): 558.00', 33, '2022-02-26 17:14:20'),
(323, 'Silver Dip - Instant Silver Cleaner', 215, 108.14, 4.01, 'Code: HC0026   Shade Name: \r\nDP: 215.00   BV: 108.14   PV: 4.01\r\nWeight(gm): 410.00\r\n', 33, '2022-02-26 17:15:14'),
(326, 'Stericlean Powerful Disinfectant Cleaner Original', 120, 60, 2.22, 'Code: HC3027   Shade Name: SteriClean - Disinfectant Cleaner\r\nDP: 120.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 318.00', 33, '2022-02-26 17:18:55'),
(327, 'Germi Bust Multi-Surface Disinfectant Spray', 175, 70, 2.59, 'Code: HC0020   Shade Name: \r\nDP: 175.00   BV: 70.00   PV: 2.59\r\nWeight(gm): 227.00', 33, '2022-02-26 17:21:07'),
(328, 'One Der Drop Advanced Concentrated Dish Washing Liquid (Original Formula) New', 200, 100, 3.7, 'Code: HC0006   Shade Name: \r\nDP: 200.00   BV: 100.00   PV: 3.70\r\nWeight(gm): 613.00', 33, '2022-02-26 17:22:06'),
(329, 'Fruveg Fruit and Vegetable Wash', 250, 125, 4.63, 'Code: HC0021   Shade Name: \r\nDP: 250.00   BV: 125.00   PV: 4.63\r\nWeight(gm): 545.00', 33, '2022-02-26 17:22:55'),
(330, 'Stericlean Powerful Disinfectant Cleaner Lime', 222, 111, 4.11, 'Code: HC2027   Shade Name: \r\nDP: 222.00   BV: 111.00   PV: 4.11\r\nWeight(gm): 565.00', 33, '2022-02-26 18:59:27'),
(331, 'Stericlean Powerful Disinfectant Cleaner Khus', 222, 111, 4.11, 'Code: HC2028   Shade Name: \r\nDP: 222.00   BV: 111.00   PV: 4.11\r\nWeight(gm): 565.00', 33, '2022-02-26 19:01:12'),
(332, 'Stericlean Powerful Disinfectant Cleaner Advance', 191, 95.5, 3.54, 'Code: HC2026   Shade Name: \r\nDP: 191.00   BV: 95.50   PV: 3.54\r\nWeight(gm): 546.00', 33, '2022-02-26 19:03:01'),
(333, 'Well Spirulina', 415, 249, 9.22, 'Code: HL2008   Shade Name: Well Spirulina (New MRP)\r\nDP: 415.00   BV: 249.00   PV: 9.22\r\nWeight(gm): 106.00', 22, '2022-02-26 19:56:08'),
(334, 'Well Aloe Vera', 285, 171, 6.33, 'Code: HL2027   Shade Name: \r\nDP: 285.00   BV: 171.00   PV: 6.33\r\nWeight(gm): 60.00', 22, '2022-02-26 20:02:26'),
(335, 'Well Noni', 515, 309, 11.44, 'Code: HL2030   Shade Name: \r\nDP: 515.00   BV: 309.00   PV: 11.44\r\nWeight(gm): 81.00', 22, '2022-02-26 20:04:40'),
(338, 'Modicare Envirochip - Family Pack New', 2000, 1200, 44.44, 'Code: HL2023   Shade Name: \r\nDP: 2000.00   BV: 1200.00   PV: 44.44\r\nWeight(gm): 16.00', 22, '2022-02-26 20:21:46'),
(339, 'Modicare Envirochip - Soch Badlo New', 600, 360, 13.33, 'Code: HL2059   Shade Name: \r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 11.00', 22, '2022-02-26 20:23:44'),
(340, 'Modicare Enviroglobe Rose Gold', 4165, 2499, 92.56, 'Code: HL2022   Shade Name: \r\nDP: 4165.00   BV: 2499.00   PV: 92.56\r\nWeight(gm): 515.00', 22, '2022-02-26 20:24:37'),
(341, 'Well Pudina With Tulsi', 335, 201.54, 7.46, 'Code: HL2007   Shade Name: Well Pudina With Tulsi (Pack Of 100 Soft Gels (New MRP)\r\nDP: 335.00   BV: 201.54   PV: 7.46\r\nWeight(gm): 75.00', 22, '2022-02-26 20:28:44'),
(342, 'Well All Plant Protein Powder (500 g)', 2000, 1200, 44.44, 'Code: FS5052   Shade Name: \r\nDP: 2000.00   BV: 1200.00   PV: 44.44\r\nWeight(gm): 640.00\r\n', 22, '2022-02-26 20:57:02'),
(343, 'Well All Plant Protein Powder ( 200 g)', 900, 540, 20, 'Code: FS5051   Shade Name: \r\nDP: 900.00   BV: 540.00   PV: 20.00\r\nWeight(gm): 284.00', 22, '2022-02-26 20:58:41'),
(344, 'Well Flax Oil', 560, 336, 12.44, 'Code: HL2004   Shade Name: Well Flax Oil (Pack Of 90 Soft Gels) (New MRP)\r\nDP: 560.00   BV: 336.00   PV: 12.44\r\nWeight(gm): 112.00', 22, '2022-02-26 21:01:56'),
(346, 'Modicare Enviroglobe Silver', 4165, 2499, 92.56, 'Code: HL2021   Shade Name: \r\nDP: 4165.00   BV: 2499.00   PV: 92.56\r\nWeight(gm): 515.00', 22, '2022-02-26 21:06:57'),
(347, 'Well Strong & Smart (Chocolate Flavour)', 600, 360, 13.33, 'Code: HL1001   Shade Name: Modicare Well Strong & Smart (New MRP)\r\nDP: 600.00   BV: 360.00   PV: 13.33\r\nWeight(gm): 303.00\r\n', 22, '2022-02-26 21:08:25'),
(348, 'MODICARE ENVIROCHIP RADIATION PROTECTION-TRI BAND', 500, 325, 12.04, 'Code: 600825   Shade Name: \r\nDP: 500.00   BV: 325.00   PV: 12.04\r\nWeight(gm): 11.00', 22, '2022-02-26 21:10:58'),
(349, 'Modicare Premium Limited Edition Mask-black(l) pack of 2', 215, 108, 4, 'Code: HL2033 HL2034 HL2039\r\nShade Name: \r\nDP: 215.00   BV: 108.00   PV: 4.00\r\nWeight(gm): 48.00', 22, '2022-02-26 21:44:12'),
(350, 'Essensual Pocket Perfume Wild Girl New', 70, 21, 0.78, 'Code: PC0031   Shade Name: \r\nDP: 70.00   BV: 21.00   PV: 0.78\r\nWeight(gm): 33.00', 31, '2022-02-27 09:39:38'),
(351, 'Essensual Pocket Perfume Dusky Desire New', 70, 21, 0.78, 'Code: PC0032   Shade Name: \r\nDP: 70.00   BV: 21.00   PV: 0.78\r\nWeight(gm): 33.00', 31, '2022-02-27 09:40:45'),
(352, 'Essensual Romantic Orchid-pocket perfume', 68, 20.4, 0.76, 'Code: PC0029   Shade Name: \r\nDP: 68.00   BV: 20.40   PV: 0.76\r\nWeight(gm): 33.00', 31, '2022-02-27 09:41:42'),
(353, 'Essensual Pocket Perfume Spice Woods New', 68, 20.4, 0.76, 'Code: PC0030   Shade Name: \r\nDP: 68.00   BV: 20.40   PV: 0.76\r\nWeight(gm): 33.00', 31, '2022-02-27 09:42:45'),
(354, 'Velocity Men Twin Blade Plus Readyshaver', 130, 52, 1.93, 'Code: PC5012   Shade Name: \r\nDP: 130.00   BV: 52.00   PV: 1.93\r\nWeight(gm): 42.00', 31, '2022-02-27 10:48:50'),
(355, 'Velocity Men 7 In 1 Beard Growth Oil', 320, 176, 6.52, 'Code: PC5014   Shade Name: \r\nDP: 320.00   BV: 176.00   PV: 6.52\r\nWeight(gm): 95.00', 31, '2022-02-27 10:49:49'),
(356, 'Salon Professional Argan Oil Of Morocco Hair Treatment Oil New', 630, 378, 14, 'Code: PC5285   Shade Name: \r\nDP: 630.00   BV: 378.00   PV: 14.00\r\nWeight(gm): 225.00', 31, '2022-02-27 10:54:49'),
(357, 'Fruit Of The Earth Shampoo With Henna & Jojoba Oil (Hair Fall Control)', 110, 55, 2.04, 'Code: PC5258   Shade Name: \r\nDP: 110.00   BV: 55.00   PV: 2.04\r\nWeight(gm): 117.00', 31, '2022-02-27 10:57:18'),
(358, 'Fruit Of The Earth Conditioner With Aloe Vera & Almond Oil (Smooth & Shine)', 135, 67.5, 2.5, 'Code: PC5259   Shade Name: \r\nDP: 135.00   BV: 67.50   PV: 2.50\r\nWeight(gm): 115.00', 31, '2022-02-27 10:58:15'),
(359, 'Salon Professional Argan Oil of Morocco - Conditioner', 405, 243, 9, 'Code: PC5283   Shade Name: \r\nDP: 405.00   BV: 243.00   PV: 9.00\r\nWeight(gm): 236.00', 31, '2022-02-27 10:59:00'),
(360, 'Salon Professional Cool Herbal Oil', 85, 34, 1.26, 'Code: PC0033   Shade Name: \r\nDP: 85.00   BV: 34.00   PV: 1.26\r\nWeight(gm): 103.00', 31, '2022-02-27 11:53:27'),
(361, 'Salon Professional Amla Hair Oil', 60, 24, 0.89, 'Code: PC0034   Shade Name: \r\nDP: 60.00   BV: 24.00   PV: 0.89\r\nWeight(gm): 103.00', 31, '2022-02-27 11:55:33'),
(362, 'Schloka Purifying Lime Peel & Neem Face Wash-Men', 180, 108, 4, 'Code: SC3021   Shade Name: \r\nDP: 180.00   BV: 108.00   PV: 4.00\r\nWeight(gm): 85.00', 31, '2022-02-27 11:57:28'),
(363, 'Essensual Body Puff - Ultra Soft & Gentle', 85, 51, 1.89, 'Code: PC9000   Shade Name: \r\nDP: 85.00   BV: 51.00   PV: 1.89\r\nWeight(gm): 50.00', 31, '2022-02-27 12:04:47'),
(364, 'Sanitary Napkin - X-Large', 240, 132, 4.89, 'Code: PC6051   Shade Name: \r\nDP: 240.00   BV: 132.00   PV: 4.89\r\nWeight(gm): 162.00', 31, '2022-02-27 12:06:36'),
(365, 'Sanitary Napkin - Large', 225, 123.75, 4.58, 'Code: PC6050   Shade Name: \r\nDP: 225.00   BV: 123.75   PV: 4.58\r\nWeight(gm): 138.00', 31, '2022-02-27 12:07:50'),
(366, 'VELOCITY MEN COOL MENTHOL SHAMPOO', 165, 90.75, 3.63, 'Code: PC6035   Shade Name: \r\nDP: 165.00   BV: 90.75   PV: 3.63\r\nWeight(gm): 0.00', 31, '2022-02-27 12:08:41'),
(367, 'Velocity Men Fortifying Hair Conditioner', 153, 84.15, 3.12, 'Code: PC6032   Shade Name: \r\nDP: 153.00   BV: 84.15   PV: 3.12\r\nWeight(gm): 142.00', 31, '2022-02-27 12:09:30'),
(368, 'Velocity Men Fortifying Shampoo', 165, 91, 3.37, 'Code: PC6028   Shade Name: Velocity Men Fortifying Shampoo\r\nDP: 165.00   BV: 91.00   PV: 3.37\r\nWeight(gm): 194.00', 31, '2022-02-27 12:10:18'),
(369, 'Salon Professional Advance Formula Radiant Shine Conditioner', 270, 161.89, 6, 'Code: PC5248   Shade Name: \r\nDP: 270.00   BV: 161.89   PV: 6.00\r\nWeight(gm): 230.00\r\n', 31, '2022-02-27 12:12:18'),
(370, 'Salon Professional Advance Formula Hair Fall Defense Shampoo', 260, 156.22, 5.79, 'Code: PC5247   Shade Name: \r\nDP: 260.00   BV: 156.22   PV: 5.79\r\nWeight(gm): 230.00', 31, '2022-02-27 12:14:36'),
(372, 'SALON PROFESSIONAL ADVANCED FORMULA DANDRUFF CARE SHAMPOO', 260, 156.22, 5.79, 'Code: PC5245   Shade Name: \r\nDP: 260.00   BV: 156.22   PV: 5.79\r\nWeight(gm): 200.00', 31, '2022-02-27 12:25:20'),
(373, 'Essensual Hand & Body Lotion (Glycerine & Honey)', 160, 95.24, 3.53, 'Code: PC5242   Shade Name: \r\nDP: 160.00   BV: 95.24   PV: 3.53\r\nWeight(gm): 117.00', 31, '2022-02-27 12:31:36'),
(374, 'Auto Glow Auto Polish-For Car, Appliances & Others', 390, 195, 7.22, 'Code: AC3008   Shade Name: \r\nDP: 390.00   BV: 195.00   PV: 7.22\r\nWeight(gm): 541.00', 27, '2022-02-27 23:27:01'),
(375, 'Salon Professional Hair Color-Dark Blond (6)', 415, 166, 6.15, 'Code: PC5237   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 31, '2022-02-27 23:32:30'),
(376, 'Salon Professional Hair Color-Light Brown (5)', 415, 166, 6.15, 'Code: PC5236   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 31, '2022-02-27 23:33:24'),
(377, 'Salon Professional Hair Color-Chocolate (4)', 415, 166, 6.15, 'Code: PC5235   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 31, '2022-02-27 23:34:18'),
(378, 'Salon Professional Hair Color-Brown (3)', 415, 166, 6.15, 'Code: PC5234   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 31, '2022-02-27 23:35:26'),
(379, 'Salon Professional Hair Color-Dark Brown (1)', 415, 166, 6.15, 'Code: PC5232   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 31, '2022-02-27 23:36:52'),
(381, 'Fruit Of The Earth Shampoo With Arnica & Tea Tree Oil (Dandruff Control)', 110, 55, 2.04, 'Code: PC5257   Shade Name: \r\nDP: 110.00   BV: 55.00   PV: 2.04\r\nWeight(gm): 117.00', 31, '2022-02-27 23:39:23'),
(382, 'Velocity Men Smooth Shave Gel', 105, 57.75, 2.14, 'Code: PC5011   Shade Name: \r\nDP: 105.00   BV: 57.75   PV: 2.14\r\nWeight(gm): 77.00', 31, '2022-02-27 23:40:36'),
(383, 'Velocity Men Premium Shaving Cream', 110, 60.92, 2.26, 'Code: PC5010   Shade Name: Velocity Men Premium Shaving Cream (New MRP)\r\nDP: 110.00   BV: 60.92   PV: 2.26\r\nWeight(gm): 101.00', 31, '2022-02-28 01:25:58'),
(386, 'Velocity Men Hair Styling Gel', 90, 49.5, 1.83, 'Code: PC5008   Shade Name: \r\nDP: 90.00   BV: 49.50   PV: 1.83\r\nWeight(gm): 76.00', 31, '2022-02-28 01:28:51'),
(390, 'Velocity Men Body Spray', 195, 97.5, 3.61, 'Code: PC5002   Shade Name: Velocity Men Body Spray (New MRP)\r\nDP: 195.00   BV: 97.50   PV: 3.61\r\nWeight(gm): 163.00', 31, '2022-02-28 01:34:18'),
(391, 'Velocity Men After Shave Splash', 210, 115.5, 4.28, 'Code: PC5001   Shade Name: \r\nDP: 210.00   BV: 115.50   PV: 4.28\r\nWeight(gm): 293.00', 31, '2022-02-28 01:35:06'),
(392, 'Sofwash 3 IN 1 Hand wash, Shower Gel & Bubble Bath - Green Apple', 160, 96, 3.56, 'Code: PC4005   Shade Name: \r\nDP: 160.00   BV: 96.00   PV: 3.56\r\nWeight(gm): 326.00', 31, '2022-02-28 01:36:21'),
(393, 'Sofwash Glycerine & Honey Bar', 129, 64.5, 2.39, 'Code: PC4003   Shade Name: Sofwash Glycerin & Honey Bar ( 100G X 2) (New MRP)\r\nDP: 129.00   BV: 64.50   PV: 2.39\r\nWeight(gm): 237.00', 31, '2022-02-28 01:37:02'),
(394, 'Sofwash 3 In 1 Hand Wash Shower Gel & Bubble Bath - Berry Strawberry', 160, 96, 3.56, 'Code: PC4001   Shade Name: \r\nDP: 160.00   BV: 96.00   PV: 3.56\r\nWeight(gm): 326.00', 31, '2022-02-28 01:37:50'),
(398, 'Fruit Of The Earth Shampoo With Arnica & Tea Tree Oil (Dandruff Control)', 175, 87.5, 3.24, 'Code: PC1005   Shade Name: Fote-Shampoo With Arnica And Tea Tree Oil 200 (New MRP)\r\nDP: 175.00   BV: 87.50   PV: 3.24\r\nWeight(gm): 262.00', 31, '2022-02-28 01:41:41');
INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaPrice1`, `pizzaPrice2`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(399, 'Fruit Of The Earth Shampoo With Henna & Jojoba Oil (Hair Fall Control)', 175, 87.5, 3.24, 'Code: PC1006   Shade Name: Fote-Shampoo With Henna And Jojoba Oil 200 Ml (New MRP)\r\nDP: 175.00   BV: 87.50   PV: 3.24\r\nWeight(gm): 258.00', 31, '2022-02-28 01:42:42'),
(400, 'Fruit Of The Earth Conditioner With Aloe Vera & Almond Oil (Smooth & Shine)', 190, 114, 4.22, 'Code: PC1002   Shade Name: Fote-Conditioner With Aloe Vera And Almond Oi (New MRP)\r\nDP: 190.00   BV: 114.00   PV: 4.22\r\nWeight(gm): 201.00', 31, '2022-02-28 01:43:40'),
(410, 'Baby Spa 2 In 1 Bubble Bath & Wash', 201, 110.55, 4.09, 'Code: BC0010   Shade Name: \r\nDP: 201.00   BV: 110.55   PV: 4.09\r\nWeight(gm): 235.00', 33, '2022-02-28 01:56:43'),
(411, 'Baby Spa Massage Oil', 195, 107.25, 3.97, 'Code: BC0008   Shade Name: \r\nDP: 195.00   BV: 107.25   PV: 3.97\r\nWeight(gm): 198.00', 33, '2022-02-28 01:57:31'),
(413, 'Baby Spa No-Tears Shampoo', 190, 104.5, 3.87, 'Code: BC0005   Shade Name: \r\nDP: 190.00   BV: 104.50   PV: 3.87\r\nWeight(gm): 235.00', 33, '2022-02-28 01:59:41'),
(414, 'Baby Spa Moisturising Lotion', 175, 96.25, 3.56, 'Code: BC0004   Shade Name: \r\nDP: 175.00   BV: 96.25   PV: 3.56\r\nWeight(gm): 225.00', 33, '2022-02-28 02:00:32'),
(415, 'Baby Spa Milk Cream', 100, 55, 2.04, '\r\nCode: BC0003   Shade Name: \r\nDP: 100.00   BV: 55.00   PV: 2.04\r\nWeight(gm): 58.00', 33, '2022-02-28 02:01:28'),
(419, 'Fruit of the Earth-Henna', 80, 40, 1.48, 'Code: PC1022   Shade Name: \r\nDP: 80.00   BV: 40.00   PV: 1.48\r\nWeight(gm): 120.00', 31, '2022-02-28 02:11:43'),
(420, 'Sofwash Lime Soap ', 32, 8, 0.3, 'Code: PC4013   Shade Name: \r\nDP: 32.00   BV: 8.00   PV: 0.30\r\nWeight(gm): 103.00', 31, '2022-02-28 02:15:07'),
(421, 'Sofwash Orange Soap', 32, 8, 0.3, 'Code: PC4012   Shade Name: \r\nDP: 32.00   BV: 8.00   PV: 0.30\r\nWeight(gm): 103.00', 31, '2022-02-28 02:16:13'),
(422, 'Sofwash Berry Strawberry 3 In 1- Refill Pouch -New (Green Apple) (Citrusy Lime)  ', 250, 150.21, 5.56, 'Code: PC4007  PC4008  PC4009 Shade Name: \r\nDP: 250.00   BV: 150.21   PV: 5.56\r\nWeight(gm): 537.00', 31, '2022-02-28 02:24:14'),
(423, 'Fresh Moments Deep Clean Anti-Cavity Toothpaste', 45, 11.25, 0.42, 'Code: PC0035   Shade Name: \r\nDP: 45.00   BV: 11.25   PV: 0.42\r\nWeight(gm): 120.00', 31, '2022-02-28 02:25:29'),
(424, 'FOTE- Heena & Jojoba Oil Shampoo (6ml*48 sachets )', 168, 67.2, 49, 'Code: PC0050   Shade Name: \r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 320.00', 31, '2022-02-28 02:29:27'),
(425, 'FOTE -Arnica & Tea Tree Oil Shampoo (6ml *48 sachets )', 168, 67.2, 2.49, 'Code: PC0051   Shade Name: \r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 320.00', 31, '2022-02-28 02:30:56'),
(426, 'Baby Spa Soft Cleansing Wipes', 220, 88, 3.26, 'Code: BC0012   Shade Name: \r\nDP: 220.00   BV: 88.00   PV: 3.26\r\nWeight(gm): 515.00', 31, '2022-02-28 10:47:41'),
(427, 'All Pure Germ Protection Wipes-New', 99, 39.6, 1.46, 'Code: PC0070   Shade Name: \r\nDP: 99.00   BV: 39.60   PV: 1.46\r\nWeight(gm): 186.00', 31, '2022-02-28 10:48:40'),
(428, 'Essensual Cold Cream', 173, 86.52, 3.2, 'Code: PC0078   Shade Name: \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nWeight(gm): 155.00', 31, '2022-02-28 10:49:26'),
(429, 'All Pure Hand Sanitizer New', 115, 28.75, 1.06, 'Code: PC0041   Shade Name: \r\nDP: 115.00   BV: 28.75   PV: 1.06\r\nWeight(gm): 249.00', 31, '2022-02-28 10:51:00'),
(431, 'All Pure Hand Sanitizer -Moringa 100ml', 68, 17, 0.63, 'Code: PC0043   Shade Name: \r\nDP: 68.00   BV: 17.00   PV: 0.63\r\nWeight(gm): 106.00', 31, '2022-02-28 10:53:07'),
(432, 'All Pure Hand Sanitizer New', 225, 56.25, 2.08, 'Code: PC0042   Shade Name: \r\nDP: 225.00   BV: 56.25   PV: 2.08\r\nWeight(gm): 497.00', 31, '2022-02-28 10:54:39'),
(433, 'All Pure Hand Sanitizer New', 30, 3, 0.11, 'Code: PC0039   Shade Name: \r\nDP: 30.00   BV: 3.00   PV: 0.11\r\nWeight(gm): 65.00', 31, '2022-02-28 10:55:52'),
(436, 'Schloka Hydrating Papaya & Hibiscus Moisturiser', 245, 147, 5.44, 'Code: SC0025   Shade Name: \r\nDP: 245.00   BV: 147.00   PV: 5.44\r\nWeight(gm): 140.00', 23, '2022-02-28 16:55:55'),
(440, 'Schloka Rejuvenating Day Cream With Almond & Lavender', 240, 144, 5.33, 'Code: SC0013   Shade Name: Schloka Rejuvenating Day Cream (New MRP)\r\nDP: 240.00   BV: 144.00   PV: 5.33\r\nWeight(gm): 131.00', 23, '2022-02-28 17:06:00'),
(443, 'Fruit Of The Earth Cleansing Gel With Apricot & Tea Tree Oil (Ph Balanced)', 250, 125, 4.63, 'Code: PC5262   Shade Name: \r\nDP: 250.00   BV: 125.00   PV: 4.63\r\nWeight(gm): 118.00', 23, '2022-02-28 17:16:31'),
(446, 'Fruit Of The Earth Cleansing Gel With Apricot & Tea Tree Oil (Ph Balanced)', 315, 189, 7, 'Code: PC1001   Shade Name: \r\nDP: 315.00   BV: 189.00   PV: 7.00\r\nWeight(gm): 203.00', 23, '2022-02-28 17:19:04'),
(448, 'Schloka Gold Facial Kit', 225, 135, 5, 'Code: PC1023   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 75.00', 23, '2022-02-28 17:28:18'),
(449, 'Fruit Of The Earth Blooms Of Eden Hydrating Mist New', 520, 312, 11.56, 'Code: PC1016   Shade Name: \r\nDP: 520.00   BV: 312.00   PV: 11.56\r\nWeight(gm): 125.00', 23, '2022-02-28 17:29:22'),
(451, 'Fote Red Obsession - Hydra Nourish Cream New', 375, 187.5, 6.94, 'Code: PC1017   Shade Name: \r\nDP: 375.00   BV: 187.50   PV: 6.94\r\nWeight(gm): 50.00', 23, '2022-02-28 17:31:03'),
(452, 'Fruit Of The Earth Moor Mud Mask', 450, 270, 10, 'Code: PC5271   Shade Name: \r\nDP: 450.00   BV: 270.00   PV: 10.00\r\nWeight(gm): 172.00', 23, '2022-02-28 17:32:03'),
(453, 'Fote Red Obsession - Hydra Nourish Scrub New', 375, 187.5, 6.94, 'Code: PC1018   Shade Name: \r\nDP: 375.00   BV: 187.50   PV: 6.94\r\nWeight(gm): 50.00', 23, '2022-02-28 17:33:18'),
(454, 'Fote Red Obsession - Hydra Nourish Mask New', 375, 187.5, 6.94, 'Code: PC1019   Shade Name: \r\nDP: 375.00   BV: 187.50   PV: 6.94\r\nWeight(gm): 50.00', 23, '2022-02-28 17:34:05'),
(456, 'Blackest Black', 332, 199.2, 7.38, 'Code: UC9000   Shade Name: UC Intense Stay 10Hrs Kajal Blackest Black 001 (New MRP)\r\nDP: 332.00   BV: 199.20   PV: 7.38\r\nWeight(gm): 12.00', 24, '2022-02-28 18:57:18'),
(459, 'Wipes', 225, 135, 5, 'Code: UC4801   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 206.00', 24, '2022-02-28 19:00:51'),
(464, 'White Ice', 354, 212.4, 7.87, 'Code: UC4701   Shade Name: White Ice\r\nDP: 354.00   BV: 212.40   PV: 7.87\r\nWeight(gm): 71.00', 24, '2022-02-28 19:06:19'),
(465, 'Fair', 413, 247.8, 9.18, 'Code: UC4600   Shade Name: BB Cream- Fair 30g\r\nDP: 413.00   BV: 247.80   PV: 9.18\r\nWeight(gm): 49.00', 24, '2022-02-28 19:07:17'),
(467, 'Natural', 458, 274.8, 10.18, 'Code: UC4302   Shade Name: UC Ultimate Radiance Foundation Natural (New MRP)\r\nDP: 458.00   BV: 274.80   PV: 10.18\r\nWeight(gm): 57.00\r\n', 24, '2022-02-28 19:08:59'),
(468, 'Ivory', 625, 375, 13.89, 'Code: UC4201   Shade Name: UC Ultimate Radiance Compact 9G Ivory (New MRP)\r\nDP: 625.00   BV: 375.00   PV: 13.89\r\nWeight(gm): 82.00', 24, '2022-02-28 19:09:44'),
(472, 'Coral Rush', 579, 347.4, 12.87, 'Code: UC1201   Shade Name: Coral Rush 4 g\r\nDP: 579.00   BV: 347.40   PV: 12.87\r\nWeight(gm): 34.00', 24, '2022-02-28 19:15:05'),
(473, 'Magic Red', 413, 247.8, 9.18, 'Code: UC1001   Shade Name: MAGIC RED\r\nDP: 413.00   BV: 247.80   PV: 9.18\r\nWeight(gm): 29.00', 24, '2022-02-28 19:15:47'),
(474, 'UC Amuse Shiny Gold Sling Bag', 350, 71, 2.63, 'Code: 600949   Shade Name: \r\nDP: 350.00   BV: 71.00   PV: 2.63\r\nWeight(gm): 240.00', 24, '2022-02-28 19:16:38'),
(475, 'Urban Color Multicolored Pouch', 175, 35, 1.3, 'Code: 600947   Shade Name: \r\nDP: 175.00   BV: 35.00   PV: 1.30\r\nWeight(gm): 0.00', 24, '2022-02-28 19:17:23'),
(476, 'Urban Color Red Floral Pouch', 175, 35, 1.3, 'Code: 600946   Shade Name: \r\nDP: 175.00   BV: 35.00   PV: 1.30\r\nWeight(gm): 0.00', 24, '2022-02-28 19:18:01'),
(479, 'URBAN COLOR LONDON - CREME LIPSTICK', 299, 179.5, 6.65, 'Code: UCL801   Shade Name: Creme Rose\r\nDP: 299.00   BV: 179.50   PV: 6.65\r\nWeight(gm): 26.00', 24, '2022-02-28 19:21:50'),
(480, 'URBAN COLOR LONDON METAL BLAST NAIL LACQUER 6ML - SILVER S', 130, 78.15, 2.89, 'Code: UCL901   Shade Name: URBAN COLOR LONDON METAL BLAST NAIL LACQUER 6ML - SILVER S\r\nDP: 130.00   BV: 78.15   PV: 2.89\r\nWeight(gm): 33.00', 24, '2022-02-28 19:22:40'),
(482, 'Travel Buddy Nail Lacquer Wipes', 152, 76, 2.81, 'Code: UC8001   Shade Name: \r\nDP: 152.00   BV: 76.00   PV: 2.81\r\nWeight(gm): 43.00', 24, '2022-02-28 19:24:18'),
(483, 'Night Cream', 2085, 1251, 46.33, 'Code: UC5902   Shade Name: \r\nDP: 2085.00   BV: 1251.00   PV: 46.33\r\nWeight(gm): 118.00', 24, '2022-02-28 19:25:01'),
(484, 'Day Cream SPF 15', 2085, 1251, 46.33, 'Code: UC5901   Shade Name: \r\nDP: 2085.00   BV: 1251.00   PV: 46.33\r\nWeight(gm): 118.00', 24, '2022-02-28 19:25:54'),
(485, 'Pore Minimising Mist', 869, 521.22, 19.3, 'Code: UC5905   Shade Name: \r\nDP: 869.00   BV: 521.22   PV: 19.30\r\nWeight(gm): 162.00', 24, '2022-02-28 19:26:36'),
(486, 'Power Lift Cleanser', 869, 521.22, 19.3, 'Code: UC5904   Shade Name: \r\nDP: 869.00   BV: 521.22   PV: 19.30\r\nWeight(gm): 138.00', 24, '2022-02-28 19:27:28'),
(487, 'Blue Light Shield Resurfacing Gel Scrub', 478, 287, 10.63, 'Code: UC1103   Shade Name: \r\nDP: 478.00   BV: 287.00   PV: 10.63\r\nWeight(gm): 50.00', 24, '2022-02-28 19:28:35'),
(488, 'Blue Light Shield Reset Serum Oil', 478, 287, 10.63, 'Code: UC1102   Shade Name: \r\nDP: 478.00   BV: 287.00   PV: 10.63\r\nWeight(gm): 20.00', 24, '2022-02-28 19:29:16'),
(489, 'Blue Light Shield Gentle Face Wash', 435, 261, 9.66, 'Code: UC1101   Shade Name: \r\nDP: 435.00   BV: 261.00   PV: 9.66\r\nWeight(gm): 70.00', 24, '2022-02-28 19:30:03'),
(490, 'Go Glow 3 in 1 Cleanser, Makeup Remover & Hydrator', 832, 499.2, 18.49, 'Code: UCL201   Shade Name: \r\nDP: 832.00   BV: 499.20   PV: 18.49\r\nWeight(gm): 204.00\r\n', 24, '2022-02-28 19:30:45'),
(492, 'Collagen Boosting Serum', 1129, 677.74, 25.1, 'Code: UC5903   Shade Name: \r\nDP: 1129.00   BV: 677.74   PV: 25.10\r\nWeight(gm): 90.00', 24, '2022-02-28 19:32:19'),
(495, 'Urban Color London â€“ Skin Type Tester', 199, 79.6, 2.95, 'Code: 601046   Shade Name: \r\nDP: 199.00   BV: 79.60   PV: 2.95\r\nWeight(gm): 5.00', 24, '2022-02-28 19:35:22'),
(496, 'Blue Light Shield Deep Clean Coffee Masque', 565, 339, 12.56, 'Code: UC1105   Shade Name: \r\nDP: 565.00   BV: 339.00   PV: 12.56\r\nWeight(gm): 55.00', 24, '2022-02-28 19:37:31'),
(497, 'Blue Light Shield Moisturising Creme', 565, 339, 12.56, 'Code: UC1104   Shade Name: \r\nDP: 565.00   BV: 339.00   PV: 12.56\r\nWeight(gm): 50.00', 24, '2022-02-28 19:38:32'),
(498, 'Under - Eye Recovery Concentrate', 1216, 729.6, 27.02, 'Code: UC5906   Shade Name: \r\nDP: 1216.00   BV: 729.60   PV: 27.02\r\nWeight(gm): 39.00', 24, '2022-02-28 19:39:26'),
(499, 'Pro Micellar Bi-Phase Makeup Cleanser', 434, 260, 9.62, 'Code: UC9018   Shade Name: \r\nDP: 434.00   BV: 260.00   PV: 9.62\r\nWeight(gm): 183.00\r\n', 24, '2022-02-28 19:49:34'),
(500, 'Pro White Fresh Radiance Lotion', 1477, 886.2, 32.82, 'Code: UC4903   Shade Name: \r\nDP: 1477.00   BV: 886.20   PV: 32.82\r\nWeight(gm): 119.00', 24, '2022-02-28 19:53:25'),
(501, 'Cherry', 173, 103.83, 3.85, 'Code: UCL003   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.85\r\nWeight(gm): 21.00', 24, '2022-02-28 20:45:57'),
(504, 'Pro Selfie Primer', 564, 338, 12.52, 'Code: UC1107   Shade Name: \r\nDP: 564.00   BV: 338.00   PV: 12.52\r\nWeight(gm): 57.00', 24, '2022-02-28 20:50:04'),
(505, 'Instant Radiance Illuminating Lotion', 1279, 767.4, 28.42, 'Code: UC9019   Shade Name: \r\nDP: 1279.00   BV: 767.40   PV: 28.42\r\nWeight(gm): 106.00', 24, '2022-02-28 20:53:13'),
(507, 'Real Maroon', 99, 59.4, 2.2, 'Code: UCL702   Shade Name: \r\nDP: 99.00   BV: 59.40   PV: 2.20\r\nWeight(gm): 3.00', 24, '2022-02-28 20:55:11'),
(508, 'Instant Radiance Illuminating Lotion', 1216, 730, 27.03, 'Code: UC9019   Shade Name: \r\nDP: 1216.00   BV: 730.00   PV: 27.03\r\nWeight(gm): 106.00', 24, '2022-02-28 20:56:15'),
(509, 'Wow Brow Shaping and Defining Kit', 760, 456.52, 16.91, 'Code: UC9029   Shade Name: \r\nDP: 760.00   BV: 456.52   PV: 16.91\r\nWeight(gm): 5.00', 24, '2022-02-28 20:59:17'),
(511, 'Shape Up Crystal Nail Filer-Black', 152, 60.87, 2.25, 'Code: UC9020   Shade Name: \r\nDP: 152.00   BV: 60.87   PV: 2.25\r\nWeight(gm): 24.00', 24, '2022-02-28 21:01:10'),
(512, 'Flawless Finish Beauty Sponge-Pink', 173, 86.52, 3.2, 'Code: UC9022   Shade Name: \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nWeight(gm): 19.00', 24, '2022-02-28 21:02:14'),
(513, 'UC SPARKLE VANITY POUCH WITH POM POM RED', 520, 104, 3.26, 'Code: UC9024   Shade Name: \r\nDP: 520.00   BV: 104.00   PV: 3.26\r\nWeight(gm): 115.00', 24, '2022-02-28 21:03:38'),
(514, 'UC SPARKLE VANITY POUCH WITH POM POM MAGENTA', 520, 104, 3.26, 'Code: UC9025   Shade Name: \r\nDP: 520.00   BV: 104.00   PV: 3.26\r\nWeight(gm): 0.00', 24, '2022-02-28 21:04:25'),
(515, 'UC SPARKLE ADDICT MAKEUP POUCH â€“MAGENTA', 345, 69, 2.19, 'Code: UC9027   Shade Name: \r\nDP: 345.00   BV: 69.00   PV: 2.19\r\nWeight(gm): 87.00', 24, '2022-02-28 21:05:13'),
(516, 'Shape Up Crystal Nail Filer-Pink', 152, 60.87, 2.25, 'Code: UC9023   Shade Name: \r\nDP: 152.00   BV: 60.87   PV: 2.25\r\nWeight(gm): 24.00', 24, '2022-02-28 21:06:02'),
(517, 'UC SPARKLE ADDICT MAKEUP POUCH â€“PINK', 345, 69, 2.19, 'Code: UC9026   Shade Name: \r\nDP: 345.00   BV: 69.00   PV: 2.19\r\nWeight(gm): 84.00', 24, '2022-02-28 21:06:38'),
(518, 'Rose', 130, 78, 2.89, 'Code: UC2201   Shade Name: Rose\r\nDP: 130.00   BV: 78.00   PV: 2.89\r\nWeight(gm): 32.00', 24, '2022-02-28 21:09:25'),
(519, 'Oh So Red', 112, 59.5, 2.2, 'Code: UCL301   Shade Name: Oh So Red\r\nDP: 112.00   BV: 59.50   PV: 2.20\r\nWeight(gm): 32.00', 24, '2022-02-28 21:10:45'),
(522, 'Salon Professional Hair Color-Dark Brown (2)', 415, 166, 6.15, 'Code: PC5233   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00', 24, '2022-03-01 00:59:52'),
(523, 'Salon Professional Advance Formula Smooth & Shine Shampoo', 260, 156.22, 5.79, 'Code: PC5246   Shade Name: \r\nDP: 260.00   BV: 156.22   PV: 5.79\r\nWeight(gm): 230.00', 31, '2022-03-01 01:01:32'),
(524, 'Exotic Tangerine 01', 662, 397, 14.71, 'Code: UC1601   Shade Name: Exotic Tangerine\r\nDP: 662.00   BV: 397.20   PV: 14.71\r\nWeight(gm): 18.00\r\n', 24, '2022-03-01 01:04:45'),
(525, 'DEEP BLACK 001 (Urban color intense color eye)', 445, 267, 9.89, 'Code: UC9001   Shade Name: DEEP BLACK 01\r\nDP: 445.00   BV: 267.00   PV: 9.89\r\nWeight(gm): 11.00', 24, '2022-03-01 01:10:16'),
(526, 'Urban Color London Ultra Precision Lip Liner', 299, 179.5, 6.65, 'Code: UCL501   Shade Name: Rock-N-Red\r\nDP: 299.00   BV: 179.50   PV: 6.65\r\nWeight(gm): 8.00', 24, '2022-03-01 01:14:08'),
(527, 'Strawberry', 173, 103.83, 3.85, 'Code: UCL001   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.85\r\nWeight(gm): 21.00', 24, '2022-03-01 01:16:08'),
(528, 'Radiance Primer', 500, 300, 11.11, 'Code: UC8888   Shade Name: UC Ultimate Radiance Primer 30Ml (New MRP)\r\nDP: 500.00   BV: 300.00   PV: 11.11\r\nWeight(gm): 67.00', 24, '2022-03-01 01:18:11'),
(529, 'SOFWASH KIDS 3 IN 1 HANDWASH, SHOWERGEL & BUBBLE BATH (New MRP)', 239, 143, 4.78, 'Code: BC0001   Shade Name: \r\nDP: 239.00   BV: 143.00   PV: 4.78\r\nWeight(gm): 296.00\r\n', 31, '2022-03-01 01:20:11'),
(530, 'Velocity Men Deodorising Body Talc', 70, 38.56, 1.43, 'Code: PC5003   Shade Name: Velocity Men Deodorising Body Talc (New MRP)\r\nDP: 70.00   BV: 38.56   PV: 1.43\r\nWeight(gm): 137.00', 23, '2022-03-01 01:21:54'),
(531, 'Velocity Men Fairness Cream', 135, 81, 3, 'Code: PC5005   Shade Name: Velocity Men Fairness Cream (50Gm) (New MRP)\r\nDP: 135.00   BV: 81.00   PV: 3.00\r\nWeight(gm): 77.00\r\n', 23, '2022-03-01 01:23:40'),
(532, 'Schloka Under Eye Cream With Ashwagandha & Gotukola', 150, 90, 3.33, 'Code: SC0027   Shade Name: \r\nDP: 150.00   BV: 90.00   PV: 3.33\r\nWeight(gm): 30.00', 23, '2022-03-01 01:26:29'),
(533, 'Schloka Sun Screen Cream Spf 30 Pa+++ With Gotukola & Cucumber', 245, 147, 5.44, 'Code: SC0020   Shade Name: Schloka Sun Screen Spf 30 Pa+++ With Got\r\nDP: 245.00   BV: 147.00   PV: 5.44\r\nWeight(gm): 92.00', 23, '2022-03-01 01:28:55'),
(534, 'Schloka Sun Screen Cream Spf 50 Pa+++ With Vitamin E & Comfrey', 300, 180, 6.67, 'Code: SC0021   Shade Name: \r\nDP: 300.00   BV: 180.00   PV: 6.67\r\nWeight(gm): 95.00', 23, '2022-03-01 01:29:30'),
(535, '(Big) Essensual Hand & Body Lotion (Glycerine & Honey) or (Allantoin & Vit. E) Big - (only 1)', 240, 143.78, 5.33, 'Code: PC0001 PC0002   Shade Name: \r\nDP: 240.00   BV: 143.78   PV: 5.33\r\nWeight(gm): 260.00\r\nonly 1', 23, '2022-03-01 01:33:45'),
(536, '(Small) Essensual Hand & Body Lotion (Glycerine & Honey) Or (Allantoin & Vit. E) - only 1', 160, 95.24, 3.53, 'Code: PC5242  PC5243 Shade Name: \r\nDP: 160.00   BV: 95.24   PV: 3.53\r\nWeight(gm): 117.00\r\n', 23, '2022-03-01 01:35:05'),
(537, 'Fruit Of The Earth Fairness Gel With Liquorice & Aloe Vera (Spf14)', 285, 171, 6.33, 'Code: PC1003   Shade Name: \r\nDP: 285.00   BV: 171.00   PV: 6.33\r\nWeight(gm): 206.00', 23, '2022-03-01 01:36:52'),
(538, 'Sanitary Napkin - Regular', 205, 112.75, 4.18, 'Code: PC6049   Shade Name: \r\nDP: 205.00   BV: 112.75   PV: 4.18\r\nWeight(gm): 117.00', 31, '2022-03-01 01:38:09'),
(539, 'Schloka Moroccan Argan Oil Cleanser', 400, 240, 8.89, 'Code: SC0002   Shade Name: Schloka Moroccan Argan Oil Cleanser (New MRP)\r\nDP: 400.00   BV: 240.00   PV: 8.89\r\nWeight(gm): 273.00', 23, '2022-03-01 01:40:08'),
(540, 'Velocity Men Energising Shower Gel', 209, 114.95, 4.26, 'Code: PC5004   Shade Name: \r\nDP: 209.00   BV: 114.95   PV: 4.26\r\nWeight(gm): 193.00\r\n', 23, '2022-03-01 01:43:56'),
(541, 'Fresh Moments Toothbrush (3)', 203, 101.5, 3.76, 'Code: PC2001   Shade Name: Fresh Moments Tooothbrush (Pack Of 3) (New MRP)\r\nDP: 203.00   BV: 101.50   PV: 3.76\r\nWeight(gm): 77.00', 31, '2022-03-01 01:46:28'),
(542, 'Essensual Perfumed Body Talc - Wild Flower (Big)', 200, 120, 4.44, 'Code: PC0013   Shade Name: \r\nDP: 200.00   BV: 120.00   PV: 4.44\r\nWeight(gm): 459.00', 23, '2022-03-01 01:48:38'),
(543, 'Essensual Instante Tea Tree Oil With Vitamin E', 295, 177, 6.56, 'Code: PC0003   Shade Name: Essensual Instante Tea Tree Oil (15Ml) (New MRP)\r\nDP: 295.00   BV: 177.00   PV: 6.56\r\nWeight(gm): 62.00\r\n', 31, '2022-03-01 01:50:38'),
(544, 'Fruit Of The Earth Face Pack With Neem & Rosemary (Sensitive & Acne Prone Skin)', 245, 122.5, 4.54, 'Code: PC5261   Shade Name: \r\nDP: 245.00   BV: 122.50   PV: 4.54\r\nWeight(gm): 125.00', 23, '2022-03-01 01:52:39'),
(545, 'Fruit Of The Earth Calming White Hydrating Mist New', 520, 312, 11.56, 'Code: PC1015   Shade Name: \r\nDP: 520.00   BV: 312.00   PV: 11.56\r\nWeight(gm): 146.00', 24, '2022-03-01 01:54:15'),
(546, 'Essensual Perfumed Deo Spray - Oriental Spice', 185, 92.5, 3.43, 'Code: PC0007   Shade Name: Essensual Perfumed Deo Spray Oriental Spice 150Ml (New MRP)\r\nDP: 185.00   BV: 92.50   PV: 3.43\r\nWeight(gm): 143.00', 31, '2022-03-01 01:56:13'),
(547, 'UC Nail Lacquer 9Ml-Royal Purple (New MRP)', 179, 107, 3.96, 'Code: UC4419   Shade Name: ROYAL PURPLE\r\nDP: 179.00   BV: 107.00   PV: 3.96\r\nWeight(gm): 59.00', 24, '2022-03-01 01:57:58'),
(548, 'Essensual Perfumed Deo Spray - Momentum', 185, 92.5, 3.43, 'Code: PC0004   Shade Name: Essensual Perfumed Deo Spray Momentum 150Ml (New MRP)\r\nDP: 185.00   BV: 92.50   PV: 3.43\r\nWeight(gm): 156.00', 31, '2022-03-01 02:04:13'),
(549, 'Essensual Perfumed Body Talc - Dreams', 70, 42, 1.56, 'Code: PC0010   Shade Name: Essensual Perfumed Body Talc-Dreams 100G (New MRP)\r\nDP: 70.00   BV: 42.00   PV: 1.56\r\nWeight(gm): 137.00', 31, '2022-03-01 02:06:07'),
(550, 'Essensual Perfumed Deo Spray - Ocean Blue', 185, 92.5, 3.43, 'Code: PC0006   Shade Name: Essensual Perfumed Deo Spray Ocean Blue 150Ml (New MRP)\r\nDP: 185.00   BV: 92.50   PV: 3.43\r\nWeight(gm): 143.00\r\n', 31, '2022-03-01 02:07:59'),
(551, 'Essensual Perfumed Body Talc - Wild Flower', 70, 42, 1.56, 'Code: PC0011   Shade Name: \r\nDP: 70.00   BV: 42.00   PV: 1.56\r\nWeight(gm): 137.00\r\n', 31, '2022-03-01 02:10:06'),
(552, 'Essensual Perfumed Deo Spray - Indulge', 185, 92.5, 3.43, 'Code: PC0005   Shade Name: Essensual Perfumed Deo Spray Indulge 150Ml (New MRP)\r\nDP: 185.00   BV: 92.50   PV: 3.43\r\nWeight(gm): 143.00\r\n', 31, '2022-03-01 02:12:03'),
(553, 'Essensual Perfumed Body Talc - Dreams', 200, 120, 4.44, 'Code: PC0012   Shade Name: Essensual Perfumed Body Talc-Dreams 400G (New MRP)\r\nDP: 200.00   BV: 120.00   PV: 4.44\r\nWeight(gm): 459.00', 31, '2022-03-01 02:13:53'),
(554, 'Ivory Light 01', 782, 469, 17.37, 'Code: UC4204   Shade Name: Ivory Light 01\r\nDP: 782.00   BV: 469.00   PV: 17.37\r\nWeight(gm): 68.00\r\n', 24, '2022-03-01 02:16:26'),
(555, 'Party Pink', 120, 72.41, 2.68, 'Code: UCL401   Shade Name: Party Pink\r\nDP: 120.00   BV: 72.41   PV: 2.68\r\nWeight(gm): 32.00\r\n', 24, '2022-03-01 02:18:02'),
(556, 'Perfect Matte Lipstick 10 in 1 Sampler Set of Corals, Reds & Browns', 249, 49.8, 1.84, 'Code: UC5001   Shade Name: Set of Corals, Reds & Browns â€“ Orange Blaze, Molten Coral, Orange Rum, Burnt Orange, Forever Love, Dreamed, Brown Magic, Brown Sugar, Pink Cocoa & Coffee Twist\r\nDP: 249.00   BV: 49.80   PV: 1.84\r\nWeight(gm): 48.00', 24, '2022-03-01 02:20:01'),
(557, 'Perfect Matte & CrÃ¨me Glam Mix Palette Lipstick 10 in 1 Sampler', 249, 49.8, 1.84, 'Code: UC5005   Shade Name: Mix Palette - Dreamed, Kissable, Cupid, Red Sizzle, Deep Red, Magic Red, Kiss Me, Charming Pink, Berry Crush & Maroon Magic\r\nDP: 249.00   BV: 49.80   PV: 1.84\r\nWeight(gm): 48.00', 24, '2022-03-01 02:20:55'),
(558, 'Creme Glam Lipstick 10 in 1 Sampler Set of Pinks, Mauves & Berries ', 249, 49.8, 1.84, 'Code: UC5004   Shade Name: Set of Pinks, Mauves & Berries - Pink Rose, Vibrant Pink, Pink Burst, Pink Rum, Rose Crush , Sweet Pink, Pouty Pink, Mauve Ice, Clover Mauve & Purple Love\r\nDP: 249.00   BV: 49.80   PV: 1.84\r\nWeight(gm): 48.00', 24, '2022-03-01 02:21:55'),
(559, 'UC Ultimate Radiance Blush 4G Fresh Coral ', 440, 264, 9.78, 'Fresh Coral\r\nCode: UC4101   Shade Name: (New MRP)\r\nDP: 440.00   BV: 264.00   PV: 9.78\r\nWeight(gm): 51.00', 24, '2022-03-01 02:24:03'),
(560, 'URBAN COLOR perfect metal Lipstic', 413, 247.8, 9.18, 'Dreamed\r\nCode: UC1501   Shade Name: DREAMED\r\nDP: 413.00   BV: 247.80   PV: 9.18\r\nWeight(gm): 29.00', 24, '2022-03-01 02:26:21'),
(561, 'Power Matte Transfer Proof Liquid Lip Color', 435, 260.87, 9.66, 'Code: UCL601   Shade Name: Ruby Shock\r\nDP: 435.00   BV: 260.87   PV: 9.66\r\nWeight(gm): 28.00\r\n', 24, '2022-03-01 02:28:09'),
(562, 'Super Matte 16HRS Stay Eye Liner Super Blue â€“ 02 / Black- 02', 593, 355.8, 13.18, 'Super Blue\r\nCode: 0002ML   Shade Name: \r\nDP: 593.00   BV: 355.80   PV: 13.18\r\nWeight(gm): 12.00\r\n', 24, '2022-03-01 02:36:12'),
(563, 'Urban Color London Pro Ultra Finish Contour & Highlighter Kit', 850, 510, 18.89, 'Code :UC9028  DP: 850  BV: 510.00\r\nPV: 18.89 Weight-12gm', 24, '2022-03-01 02:46:18'),
(564, 'Pro White Fresh Radiance Day Cream', 1460, 876, 32.44, 'Code: UC4901   Shade Name: \r\nDP: 1460.00   BV: 876.00   PV: 32.44\r\nWeight(gm): 119.00', 24, '2022-03-01 02:51:09'),
(565, 'UC Ultimate Radiance 3 In 1 Makeup 9G Ivory (New MRP) LVORY', 700, 420, 15.56, 'Ivory\r\nCode: UC4001   Shade Name: \r\nDP: 700.00   BV: 420.00   PV: 15.56\r\nWeight(gm): 78.00', 24, '2022-03-01 02:53:17'),
(566, 'UC Hypnoteyes Eyeshadow Quad (New MRP)', 1167, 700.2, 25.93, 'Everlasting Fun\r\nCode: UC7002   Shade Name: UC Hypnoteyes Eyeshadow Quad (New MRP)\r\nDP: 1167.00   BV: 700.20   PV: 25.93\r\nWeight(gm): 82.00', 24, '2022-03-01 02:55:27'),
(567, 'Herbal Tea Latte (Immunity Booster)', 349, 303, 121.2, 'Code: HL2075\r\nMRP:349 DP:303 BV:121.2 PV:4.49', 22, '2022-03-20 01:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'ModicarePrice', 'neelnsoni13@gmail.com', 7874866543, 9427080543, 'Aravalli / Gujarat', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `mca` int(9) NOT NULL,
  `code` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ava` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `mca`, `code`, `email`, `address`, `ava`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 12345678, 'adm123', 'admin@gmail.com', '', '', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(48, '87389300', 'Dr Dimple', 'Nikunjkumar Soni', 87389300, 'bayad123', 'nikunjsoni13@gmail.com', '59,SHREEJICHARAN SOCIETY,OPP RELIANCE PETROL PUMP / BAYAD / ARAVALLI / GUJARAT', '7 Days = 7 Am to 10 Pm & Sunday =10 Am to 2 Pm', 9427080543, '1', '$2y$10$B4Li36wLqedmMXZr1VIL.uYPa18I5PRQefcuxPok23B19U24p6pPK', '2022-03-23 18:28:54'),
(49, '87389301', 'Purvi', 'Popat', 87389301, 'rajkot123', 'purvi@gmail.com', 'Rajkot Raiya Road', '7 Days = 7 Am to 10 Pm & Sunday =10 Am to 2 Pm', 7060504030, '1', '$2y$10$JngXyRNP36FIi0M42ZdRPup4szKf9J./yrppYpE0zpTlcweFY7uw.', '2022-03-23 18:32:23'),
(50, '87389310', 'Sabnam', 'Malik', 0, '', '', '', '', 8070605040, '0', '$2y$10$jQWU6nsKUIVIx1Fs0X3fu.3.W8XRtHElwcpfmqqOiPgKr95ynJVRm', '2022-03-23 18:39:57'),
(52, '87389313', 'Neel', 'Soni', 0, '', 'neelnsoni13@gmail.com', '', '', 7874866543, '0', '$2y$10$Zl.YI26I/GEkXHg4UuFpKuP4eLzGy6nb5h.TiwtAUrU7ZPDdE3FJK', '2022-03-26 15:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(216, 161, 1, 50, '2022-03-24 22:32:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `giftdetails`
--
ALTER TABLE `giftdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `paydetails`
--
ALTER TABLE `paydetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `giftdetails`
--
ALTER TABLE `giftdetails`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `paydetails`
--
ALTER TABLE `paydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
