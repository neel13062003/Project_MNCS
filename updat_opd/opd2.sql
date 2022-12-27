-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2022 at 11:30 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

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
(22, 'HEALTH & NUTRITION', 'Nutrition is a critical part of health and development. Better nutrition is related to improved infant, child and maternal health, stronger immune systems, safer pregnancy and childbirth, lower risk of non-communicable diseases (such as diabetes and cardiovascular disease), and longevity. Healthy children learn better.', '2021-11-28 17:54:19'),
(23, 'SKIN CARE', 'Skin Care', '2021-11-29 22:26:16'),
(24, 'URBAN COLOR', 'Urban Color', '2021-11-29 22:26:49'),
(26, 'AGRICULTURE', 'Agriculture', '2021-11-29 22:29:29'),
(27, 'AUTO CARE', 'Auto Care', '2021-11-29 22:30:05'),
(28, 'FOOD & BEVERAGES', 'Food & Beverages', '2021-11-29 22:31:42'),
(29, 'DIVINE', 'Divine', '2021-11-29 22:37:04'),
(30, 'LITERATURE', 'Literature', '2021-11-29 22:37:34'),
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

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(12, 15, 'neelnsoni13@gmail.com', 7874866543, 0, 'i not satisfied with your product', '2021-12-17 17:34:22');

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

