-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2019 at 03:31 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ementor`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `name`, `icon`) VALUES
(1, 'Development', 'code'),
(2, 'Business', 'briefcase'),
(3, 'IT &amp; Software', 'rocket'),
(4, 'Office Productivity', 'building-o'),
(5, 'Personal Development ', 'user-circle'),
(6, 'Design', 'paint-brush'),
(7, 'Marketing ', 'bullhorn'),
(8, 'LifeStyle', 'life-ring'),
(9, 'Photography', 'camera'),
(10, 'Health &amp; Fitness', 'heartbeat'),
(11, 'Teacher Training', 'certificate'),
(12, 'Music', 'music'),
(13, 'Acadamics', 'university'),
(14, 'Language', 'language'),
(15, 'Test Prep', 'file-text-o');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subheading` varchar(255) NOT NULL,
  `description` text,
  `prerequisite` text NOT NULL,
  `thumbnail` text,
  `categoryid` int(11) NOT NULL,
  `createdby` int(11) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nooflectures` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseid`, `title`, `subheading`, `description`, `prerequisite`, `thumbnail`, `categoryid`, `createdby`, `language`, `level`, `lastupdated`, `nooflectures`, `price`) VALUES
(4, ' Android s', 'Android Application Development Course', 'Learn How To Design And Build Android Apps And Take Your Idea To Millions Of People', 'Java Language', '/eMentor/media/img/android.jpg', 1, 1, 'Urdu', 'Intermediate', '2018-01-23 09:59:55', 4, 2000),
(5, 'Web Development', 'HTML,CSS,jQuery,javascript,php,ruby,python,mySQL', 'Learn Web Development with easy Programming.Languages are also available\r\nlike HTML,CSS,jQuery,javascript,php,ruby,python,mySQL', 'HTML ', '/eMentor/media/img/web.jpg', 1, 1, 'Urdu', 'Beginner', '2018-01-23 06:15:37', 5, 2000),
(6, 'Word Press Development', 'Simple To Use', 'Learn PSD Design to WordPress\r\n', 'Word Press', '/eMentor/media/img/word.jpg', 1, 1, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 1500),
(7, 'Outcome Based Education & Academic Quality Assurance', 'Master course for teachers and educators to make breakthrough improvements in Quality of Teaching & Learning', 'Learn with examples how successful institutions apply Quality Assurance and Outcome Based Education in their institutions\r\nIdentify the differences between the teacher-centered and student-centered education\r\nUnderstand and analyze different learning theories and taxonomies so that you can assess your own style of teaching and can improve upon it', 'The course is for all levels', '/eMentor/media/img/education.jpg', 13, 2, 'Urdu', 'Intermediate', '2018-01-21 12:22:02', 5, 2000),
(8, 'Academic Vocabulary Builder: Grammar & 560 Word List', 'he course is practical : Learn 560 words for intermediate to advanced students preparing for the IELTS, TOEFL or GRE.', 'Academic Vocabulary Builder is a collection of grammar videos, interactive tests, games, response sheets and quizzes created for students preparing to take the IELTS/TOEFL and GRE/GMAT even SAT/ACT tests. ', 'Hunger to Learn', '/eMentor/media/img/academic.jpg', 13, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(9, 'Advanced Level Psychology Certificate\r\n', 'Psychology skills, Applied Social & Cognitive Psychology, Child Development, Research Methods, academic online study', 'In this course you will learn:\r\n\r\nWhat is perception, attention, and thinking\r\nWhy we conform to other people and authorities\r\nHow we judge other people\r\nHow children develop in various ages\r\nWhat is anxiety, depression, and other emotional disorders\r\nHow to treat \'abnormal behaviour\' \r\nand so much more!', 'An interest in studying Psychology\r\nA desire to study advanced form of Psychology', '/eMentor/media/img/psychology.jpg', 13, 2, 'English', 'Intermediate', '2018-01-22 15:50:33', 5, 3500),
(10, 'Python for Data Science and Machine Learning Bootcamp', 'Learn how to use NumPy, Pandas, Seaborn , Matplotlib , Plotly , Scikit-Learn , Machine Learning, Tensorflow , and more!', 'We\'ll teach you how to program with Python, how to create amazing data visualizations, and how to use Machine Learning with Python! Here a just a few of the topics we will be learning:\r\n\r\nProgramming with Python\r\nNumPy with Python\r\nUsing pandas Data Frames to solve complex tasks\r\nUse pandas to handle Excel Files\r\nWeb scraping with python\r\nConnect Python to SQL\r\nUse matplotlib and seaborn for data visualizations\r\nUse plotly for interactive visualizations\r\nMachine Learning with SciKit Learn, including:\r\nLinear Regression\r\nK Nearest Neighbors\r\nK Means Clustering\r\nDecision Trees\r\nRandom Forests\r\nNatural Language Processing\r\nNeural Nets and Deep Learning\r\nSupport Vector Machines\r\nand much, much more!\r\nEnroll in the course and become a data scientist today!', 'Some programming experience\r\nAdmin permissions to download files', '/eMentor/media/img/python.jpg', 2, 2, 'English', 'Intermediate', '2018-01-22 17:16:45', 3, 2000),
(11, 'Artificial Intelligence A-Z™: Learn How To Build An AI', 'Combine the power of Data Science, Machine Learning and Deep Learning to create powerful AI for Real-World applications!', 'Learn key AI concepts and intuition training to get you quickly up to speed with all things AI. Covering:\r\n\r\nHow to start building AI with no previous coding experience using Python\r\nHow to merge AI with OpenAI Gym to learn as effectively as possible\r\nHow to optimize your AI to reach its maximum potential in the real world', 'Only High School Maths', '/eMentor/media/img/AI.jpg', 2, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(12, 'Agile Scrum Master Project Management Certification Training', 'Agile Scrum Project Management: Master User Story & Business Analysis, Certification Training for Analyst, Product Owner', 'Agile Scrum is changing the world by the minute Businesses and people working faster and better every day and it’s growing at a scary rate! Agile is a simple method for managing projects and completing them, but if you miss these team building and planning skills, you can’t compete with others with these skills.', 'No Prior Knowledge Or Work Is Necessary To Take This Course.\r\nPen And Paper For Precious Notes', '/eMentor/media/img/agile.jpg', 2, 2, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 5000),
(13, 'The Ultimate Drawing Course - Beginner to Advanced', 'Learn the #1 most important building block of all art', 'The Ultimate Drawing Course will show you how to create advanced art that will stand up as professional work. This course will enhance or give you skills in the world of drawing - or your money back\r\n\r\nThe course is your track to obtaining drawing skills like you always knew you should have! Whether for your own projects or to draw for other people.\r\n\r\nThis course will take you from having little knowledge in drawing to creating advanced art and having a deep understanding of drawing fundamentals.', 'Paper\r\nPencil\r\nEraser\r\nRuler\r\nMotivation to learn!', '/eMentor/media/img/drawing.jpg', 6, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(14, 'Futuristic HUD Motion Graphics in After Effects', 'Learn how to create motion graphics in After Effects like what you see in Iron Man, Star Wars or other action movies', 'After Effects users often times get intimidated by the \"Iron Man\" style futuristic HUD animations, I\'m here to tell you it\'s nothing to be afraid of! This motion graphics effect is something anyone can do with very little After Effects experience!\r\n\r\nSo join me in this course to dissect an animation that looks super complicated and making it super simple!\r\n\r\nIn this class we will learn and experiment with:\r\n\r\nTurning boring shape layers into something visually interesting\r\n\r\nVirtual camera animations\r\n\r\nAfter Effects expressions to save you hours of animating time.\r\n\r\nThis is an introductory course and I will be explaining everything step by step. However you may need to have some After Effects knowledge to understand basic functionality and layout of the software.', 'You will need a copy of Adobe After Effects\r\nA basic understanding of After Effects is recommended but not required. I\'ll be pointing things out step by step.\r\n', '/eMentor/media/img/hud.jpg', 6, 3, 'English', 'Beginner', '2018-01-19 11:53:30', 0, 3500),
(15, 'Gift This Course\r\nWishlist\r\nUltimate Photoshop Training: From Beginner to Pro', 'Master Photoshop without any previous knowledge with this easy-to-follow course', 'My approach is simple: we focus on real world cases and I present the best techniques that require minimal effort yet produce maximum results. All my content is focused on getting the job done in the least amount of time possible. I\'ll be using the latest version of the program - Photoshop CC 2017, but all the content is explained for all users, no matter what version you have installed.\r\n\r\nWhat will you learn?\r\n\r\nGet the best Photoshop version\r\nCustomize the program to best suit you\r\nCreate new projects and share your work\r\nMaster layers and the layers panel\r\nMove, select, and edit layers\r\nWork with the Pen Tool like a pro\r\nCreate and modify shapes\r\nDesign flat illustrations\r\nCreate and animate emojis\r\nRemove skin issues and retouch portraits\r\nDesign business cards\r\nCreate app icons\r\nDesign cute characters\r\nManipulate and repair photos in creative ways', 'No previous knowledge of Photoshop required.\r\nIf you have Photoshop installed, that\'s great. If not, I\'ll teach you how to get it on your computer.', '/eMentor/media/img/ps.jpg', 6, 2, 'English', 'Beginner', '2018-01-22 17:44:05', 4, 1500),
(16, 'Nutrition Masterclass: Build Your Perfect Diet & Meal Plan', 'Learn The Truth About Nutrition, Dieting For Weight Loss, Building Muscle, Healthy Eating, Meal Planning, Fat Loss', 'Learn How To Build The Perfect Diet & Meal Plan For Improved Health, Better Weight Loss And More Muscle Gains\r\n\r\nHi, I\'m Felix Harder fitness and dieting coach and amazon best selling author. My \"Nutrition Masterclass\" is designed for anyone who wants to get the most out of their diet, no matter if you\'re an athlete, bodybuilder or simply want to live a healthier life.\r\n\r\nThis course is not some random fad diet that tells you which foods you should and shouldn\'t eat. Instead I will take you through each of the steps involved in setting up and following through with your diet. \r\n\r\nUnfortunately, the internet is full of false health gurus that sell you all kinds of diet plans and supplements that are overpriced and don\'t work. This is why I wanted to create an video course that not only debunks the most common dieting myths but also teaches everything you need to know to reach your dieting goals, be it to lose fat, build muscle or simply live a healthier life. \r\n\r\nHere Is What\'s Inside The Program:\r\n\r\nDieting For Health & Fitness\r\n\r\nEverything You Need To Know About Calories, Protein, Carbs & Fat\r\nHow To Determine Your Optimal Calorie Intake\r\nHow To Track Calories The Right Way\r\nHow To Adjust Your Diet For Weight Loss\r\nHow To Adjust Your Diet For Muscle Gains\r\nThe Perfect Pre- & Post-Workout Meals \r\nCheat Meals That Won\'t Destroy Your Overall Diet \r\nReady To Use Meals Plans To Lose Weight And Build Muscle \r\nDiet Trends Explained (See If They Are Right For You):\r\n\r\nGluten Free\r\nLow Carb\r\nPaleo Dieting\r\nIntermittent Fastin\r\nVegan Dieting\r\nEverything You Need To Improve Your Health & Immunity:\r\n\r\nThe Right Vitamins & Minerals\r\nHow Much Water You Should Really Drink (No, It\'s Not 8 Glasses Per Day)\r\nHow To Boost Testosterone Naturally\r\nHow To Correctly Read A Nutrition Label\r\nScientifically Proven Ways To Boost Immunity\r\nCommon Dieting Questions Answered:\r\n\r\nAre Carbs Bad For You?\r\nIs Too Much Fat Bad For You?\r\nIs Too Much Protein Bad For You?\r\nDo Eggs Really Raise Cholesterol?\r\nDoes Meat Cause Cancer?\r\nDo Several Small Meals Throughout The Day Boost Your Metabolism?\r\nAll In All The Program Includes Over 80 Lessons On Dieting And Nutrition\r\n\r\n\r\nSo If You Want To Boost Your Performance, Feel More Energized And Live A Healthier Life, This Is The Right Course For You\r\n\r\nRemember, there is a 30-day 100% money-back guarantee. There is no reason to hesitate. Enroll now, see if you enjoy the course, and start building your perfect diet today!\r\n\r\n\r\n\r\ntags: nutrition, dieting, diet plan, fat loss, weight loss, build muscle, meal planning, building muscle, weight loss, fitness, health', 'No prior health knowledge is required or assumed\r\nA digital food scale will help but is not required', '/eMentor/media/img/health.jpg', 10, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 5000),
(17, 'Total Transformation Yoga Teacher Training: Anatomy & Flow!', 'Sadie and Tyler\'s trainings are renowned as the best Anatomy & Vinyasa Yoga trainings in the world. Grab yours now!', '\"This one online teacher training course taught me more than my 200 and 500-hour trainings combined--and for a fraction of the price. Now my class sizes have tripled by using the information that Sadie and Tyler have so brilliantly designed and so generously offered.\r\n\r\nRun, don\'t walk to get this priceless resource for yourself.\r\n\r\nYeah. It\'s that good!\"\r\n\r\n~Kim, studio owner, NYC\r\n\r\n********\r\n\r\nHi there--it\'s Sadie & Tyler!\r\n\r\nDid you know that, by our professional estimation, around 95% of yoga teachers everywhere are giving instructions that can injure students over time (or in one class), and leaks away half the benefits of EVERY pose they teach? And they don\'t even know it!\r\n\r\nAfter taking this training course...you won\'t be one of them.\r\n\r\nAnd, what\'s more, over 90% of any yoga pose should be aligned BEFORE you get into the pose, not after you\'re already there. Forget coming into Warrior 2, and then talking about alignment--it\'s too late!\r\n\r\nTyler and I, two anatomy and yoga experts who travel the world teaching students and teachers alike how to ROCK their yoga practice in creative, savvy, next-level and ridiculously effective ways, are here to teach you the crucial new world of internal vs. external yoga cueing and aligning your students properly through the transitions.\r\n\r\nWhat\'s cool is that you can keep what and how you already teach, but now you\'ll have a totally transformed turboboost to apply during what used to be thought of as the less important in-between times.\r\n\r\nWe now know that the spaces in-between postures are actually the magic key to giving your students 2-3 times the results, safety and power! You MUST know the 7 Core Cues, in order, to be able to ignite the transitions optimally.\r\n\r\nWe want you and your students to practice yoga for a lifetime, not until the neck, wrists, shoulders, low back, hips or knees give out--something MOST yoga instruction today is causing--not helping!\r\n\r\nWith this incredible training that you won\'t find anywhere else, you\'re about to join the top level of yoga teachers in the world, who know the latest anatomy, biomechanics and yoga movement language of Core Strength Vinyasa Yoga. This is a style that COMPLIMENTS your existing style, so you don\'t have to give it up--we just help you shore it up--to make your style much more effective, dynamic and safe! It\'s awesome.\r\n\r\nAnd yes! If you\'re a yoga student wanting to learn how to ensure your yoga practice is giving you all the benefits, with WAY less chance of injury, you will also get a ton out of this training.\r\n\r\nThousands of teachers count CSV Yoga as their secret--or not so secret--weapon to attract more students, and become one of the most sought-after teachers in their areas and beyond.\r\n\r\nTyler and I have studied with the great anatomy and yoga masters, and formulated our 7 Core Cues of Core Strength Vinyasa Yoga to help distill decades of complex anatomy knowledge into 7 simple concepts you can use to ROCK your yoga classes, and every pose you teach...every time. This is the latest in our method, and it\'s going to blow your mind.\r\n\r\nThe 7 Core Cues are based on the understanding of myofascial meridians (the fact that your muscles run in holistic, whole-body lines, not singular muscles as many people think), and unique bone and joint alignment where EVERY student is different, and our standard cueing has to change or we can hurt people, and also the knowledge of Laws of Physics and why we need to use them or our poses get super heavy and joint compressive. Yuck-asana!', 'A yoga mat to practice with us, a journal and pens for notes, and an open mind!', '/eMentor/media/img/yoga.jpg', 10, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 2000),
(18, 'The 30 in 45 Weight Loss & Body Transformation Program', 'How I Lost 30 Lbs in 45 Days & How You Can Too', 'The 30 in 45 Weight Loss & Body Transformation Program is not a diet!....This is a lifestyle modification and body transformation program the produces the lasting and sustainable changes and results you desire. You see diets are designed to fail, heck, the first three letters of DIET spell DIE, in fact I argue that diets actually lead to the death of weight loss. The Merriam Webster Dictionary defines diet as: \"A regimen of eating or drinking sparingly so as to reduce one’s weight\". But, with the 30 in 45 program there are no restrictions on how much you can eat and no counting calories. With this program you eat whenever you are hungry as long as you eat from the prescribed list of acceptable foods which is liberal in choice and even better one day per week you MUST indulge yourself and eat anything and everything you want.This includes pizza, cupcakes, fried foods, pancakes, beer, cheesecake and anything else you desire (although only once every 7 days).\r\n\r\nAdditionally, the 30 in 45 program allows you to workout at home with no equipment other than your own bodyweight for as little as 48 minutes a week. It’s perfect for anyone who is truly serious about taking control of their weight, health, and future.', 'The desire to lose up to 30 Lbs in the next 45 days.\r\nNo prior exercise, fitness, nutrition, or culinary experience required.\r\nComfortable shoes and clothing appropriate for exercise.', '/eMentor/media/img/loss.jpg', 10, 2, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(19, 'Gift This Course\r\nWishlist\r\nThe Complete Cyber Security Course : Hackers Exposed!', 'Volume 1 : Become a Cyber Security Specialist, Learn How to Stop Hackers, Prevent Hacking, Learn IT Security & INFOSEC', 'Learn a practical skill-set in defeating all online threats, including - advanced hackers, trackers, malware, zero days, exploit kits, cybercriminals and more.\r\n\r\nBecome a Cyber Security Specialist - Go from a beginner to advanced in this easy to follow expert course.  \r\n\r\nCovering all major platforms - Windows 7, Windows 8, Windows 10, MacOS and Linux.\r\n\r\nThis course covers the fundamental building blocks of your required skill set - You will understand the threat and vulnerability landscape through threat modeling and risk assessments.\r\n\r\nWe explore the Darknet and mindset of the cyber criminal. Covering malware, exploit kits, phishing, zero-day vulnerabilities and much more.\r\n\r\nYou will learn about the global tracking and hacking infrastructures that nation states run. Covering the NSA, FBI, CIA, GCHQ, China’s MSS and other intelligence agencies capabilities.\r\n\r\nYou will understand the foundations of operating system security and privacy functionality. A close look at the new Windows 10 privacy issues and how to best mitigate them.\r\n\r\nThere is a complete easy to follow crash course on encryption, how encryption can be bypassed and what you can do to mitigate the risks.\r\n\r\nMaster defenses against phishing, SMShing, vishing, identity theft, scam, cons and other social engineering threats.\r\n\r\nFinally we cover the extremely important, but underused security control of isolation and compartmentalization. Covering sandboxes, application isolation, virtual machines, Whonix and Qubes OS.', 'A basic understanding of using operating systems, networks, and the Internet. Be able to download and install software. A willingness to learn.\r\nPlease note this is Volume 1 of 4 of the complete course. After the completion of all 4 volumes, you will know more than 80% of security professionals, government and law enforcement agents and even expert hackers about maintaining security, privacy, and anonymity.', '/eMentor/media/img/hacker.jpg', 3, 3, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 2000),
(20, 'Develop your OWN Operating System from SCRATCH', 'In Simple and Comprehensive manner', 'With this course you are going to Develop you own Custom Operating System with SUSE and learn few fundamental concepts related to working and development of an OS. We would use Linux Kernel, add some utilities and applications, with configurations, and finally deploy and test it. We would also create an user and set permission. We would generate .iso file at the end.', 'Grasp over fundamentals of Operating System and related terms like kernel, process, system call could be useful. But NOT mandatory at all!', '/eMentor/media/img/os.jpg', 3, 3, 'English', 'Expert', '2018-01-19 11:53:30', 0, 3500),
(21, 'Learn Wi-Fi Password Penetration Testing (WEP/WPA/WPA2)', '46+ Videos to teach you how to hack and secure Wi-Fi (WEP, WPA, WPA2, WPA/WPA2 Enterprise)', 'Welcome to my wifi cracking course, in this course you will start as a beginner with no previous knowledge about penetration testing. The course is structured in a way that will take you through the basics of networking and how clients communicate with each other, then we will start talking about how we can exploit this method of communication to carry out a number of powerful attacks. At the end of the course you will learn how to configure wireless networks to protect it from these attacks.\r\n\r\nThis course is focuses on the practical side of wireless penetration testing without neglecting the theory behind each attack, the attacks explained in this course are launched against real devices in my lab.\r\n\r\nThe Course is Divided into four main sections:\r\n\r\nNetworks Basics: in this section you will learn about how networks work, how devices communicate with each other and how the information is transferred in a wireless networks. You will also learn about basic terminology, what is a channel ? MAC address ? what is managed mode ? What is monitor mode and how to enable it ? what is sniffing and what is it limited to ? so in this section we still don\'t know much about penetration testing , all we have is a computer and a wireless card connected to it, you will learn how to start gathering information using your wi-fi card (packet sniffing) and you will learn a number of attacks that you can launch without the need to know the password such as controlling all the connections around you (ie: deny/allow any device from connecting to any network),  you will also learn how to overcome some security features that would prevent you from even trying any attacks, you will learn how to discover and target hidden networks and bypass mac filtering weather it is implemented using a black-list or a white-list. .\r\nWEP Cracking: Now that you have gathered information about all the networks around you, and found your target, you will learn how to crack the key that the target uses. In this section you will learn three methods to crack WEP encryption. First you will learn the weaknesses in WEP that allow us to crack it, then you will learn the theory behind each method and finally you will learn how to launch that attack against WEP networks and obtain their key, in this section you will learn 4 different methods to crack WEP to make sure that you can crack any WEP network you face regardless of how its configured.\r\nWPA Cracking: in this section you will learn a number of methods to crack WPA/WPA2 networks, again you will learn the weakness in WPA and theory behind each method first, and then you will learn how to launch the attack against a real network, this section is divided into a number of smaller sections:\r\nExploiting WPS - In this subsection you will learn how to exploit the WPS feature to gain access to WPA/WPA2 networks without using a wordlist, not only that but you\'ll also learn how to debug reaver\'s output and exploit the WPS feature on more routers using reaver\'s advanced options, you will also learn how to unlock some routers if they lock after a number of failed attempts.\r\nWordlist Attacks - in this subsection you will learn how to run wordlist attacks to crack the WPA/WPA2 key, you will learn how to use huge wordlists without wasting storage, save the cracking progress so that you can pause and resume the cracking process whenever you want, you will also learn how to crack the key much faster using the GPU instead of the CPU.\r\nWPA/WPA2 Enterprise - These networks are usually used in companies and colleges, these are secure networks that use WPA/WPA2 but also require users to login with a username and password after connecting, in this subsection you will understand how they work and how to gain access to them.\r\nProtection: At this stage you will know the weaknesses and methods that real life hackers use, therefore it will be very easy for you to secure your network against these attacks. In this section you will learn how to configure your wireless networks so that the above attacks will not work, you will learn what settings need to be changed, how to access the router settings and how to change these settings.\r\n\r\n\r\nAll the attacks in this course are practical attacks that work against real wireless networks, all of the attacks are carried out against real networks in my lab. Each attack is explained in a simple way first so that you understand how it actually works, so first you will learn the theory behind each attack and then you will learn how to carry out the attack using Kali Linux.\r\n\r\n', 'Basic IT skills\r\nWireless adapter like ALFA AWUS036NHA or anything with an Atheros chip (more info provided in the course)\r\nKali Linux (can be download for free)', '/eMentor/media/img/wifi.jpg', 3, 2, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(22, 'How to write Arabic for Beginners', 'Learning arabic alphabet for beginners', 'My course is about special tips and techniques that will help you learn write in Arabic from scratch . \r\n\r\nIn this course all you need to know for writing Arabic in two days i only explain what you need to know to do it fast i\'m not gonna explain any unnecessary to make the course longer. \r\n\r\ni will go from A to Z step by step explaining every tips you need to be a professional with a lil bit of practice .\r\n\r\nlet me give you a quick tip in order to do it fast you have to practice with me at least for 15 mins each day \r\n\r\nPlease note that in the course i promise writing arabic in two days but that may not be the case for some students .because  each student  has different background ..', 'You should be able to use pencil', '/eMentor/media/img/arabic.jpg', 14, 2, 'English', 'Beginner', '2018-01-19 11:53:30', 0, 3500),
(23, 'Learn Italian Language: Italian Course', 'Learn Italian Language fast and easy. Complete Italian Course for Intermediate with Visual Support.', 'Complete Italian Intermediate Course\r\n\r\nThis course includes:\r\n\r\nThis Italian course includes: FULL HD Video Lessons presented on an Interactive Board\r\nThis Italian course includes: Downloadable .pdf Files for each Lesson \r\nComing Soon: Video Captions in English, French, Spanish, Italian, German, Romanian\r\nThis Italian course includes: Everyday situations presented in Italian language\r\nThis Italian course includes: Listening and speaking practice\r\nThis Italian course includes: An easy way to understand the Italian intermediate grammar\r\nComing soon: Testing and improving your knowledge using quizzes after each lesson\r\nThis Italian course includes: Future Updates\r\nThis Italian course includes: Full Lifetime access\r\nThis Italian course includes: 30-Day Satisfaction or money back guarantee \r\nThis Italian course includes: Access on computer, mobile and TV', 'You should be able to use a PC at a beginner level.\r\nPrevious Italian knowledge from our Beginners Course is required.\r\nVideos are in Italian with Italian captions and English, and Romanian subtitles.\r\nNative Level Teacher\r\nFree Demo Lessons\r\n', '/eMentor/media/img/italian.jpg', 14, 3, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 3500),
(24, 'Chinese Made Easy L1: Understand 65% of Chinese in 10 hours', 'Learn 65% of Chinese (Mandarin) and start speaking and reading in an engaging course with a unique teaching approach.', 'Start learning Chinese with a completely new approach that will both make it fun and easy. In this course you will learn:\r\n\r\n- to recognize the most essential 350 character and understand 65% of the language\r\n\r\n- to read and even write at an intermediate level\r\n\r\n- to have a conversation about practically anything\r\n\r\n- useful insights into China and its culture\r\n\r\n++++++++++++++++++++++++++++++++++++++++++++++++++++\r\n\r\nAbout the course and us\r\n\r\nThe first foreign-run Chinese (Mandarin) teaching company with a completely new approach to teaching Chinese. Our courses are constructed by foreigners for foreigners, and also include the wide experience of our Chinese teachers.\r\n\r\n\"Chinese Made Easy: Understand 65% of Chinese in 10 hours\" is an extensive Chinese course for anyone who wants to start learning Chinese or even if you have studied it but find it both boring and/or difficult.\r\n\r\nWith our new approach we are able to make it fun through entertaining videos, and logical with the way we break down the language for you and you help us build it up. When you have finished building, we promise you, you will have a much greater understanding of the language and you\'ll even be able to teach it to others (more about how we convert our students to teachers in our brochure in the first lesson).\r\n\r\nIt will start with the basics for anyone who is completely new to the language and quickly build up to a conversational level. We cover speaking as well as reading and writing so you get the whole package. The goal at the end of the course is that you should be able to read and even write articles completely in Chinese at an intermediate level. You should also have enough vocabulary and understanding of how the language works to be able to engage in discussions of most topics.\r\n\r\nIf you haven\'t studied with us earlier I suggest you go to our first introduction course “Chinese Made Easy: An Exciting Start to Chinese\", it\'s completely free with over 4 hours of video content and it should give you a good idea of how you will be learning with us. You can also find that course under my profile (Felix Lättman).', 'We recommend all our students to get teachers to practice with. This will improve your spoken Chinese significantly as you the focus with our teachers is not to teach you more but to help you start using what you have learned. Download our brochure in the first lesson and learn more!\r\nWhen you have a teacher he/she will provide you with all the supplementary material you will need.\r\nIf you only study this online course you can download our course book in the first lesson', '/eMentor/media/img/chinese.jpg', 14, 3, 'Urdu', 'Beginner', '2018-01-19 11:53:30', 0, 1500),
(25, 'Makeup: Effortless Makeup for Real Women', 'A comprehensive guide on creating flawless looking makeup for every day, occasion, budget and time limits.', 'I believe make up should fit into every lifestyle, and you shouldn\'t need years of training and a bottomless wallet to look and feel amazing. This course will empower you to take control of the vast sea of makeup options out there, and look your best every day.\r\n\r\nAfter taking this course you will:\r\n\r\nUnderstand how to create a flawless base\r\nTake your makeup quickly from day to evening to night\r\nFit different makeup options into a limited time frame\r\nLearn which bargain products beat the designer ones\r\nPick up my tips and tricks for time saving and avoiding makeup mistakes\r\nUnderstand the difference between types of brushes and application techniques\r\nTailor complex techniques (like contouring and false lashes) to a realistic lifestyle\r\n\r\n\r\nI\'m not a professional makeup artist - I am a normal woman just like you, and I need a makeup routine that will fit in with my busy lifestyle. I am passionate about makeup, getting bargains, and have spent years trawling Youtube and blogs for the best recommendations. I\'m so excited to teach you all my tips and tricks for looking flawless!', 'Nothing! I\'ll recommend which brushes and products to use for all skin types and preferences\r\nOr....use and existing makeup collection in a new and effective way\r\nA willingness to learn and have fun!', '/eMentor/media/img/makeup.jpg', 8, 2, 'Urdu', 'Expert', '2018-01-19 11:53:30', 0, 3500),
(26, 'THE ART & SCIENCE OF DRAWING / BASIC SKILLS', 'DRAWING IS NOT A TALENT. IT\'S A SKILL ANYONE CAN LEARN.', 'The Art & Science of Drawing is a remarkable new program that will teach you how to draw one day at a time. The program is simple, each day you’ll watch one video lesson that will introduce an essential drawing skill, and then do the recommended practice. The Art & Science of Drawing is overflowing with powerful insights into the drawing process and offers some of the clearest, most accessible drawing instruction available.  Many of the tools and techniques you\'ll learn here are rarely seen outside of private art academies.\r\n\r\nBASIC SKILLS is designed for the absolute beginner, but is recommended for anyone wanting to improve their drawing skills. In this first week you’ll learn:\r\n\r\n•	How to hold the pencil\r\n\r\n•	How to draw any shape\r\n\r\n•	How to analyze any form\r\n\r\n•	How to use light lines and basic shapes to lay an accurate foundation for finished drawings\r\n\r\nBASIC SKILLS is the first entry in a series designed to take students from the absolute basics to advanced techniques like volumetric drawing and the science of light and shadow. If you\'re a beginner, we recommend going through the entire series in order.  If you\'ve got some drawing experience, feel free to mix and match The Art & Science of Drawing courses to suit your personal needs as an artist!', 'This course is for absolute beginners and intermediate level artists seeking to improve their fundamental skills.\r\nNo previous drawing experience is necessary!', '/eMentor/media/img/sketch.jpg', 8, 3, 'Urdu', 'Intermediate', '2018-01-19 11:53:30', 0, 1500),
(27, 'Gift This Course\r\nWishlist\r\nHow to Become a Fashion Designer at a Young Age + Sketching', 'Learn how to become fashion designer , Master this essential fashion design skill to ensure your designs are fresh.\r\n', 'Becoming a fashion designer at a young age isn\'t easy. However, time is on your side and you have decades of creative evolution ahead of you, so hang in there and have faith that what you\'re learning now will set you in good stead for a great future.\r\n\r\nIt\'s obvious what you should do after you leave high school...but what can you do as a teen to prepare for a career in fashion design? It\'s not as hard as it seems and there are lots of ways that you can set yourself up for real success as a fashion designer. Don\'t expect to become the next Alexander McQueen overnight (fashion design is a competitive industry that takes a lot of hard work) but you can get there in this course.\r\n\r\nMake sure your fashion design work is constantly topped up with innovative ideas and inspired work because you have learnt the essential skills for fashion design research.\r\n\r\nThis course will help:\r\n\r\nFashion students at all levels\r\nPeople going through the application process for a university or college course in fashion design or a fashion related course\r\nPeople applying for a job in the field of fashion where an understanding of research in the design process is required.\r\nAre you interested in fashion and style? Do you know how Fashion works? Do you want to be good at fashion management?\r\n\r\nWe offer you the help of true professionals – fashion education with Italian teachers from Milan in Italian E-Learning Fashion School. \r\n\r\nThis course is about Fashion management and how fashion works nowadays.\r\n\r\nMore than 1 hour of informative and useful lectures about fashion management and how fashion works!\r\n\r\nIn these lectures you will know more about fashion management and how fashion works', 'lined paper, pencil , eraser , sharpener for Sketching\r\nfolder(optional) , CD\'s and CD player(optional)\r\nFashion magazines(optional) , scissors\r\nYou don\'t need special extra programs or resources to complete the course\r\nThis is an online video course - no Photoshop or adobe illustrator required , No need to purchase expensive software for this course', '/eMentor/media/img/design.jpg', 8, 3, 'English', 'Beginner', '2018-01-19 11:53:30', 0, 1500),
(28, 'Gift This Course\r\nWishlist\r\nFacebook Ads & Facebook Marketing Mastery Guide 2018', 'Use Facebook marketing to excel your business! Take this top rated course to optimize your Facebook ads today!', 'OIN THE 500+ COMPANIES I HAVE CONSULTED ON SOCIAL MEDIA MARKETING AND INCREASING CONVERSIONS VIA FACEBOOK ADS!\r\n\r\nThree reasons to TAKE THIS COURSE right now!\r\n\r\nYou get lifetime access to lectures, including new lectures every month (content is added constantly as updates to Facebook, SEO & SMM roll out).\r\nYou can ask me questions and see me respond to every single one of them thoughtfully!\r\nWhat you will learn in this course is original, tested, and very detailed! Learn the Social Media Marketing strategies I implement for clients daily, including what social media pages are right for you and content management options that will streamline your posting process. This course will also layout how to optimize your Facebook ads and enable you to reach any type of target market! Make the most of social media marketing and make it easy, so you can get back to what you do best, running your business!\r\nIn this course, you will learn Facebook Marketing from beginner level to advanced!\r\n\r\nYou will be able to optimize your Facebook ads for increased conversions and decreased costs. You will be able to create and make use of EVERY type of Facebook ad. You will be able to grow your Facebook page likes and post engagement. You will be able to find new customers that will drive your brand to new heights via social marketing. Join this course now to learn how to take your brand, product or service to the next level with the power of Facebook Marketing!', 'Have a personal profile/account on Facebook.', '/eMentor/media/img/market.jpg', 7, 3, 'Urdu', 'Expert', '2018-01-19 11:53:30', 0, 1500),
(29, 'SEO For WordPress: Keyword Research Secrets [Beginners]', 'Improve your SEO for WordPress by learning our keyword research secrets. Find profitable keywords for your website.', 'SEO For WordPress: Keyword Research Secrets [Beginners]  \r\n\r\nAre You Looking For A Unique Way To Find Profitable Keywords For Your Website?\r\n\r\nDo You Want To Learn The Secret Keyword Strategies Used By The Top SEO Agencies? \r\n\r\nIf you answered \"YES\", then this course is for you!\r\n\r\nDiscover How To Find Profitable Keyword Opportunities Without Spending Any Money On Confusing SEO Tools!\r\n\r\nMy name is Kent Mauresmo, and I\'ve been teaching SEO for the past 5 years through my books and live seminars in Los Angeles, California.\r\n\r\nThere\'s a lot of information everywhere online about keyword research, but most of it is confusing because it\'s not for beginners.\r\n\r\nThat\'s why I\'ve created this simple, step-by-step video course that will teach you creative ways to discover keyword opportunities for your website.\r\n\r\nYou\'ll learn:\r\n\r\nThe difference between broad keywords, keyword phrases, and long tail keywords.\r\nYou\'ll discover how to find \"buyer keywords\" and avoid \"tire kicker\" keywords.\r\nI\'ll Also Show You...\r\n\r\nThe correct way to use Google Keyword Planner to find profitable keywords.\r\nHow to easily find out which keywords your competitors are using so you can ethically steal their web traffic.\r\nThe strategies that I teach you in this video course are updated, tested, and used by the top SEO agencies in the world.\r\n\r\nWhat Are The Requirements To Take This Course?\r\n\r\nYou need a computer.\r\nYou need to be able to follow simple step-by-step instructions. That\'s it.\r\nIs This Video Course For Complete Beginners?\r\n\r\nYes!\r\n\r\nMake a small investment today, and you\'ll learn the skills required to increase your profits fast! This training course comes with a 30-Day Money-Back Guarantee, so you have nothing to lose.\r\n\r\nAre You Ready To Get Started?\r\n\r\nEnroll Now And I\'ll See You In The Course!', 'You need a computer, laptop, or tablet.', '/eMentor/media/img/seo.jpg', 7, 2, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 2000),
(30, 'Instagram Marketing For Business: Gain Instagram Followers', 'Instagram Marketing For Business & Instagram Ads: Gain Influence, Get Followers & Leads To Build Your Business', 'Your target market is scrolling daily on platforms like Instagram, for entertainment or trying to find solutions to their problems, but since your Instagram page and its content isn’t found from your target audience, you don’t get any traffic and your competitors are enjoying these hot burning leads.\r\n\r\nWhat if you could change that?\r\n\r\nMy complete Instagram marketing course will show you the exact techniques and strategies you need to get burning leads looking to purchase from you and get viral attention on Instagram.\r\n\r\nFor less than a movie ticket, you will get over 4 hours of video lectures and the freedom to ask me any questions regarding the course as you go through it. :)\r\n\r\nWhat Is In This Course?\r\n\r\nYour Instagram Marketing Will Never Be The Same.\r\n\r\nExcept if you’re getting a ton of sales and exposure on Instagram, you are going to lose sales and followers to your competitors that will gladly take them. You are in power to change that, it’s time to act now!\r\n\r\nAs what Adam Audette, Chief Knowledge Officer, RKG says “Today it’s not about ‘get the traffic’ — it’s about ‘get the targeted and relevant traffic.”\r\n\r\nThis is offered with a 30 days money back guarantee. You can try it with no financial risk.\r\n\r\nIn Instagram Marketing, You\'ll Learn:\r\n\r\nCourse Outline\r\n\r\nTitle: Instagram Marketing For Business: Gain Instagram Followers\r\n\r\nOptimize Your Profile For SEO Purposes\r\nWrite The Best Bio For Lead Generation\r\nFind The Perfect Name For Your Account\r\nBuild A Brand Story And Theme\r\nBuilding Your Brand Strategy\r\nFind Your Target Audience On Instagram\r\nWhat Type If Best For You On Instagram\r\nHow To Create Great Content\r\nHow To Effectively Use Hashtags To Be Discovered\r\nHow To Get More Video Views\r\nHow To Get More Comments\r\nInstagram Hacks & Tools\r\nHow To Leverage Instagram Ads', 'No Prior Knowledge Or Work Is Necessary To Take This Course.\r\nPen And Paper For Precious Notes', '/eMentor/media/img/insta.jpg', 7, 3, 'English', 'Expert', '2018-01-19 11:53:30', 0, 5000),
(31, 'Become a Great Singer: Your Complete Vocal Training System', 'For Serious Vocalists. Immediately Improve Your Singing. (Any Level, Any Style)', '\"Hands Down- THE best vocal training ever...I can\'t say enough about how well Robert Lunte explains and demonstrates the techniques and the theory behind the art of singing.\" - Michael Rendon \r\n\r\n\"I\'m only about a week and a half into the course, but the difference is absolutely dramatic. The training techniques are very different from anything I\'ve ever experienced.\" - Cole Gentles \r\n\r\n\"The Four Pillars of Singing is no joke. It\'s the real deal. If you\'re aspiring to become a successful singer this is the place you need to be.\" - Bram\r\n\r\nBEST SINGING COURSE ON UDEMY! \r\nOVER 21 HOURS!\r\nCOMES WITH EBOOK!\r\nCUSTOMER SERVICE CHAT WITH CREATOR!\r\nThe TVS vocal training course and book is widely considered to be the most comprehensive and complete home study vocal training system ever developed for singers of all styles and levels of experience. Sold in over 120 countries.\r\n\r\nFounder and producer of the The Vocalist Studio and The Vocalist Studio Method, Maestro Robert Lunte, has produced an intensive vocal training system that not only shows you what to do, but explains why and how with scientific and practical application.  \r\n\r\nThis proven vocal training program was offered to members of The Vocalist Studio only, but after raving testimonials and real success from students, Robert has finally decided to release this course here on Udemy to help even more vocalists like you achieve spectacular results.  \r\n\r\nWith very clear, step by step instructions and video demonstrations of how to train your singing voice, The Four Pillars of Singing is for any student that is prepared to train and practice with the expectation of gaining lasting, life changing progress. \r\n\r\nYou won\'t just learn how to improve your singing voice or how to extend your vocal range or how to warm up properly... Train Vocal Athletes. This is high performance vocal training with effective results, no matter what your starting point is.  \r\n\r\nWhat You Get When You Enroll:\r\n\r\nReal-Time customer service chat system where you can communicate with the course creator in person!\r\nAccess to \'The Four Pillars of Singing\' eBook inside the course. (Only Udemy Singing Course with a Book).\r\nTraining Work Flow diagrams that show you step by step, which workouts to train and when.\r\n32 High Definition videos of Robert Lunte demonstrating ALL the vocal workouts. Train over the videos!\r\n170+ video lessons with quizzes to measure your progress.\r\n32 vocal workouts, offered in slow and fast versions.\r\n32 vocal workouts specially made for both men and women.\r\n32 guide files that allow you to train over a pre-recorded track to learn how the exercises go.\r\nNotation of every workout for those that can read music and follow notes.\r\nStep by step instructions and detailed routines that teach you exactly WHAT to do and HOW to do it. \r\nHow to train specific vocal styles, vocal modes, and training onsets, vocal strength building, coordination and tuning techniques, improve the color / tones of your voice, respiration exercises, mechanics of tongue and body positioning, anchoring your larynx, microphone ergonomics, and the list goes on...\r\nScroll through the curriculum / the list of video lectures to preview the value contained in this complete vocal training system. \r\n\r\nYou CAN become a great singer. It\'s not genetics. It\'s science, applied with the right practice habits. \r\n\r\nWhen you truly understand the mechanics of how the voice operates, as you will in these video lectures, you open up a complete toolbox that allows you to truly dive into the art of singing. ', 'Computer\r\nA Keyboard (Can Be An App. or Something Small & Simple)\r\nAmplification With Microphones If Possible, But Not Required\r\nA Willingness To Train The Techniques 4 - 7 Days A Week, 1 - 2 Hours Each Session', '/eMentor/media/img/music.jpg', 12, 2, 'English', 'Intermediate', '2018-01-19 11:53:30', 0, 5000);
INSERT INTO `courses` (`courseid`, `title`, `subheading`, `description`, `prerequisite`, `thumbnail`, `categoryid`, `createdby`, `language`, `level`, `lastupdated`, `nooflectures`, `price`) VALUES
(32, 'Guitar Chord Mastery!Turn Your Brain Into A Chord Encyclopia', 'Make Learning Guitar Chords A Snap! Plus...Learn Music Theory in Record Time with No Sight Reading!', 'Here Is What You Will Learn:\r\n\r\nPhase 1 - Develop The Virtuoso Musical Mind With Ease\r\n\r\nFirst, you will learn to simplify complex musical ideas...by developing a birds eye view of how music is made that eliminates excessive detail that other courses force down your throat which only confuses rather than helps\r\nUnderstand Music without needing to sightread traditional notation or tab...good if you can rad it, but not needed\r\nDeclutter your brain... by learning only the most important musical terms in easy to understand language\r\nThe three most powerful tools you can use to make comprehending scales chords keys in arpeggios that are almost never taught\r\nDevelop a incredible ear for music...by learning why chords sound the way they do, and when to use them.\r\nGain control over your own playing...by knowing which chord voicings to use and when.\r\nWrite songs faster...increasing your options with a different chord choices yet keeping the chords simple\r\nLearn to create one of the most powerful tools in music with lightning speed...The cycles of 4th\'s and 5th\'s\r\nDispel all the misconceptions about how chord scales keys and intervals work together to create seamless understanding to apply to the fretboard\r\nFinally be able to target notes in chords when soloing... by gaining the ability to spell chords in any key.\r\n\r\n\r\n\r\n\r\nPhase 2 Turn Your Mind Into A Fretboard Roadmap\r\n\r\nLearn a completely new way of understanding the musical layout of the fretboard.\r\nFind any note in all locations in 5 seconds or less.\r\nLearn when to use the sharp or flat names of notes, and find out why almost all of the images of fretboards you see in the books and online are incomplete\r\nLearn the secret way of seeing the fretboard layout that even many advanced players don\'t understand at all.\r\nMake one chord sound like a dozens of different chords...by mastering different chord voicings.\r\nFind hidden chord shapes that you never new were under your fingers, and get to them by moving just one finger!\r\nAlways choose the right chord voicing, by knowing why chord voicings sound different.\r\nNever get lost again...by gaining complete freedom anywhere on the neck by making the whole neck your safe zone.\r\nPlay like the virtuoso\'s...by using small string groups instead of large bulky Bar/Barre Chords\r\nSimplify and Systematize thousands of chord Shapes by learning \"the symmetrical system\" method of fretboard visualization which is even more in depth than the CAGED system.\r\nSpeed up your thinking by learning to use a numbers rather than letters\r\nNever get confused again by keeping musical concepts and geographic concept separate in your own mind then combined them directly on the fretboard to\r\nMake giant leaps beyond normal guitar players to understand thousands of chords...by using instantly recognizable shapes that even a non-musician can remember.\r\nIn Just a couple of hours you can completely change the way you think about music and the guitar!', 'If You know your basic open chords, bar chords, and a scale or two, you are perfect for this course!\r\nNo sightreading or tablature knowledge necessary!', '/eMentor/media/img/guitar.jpg', 12, 3, 'Urdu', 'Expert', '2018-01-19 11:53:30', 0, 1500),
(33, 'Music Production III - Audio Mastering - The COMPLETE Guide!', 'Music production and mastering using Logic Pro X within your own Music Production home studio!', 'In this Music Production III course you will learn how to use both standard and advanced plugins to master your own songs within the DAW environment. In this course Mitch takes you through the Music Mastering process within Logic Pro X. The techniques in this course can be applied within any DAW environment of equal value. This Music Production course is a COMPLETE mastering course, giving you some simple insight as to how to get your tracks sounding GREAT! You will be able to finally release music that competes in the commercial world!\r\n\r\nHere are the things you will learn in this Music Production III course.\r\n\r\nHow to prepare for Mastering\r\nWhat NOT to do in the Mixdown Process\r\nMastering Equalization\r\nMastering Compression\r\nMastering Limiting\r\nHow to use plugins to enhance the overall sound of your mix\r\nHow to prepare your listening environment\r\nHow to most effectively learn the Art of Mastering\r\nHow to master for different distribution protocols\r\nHow to create a great Mastering Workflow\r\nAnd MUCH MORE!\r\nBy the end of this course you will be able to Master your songs professionally and competitively with the Music Production pros around you! ', 'You will need to have a basic understanding of the DAW environment.', '/eMentor/media/img/music1.jpg', 12, 3, 'Urdu', 'Expert', '2018-01-19 11:53:30', 0, 2000),
(215, ' a', 'a', 'a', 'aa', '/eMentor/media/img/53794382_407976356667444_4934738288608018432_n.jpg', 13, 123, 'aa', 'on', '2019-03-12 05:17:56', 0, 38);

-- --------------------------------------------------------

--
-- Table structure for table `lectures`
--

CREATE TABLE `lectures` (
  `lectureid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `videofile` text NOT NULL,
  `lectureno` int(11) NOT NULL DEFAULT '0',
  `courseid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lectures`
--

INSERT INTO `lectures` (`lectureid`, `title`, `videofile`, `lectureno`, `courseid`) VALUES
(39, 'Introduction-What is Manual Testing', '/eMentor/media/vid/What_is_Manual_Testing_1_.mp4', 1, 7),
(40, 'What is Black Testing', '/eMentor/media/vid/What_is_Black_Box_Testing_2.mp4', 2, 7),
(41, 'Ad hoc Testing in Software Testing', '/eMentor/media/vid/Ad_hoc_Testing_in_Software_Testing_3.mp4', 3, 7),
(42, 'What is Automated Testing', '/eMentor/media/vid/What_is_Automated_Testing_4_.mp4', 4, 7),
(43, 'Software Testing and Analysis', '/eMentor/media/vid/Software_Testing_and_Analysis_5.mp4', 5, 7),
(44, 'The Biological Approach', '/eMentor/media/vid/The_Biological_Approach_1.mp4', 1, 9),
(45, 'Approaches in Psychology_Congnitive', '/eMentor/media/vid/Approaches_in_Psychology__Cognitive_2.mp4', 2, 9),
(46, 'Approaches in Psychology_Biological', '/eMentor/media/vid/Approaches_in_Psychology__Biological_3.mp4', 3, 9),
(47, 'Approaches in Psychology_Behaviourist', '/eMentor/media/vid/Approaches_in_Psychology__Behaviourist_4.mp4', 4, 9),
(48, 'Approaches in Psychology_Psychodynamic', '/eMentor/media/vid/Approaches_in_Psychology_Psychodynamic_5.mp4', 5, 9),
(49, 'Practical Machine Learning Tutorial with Python Intro', '/eMentor/media/vid/Practical_Machine_Learning_Tutorial_with_Python_Intro_p.1.mp4', 1, 10),
(50, 'Regression Intro-Practical Machine Learning Tutorial with Python', '/eMentor/media/vid/Regression_Intro_-_Practical_Machine_Learning_Tutorial_with_Python_p.2.mp4', 2, 10),
(51, 'Regression Features and Labels-Practical Machine Learning Tutorial with Python', '/eMentor/media/vid/Regression_Features_and_Labels_-_Practical_Machine_Learning_Tutorial_with_Python.mp4', 3, 10),
(52, 'Introduction', '/eMentor/media/vid/The_Complete_beginners_guide_to_Adobe_Photoshop___Course_overview___breakdown.mp4', 1, 15),
(53, 'Interface Introduction to Adobe Photoshop Ep1_33[Adobe Photoshop for Beginner]', '/eMentor/media/vid/Interface_Introduction_to_Adobe_Photoshop_Ep1_33__Adobe_Photoshop_for_Beginners_.mp4', 2, 15),
(54, 'Panels & Workspaces in Adobe Photoshop Ep2_33[Adobe Photoshop for Beginners]', '/eMentor/media/vid/Panels___Workspaces_in_Adobe_Photoshop_Ep2_33__Adobe_Photoshop_for_Beginners_.mp4', 3, 15),
(55, 'Raster Image principles in Adobe Photoshop Ep3_33[Adobe Photoshop for Beginners]', '/eMentor/media/vid/Raster_Image_principles_in_Adobe_Photoshop_Ep3_33__Adobe_Photoshop_for_Beginners.mp4', 4, 15),
(56, 'Introduction', '/eMentor/media/vid/Android_Tutorial_for_Beginners_1___Introduction_and_Installing_and_Configuring_Java_JDK.mp4', 1, 4),
(57, 'How To install Android Studio', '/eMentor/media/vid/Android_Tutorial_for_Beginners_2___How_to_install_Android_Studio.mp4', 2, 4),
(58, 'Building your First Android App(Hello World Example)', '/eMentor/media/vid/Android_Tutorial_for_Beginners_3___Building_Your_First_Android_App__Hello_World_Example_.mp4', 3, 4),
(59, 'Introduction', '/eMentor/media/vid/Course_Introduction__30_Days_to_Learn_HTML_and_CSS_.mp4', 1, 5),
(60, 'Your First Web Page', '/eMentor/media/vid/Day_1__Your_First_Webpage__30_Days_to_Learn_HTML___CSS_.mp4', 2, 5),
(61, 'Finding a proper Code Editor', '/eMentor/media/vid/Day_2__Finding_a_Proper_Code_Editor__30_Days_to_Learn_HTML___CSS_.mp4', 3, 5),
(62, 'Lists', '/eMentor/media/vid/Day_3__Lists__30_Days_to_Learn_HTML___CSS_.mp4', 4, 5),
(63, 'Parent-Child Relationship', '/eMentor/media/vid/Day_4__Parent-Child_Relationships__30_Days_to_Learn_HTML___CSS_.mp4', 5, 5),
(64, 'Testing by Abdullah', '/eMentor/media/vid/Day_2__Finding_a_Proper_Code_Editor__30_Days_to_Learn_HTML___CSS_.mp4', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `reviewby` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `reviewedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewid`, `courseid`, `reviewby`, `rating`, `comment`, `reviewedon`) VALUES
(26, 5, 30, 5, 'this course is amazing the instructor told every pick point true heartedly', '2018-01-23 06:21:32'),
(27, 5, 31, 3, 'its amazing but it has not much efficient', '2018-01-23 06:23:51'),
(28, 0, 0, 0, 'null', '2018-01-23 06:23:54'),
(29, 0, 0, 0, 'null', '2018-01-23 06:23:57'),
(30, 0, 0, 0, 'null', '2018-01-23 06:24:27'),
(31, 0, 0, 0, 'null', '2018-01-23 06:24:29'),
(32, 0, 0, 0, 'null', '2018-01-23 06:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionid`, `courseid`, `userid`, `timestamp`, `amount`) VALUES
(9, 10, 30, '2018-01-22 21:15:31', 2000),
(10, 15, 30, '2018-01-22 21:39:56', 1500),
(11, 15, 30, '2018-01-22 21:41:34', 1500),
(12, 31, 1, '2018-01-23 05:08:34', 5000),
(13, 5, 30, '2018-01-23 06:18:47', 2000),
(14, 5, 31, '2018-01-23 06:22:33', 2000),
(15, 5, 33, '2018-01-23 06:27:35', 2000),
(16, 5, 37, '2018-01-23 07:52:01', 2000),
(17, 5, 37, '2018-01-23 07:53:28', 2000),
(18, 4, 2, '2018-01-23 09:54:04', 2000),
(19, 4, 3, '2019-04-26 05:05:43', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT '2',
  `registeredon` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profileimage` varchar(255) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `email`, `fname`, `lname`, `city`, `country`, `usertype`, `registeredon`, `profileimage`, `balance`) VALUES
(1, 'sadaf', '123', 'sadaf@gmail.com', 'Syeda', 'Sadaf', 'Lahore', 'Pakistan', 3, '2018-01-22 20:28:15', '/eMentor/media/img/images.jpg', 10000),
(2, 'Tahir', '023', 'tahir@gmail.com', 'Tahir', 'Aziz', 'Lahore', 'Pakistan', 3, '2018-01-16 12:00:55', NULL, 10000),
(3, 'ali', '059', 'ali@gmail.com', 'Muhammad', 'Ali', 'Lahore', 'Pakistan', 2, '2018-01-02 15:23:47', '', 3000),
(4, 'Mahnoor', 'mano', 'Mahnoor@gmail.com', 'Mahnoor', 'Khalil', 'Lahore', 'Pakistan', 2, '2018-01-23 06:09:24', '/eMentor/media/img/large.jpg', 8000),
(5, 'zoya', 'zoya', 'zoya@gmail.com', 'Zoya', 'Javed', 'Lahore', 'Pakistan', 2, '2018-01-23 06:10:26', NULL, 10000),
(10, 'khadia', 'khadija', 'khadia@gmail.com', 'Khadija', 'Khan', 'Lahore', 'Pakistan', 2, '2018-01-23 06:11:36', NULL, 8000),
(34, 'talha', 'talha', 'talha@gmail.com', 'talha', 'khan', 'Lahore', 'Pakistan', 2, '2018-01-23 06:34:17', NULL, 20000),
(36, 'bilal', '123', 'bilal@iqbal.com', 'Bilal', 'Iqbal', 'Lahore', 'Pakistan', 2, '2018-01-23 07:29:38', NULL, 0),
(38, 'bhatti', '123', 'bhatti@gail.com', 'nabeel', 'bhatti', 'Lahore', 'Pakistan', 2, '2019-03-12 05:16:47', '/eMentor/media/img/53794382_407976356667444_4934738288608018432_n.jpg', 0),
(40, 'M. ali', '123', 'ali@gmail.com', 'ali', 'shah', 'lahore', 'pakistan', 1, '2019-03-12 05:26:59', NULL, 200000),
(44, 'baka', '058', 'baka@gmail.com', 'bakar', 'bakar', 'lahore', 'pakistan', 3, '2019-03-12 06:16:19', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `lectures`
--
ALTER TABLE `lectures`
  ADD PRIMARY KEY (`lectureid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `lectures`
--
ALTER TABLE `lectures`
  MODIFY `lectureid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