--
-- Dumping data for table `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(10, 12, 15, 'ok we will take care next time', '2021-12-17 17:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(15, 29, 'chagan', 9457811378, 50, '2021-12-17 17:33:18');

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
(1, 1, 1, 15),
(2, 1, 2, 1),
(3, 1, 7, 1),
(4, 1, 22, 1),
(5, 2, 14, 1),
(6, 3, 14, 2),
(7, 3, 44, 1),
(8, 3, 49, 1),
(9, 3, 52, 1),
(10, 3, 1, 1),
(11, 4, 69, 3),
(12, 4, 70, 2),
(13, 5, 70, 2),
(14, 6, 38, 1),
(15, 6, 39, 1),
(16, 6, 40, 1),
(17, 7, 69, 10),
(18, 7, 70, 3),
(19, 8, 2, 1),
(20, 8, 4, 1),
(21, 8, 69, 10),
(22, 9, 69, 1),
(23, 9, 70, 1),
(24, 10, 69, 1),
(25, 10, 71, 1),
(26, 10, 72, 1),
(27, 11, 72, 1),
(28, 12, 69, 1),
(29, 13, 69, 1),
(30, 13, 70, 1),
(31, 14, 69, 1),
(32, 15, 69, 1),
(33, 16, 70, 1),
(34, 16, 71, 1),
(35, 17, 72, 2),
(36, 18, 71, 1),
(37, 18, 72, 1),
(38, 19, 70, 1),
(39, 19, 71, 1),
(40, 19, 72, 1),
(41, 20, 70, 1),
(42, 20, 71, 1),
(43, 21, 69, 1),
(44, 21, 71, 1),
(45, 22, 69, 1),
(46, 23, 69, 1),
(47, 23, 70, 1),
(48, 24, 69, 2),
(49, 24, 70, 1),
(50, 25, 74, 3),
(51, 25, 87, 1),
(52, 25, 95, 1),
(53, 25, 96, 1),
(54, 26, 69, 1),
(55, 28, 69, 1),
(56, 29, 121, 2),
(57, 29, 69, 1),
(58, 30, 69, 1),
(59, 30, 71, 1),
(60, 30, 72, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `username1` varchar(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `username1`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(29, 'neelsoni', 15, '59/Shriji charan society / Opp Reliance Petrol Pump. Modasa Road / Bayad / Aravalli / Gujarat , Bayad', 383325, 7874866543, 321, '0', '4', '2021-12-17 17:31:38'),
(30, 'DHRUV', 16, 'Shreedhar society, opp relaince petrol pump', 383325, 7874866543, 1569, '0', '0', '2022-02-11 15:52:23');

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
(69, 'Well Amla', 185, 82.5, 10, 'Well Amla contains fruit extract of Emblica officinalis standardized for 30% tannins. Amla helps boost immunity by building the bodyâ€™s natural defense system to fight infections. It is a natural source of Vitamin C and antioxidants that helps fight free radicals. Amla can help delay the signs of ageing and improve the appearance of skin and hair. It helps in detoxification and supports the digestive system.\r\n\r\n100 % Natural, Gluten Free, Vegan and Vegetarian\r\n\r\nContains no added colour, flavours or preservatives\r\n\r\n \r\n\r\nName & Address of the Manufacturer\r\nPrakruti Products Pvt. Ltd.,\r\nB 1/2,Navagadde, Agsoor, Ankola, Karnataka-581314\r\nName & Address of the Marketer:\r\nModicare Ltd., 5 Community Centre, New Friends Colony, New Delih-110025', 22, '2021-11-28 17:57:40'),
(70, 'Well Turmeric', 900, 450, 25, 'Well Turmeric contains turmeric extract standardized for 95% curcuminoids. It provides the most important active constituents â€“ Curcumin, Demethoxycurcumin, Biodemethoxycurcumin. They are known to possess anti-inflammatory and antioxidant properties; Curcumin is considered anti-ageing and helps to protect cells against free radicals. It helps to improve immunity, supports cardiovascular, joint, and skin health. It also contains Piperine derived from black pepper extract and standardized to 95%. Piperine is known to increase the bioavailability of nutrients in the body.\r\n\r\nOne Tumeric tablet is equivalent to 33 Turmeric roots\r\n\r\n100 % Natural, Gluten Free, Vegan and Vegetarian\r\n\r\nContains no added colour, flavours or preservatives\r\n\r\n \r\n\r\nName & Address of the Manufacturer\r\nPrakruti Products Pvt. Ltd.,\r\nB 1/2,Navagadde, Agsoor, Ankola, Karnataka-581314\r\nName & Address of the Marketer:\r\nModicare Ltd., 5 Community Centre, New Friends Colony, New Delih-110025', 22, '2021-11-28 18:01:23'),
(71, 'Well Brahmi', 385, 150, 16.45, 'Well Brahmi contains Bacopa extract standardized for 20% bacosides to give you all the natural benefits of the herb.  Brahmi helps to calm the mind, promotes clarity of thought, supports cognition and improves the memory. It is considered ideal for improving mental agility, concentration and alertness. It helps to support the functioning of the central nervous system.\r\n\r\n100 % Natural, Gluten Free, Vegan and Vegetarian\r\n\r\nContains no added colour, flavours or preservatives\r\n\r\nName & Address of the Manufacturer\r\nPrakruti Products Pvt. Ltd.,\r\nB 1/2,Navagadde, Agsoor, Ankola, Karnataka-581314\r\nName & Address of the Marketer:\r\nModicare Ltd., 5 Community Centre, New Friends Colony, New Delih-110025', 22, '2021-11-29 22:44:52'),
(72, 'Well Brain Activ', 999, 356, 25.6, 'Well BrainActiv supports brain function, improves memory, concentration and recall. A powerful combination of ingredients â€“ Bacopa, Ginkgo biloba, Rosemary and Soy Lecithin are known to provide nourishment to the brain.\r\n\r\nIt promotes mental clarity and assists to reduce age-related memory loss. It contains antioxidants that help to reduce free radicals formed in the body, and helps to promote healthy blood circulation, levels of oxygen and nutrients to the brain. \r\n\r\n100 % Natural, Gluten Free, Vegan and Vegetarian\r\n\r\nContains no added colours or flavours \r\n\r\n \r\n\r\nName & Address of the Manufacturer\r\nPrakruti Products Pvt. Ltd.,\r\nB 1/2,Navagadde, Agsoor, Ankola, Karnataka-581314\r\nName & Address of the Marketer:\r\nModicare Ltd., 5 Community Centre, New Friends Colony, New Delih-110025', 22, '2021-11-29 22:45:59'),
(74, 'Well Multivitamin Multimineral', 350, 210, 7.78, 'Code: HL2009   Shade Name: Well Multivitamin-Multimineral Tablets (New MRP)\r\nDP: 350.00   BV: 210.00   PV: 7.78\r\nWeight(gm): 78.00', 22, '2021-12-02 14:43:32'),
(86, 'Amrit Shakti', 300, 150.3, 20.34, 'Amrit Shakti', 22, '2021-12-02 18:47:55'),
(87, 'Ashwgandha', 500, 250.25, 25, 'Ashwgandha', 22, '2021-12-02 19:59:21'),
(88, 'Calcium', 466, 395, 15.56, 'Calcium', 22, '2021-12-02 20:00:44'),
(89, 'Cardio Active', 521, 435, 25, 'Cardio Active', 22, '2021-12-02 20:01:29'),
(90, 'Intelecte', 600, 300, 25, 'Intelecte', 22, '2021-12-02 20:02:41'),
(91, 'Omega', 600, 300, 25, 'Omega', 22, '2021-12-02 20:03:41'),
(92, 'Dtox', 535, 457, 15.56, 'Dtox', 22, '2021-12-02 20:04:44'),
(93, 'Dtox', 535, 457, 15.56, 'Dtox', 22, '2021-12-02 20:04:44'),
(94, 'Shilajit Ojas Red', 599, 499, 52, 'Shilajit Ojas Red', 22, '2021-12-02 20:05:55'),
(95, 'Well Vitamin D3', 500, 250, 10, 'Well Vitamin D3', 22, '2021-12-02 20:06:44'),
(96, 'Well Vitamin C', 600, 300, 20, 'Well Vitamin C', 22, '2021-12-02 20:07:45'),
(97, 'Well Triphala', 600, 300, 20, 'Well Triphala', 22, '2021-12-02 20:09:05'),
(98, 'Well Vitamin B', 500, 250, 10, 'Well Vitamin B', 22, '2021-12-02 20:10:49'),
(99, 'Well Phudina', 500, 250, 10, 'Well Phudina', 22, '2021-12-02 20:11:57'),
(100, 'Well Protein Crest', 1114, 600, 26, 'Well Protein Crest', 22, '2021-12-02 20:14:20'),
(101, 'Well Korean', 900, 450, 25, 'Well Korean', 22, '2021-12-02 20:15:43'),
(102, 'Well Chyawanprash', 565, 250, 13, 'Well Chyawanprash', 22, '2021-12-02 20:17:40'),
(103, 'Well Flax Oil', 600, 200, 10, 'Well Flax Oil', 22, '2021-12-02 20:18:38'),
(104, 'Well Noni Juice Concentrate', 499, 199.6, 7.39, 'Code: HL2006   Shade Name: Well Noni Juice Concentrate (1 L) (New MRP)\r\nDP: 499.00   BV: 199.60   PV: 7.39\r\nWeight(gm): 1253.00', 22, '2021-12-02 20:25:39'),
(105, 'Well Iron Folic Acid', 600, 100, 25, 'Well Iron Folic Acid', 22, '2021-12-02 20:26:56'),
(107, 'Well Aloe Vera', 280, 112, 4.15, 'Code: HL2011   Shade Name: \r\nDP: 280.00   BV: 112.00   PV: 4.15\r\nWeight(gm): 1110.00', 22, '2021-12-02 20:29:55'),
(111, 'Fruit Of The Earth Instant Blended Coffee', 150, 60, 2.22, 'Code: FP3009   Shade Name: Fruit of the Earth Blended Instant Coffee\r\nDP: 150.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 239.00', 22, '2021-12-02 20:57:09'),
(112, 'Well Karela Jamun', 600, 300, 20, 'Well Karela Jamun', 22, '2021-12-02 20:59:02'),
(113, 'Well Glucosamine', 1225, 600, 30, 'Well Glucosamine', 22, '2021-12-02 21:00:51'),
(114, 'Well Garlic Perl', 292, 185, 20.34, 'Well Garlic Perl', 22, '2021-12-02 21:01:31'),
(115, 'Well GIloy', 500, 250, 154, 'Well GIloy', 22, '2021-12-02 21:03:21'),
(118, 'Baby Spa Moturise Lotion', 147, 80, 2.53, 'Baby Spa Moturise Lotion', 33, '2021-12-02 21:09:21'),
(119, 'Baby Spa Nourishing Soap', 59, 32.45, 1.2, 'Code: BC0002    \r\nDP: 59.00   BV: 32.45   PV: 1.20', 33, '2021-12-02 21:10:05'),
(121, 'Baby Talc Powder', 68, 37.4, 1.39, 'Code: BC0009   Shade Name: \r\nDP: 68.00   BV: 37.40   PV: 1.39\r\nWeight(gm): 128.00', 33, '2021-12-02 21:11:03'),
(122, 'Body Spray', 170, 85, 20.5, 'Body Spray', 31, '2021-12-02 21:12:21'),
(123, 'Body Lotion', 140, 70, 10, 'Body Lotion', 31, '2021-12-02 21:13:18'),
(124, 'Fresh Moments Blue Toothpaste PC2000', 62, 30, 10, 'Fresh Moments Blue Toothpaste PC2000', 31, '2021-12-02 21:15:05'),
(125, 'Modicare Environ Chip Laptop', 2000, 1000, 20, 'Modicare Environ Chip Laptop', 31, '2021-12-02 21:16:46'),
(126, 'Modicare Environ Router Chip', 583, 583, 20, 'Modicare Environ Router Chip', 31, '2021-12-02 21:18:38'),
(127, 'Modicare Environ Pink Magneta Chip', 583, 200, 20, 'Modicare Environ Pink Magneta Chip', 31, '2021-12-02 21:19:36'),
(128, 'Modicare Anti Radiation Environ Blue Chip', 583, 200, 20, 'Modicare Anti Radiation Environ Blue Chip', 31, '2021-12-02 21:20:27'),
(129, 'Modicare Anti Radiation Environ Black Chip', 583, 25, 25, 'Modicare Anti Radiation Environ Black Chip', 31, '2021-12-02 21:21:06'),
(130, 'Modicare Anti Radiation Environ Silver Chip', 583, 250, 22, 'Modicare Anti Radiation Environ Silver Chip', 31, '2021-12-02 21:21:55'),
(131, 'Glycerine Orange Soap', 150, 75, 20, 'Glycerine Orange Soap', 31, '2021-12-02 21:23:25'),
(132, 'Salon Hair Oil', 98, 49, 1.81, 'Salon Hair Oil', 31, '2021-12-03 14:00:24'),
(133, 'Anti Bacterial Soap 75g', 40, 10, 0.74, 'Anti Bacterial Soap (75g)', 31, '2021-12-03 14:02:17'),
(134, 'Washmate Popular Detergent Powder 1Kg', 160, 56, 2.07, 'Code: LC1018   Shade Name: \r\nDP: 160.00   BV: 56.00   PV: 2.07\r\nWeight(gm): 1012.00', 31, '2021-12-03 14:04:51'),
(135, 'Well Tulsi ', 385, 231, 8.56, 'Code: HL2028   Shade Name: \r\nDP: 385.00   BV: 231.00   PV: 8.56\r\nWeight(gm): 55.00\r\nThe holistically balanced formula features holy basil leaf extract which is standardized to contain 2% ursolic acid. Tulsi helps to fight infections, common cough and cold and boosts immunity. It possesses adaptogenic and antioxidant properties. It has shown to support a healthy response to stress and respiratory disorders.\r\n\r\nOne Tulsi tablet is equivalent to 150 leaves\r\n100 % Natural, Gluten Free, Vegan and Vegetarian\r\nContains no added colour, flavours or preservatives\r\n \r\nName & Address of the Manufacturer\r\nPrakruti Products Pvt. Ltd.,\r\nB 1/2,Navagadde, Agsoor, Ankola, Karnataka-581314\r\nName & Address of the Marketer:\r\nModicare Ltd., 5 Community Centre, New Friends Colony, New Delih-110025', 22, '2022-02-18 14:15:04'),
(136, 'Soul Flavours Premium Basmati Rice ', 750, 150, 5.56, 'Code: FP3107   Shade Name: \r\nDP: 750.00   BV: 150.00   PV: 5.56\r\nWeight(gm): 5050.00', 28, '2022-02-18 14:32:18'),
(137, ' Soul Flavours Shahi Paneer - FP3079', 195, 39, 1.44, 'Code: FP3079   Shade Name: \r\nDP: 195.00   BV: 39.00   PV: 1.44\r\nWeight(gm): 334.00', 28, '2022-02-18 14:37:52'),
(138, 'Soul Flavours Malai Kofta FP3081  ', 173, 34.6, 1.28, 'Grab ready to eat Soul Flavours Malai Kofta to fulfil your cravings. You can now enjoy gourmet Indian dishes without going through the hassle of asking the recipe or having to stand in the kitchen for long hours. It is ready to eat in just 3-5 minutes.', 28, '2022-02-18 14:41:18'),
(139, 'Soul Flavours Rajma  FP3085 ', 93, 18.69, 3.69, 'Grab ready to eat Soul Flavours Rajma to fulfil your cravings. You can now enjoy gourmet Indian dishes without going through the hassle of asking the recipe or having to stand in the kitchen for long hours. It is ready to eat in just 3-5 minutes.', 28, '2022-02-18 14:48:09'),
(140, 'Fruit Of The Earth 100% Pure Instant Coffee FP3008  ', 150, 60, 2.22, 'Code: FP3008   Shade Name: Fruit of the Earth 100% Pure Instant Coffee\r\nDP: 150.00   BV: 60.00   PV: 2.22\r\nWeight(gm): 239.00', 28, '2022-02-18 14:52:09'),
(141, 'Soul Flavours Honey', 315, 126, 4.67, 'Code: FP0010   Shade Name: \r\nDP: 315.00   BV: 126.00   PV: 4.67\r\nWeight(gm): 550.00', 28, '2022-02-18 14:54:47'),
(142, 'Fruit Of The Earth Coconut Oil', 199, 39.8, 1.47, 'Code: FP0006   Shade Name: \r\nDP: 199.00   BV: 39.80   PV: 1.47\r\nWeight(gm): 523.00', 28, '2022-02-18 14:59:11'),
(144, 'Soul Flavours Chatpata Amla Candy', 265, 106, 3.93, 'Code: FP0009   Shade Name: \r\nDP: 265.00   BV: 106.00   PV: 3.93\r\nWeight(gm): 580.00', 28, '2022-02-18 15:07:20'),
(145, 'SOUL FAVOURS ACTIVE RICE bran oil.5 litre', 1150, 230, 8.52, 'Your favourite oil is now available in 5 litre pack\r\n\r\nRice Bran Oil extracted from the hard-outer brown layer of rice is one of the most nutritious edible oils available. With High Oryzanol content of 1350mg per 100g, it helps lower bad cholesterol and has upto 15% less oil absorption level leading to reduced calories and better tasting food. \r\nProduced with the patented “Physical Refining” process, it is perfect for Indian cooking, stir frying & deep frying due to its High Smoke Point. It is trans-fat free and is fortified with Vitamins A & D2 to give you a healthy medium of cooking.', 28, '2022-02-18 15:12:48'),
(146, 'Soul Flavours Cow Ghee', 625, 62.5, 2.31, 'Code: FP0016   Shade Name: \r\nDP: 625.00   BV: 62.50   PV: 2.31\r\nWeight(gm): 945.00', 28, '2022-02-18 15:15:37'),
(149, 'Washmate Matic Concentrated Detergent - LC2015 Powder ', 145, 50.75, 1.88, 'Code: LC2015   Shade Name: \r\nDP: 145.00   BV: 50.75   PV: 1.88\r\nWeight(gm): 507.00', 31, '2022-02-18 15:33:39'),
(150, 'SM LADIES  SILVER PLATED DIAL GOLD WATCH - WAT027', 2608, 1303.91, 48.29, 'These premium silver-plated dials and Gold watch is designed to give our customers an elegant look. Inspired by the vigour, thinking and mind set of today’s youths. The watch is made with high quality Japanese Movements creating a stylish and monochromatic look for today’s youth. The case is made of brass with premium stainless steel to give a perfect finish.', 34, '2022-02-18 15:37:44'),
(151, 'Beyond Blue - HC0027 ', 160, 80, 2.96, 'Makes your toilet clean, germ - free & hygienically fresh in just 90 seconds. Unique colour changing formula shows the product working.. Convenient and easy to use.', 33, '2022-02-18 15:41:09'),
(152, 'Fresh Moments Gel Toothpaste  ', 90, 45, 1.67, 'Green ToothPaste  Code: PC2004    \r\nDP: 90.00   BV: 45.00   PV: 1.67', 33, '2022-02-18 16:08:24'),
(153, 'Fresh Moments Ayurvedic Herbal Toothpaste - PC0036', 55, 13.75, 0.51, 'Orange ToothPaste', 33, '2022-02-18 16:10:28'),
(154, 'Sanitary Napkin - X-Large PC6051', 240, 132, 4.89, 'stay fresh with freedom sanitary napkin designed with 8 layers for optimal absorption', 31, '2022-02-18 16:18:43'),
(155, 'Sanitary Napkin - Large  PC6050 ', 225, 123.75, 4.58, 'stay fresh with freedom sanitary napkin designed with 8 layers for optimal absorption', 31, '2022-02-18 16:20:45'),
(156, 'Sofwash 3 In 1 Hand Wash, Shower Gel & Bubble Bath - Citrusy Lime ', 142, 85.2, 3.16, ' PC4002  - Orange Hand Wash', 33, '2022-02-18 16:22:33'),
(157, 'Velocity Men Oil Clear Face Wash (50Gm)', 125, 75, 2.78, 'PC5009 DP: 125.00   BV: 75.00   PV: 2.78', 31, '2022-02-18 16:25:28'),
(158, 'Schloka Purifying Lime Peel & Neem Face Wash-Men', 180, 108, 4, 'Code: SC3021   \r\nDP: 180.00   BV: 108.00   PV: 4.00', 31, '2022-02-18 16:28:55'),
(159, 'Fresh Moments Toothbrush', 150, 75, 2.78, 'Code: PC2002   Shade Name: Fresh Moments Tooth Brush (Pack Of 4) (New MRP)\r\nDP: 150.00   BV: 75.00   PV: 2.78', 31, '2022-02-18 16:30:20'),
(160, 'Sofwash Aloe Vera, Neem & Tulsi soap', 33, 8.25, 0.31, 'Code: PC4010    \r\nDP: 33.00   BV: 8.25   PV: 0.31', 23, '2022-02-18 16:34:54'),
(161, 'Sofwash Sandal Soap New', 32, 8, 0.3, 'Code: PC4011    \r\nDP: 32.00   BV: 8.00   PV: 0.30', 23, '2022-02-18 16:35:57'),
(162, 'Sofwash White Pearl Soap', 183, 91.5, 3.39, 'Code: PC5229   Shade Name: SOFWASH WHITE PEARL SOAP (75G X 4)\r\nDP: 183.00   BV: 91.50   PV: 3.39', 31, '2022-02-18 16:37:04'),
(163, 'Baby Spa Diaper Rash Cream', 127, 69.85, 2.59, 'Code: BC0007   Shade Name: \r\nDP: 127.00   BV: 69.85   PV: 2.59', 33, '2022-02-18 16:38:03'),
(164, 'Essensual Hand & Body Lotion (Allantoin & Vit. E)', 219, 131, 4.87, 'Code: PC0001   \r\nDP: 219.00   BV: 131.40   PV: 4.87', 31, '2022-02-18 16:40:07'),
(165, 'Essensual Cold Cream', 173, 86.52, 3.2, 'Code: PC0078    \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nEssensual Cold Cream with the goodness of Shea Butter, Olive Oil & Aloe Vera deeply nourishes and moisturizes dry, rough & flaky skin leaving it soft, supple and nourished.', 24, '2022-02-18 16:41:36'),
(166, 'Essensual Hand & Body Lotion (Allantoin & Vit. E)', 140, 84, 3.11, 'Code: PC5243   Small\r\nDP: 140.00   BV: 84.00   PV: 3.11\r\nWeight(gm): 117.00', 31, '2022-02-18 16:43:21'),
(167, 'Essensual Soft & Smooth Intensive Foot Care Cream', 210, 125.66, 4.65, 'Code: PC5244   Shade Name: \r\nDP: 210.00   BV: 125.66   PV: 4.65\r\nWeight(gm): 115.00', 31, '2022-02-18 16:44:18'),
(168, 'Salon Professional Amla Hair Oil', 60, 24, 0.89, 'Code: PC0034   Shade Name: \r\nDP: 60.00   BV: 24.00   PV: 0.89\r\nWeight(gm): 103.00', 33, '2022-02-18 16:45:39'),
(169, 'Salon Professional Advance Formula Dandruff Care Shampoo - 288ml(6ml*48 sachets) Blue', 168, 67.2, 2.49, 'Code: PC0047   Shade Name: Blue\r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00', 31, '2022-02-18 16:46:49'),
(170, 'Salon Professional Advance Formula Hair Fall Defense Shampoo - 288ml(6ml*48 sachets) Green', 168, 67.2, 2.49, 'Code: PC0048   Shade Name: Green \r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00', 31, '2022-02-18 16:48:08'),
(171, 'Salon Professional Advance Formula Smooth & Shine Shampoo - 288ml(6ml*48 sachets) Pink', 168, 67.2, 2.49, 'Code: PC0049   Shade Name: Pink\r\nDP: 168.00   BV: 67.20   PV: 2.49\r\nWeight(gm): 325.00\r\n', 31, '2022-02-18 16:49:31'),
(172, 'Fruit Of The Earth Shampoo With Arnica & Tea Tree Oil (Dandruff Control) ', 175, 87.5, 3.24, 'Code: PC1005   Shade Name: Fote-Shampoo With Arnica And Tea Tree Oil 200 (New MRP)\r\nDP: 175.00   BV: 87.50   PV: 3.24\r\nWeight(gm): 262.00\r\n', 31, '2022-02-18 16:50:35'),
(173, 'Salon Professional Hair Color-Chocolate (4)', 415, 166, 6.15, 'Code: PC5235   Shade Name: \r\nDP: 415.00   BV: 166.00   PV: 6.15\r\nWeight(gm): 210.00\r\nMade in Italy, Ammonia & Paraben Free, Enriched with Argan Oil, Olive Oil & Ayurvedic Mix Salon Professional Hair Colouring Crème with the goodness of Argan Oil, Olive Oil & an Ayurvedic Ingredient mix is perfect for complete grey coverage, luster and a vibrant long-lasting color. Ayurvedic ingredients like Sesame, Brahmi and Neem are ideal to protect and nourish the hair shaft.', 24, '2022-02-18 16:52:28'),
(174, 'Salon Professional Argan Oil Of Morocco Hair Treatment Oil New', 630, 378, 14, 'Code: PC5285   \r\nDP: 630.00   BV: 378.00   PV: 14.00\r\nWeight(gm): 225.00', 31, '2022-02-18 16:55:39'),
(175, 'Salon Professional Argan Oil of Morocco - Shampoo', 396, 238, 8.81, ' The luxurious shampoo infused with Moroccan Argan Oil, rich in Vitamin E, fatty acids and antioxidants makes hair strong and helps protect from colour, UV and styling heat damage. \r\n\r\nIt penetrates the hair shaft leaving it nourished, manageable and strong. This moisturizing shampoo cleanses repairs broken strands and dead ends to restore elasticity, moisture, and shine. \r\n \r\nColour Safe, Phosphate & Paraben free\r\nCode: PC5284   Shade Name: \r\nDP: 396.00   BV: 238.00   PV: 8.81\r\nWeight(gm): 236.00', 31, '2022-02-18 17:37:39'),
(176, 'Salon Professional Argan Oil of Morocco - Shampoo', 405, 243, 9, 'The luxurious shampoo infused with Moroccan Argan Oil, rich in Vitamin E, fatty acids and antioxidants makes hair strong and helps protect from colour, UV and styling heat damage. \r\n\r\nIt penetrates the hair shaft leaving it nourished, manageable and strong. This moisturizing shampoo cleanses repairs broken strands and dead ends to restore elasticity, moisture, and shine. \r\n \r\nColour Safe, Phosphate & Paraben free\r\nCode: PC5284   Shade Name: \r\nDP: 405.00   BV: 243.00   PV: 9.00\r\nWeight(gm): 236.00', 31, '2022-02-18 17:38:40'),
(177, 'SALON PROFESSIONAL ADVANCED FORMULA HAIR FALL DEFENSE SHAMPOO', 233, 140, 5.6, 'Code: PC5247   \r\nDP: 233.00   BV: 140.00   PV: 5.60\r\nWeight(gm): 200.00\r\n', 31, '2022-02-18 17:39:55'),
(178, 'SALON PROFESSIONAL ADVANCED FORMULA HAIR FALL DEFENSE SHAMPOO', 233, 140, 5.6, 'Code: PC5247   \r\nDP: 233.00   BV: 140.00   PV: 5.60\r\nWeight(gm): 200.00\r\n', 31, '2022-02-18 17:40:58'),
(179, 'Salon Professional Advance Formula Hair Fall Defense Shampoo', 260, 156.22, 5.79, 'Code: PC5247   Shade Name: \r\nDP: 260.00   BV: 156.22   PV: 5.79\r\nWeight(gm): 230.00\r\n', 31, '2022-02-18 17:41:45'),
(180, 'Salon Professional Advance Formula Dandruff Care Shampoo Blue', 260, 156.22, 5.79, 'Are you facing problem of dandruff? Is an itchy scalp causing you trouble? Have visible flakes of dandruff on your dress embarrassed you?\r\n\r\nSalon Professional Dandruff Care shampoo with Zinc Pyrithione, Vitamin E & Protein Complex helps in preventing dandruff and the associated scalp irritation , itching and dryness. Specially formulated to improve scalp health and repair damaged hair. Pick up a bottle and get ready for dandruff-free healthy looking hair!\r\nCode: PC5245   Shade Name: \r\nDP: 260.00   BV: 156.22   PV: 5.79\r\nWeight(gm): 230.00', 31, '2022-02-18 17:42:47'),
(181, 'Well Amla Juice', 299, 119.6, 4.43, 'Code: HL2012   Shade Name: \r\nDP: 299.00   BV: 119.60   PV: 4.43\r\nWeight(gm): 1090.00', 22, '2022-02-18 17:48:17'),
(182, 'Medium (1Navy Blue Mask + 1 Black Mask) New', 199, 99.5, 3.69, 'Code: HL2032   Shade Name: \r\nDP: 199.00   BV: 99.50   PV: 3.69\r\nWeight(gm): 48.00', 22, '2022-02-18 17:51:15'),
(183, 'Orange', 173, 103.83, 3.85, 'Code: UCL002   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.85\r\nWeight(gm): 21.00', 24, '2022-02-18 17:52:51'),
(184, 'Rosewood', 299, 179.5, 6.65, 'Code: UCL101   Shade Name: Rosewood\r\nDP: 299.00   BV: 179.50   PV: 6.65\r\nWeight(gm): 26.00', 24, '2022-02-18 17:54:30'),
(185, 'Power Matte Transfer Proof Liquid Lip Color', 435, 260.87, 9.66, 'Code: UCL601   Shade Name: Ruby Shock\r\nDP: 435.00   BV: 260.87   PV: 9.66\r\nWeight(gm): 28.00', 24, '2022-02-18 17:55:55'),
(186, 'Nail Enamel Remover', 165, 99, 3.67, 'Code: UC3999   Shade Name: \r\nDP: 165.00   BV: 99.00   PV: 3.67\r\nWeight(gm): 135.00\r\n', 24, '2022-02-18 17:57:49'),
(187, 'Ivory Light 01', 999, 599.4, 22.2, 'Code: UC4305   Shade Name: Ivory Light 01\r\nDP: 999.00   BV: 599.40   PV: 22.20\r\nWeight(gm): 505.00', 24, '2022-02-18 18:48:30'),
(188, 'Real Red', 99, 59.4, 2.2, 'Code: UCL701   Shade Name: \r\nDP: 99.00   BV: 59.40   PV: 2.20\r\nWeight(gm): 3.00\r\n', 24, '2022-02-18 18:49:22'),
(189, 'Blackest Black', 300, 180, 6.67, 'Code: UC9000   Shade Name: UC Intense Stay 10Hrs Kajal Blackest Black 001 (New MRP)\r\nDP: 300.00   BV: 180.00   PV: 6.67\r\nWeight(gm): 12.00\r\n', 24, '2022-02-18 18:50:49'),
(190, 'JET BLACK 001', 525, 315, 11.67, 'Code: UC9013   Shade Name: JET BLACK 001\r\nDP: 525.00   BV: 315.00   PV: 11.67\r\nWeight(gm): 10.00', 24, '2022-02-18 18:52:20'),
(191, 'JET BLACK 001', 525, 315, 11.67, 'Code: UC9013   Shade Name: JET BLACK 001\r\nDP: 525.00   BV: 315.00   PV: 11.67\r\nWeight(gm): 10.00', 24, '2022-02-18 18:55:39'),
(192, 'Dark Brown -01', 520, 313, 11.59, 'Code: UC9017   Shade Name: \r\nDP: 520.00   BV: 313.00   PV: 11.59\r\nWeight(gm): 11.00', 24, '2022-02-18 18:57:28'),
(193, 'Black', 496, 297.6, 11.02, 'Ultimate Lash Mascara is a dual function mascara that instantly adds volume and lengthens eye lashes. Clump-resistant formula deepens, darkens, and thickens eye lashes. The enlarged brush coats your lashes evenly for an enhanced appeal.\r\nCode: UC9999   Shade Name: \r\nDP: 496.00   BV: 297.60   PV: 11.02\r\nWeight(gm): 41.00', 24, '2022-02-18 18:59:14'),
(194, 'Pro White Replenishing Night Cream', 1390, 834, 30.89, 'Code: UC4902   Shade Name: \r\nDP: 1390.00   BV: 834.00   PV: 30.89\r\nWeight(gm): 119.00', 24, '2022-02-18 19:00:43'),
(195, 'Pro White Anti-Spot Radiance Serum', 434, 260.4, 9.64, 'Code: UC4904   Shade Name: \r\nDP: 434.00   BV: 260.40   PV: 9.64\r\nWeight(gm): 52.00\r\n', 24, '2022-02-18 19:01:45'),
(196, 'Pro White Advance Anti-Wrinkle & Nourishing Tencel Sheet Mask with Collagen (New)', 173, 103.83, 3.81, 'Code: UC4905   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.81\r\nWeight(gm): 35.00\r\n', 24, '2022-02-18 19:02:37'),
(197, 'Pro White Super Soothing & Anti - Ageing Tencel Sheet Mask with Aloe (New)', 173, 103.83, 3.81, 'Code: UC4906   Shade Name: \r\nDP: 173.00   BV: 103.83   PV: 3.81\r\nWeight(gm): 35.00', 24, '2022-02-18 19:03:38'),
(198, 'Fine Tip Pencil Sharpener', 125, 62.5, 2.31, 'Code: UC9016   Shade Name: \r\nDP: 125.00   BV: 62.50   PV: 2.31\r\nWeight(gm): 8.00', 24, '2022-02-18 19:05:47'),
(199, 'Flawless Finish Beauty Sponge-Black', 173, 86.52, 3.2, 'Code: UC9021   Shade Name: \r\nDP: 173.00   BV: 86.52   PV: 3.20\r\nWeight(gm): 19.00\r\n', 24, '2022-02-18 19:06:45'),
(200, 'Fruit Of The Earth Red Obsession Hydrating Mist New', 520, 312, 11.56, 'Code: PC1014   Shade Name: \r\nDP: 520.00   BV: 312.00   PV: 11.56\r\nWeight(gm): 146.00', 23, '2022-02-18 19:19:17'),
(201, 'Fruit Of The Earth Moor Mud Facial Bar', 271, 135.5, 5.02, 'Code: PC5224   Shade Name: \r\nDP: 271.00   BV: 135.50   PV: 5.02\r\nWeight(gm): 159.00\r\n', 23, '2022-02-18 19:20:34'),
(202, 'Schloka Purifying Neem & Gotukola Face Wash', 165, 99, 3.67, 'Code: SC0019   Shade Name: \r\nDP: 165.00   BV: 99.00   PV: 3.67\r\nWeight(gm): 96.00\r\n', 23, '2022-02-18 19:21:41'),
(203, 'Schloka 3 In 1 Cleanser, Toner And Make Up Remover With Green Tea & Chamomile Extract', 270, 162, 6, 'Code: SC0003   Shade Name: Schloka 3 In 1 Cleanser, Toner And Make Up Remover (New MRP)\r\nDP: 270.00   BV: 162.00   PV: 6.00\r\nWeight(gm): 265.00', 23, '2022-02-18 19:22:31'),
(204, 'Schloka Moroccan Argan Oil Scrub', 183, 109.8, 4.07, 'Code: SC0024   Shade Name: \r\nDP: 183.00   BV: 109.80   PV: 4.07\r\nWeight(gm): 93.00\r\n', 23, '2022-02-18 19:23:57'),
(205, 'Schloka Avocado Face Scrub With Oatmeal & Neroli', 239, 143.4, 5.31, 'Code: SC0028   Shade Name: \r\nDP: 239.00   BV: 143.40   PV: 5.31\r\nWeight(gm): 94.00', 23, '2022-02-18 19:25:38'),
(206, 'Fruit Of The Earth Face Pack With Neem & Rosemary (Sensitive & Acne Prone Skin)', 304, 182.4, 6.76, 'Code: PC1004   Shade Name: \r\nDP: 304.00   BV: 182.40   PV: 6.76\r\nWeight(gm): 219.00', 23, '2022-02-18 19:26:31'),
(207, 'Schloka Gold Facial Kit', 225, 135, 5, 'Code: PC1023   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 75.00', 23, '2022-02-18 19:27:18'),
(208, 'Schloka D Tan Face Pack With Tulsi & Clove', 162, 97.2, 3.6, 'Code: SC0022   Shade Name: \r\nDP: 162.00   BV: 97.20   PV: 3.60\r\nWeight(gm): 94.00\r\n', 23, '2022-02-18 19:28:33'),
(209, 'Schloka Glow Face Pack With Orange Peel And White Clay', 187, 112, 4.16, 'Code: SC0026   Shade Name: \r\nDP: 187.00   BV: 112.20   PV: 4.16\r\nWeight(gm): 94.00', 23, '2022-02-18 19:29:28'),
(210, 'Schloka Moroccan Argan Oil Facial Kit', 225, 135, 5, 'Code: SC3023   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 75.00', 23, '2022-02-18 19:30:28'),
(211, 'Schloka Body Butter With Shea Butter & Almond Oil', 267, 160.2, 5.93, 'Code: SC0006   Shade Name: \r\nDP: 267.00   BV: 160.20   PV: 5.93\r\nWeight(gm): 207.00', 23, '2022-02-18 19:31:37'),
(212, 'Schloka Hydra - Nourish Facial Cream With Shea Butter, Almond & Olive Oil', 264, 158.4, 5.87, 'Code: SC0009   Shade Name: \r\nDP: 264.00   BV: 158.40   PV: 5.87\r\nWeight(gm): 213.00\r\n', 23, '2022-02-18 19:32:56'),
(213, 'Schloka Hydrating Papaya & Hibiscus Moisturiser', 225, 135, 5, 'Code: SC0025   Shade Name: \r\nDP: 225.00   BV: 135.00   PV: 5.00\r\nWeight(gm): 140.00\r\n', 23, '2022-02-18 19:33:58'),
(214, 'Fruit Of The Earth Cleansing Gel With Apricot & Tea Tree Oil (Ph Balanced)', 315, 189, 7, 'Code: PC1001   Shade Name: \r\nDP: 315.00   BV: 189.00   PV: 7.00\r\nWeight(gm): 203.00', 23, '2022-02-18 19:34:54'),
(215, 'Fruit Of The Earth Fairness Gel With Liquorice & Aloe Vera (Spf14)', 210, 105, 3.89, 'Code: PC5260   Shade Name: \r\nDP: 210.00   BV: 105.00   PV: 3.89\r\nWeight(gm): 115.00\r\n', 23, '2022-02-18 19:36:08'),
(216, 'Fruit Of The Earth Cleansing Gel With Apricot & Tea Tree Oil (Ph Balanced)', 230, 115, 4.26, 'Code: PC5262   Shade Name: \r\nDP: 230.00   BV: 115.00   PV: 4.26\r\nWeight(gm): 118.00', 23, '2022-02-18 19:37:56'),
(217, 'Schloka Fairness Cream With Rose & Honey', 217, 130.2, 4.82, 'Code: SC0008   Shade Name: Schloka Fairness Cream With Rose & Honey (New MRP)\r\nDP: 217.00   BV: 130.20   PV: 4.82\r\nWeight(gm): 131.00', 23, '2022-02-18 19:38:50'),
(218, 'Code: SC0017   Shade Name: Schloka Whitening Cream With Lemon And Turmeric (New MRP) DP: 225.00   BV: 135.00   PV: 5.00 Weight(gm): 129.00', 225, 135, 5, 'Schloka Whitening Cream With Lemon And Turmeric', 23, '2022-02-18 19:39:36'),
(219, 'Schloka Anti Ageing Night Cream With Collagen And Vitamin E', 219, 131.4, 4.87, 'Code: SC0004   Shade Name: Schloka Anti Ageing Night Cream (New MRP)\r\nDP: 219.00   BV: 131.40   PV: 4.87\r\nWeight(gm): 131.00\r\n', 23, '2022-02-18 19:40:59'),
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
(245, 'Auto Glow Auto Polish-For Car, Appliances & Others', 390, 195, 7.22, 'Code: AC3008   Shade Name: \r\nDP: 390.00   BV: 195.00   PV: 7.22\r\nWeight(gm): 541.00', 34, '2022-02-26 13:18:08'),
(246, 'Sm MenS (Day & Date) Square Two Tone Gold Watch', 2869, 1434.35, 53.12, 'Code: WAT005   Shade Name: \r\nDP: 2869.00   BV: 1434.35   PV: 53.12\r\nWeight(gm): 249.00', 34, '2022-02-26 13:20:34'),
(247, 'Sm MenS (Date) Gold Watch New', 2599, 1299.5, 48.13, 'Code: WAT004   Shade Name: \r\nDP: 2599.00   BV: 1299.50   PV: 48.13\r\nWeight(gm): 249.00', 34, '2022-02-26 13:22:07'),
(248, 'Sm MenS (Day & Date) Black Dial Leather Strap Watch', 2521, 1260.43, 46.68, 'Code: WAT003   Shade Name: \r\nDP: 2521.00   BV: 1260.43   PV: 46.68\r\nWeight(gm): 205.00', 34, '2022-02-26 13:23:07'),
(249, 'Sm MenS (Day & Date) Two Tone Gold Watch', 2999, 1499.5, 55.54, 'Code: WAT002   Shade Name: \r\nDP: 2999.00   BV: 1499.50   PV: 55.54\r\nWeight(gm): 286.00', 34, '2022-02-26 13:24:14'),
(250, 'Sm MenS (Day & Date) Two Tone Rose Gold Watch', 3260, 1630, 60.37, 'Code: WAT001   Shade Name: \r\nDP: 3260.00   BV: 1630.00   PV: 60.37\r\nWeight(gm): 284.00', 34, '2022-02-26 13:25:11'),
(251, 'Activmax', 665, 399, 14.78, 'Code: AG0009   Shade Name: \r\nDP: 665.00   BV: 399.00   PV: 14.78\r\nWeight(gm): 620.00', 26, '2022-02-26 14:04:45'),
(252, 'Activzyme', 530, 318, 11.78, 'Code: AG0006   Shade Name: \r\nDP: 530.00   BV: 318.00   PV: 11.78\r\nWeight(gm): 721.00', 26, '2022-02-26 14:05:35'),
(253, 'Activzyme', 374, 224, 8.3, 'Code: AG0005   Shade Name: Active-80\r\nDP: 374.00   BV: 224.00   PV: 8.30\r\nWeight(gm): 495.00', 26, '2022-02-26 14:06:28'),
(254, 'Active - 80 Gold', 640, 384, 14.22, 'Code: AG0004   Shade Name: \r\nDP: 640.00   BV: 384.00   PV: 14.22\r\nWeight(gm): 603.00', 26, '2022-02-26 14:08:42'),
(255, 'Activzyme', 570, 342, 12.67, 'Code: AG0006   Shade Name: \r\nDP: 570.00   BV: 342.00   PV: 12.67\r\nWeight(gm): 721.00', 26, '2022-02-26 14:09:31'),
(256, 'Activzyme', 415, 249, 9.22, 'Code: AG0005   Shade Name: Active-80\r\nDP: 415.00   BV: 249.00   PV: 9.22\r\nWeight(gm): 495.00', 26, '2022-02-26 14:10:05'),
(257, 'Activmax', 490, 294, 10.89, 'Code: AG0008   Shade Name: \r\nDP: 490.00   BV: 294.00   PV: 10.89\r\nWeight(gm): 436.00', 26, '2022-02-26 14:10:53'),
(258, 'Active - 80 (447gm)', 390, 234, 8.67, 'Code: AG0001   Shade Name: Active-80\r\nDP: 390.00   BV: 234.00   PV: 8.67\r\nWeight(gm): 447.00', 26, '2022-02-26 14:13:29'),
(259, 'Active - 80  (631gm)', 560, 336, 12.44, 'Code: AG0002   Shade Name: Active-80\r\nDP: 560.00   BV: 336.00   PV: 12.44\r\nWeight(gm): 631.00', 26, '2022-02-26 14:14:29'),
(260, 'Active - 80 (Big) ', 4235, 2541, 94.11, 'Code: AG0003   Shade Name: Active-80\r\nDP: 4235.00   BV: 2541.00   PV: 94.11\r\nWeight(gm): 5730.00', 26, '2022-02-26 14:16:26'),
(261, 'Washmate Powerclean Detergent Bar', 100, 35, 1.3, 'Code: LC4004   Shade Name: \r\nDP: 100.00   BV: 35.00   PV: 1.30\r\nWeight(gm): 630.00', 31, '2022-02-26 14:21:50'),
(262, 'Washmate Pre Wash Dirt & Stain Remover', 165, 57.75, 2.14, 'Code: LC3021   Shade Name: \r\nDP: 165.00   BV: 57.75   PV: 2.14\r\nWeight(gm): 279.00', 31, '2022-02-26 14:23:43'),
(263, 'Washmate 5 In 1 Liquid Detergent With Powerzyme & Natural Softener (Biosafe Formula)', 350, 210, 7.78, 'Code: LC2018   Shade Name: \r\nDP: 350.00   BV: 210.00   PV: 7.78\r\nWeight(gm): 553.00', 31, '2022-02-26 14:24:47'),
(264, 'Washmate Delicate Liquid Detergent For Woolen & Delicate Fabrics (Biosafe Formula)', 325, 195, 7.22, 'Code: LC2017   Shade Name: \r\nDP: 325.00   BV: 195.00   PV: 7.22\r\nWeight(gm): 555.00', 31, '2022-02-26 14:26:07'),
(265, 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil', 245, 24.5, 0.91, 'Code: FP3056   Shade Name: \r\nDP: 245.00   BV: 24.50   PV: 0.91\r\nWeight(gm): 925.00', 28, '2022-02-26 14:29:25'),
(266, 'Soul Flavours Kachi Ghani Cold Pressed Mustard Oil - 5 Litre', 899, 89.9, 3.1, 'FP3071   DP:-899.00   BV:-89.90\r\nWeight(gm):-	4750.00\r\nQty:-	\r\n0\r\n\r\nWeight(gm): 4750.00', 28, '2022-02-26 14:34:48'),
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
(280, 'Fruit Of The Earth C.T.C & Long Leaf Tea', 140, 56, 2.07, 'Code: FP0003   Shade Name: \r\nDP: 140.00   BV: 56.00   PV: 2.07\r\nWeight(gm): 294.00', 28, '2022-02-26 15:03:37'),
(281, 'Soul Flavours Garam Masala', 73, 18.25, 0.68, 'Code: FP3034   Shade Name: \r\nDP: 73.00   BV: 18.25   PV: 0.68\r\nWeight(gm): 109.00', 28, '2022-02-26 15:07:07'),
(282, 'Soul Flavours Kali Mirch Powder', 170, 42.5, 1.57, 'Code: FP3029   Shade Name: \r\nDP: 170.00   BV: 42.50   PV: 1.57\r\nWeight(gm): 109.00', 28, '2022-02-26 15:08:23'),
(283, 'Soul Flavours Jeera Powder', 68, 17, 0.63, 'Code: FP3025   Shade Name: \r\nDP: 68.00   BV: 17.00   PV: 0.63\r\nWeight(gm): 109.00', 28, '2022-02-26 15:09:48'),
(284, 'Soul Flavours Lal Mirch Powder', 43, 10.75, 0.4, 'Code: FP3023   Shade Name: \r\nDP: 43.00   BV: 10.75   PV: 0.40\r\nWeight(gm): 109.00', 28, '2022-02-26 15:10:30'),
(285, 'Soul Flavours Haldi Powder', 29, 7.13, 0.26, 'Code: FP3030   Shade Name: \r\nDP: 28.50   BV: 7.13   PV: 0.26\r\nWeight(gm): 109.00', 28, '2022-02-26 15:11:46'),
(286, 'Soul Flavours Dhania Powder', 29, 7.13, 0.26, 'Code: FP3027   Shade Name: \r\nDP: 28.50   BV: 7.13   PV: 0.26\r\nWeight(gm): 109.00', 28, '2022-02-26 15:12:39'),
(287, 'Soul Flavours Lal Mirch Powder', 86, 21.5, 0.8, 'Code: FP3054   Shade Name: \r\nDP: 86.00   BV: 21.50   PV: 0.80\r\nWeight(gm): 200.00', 28, '2022-02-26 15:15:19'),
(288, 'Soul Flavours Pav Bhaji Masala', 70, 17.5, 0.65, 'Code: FP3066   Shade Name: \r\nDP: 70.00   BV: 17.50   PV: 0.65\r\nWeight(gm): 100.00', 28, '2022-02-26 15:17:56'),
(290, 'Soul Flavours Chhole Masala', 81, 20.25, 0.75, 'Code: FP3067   Shade Name: \r\nDP: 81.00   BV: 20.25   PV: 0.75\r\nWeight(gm): 100.00', 28, '2022-02-26 15:20:25'),
(291, 'Soul Flavours Chaat Masala', 65, 16.25, 0.6, 'Code: FP3065   Shade Name: \r\nDP: 65.00   BV: 16.25   PV: 0.60\r\nWeight(gm): 104.00', 28, '2022-02-26 15:30:55'),
(292, 'Soul Flavours Haldi Powder', 57, 14.25, 0.53, 'Code: FP3053   Shade Name: \r\nDP: 57.00   BV: 14.25   PV: 0.53\r\nWeight(gm): 200.00\r\n', 28, '2022-02-26 15:31:44'),
(293, 'Soul Flavours Dhania Powder', 57, 14.25, 0.53, 'Code: FP3055   Shade Name: \r\nDP: 57.00   BV: 14.25   PV: 0.53\r\nWeight(gm): 200.00', 28, '2022-02-26 15:32:55'),
(294, 'Soul Pops Freaky Fruity Lollipops', 105, 63, 2.33, 'Code: FP0028   Shade Name: \r\nDP: 105.00   BV: 63.00   PV: 2.33\r\nWeight(gm): 197.00', 28, '2022-02-26 15:33:53'),
(295, 'Soul Flavours Rawal Pindi Chana', 103, 20.6, 0.76, 'Code: FP3083   Shade Name: \r\nDP: 103.00   BV: 20.60   PV: 0.76\r\nWeight(gm): 332.00', 28, '2022-02-26 15:36:55'),
(296, 'Soul Flavours Chicken Biryani', 229, 45.8, 1.7, 'Code: FP3082   Shade Name: \r\nDP: 229.00   BV: 45.80   PV: 1.70\r\nWeight(gm): 282.00', 28, '2022-02-26 15:37:50'),
(297, 'Soul Flavours Malai Kofta', 173, 34.6, 1.28, 'Code: FP3081   Shade Name: \r\nDP: 173.00   BV: 34.60   PV: 1.28\r\nWeight(gm): 340.00', 28, '2022-02-26 15:38:36'),
(298, 'Soul Flavours Chicken Curry Boneless', 229, 45.8, 1.7, 'Code: FP3078   Shade Name: \r\nDP: 229.00   BV: 45.80   PV: 1.70\r\nWeight(gm): 330.00', 28, '2022-02-26 15:39:33'),
(299, 'Soul Flavours Rajma', 93, 18.69, 0.69, 'Code: FP3085   Shade Name: \r\nDP: 93.00   BV: 18.69   PV: 0.69\r\nWeight(gm): 334.00', 28, '2022-02-26 15:40:30'),
(300, 'Soul Flavours Dal Makhni', 93, 18.6, 0.69, 'Code: FP3084   Shade Name: \r\nDP: 93.00   BV: 18.60   PV: 0.69\r\nWeight(gm): 332.00', 28, '2022-02-26 15:41:17'),
(301, 'Soul Flavours Plain Rice', 93, 18.6, 0.69, 'Code: FP3080   Shade Name: \r\nDP: 93.00   BV: 18.60   PV: 0.69\r\nWeight(gm): 284.00', 28, '2022-02-26 15:42:10'),
(302, 'Soul Flavours Soya Tikka Masala', 150, 30, 1.11, 'Code: FP3077   Shade Name: \r\nDP: 150.00   BV: 30.00   PV: 1.11\r\nWeight(gm): 332.00', 28, '2022-02-26 15:43:17'),
(303, 'Soul Flavours Quinoa', 250, 125, 4.63, 'Code: FP0032   Shade Name: \r\nDP: 250.00   BV: 125.00   PV: 4.63\r\nWeight(gm): 510.00', 28, '2022-02-26 15:44:16'),
(304, 'Soul Flavours Active Rice Bran Oil Dispenser', 125, 50, 1.85, 'Code: 606000   Shade Name: \r\nDP: 125.00   BV: 50.00   PV: 1.85\r\nWeight(gm): 86.00', 28, '2022-02-26 15:46:33'),
(305, 'Soul Flavours Fish Masala', 71, 17.75, 0.66, 'Code: FP3062   Shade Name: \r\nDP: 71.00   BV: 17.75   PV: 0.66\r\nWeight(gm): 100.00', 28, '2022-02-26 15:48:54'),
(306, 'Soul Flavours Meat Masala', 71, 17.75, 0.66, 'Code: FP3061   Shade Name: \r\nDP: 71.00   BV: 17.75   PV: 0.66\r\nWeight(gm): 100.00', 28, '2022-02-26 15:49:41'),
(307, 'Soul Flavours Hing', 43, 10.75, 0.4, 'Code: FP3070   Shade Name: \r\nDP: 43.00   BV: 10.75   PV: 0.40\r\nWeight(gm): 22.00\r\n', 28, '2022-02-26 15:50:25'),
(308, 'Soul Flavours Kitchen King Masala', 70, 17.5, 0.65, 'Code: FP3069   Shade Name: \r\nDP: 70.00   BV: 17.50   PV: 0.65\r\nWeight(gm): 100.00', 28, '2022-02-26 15:53:06'),
(309, 'Soul Pops Freaky Fruity Lollipops', 98, 58.8, 2.18, 'Code: FP0028   Shade Name: \r\nDP: 98.00   BV: 58.80   PV: 2.18\r\nWeight(gm): 197.00', 28, '2022-02-26 15:53:58'),
(310, 'Soul Pops Fruit Chaat Candy', 47, 9.4, 0.35, 'Code: FP3058   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:55:02'),
(311, 'Soul Pops Masala Soda Candy', 47, 9.4, 0.35, 'Code: FP3057   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:55:40'),
(312, 'Soul Pops Gazab Guava Candy', 47, 9.4, 0.35, 'Code: FP3052   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:56:24'),
(313, 'Soul Pops Chatpata Orange Candy', 47, 9.4, 0.35, 'Code: FP3051   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:57:21'),
(314, 'Soul Pops Kaccha Aam Candy', 47, 9.4, 0.35, 'Code: FP3044   Shade Name: \r\nDP: 47.00   BV: 9.40   PV: 0.35\r\nWeight(gm): 212.00', 28, '2022-02-26 15:58:10');

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
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58'),
(14, 'vrajpatel', 'Vraj', 'Patel', 'vrajpatel@gmail.com', 9876543210, '0', '$2y$10$4nzvljQ5SJi/nOjftceThuTeZNBqGcC0PmzWUzvvMWTlqVXcpF75W', '2021-11-29 23:40:43'),
(15, 'neelsoni', 'Neel', 'Soni', 'neelnsoni13@gmail.com', 7874866543, '0', '$2y$10$V6TvIb9tkulNck9IFT54YOdMs2YUNh8TfHZX87Jz1eeeQxVtHAQ0i', '2021-11-29 23:53:07'),
(16, 'DHRUV', 'DHRUV', 'PATEL', 'dhruv@gmail.com', 7845963210, '0', '$2y$10$zZrI5538jLNJciH/dxSyH.thRAt70ETTeX4i4kBXA79YMA7p/LOX6', '2021-11-30 10:25:06'),
(18, 'admin1', 'admin1', 'admin1', 'admin1@gmail.com', 9876543210, '1', '$2y$10$9NDC5GU46OzxwIhSsqB9Ee9.CXzNWNjcguAXTiYaYviL72xX1WWfy', '2021-11-30 19:18:28'),
(19, 'MansiGusani', 'Mansi', 'Gusani', 'Mansi@gmail.com', 7896541230, '0', '$2y$10$s5xD.gXygqnGcQjjfU4QQ.YjzNY2cZ6e8DnzJmlJd4E48O.LlATIC', '2022-02-25 09:46:12');

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
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
