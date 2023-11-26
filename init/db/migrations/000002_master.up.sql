--
-- TOC entry 3500 (class 0 OID 25056)
-- Dependencies: 244
-- Data for Name: user_account; Type: TABLE DATA; Schema: accounts; Owner: -
--

INSERT INTO accounts.user_account VALUES (1, 1, 1000000, 'IDR');
INSERT INTO accounts.user_account VALUES (2, 2, 1000000, 'IDR');


--
-- TOC entry 3494 (class 0 OID 24994)
-- Dependencies: 238
-- Data for Name: bookings; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.bookings VALUES ('RM7AB12', 'PAID', NULL, 100000.00);
INSERT INTO bookings.bookings VALUES ('ARDIMR4', 'WAITING', '2023-07-17 13:16:24.547181', 150000.00);
INSERT INTO bookings.bookings VALUES ('TG5O6GM', 'PAID', '2023-07-26 15:11:15.381848', 150000.00);
INSERT INTO bookings.bookings VALUES ('21E3KKB', 'PAID', '2023-07-29 03:46:20.932391', 150000.00);
INSERT INTO bookings.bookings VALUES ('NOM6WG7', 'PAID', '2023-07-29 04:06:59.169774', 150000.00);
INSERT INTO bookings.bookings VALUES ('3PW90CL', 'PAID', '2023-07-29 04:12:05.554732', 150000.00);
INSERT INTO bookings.bookings VALUES ('XVMOLJ8', 'PAID', '2023-07-29 04:25:41.259083', 150000.00);
INSERT INTO bookings.bookings VALUES ('8K2JC2E', 'PAID', '2023-07-29 04:31:42.641549', 150000.00);
INSERT INTO bookings.bookings VALUES ('AW15SK2', 'PAID', '2023-07-29 04:49:28.611154', 150000.00);
INSERT INTO bookings.bookings VALUES ('R0IN724', 'PAID', '2023-10-19 13:52:34.739406', 150000.00);
INSERT INTO bookings.bookings VALUES ('9KLSP9J', 'PAID', '2023-10-19 14:14:02.061958', 150000.00);
INSERT INTO bookings.bookings VALUES ('GS6X9BL', 'PAID', '2023-10-19 14:19:29.741228', 150000.00);


--
-- TOC entry 3498 (class 0 OID 25030)
-- Dependencies: 242
-- Data for Name: passengers; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.passengers VALUES (3, 'Rizky Ardi Maulana', 1, '337602', 1, 1, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (4, 'Shiva Veronica Aulia', 1, '337601', 1, 2, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (5, 'Najwa Cahya', 1, '337603', 1, 3, '2023-07-17 13:06:04.269296');
INSERT INTO bookings.passengers VALUES (6, 'Dharma', 1, '337890', 2, 5, '2023-07-17 13:22:48.284519');
INSERT INTO bookings.passengers VALUES (7, 'Rizky Ardi Maulana', 1, '3376020411990006', 4, 12, '2023-07-26 15:11:15.381848');
INSERT INTO bookings.passengers VALUES (8, 'Shifa Veronica Aulia', 1, '3376020411990007', 4, 13, '2023-07-26 15:11:15.381848');
INSERT INTO bookings.passengers VALUES (21, 'Rizky Ardi Maulana', 1, '337602123456789', 11, 2, '2023-10-19 13:52:34.739406');
INSERT INTO bookings.passengers VALUES (22, 'Shifa Veronica Aulia', 1, '3376020411123321', 12, 35, '2023-10-19 14:14:02.061958');
INSERT INTO bookings.passengers VALUES (23, 'Najwa Cahya', 1, '336736181273123', 13, 34, '2023-10-19 14:19:29.741228');


--
-- TOC entry 3496 (class 0 OID 25002)
-- Dependencies: 240
-- Data for Name: tickets; Type: TABLE DATA; Schema: bookings; Owner: -
--

INSERT INTO bookings.tickets VALUES (1, 1, 1, 'RM7AB12', '2023-07-17 13:05:15.302182');
INSERT INTO bookings.tickets VALUES (2, 2, 1, 'ARDIMR4', '2023-07-17 13:19:30.327731');
INSERT INTO bookings.tickets VALUES (4, 1, 2, 'TG5O6GM', '2023-07-26 15:11:15.381848');
INSERT INTO bookings.tickets VALUES (11, 17, 1, 'R0IN724', '2023-10-19 13:52:34.739406');
INSERT INTO bookings.tickets VALUES (12, 17, 1, '9KLSP9J', '2023-10-19 14:14:02.061958');
INSERT INTO bookings.tickets VALUES (13, 17, 1, 'GS6X9BL', '2023-10-19 14:19:29.741228');


--
-- TOC entry 3489 (class 0 OID 24922)
-- Dependencies: 233
-- Data for Name: currencies; Type: TABLE DATA; Schema: finances; Owner: -
--

INSERT INTO finances.currencies VALUES ('IDR', 'Rupiah');


--
-- TOC entry 3479 (class 0 OID 24742)
-- Dependencies: 223
-- Data for Name: cities; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.cities VALUES ('BDG', 'Bandung');
INSERT INTO travel_schedules.cities VALUES ('TGL', 'Tegal');
INSERT INTO travel_schedules.cities VALUES ('JKT', 'Jakarta');
INSERT INTO travel_schedules.cities VALUES ('CBN', 'Cirebon');
INSERT INTO travel_schedules.cities VALUES ('SMG', 'Semarang');
INSERT INTO travel_schedules.cities VALUES ('SKT', 'Surakarta');
INSERT INTO travel_schedules.cities VALUES ('YYK', 'Yogyakarta');
INSERT INTO travel_schedules.cities VALUES ('SBY', 'Surabaya');
INSERT INTO travel_schedules.cities VALUES ('MLG', 'Malang');


--
-- TOC entry 3484 (class 0 OID 24813)
-- Dependencies: 228
-- Data for Name: classes; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.classes VALUES (1, 'EKS', 'Excecutive');
INSERT INTO travel_schedules.classes VALUES (2, 'EKO', 'Economy');


--
-- TOC entry 3486 (class 0 OID 24820)
-- Dependencies: 230
-- Data for Name: seats; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.seats VALUES (1, 1, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (2, 1, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (3, 1, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (4, 1, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (5, 1, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (6, 1, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (7, 1, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (8, 1, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (10, 1, 'A', 3);
INSERT INTO travel_schedules.seats VALUES (11, 1, 'B', 3);
INSERT INTO travel_schedules.seats VALUES (12, 1, 'C', 3);
INSERT INTO travel_schedules.seats VALUES (13, 1, 'D', 3);
INSERT INTO travel_schedules.seats VALUES (14, 1, 'A', 4);
INSERT INTO travel_schedules.seats VALUES (15, 1, 'B', 4);
INSERT INTO travel_schedules.seats VALUES (16, 1, 'C', 4);
INSERT INTO travel_schedules.seats VALUES (17, 1, 'D', 4);
INSERT INTO travel_schedules.seats VALUES (18, 2, 'A', 5);
INSERT INTO travel_schedules.seats VALUES (19, 2, 'B', 5);
INSERT INTO travel_schedules.seats VALUES (20, 2, 'C', 5);
INSERT INTO travel_schedules.seats VALUES (21, 2, 'D', 5);
INSERT INTO travel_schedules.seats VALUES (22, 2, 'A', 6);
INSERT INTO travel_schedules.seats VALUES (23, 2, 'B', 6);
INSERT INTO travel_schedules.seats VALUES (24, 2, 'C', 6);
INSERT INTO travel_schedules.seats VALUES (25, 2, 'D', 6);
INSERT INTO travel_schedules.seats VALUES (26, 2, 'A', 7);
INSERT INTO travel_schedules.seats VALUES (27, 2, 'B', 7);
INSERT INTO travel_schedules.seats VALUES (28, 2, 'C', 7);
INSERT INTO travel_schedules.seats VALUES (29, 2, 'D', 7);
INSERT INTO travel_schedules.seats VALUES (30, 2, 'A', 8);
INSERT INTO travel_schedules.seats VALUES (31, 2, 'B', 8);
INSERT INTO travel_schedules.seats VALUES (32, 2, 'C', 8);
INSERT INTO travel_schedules.seats VALUES (33, 2, 'D', 8);
INSERT INTO travel_schedules.seats VALUES (34, 2, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (35, 2, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (36, 2, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (37, 2, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (42, 3, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (43, 3, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (44, 3, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (45, 3, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (46, 4, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (47, 4, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (48, 4, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (49, 5, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (50, 5, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (51, 5, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (52, 5, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (53, 6, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (54, 6, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (55, 6, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (56, 6, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (57, 7, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (58, 7, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (59, 7, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (60, 7, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (61, 8, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (62, 8, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (63, 8, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (64, 8, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (65, 9, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (66, 9, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (67, 9, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (68, 9, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (69, 10, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (70, 10, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (71, 10, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (72, 10, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (73, 11, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (77, 15, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (78, 15, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (79, 15, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (80, 15, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (81, 4, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (74, 11, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (75, 11, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (76, 11, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (82, 12, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (83, 12, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (84, 12, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (85, 12, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (86, 13, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (87, 13, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (88, 13, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (89, 13, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (90, 14, 'A', 1);
INSERT INTO travel_schedules.seats VALUES (91, 14, 'B', 1);
INSERT INTO travel_schedules.seats VALUES (92, 14, 'C', 1);
INSERT INTO travel_schedules.seats VALUES (93, 14, 'D', 1);
INSERT INTO travel_schedules.seats VALUES (143, 3, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (144, 3, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (145, 3, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (146, 3, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (147, 4, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (148, 4, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (149, 4, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (150, 5, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (151, 5, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (152, 5, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (153, 5, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (154, 6, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (155, 6, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (156, 6, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (157, 6, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (158, 7, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (159, 7, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (160, 7, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (161, 7, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (162, 8, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (163, 8, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (164, 8, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (165, 8, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (166, 9, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (167, 9, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (168, 9, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (169, 9, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (170, 10, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (171, 10, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (172, 10, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (173, 10, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (174, 11, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (175, 11, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (176, 11, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (177, 11, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (178, 15, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (179, 15, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (180, 15, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (181, 15, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (182, 4, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (183, 12, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (184, 12, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (185, 12, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (186, 12, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (187, 13, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (188, 13, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (189, 13, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (190, 13, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (191, 14, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (192, 14, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (193, 14, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (194, 14, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (195, 2, 'A', 2);
INSERT INTO travel_schedules.seats VALUES (196, 2, 'B', 2);
INSERT INTO travel_schedules.seats VALUES (197, 2, 'C', 2);
INSERT INTO travel_schedules.seats VALUES (198, 2, 'D', 2);
INSERT INTO travel_schedules.seats VALUES (203, 1, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (204, 1, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (205, 1, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (206, 1, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (207, 2, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (208, 2, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (209, 2, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (210, 2, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (211, 3, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (212, 3, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (213, 3, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (214, 3, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (215, 4, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (216, 4, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (217, 4, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (218, 4, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (219, 5, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (220, 5, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (221, 5, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (222, 5, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (223, 6, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (224, 6, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (225, 6, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (226, 6, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (227, 7, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (228, 7, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (229, 7, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (230, 7, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (231, 8, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (232, 8, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (233, 8, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (234, 8, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (235, 9, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (236, 9, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (237, 9, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (238, 9, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (239, 10, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (240, 10, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (241, 10, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (242, 10, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (243, 11, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (244, 11, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (245, 11, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (246, 11, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (247, 12, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (248, 12, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (249, 12, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (250, 12, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (251, 13, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (252, 13, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (253, 13, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (254, 13, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (255, 14, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (256, 14, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (257, 14, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (258, 14, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (259, 15, 'A', 9);
INSERT INTO travel_schedules.seats VALUES (260, 15, 'B', 9);
INSERT INTO travel_schedules.seats VALUES (261, 15, 'C', 9);
INSERT INTO travel_schedules.seats VALUES (262, 15, 'D', 9);
INSERT INTO travel_schedules.seats VALUES (263, 1, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (264, 1, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (265, 1, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (266, 1, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (267, 2, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (268, 2, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (269, 2, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (270, 2, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (271, 3, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (272, 3, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (273, 3, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (274, 3, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (275, 4, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (276, 4, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (277, 4, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (278, 4, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (279, 5, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (280, 5, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (281, 5, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (282, 5, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (283, 6, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (284, 6, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (285, 6, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (286, 6, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (287, 7, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (288, 7, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (289, 7, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (290, 7, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (291, 8, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (292, 8, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (293, 8, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (294, 8, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (295, 9, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (296, 9, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (297, 9, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (298, 9, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (299, 10, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (300, 10, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (301, 10, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (302, 10, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (303, 11, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (304, 11, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (305, 11, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (306, 11, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (307, 12, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (308, 12, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (309, 12, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (310, 12, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (311, 13, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (312, 13, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (313, 13, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (314, 13, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (315, 14, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (316, 14, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (317, 14, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (318, 14, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (319, 15, 'A', 10);
INSERT INTO travel_schedules.seats VALUES (320, 15, 'B', 10);
INSERT INTO travel_schedules.seats VALUES (321, 15, 'C', 10);
INSERT INTO travel_schedules.seats VALUES (322, 15, 'D', 10);
INSERT INTO travel_schedules.seats VALUES (323, 1, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (324, 1, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (325, 1, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (326, 1, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (327, 2, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (328, 2, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (329, 2, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (330, 2, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (331, 3, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (332, 3, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (333, 3, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (334, 3, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (335, 4, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (336, 4, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (337, 4, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (338, 4, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (339, 5, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (340, 5, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (341, 5, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (342, 5, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (343, 6, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (344, 6, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (345, 6, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (346, 6, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (347, 7, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (348, 7, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (349, 7, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (350, 7, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (351, 8, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (352, 8, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (353, 8, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (354, 8, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (355, 9, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (356, 9, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (357, 9, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (358, 9, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (359, 10, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (360, 10, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (361, 10, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (362, 10, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (363, 11, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (364, 11, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (365, 11, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (366, 11, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (367, 12, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (368, 12, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (369, 12, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (370, 12, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (371, 13, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (372, 13, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (373, 13, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (374, 13, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (375, 14, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (376, 14, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (377, 14, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (378, 14, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (379, 15, 'A', 11);
INSERT INTO travel_schedules.seats VALUES (380, 15, 'B', 11);
INSERT INTO travel_schedules.seats VALUES (381, 15, 'C', 11);
INSERT INTO travel_schedules.seats VALUES (382, 15, 'D', 11);
INSERT INTO travel_schedules.seats VALUES (383, 1, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (384, 1, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (385, 1, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (386, 1, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (387, 2, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (388, 2, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (389, 2, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (390, 2, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (391, 3, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (392, 3, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (393, 3, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (394, 3, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (395, 4, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (396, 4, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (397, 4, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (398, 4, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (399, 5, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (400, 5, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (401, 5, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (402, 5, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (403, 6, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (404, 6, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (405, 6, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (406, 6, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (407, 7, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (408, 7, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (409, 7, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (410, 7, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (411, 8, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (412, 8, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (413, 8, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (414, 8, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (415, 9, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (416, 9, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (417, 9, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (418, 9, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (419, 10, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (420, 10, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (421, 10, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (422, 10, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (423, 11, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (424, 11, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (425, 11, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (426, 11, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (427, 12, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (428, 12, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (429, 12, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (430, 12, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (431, 13, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (432, 13, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (433, 13, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (434, 13, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (435, 14, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (436, 14, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (437, 14, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (438, 14, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (439, 15, 'A', 12);
INSERT INTO travel_schedules.seats VALUES (440, 15, 'B', 12);
INSERT INTO travel_schedules.seats VALUES (441, 15, 'C', 12);
INSERT INTO travel_schedules.seats VALUES (442, 15, 'D', 12);
INSERT INTO travel_schedules.seats VALUES (443, 1, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (444, 1, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (445, 1, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (446, 1, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (447, 2, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (448, 2, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (449, 2, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (450, 2, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (451, 3, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (452, 3, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (453, 3, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (454, 3, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (455, 4, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (456, 4, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (457, 4, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (458, 4, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (459, 5, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (460, 5, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (461, 5, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (462, 5, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (463, 6, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (464, 6, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (465, 6, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (466, 6, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (467, 7, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (468, 7, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (469, 7, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (470, 7, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (471, 8, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (472, 8, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (473, 8, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (474, 8, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (475, 9, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (476, 9, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (477, 9, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (478, 9, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (479, 10, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (480, 10, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (481, 10, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (482, 10, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (483, 11, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (484, 11, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (485, 11, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (486, 11, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (487, 12, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (488, 12, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (489, 12, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (490, 12, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (491, 13, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (492, 13, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (493, 13, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (494, 13, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (495, 14, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (496, 14, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (497, 14, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (498, 14, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (499, 15, 'A', 13);
INSERT INTO travel_schedules.seats VALUES (500, 15, 'B', 13);
INSERT INTO travel_schedules.seats VALUES (501, 15, 'C', 13);
INSERT INTO travel_schedules.seats VALUES (502, 15, 'D', 13);
INSERT INTO travel_schedules.seats VALUES (503, 1, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (504, 1, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (505, 1, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (506, 1, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (507, 2, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (508, 2, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (509, 2, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (510, 2, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (511, 3, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (512, 3, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (513, 3, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (514, 3, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (515, 4, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (516, 4, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (517, 4, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (518, 4, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (519, 5, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (520, 5, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (521, 5, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (522, 5, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (523, 6, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (524, 6, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (525, 6, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (526, 6, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (527, 7, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (528, 7, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (529, 7, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (530, 7, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (531, 8, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (532, 8, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (533, 8, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (534, 8, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (535, 9, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (536, 9, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (537, 9, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (538, 9, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (539, 10, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (540, 10, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (541, 10, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (542, 10, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (543, 11, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (544, 11, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (545, 11, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (546, 11, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (547, 12, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (548, 12, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (549, 12, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (550, 12, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (551, 13, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (552, 13, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (553, 13, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (554, 13, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (555, 14, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (556, 14, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (557, 14, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (558, 14, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (559, 15, 'A', 14);
INSERT INTO travel_schedules.seats VALUES (560, 15, 'B', 14);
INSERT INTO travel_schedules.seats VALUES (561, 15, 'C', 14);
INSERT INTO travel_schedules.seats VALUES (562, 15, 'D', 14);
INSERT INTO travel_schedules.seats VALUES (563, 1, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (564, 1, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (565, 1, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (566, 1, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (567, 2, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (568, 2, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (569, 2, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (570, 2, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (571, 3, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (572, 3, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (573, 3, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (574, 3, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (575, 4, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (576, 4, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (577, 4, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (578, 4, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (579, 5, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (580, 5, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (581, 5, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (582, 5, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (583, 6, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (584, 6, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (585, 6, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (586, 6, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (587, 7, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (588, 7, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (589, 7, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (590, 7, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (591, 8, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (592, 8, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (593, 8, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (594, 8, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (595, 9, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (596, 9, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (597, 9, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (598, 9, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (599, 10, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (600, 10, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (601, 10, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (602, 10, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (603, 11, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (604, 11, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (605, 11, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (606, 11, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (607, 12, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (608, 12, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (609, 12, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (610, 12, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (611, 13, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (612, 13, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (613, 13, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (614, 13, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (615, 14, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (616, 14, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (617, 14, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (618, 14, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (619, 15, 'A', 15);
INSERT INTO travel_schedules.seats VALUES (620, 15, 'B', 15);
INSERT INTO travel_schedules.seats VALUES (621, 15, 'C', 15);
INSERT INTO travel_schedules.seats VALUES (622, 15, 'D', 15);
INSERT INTO travel_schedules.seats VALUES (623, 1, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (624, 1, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (625, 1, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (626, 1, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (627, 2, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (628, 2, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (629, 2, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (630, 2, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (631, 3, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (632, 3, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (633, 3, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (634, 3, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (635, 4, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (636, 4, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (637, 4, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (638, 4, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (639, 5, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (640, 5, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (641, 5, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (642, 5, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (643, 6, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (644, 6, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (645, 6, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (646, 6, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (647, 7, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (648, 7, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (649, 7, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (650, 7, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (651, 8, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (652, 8, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (653, 8, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (654, 8, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (655, 9, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (656, 9, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (657, 9, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (658, 9, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (659, 10, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (660, 10, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (661, 10, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (662, 10, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (663, 11, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (664, 11, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (665, 11, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (666, 11, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (667, 12, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (668, 12, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (669, 12, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (670, 12, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (671, 13, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (672, 13, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (673, 13, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (674, 13, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (675, 14, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (676, 14, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (677, 14, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (678, 14, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (679, 15, 'A', 16);
INSERT INTO travel_schedules.seats VALUES (680, 15, 'B', 16);
INSERT INTO travel_schedules.seats VALUES (681, 15, 'C', 16);
INSERT INTO travel_schedules.seats VALUES (682, 15, 'D', 16);
INSERT INTO travel_schedules.seats VALUES (683, 1, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (684, 1, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (685, 1, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (686, 1, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (687, 2, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (688, 2, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (689, 2, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (690, 2, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (691, 3, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (692, 3, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (693, 3, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (694, 3, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (695, 4, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (696, 4, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (697, 4, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (698, 4, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (699, 5, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (700, 5, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (701, 5, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (702, 5, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (703, 6, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (704, 6, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (705, 6, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (706, 6, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (707, 7, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (708, 7, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (709, 7, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (710, 7, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (711, 8, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (712, 8, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (713, 8, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (714, 8, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (715, 9, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (716, 9, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (717, 9, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (718, 9, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (719, 10, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (720, 10, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (721, 10, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (722, 10, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (723, 11, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (724, 11, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (725, 11, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (726, 11, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (727, 12, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (728, 12, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (729, 12, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (730, 12, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (731, 13, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (732, 13, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (733, 13, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (734, 13, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (735, 14, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (736, 14, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (737, 14, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (738, 14, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (739, 15, 'A', 17);
INSERT INTO travel_schedules.seats VALUES (740, 15, 'B', 17);
INSERT INTO travel_schedules.seats VALUES (741, 15, 'C', 17);
INSERT INTO travel_schedules.seats VALUES (742, 15, 'D', 17);
INSERT INTO travel_schedules.seats VALUES (743, 1, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (744, 1, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (745, 1, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (746, 1, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (747, 2, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (748, 2, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (749, 2, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (750, 2, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (751, 3, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (752, 3, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (753, 3, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (754, 3, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (755, 4, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (756, 4, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (757, 4, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (758, 4, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (759, 5, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (760, 5, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (761, 5, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (762, 5, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (763, 6, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (764, 6, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (765, 6, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (766, 6, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (767, 7, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (768, 7, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (769, 7, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (770, 7, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (771, 8, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (772, 8, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (773, 8, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (774, 8, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (775, 9, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (776, 9, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (777, 9, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (778, 9, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (779, 10, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (780, 10, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (781, 10, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (782, 10, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (783, 11, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (784, 11, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (785, 11, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (786, 11, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (787, 12, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (788, 12, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (789, 12, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (790, 12, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (791, 13, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (792, 13, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (793, 13, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (794, 13, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (795, 14, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (796, 14, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (797, 14, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (798, 14, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (799, 15, 'A', 18);
INSERT INTO travel_schedules.seats VALUES (800, 15, 'B', 18);
INSERT INTO travel_schedules.seats VALUES (801, 15, 'C', 18);
INSERT INTO travel_schedules.seats VALUES (802, 15, 'D', 18);
INSERT INTO travel_schedules.seats VALUES (803, 1, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (804, 1, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (805, 1, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (806, 1, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (807, 2, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (808, 2, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (809, 2, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (810, 2, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (811, 3, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (812, 3, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (813, 3, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (814, 3, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (815, 4, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (816, 4, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (817, 4, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (818, 4, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (819, 5, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (820, 5, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (821, 5, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (822, 5, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (823, 6, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (824, 6, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (825, 6, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (826, 6, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (827, 7, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (828, 7, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (829, 7, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (830, 7, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (831, 8, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (832, 8, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (833, 8, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (834, 8, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (835, 9, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (836, 9, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (837, 9, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (838, 9, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (839, 10, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (840, 10, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (841, 10, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (842, 10, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (843, 11, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (844, 11, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (845, 11, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (846, 11, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (847, 12, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (848, 12, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (849, 12, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (850, 12, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (851, 13, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (852, 13, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (853, 13, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (854, 13, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (855, 14, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (856, 14, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (857, 14, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (858, 14, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (859, 15, 'A', 19);
INSERT INTO travel_schedules.seats VALUES (860, 15, 'B', 19);
INSERT INTO travel_schedules.seats VALUES (861, 15, 'C', 19);
INSERT INTO travel_schedules.seats VALUES (862, 15, 'D', 19);
INSERT INTO travel_schedules.seats VALUES (863, 1, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (864, 1, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (865, 1, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (866, 1, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (867, 2, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (868, 2, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (869, 2, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (870, 2, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (871, 3, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (872, 3, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (873, 3, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (874, 3, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (875, 4, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (876, 4, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (877, 4, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (878, 4, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (879, 5, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (880, 5, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (881, 5, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (882, 5, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (883, 6, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (884, 6, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (885, 6, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (886, 6, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (887, 7, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (888, 7, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (889, 7, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (890, 7, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (891, 8, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (892, 8, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (893, 8, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (894, 8, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (895, 9, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (896, 9, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (897, 9, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (898, 9, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (899, 10, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (900, 10, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (901, 10, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (902, 10, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (903, 11, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (904, 11, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (905, 11, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (906, 11, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (907, 12, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (908, 12, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (909, 12, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (910, 12, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (911, 13, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (912, 13, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (913, 13, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (914, 13, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (915, 14, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (916, 14, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (917, 14, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (918, 14, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (919, 15, 'A', 20);
INSERT INTO travel_schedules.seats VALUES (920, 15, 'B', 20);
INSERT INTO travel_schedules.seats VALUES (921, 15, 'C', 20);
INSERT INTO travel_schedules.seats VALUES (922, 15, 'D', 20);
INSERT INTO travel_schedules.seats VALUES (923, 1, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (924, 1, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (925, 1, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (926, 1, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (927, 2, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (928, 2, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (929, 2, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (930, 2, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (931, 3, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (932, 3, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (933, 3, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (934, 3, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (935, 4, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (936, 4, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (937, 4, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (938, 4, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (939, 5, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (940, 5, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (941, 5, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (942, 5, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (943, 6, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (944, 6, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (945, 6, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (946, 6, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (947, 7, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (948, 7, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (949, 7, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (950, 7, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (951, 8, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (952, 8, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (953, 8, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (954, 8, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (955, 9, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (956, 9, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (957, 9, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (958, 9, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (959, 10, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (960, 10, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (961, 10, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (962, 10, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (963, 11, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (964, 11, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (965, 11, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (966, 11, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (967, 12, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (968, 12, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (969, 12, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (970, 12, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (971, 13, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (972, 13, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (973, 13, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (974, 13, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (975, 14, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (976, 14, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (977, 14, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (978, 14, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (979, 15, 'A', 21);
INSERT INTO travel_schedules.seats VALUES (980, 15, 'B', 21);
INSERT INTO travel_schedules.seats VALUES (981, 15, 'C', 21);
INSERT INTO travel_schedules.seats VALUES (982, 15, 'D', 21);
INSERT INTO travel_schedules.seats VALUES (983, 1, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (984, 1, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (985, 1, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (986, 1, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (987, 2, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (988, 2, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (989, 2, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (990, 2, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (991, 3, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (992, 3, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (993, 3, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (994, 3, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (995, 4, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (996, 4, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (997, 4, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (998, 4, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (999, 5, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1000, 5, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1001, 5, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1002, 5, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1003, 6, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1004, 6, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1005, 6, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1006, 6, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1007, 7, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1008, 7, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1009, 7, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1010, 7, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1011, 8, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1012, 8, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1013, 8, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1014, 8, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1015, 9, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1016, 9, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1017, 9, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1018, 9, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1019, 10, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1020, 10, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1021, 10, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1022, 10, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1023, 11, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1024, 11, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1025, 11, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1026, 11, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1027, 12, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1028, 12, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1029, 12, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1030, 12, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1031, 13, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1032, 13, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1033, 13, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1034, 13, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1035, 14, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1036, 14, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1037, 14, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1038, 14, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1039, 15, 'A', 22);
INSERT INTO travel_schedules.seats VALUES (1040, 15, 'B', 22);
INSERT INTO travel_schedules.seats VALUES (1041, 15, 'C', 22);
INSERT INTO travel_schedules.seats VALUES (1042, 15, 'D', 22);
INSERT INTO travel_schedules.seats VALUES (1043, 1, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1044, 1, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1045, 1, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1046, 1, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1047, 2, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1048, 2, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1049, 2, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1050, 2, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1051, 3, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1052, 3, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1053, 3, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1054, 3, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1055, 4, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1056, 4, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1057, 4, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1058, 4, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1059, 5, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1060, 5, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1061, 5, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1062, 5, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1063, 6, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1064, 6, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1065, 6, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1066, 6, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1067, 7, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1068, 7, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1069, 7, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1070, 7, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1071, 8, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1072, 8, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1073, 8, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1074, 8, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1075, 9, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1076, 9, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1077, 9, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1078, 9, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1079, 10, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1080, 10, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1081, 10, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1082, 10, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1083, 11, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1084, 11, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1085, 11, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1086, 11, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1087, 12, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1088, 12, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1089, 12, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1090, 12, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1091, 13, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1092, 13, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1093, 13, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1094, 13, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1095, 14, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1096, 14, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1097, 14, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1098, 14, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1099, 15, 'A', 23);
INSERT INTO travel_schedules.seats VALUES (1100, 15, 'B', 23);
INSERT INTO travel_schedules.seats VALUES (1101, 15, 'C', 23);
INSERT INTO travel_schedules.seats VALUES (1102, 15, 'D', 23);
INSERT INTO travel_schedules.seats VALUES (1103, 1, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1104, 1, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1105, 1, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1106, 1, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1107, 2, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1108, 2, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1109, 2, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1110, 2, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1111, 3, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1112, 3, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1113, 3, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1114, 3, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1115, 4, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1116, 4, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1117, 4, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1118, 4, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1119, 5, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1120, 5, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1121, 5, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1122, 5, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1123, 6, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1124, 6, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1125, 6, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1126, 6, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1127, 7, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1128, 7, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1129, 7, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1130, 7, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1131, 8, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1132, 8, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1133, 8, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1134, 8, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1135, 9, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1136, 9, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1137, 9, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1138, 9, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1139, 10, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1140, 10, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1141, 10, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1142, 10, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1143, 11, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1144, 11, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1145, 11, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1146, 11, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1147, 12, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1148, 12, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1149, 12, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1150, 12, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1151, 13, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1152, 13, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1153, 13, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1154, 13, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1155, 14, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1156, 14, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1157, 14, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1158, 14, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1159, 15, 'A', 24);
INSERT INTO travel_schedules.seats VALUES (1160, 15, 'B', 24);
INSERT INTO travel_schedules.seats VALUES (1161, 15, 'C', 24);
INSERT INTO travel_schedules.seats VALUES (1162, 15, 'D', 24);
INSERT INTO travel_schedules.seats VALUES (1163, 1, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1164, 1, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1165, 1, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1166, 1, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1167, 2, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1168, 2, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1169, 2, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1170, 2, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1171, 3, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1172, 3, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1173, 3, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1174, 3, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1175, 4, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1176, 4, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1177, 4, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1178, 4, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1179, 5, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1180, 5, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1181, 5, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1182, 5, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1183, 6, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1184, 6, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1185, 6, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1186, 6, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1187, 7, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1188, 7, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1189, 7, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1190, 7, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1191, 8, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1192, 8, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1193, 8, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1194, 8, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1195, 9, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1196, 9, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1197, 9, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1198, 9, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1199, 10, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1200, 10, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1201, 10, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1202, 10, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1203, 11, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1204, 11, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1205, 11, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1206, 11, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1207, 12, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1208, 12, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1209, 12, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1210, 12, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1211, 13, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1212, 13, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1213, 13, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1214, 13, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1215, 14, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1216, 14, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1217, 14, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1218, 14, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1219, 15, 'A', 25);
INSERT INTO travel_schedules.seats VALUES (1220, 15, 'B', 25);
INSERT INTO travel_schedules.seats VALUES (1221, 15, 'C', 25);
INSERT INTO travel_schedules.seats VALUES (1222, 15, 'D', 25);
INSERT INTO travel_schedules.seats VALUES (1223, 1, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1224, 1, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1225, 1, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1226, 1, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1227, 2, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1228, 2, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1229, 2, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1230, 2, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1231, 3, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1232, 3, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1233, 3, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1234, 3, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1235, 4, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1236, 4, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1237, 4, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1238, 4, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1239, 5, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1240, 5, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1241, 5, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1242, 5, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1243, 6, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1244, 6, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1245, 6, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1246, 6, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1247, 7, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1248, 7, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1249, 7, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1250, 7, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1251, 8, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1252, 8, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1253, 8, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1254, 8, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1255, 9, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1256, 9, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1257, 9, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1258, 9, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1259, 10, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1260, 10, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1261, 10, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1262, 10, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1263, 11, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1264, 11, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1265, 11, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1266, 11, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1267, 12, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1268, 12, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1269, 12, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1270, 12, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1271, 13, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1272, 13, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1273, 13, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1274, 13, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1275, 14, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1276, 14, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1277, 14, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1278, 14, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1279, 15, 'A', 26);
INSERT INTO travel_schedules.seats VALUES (1280, 15, 'B', 26);
INSERT INTO travel_schedules.seats VALUES (1281, 15, 'C', 26);
INSERT INTO travel_schedules.seats VALUES (1282, 15, 'D', 26);
INSERT INTO travel_schedules.seats VALUES (1283, 1, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1284, 1, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1285, 1, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1286, 1, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1287, 2, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1288, 2, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1289, 2, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1290, 2, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1291, 3, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1292, 3, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1293, 3, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1294, 3, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1295, 4, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1296, 4, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1297, 4, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1298, 4, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1299, 5, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1300, 5, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1301, 5, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1302, 5, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1303, 6, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1304, 6, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1305, 6, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1306, 6, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1307, 7, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1308, 7, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1309, 7, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1310, 7, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1311, 8, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1312, 8, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1313, 8, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1314, 8, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1315, 9, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1316, 9, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1317, 9, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1318, 9, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1319, 10, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1320, 10, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1321, 10, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1322, 10, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1323, 11, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1324, 11, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1325, 11, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1326, 11, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1327, 12, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1328, 12, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1329, 12, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1330, 12, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1331, 13, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1332, 13, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1333, 13, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1334, 13, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1335, 14, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1336, 14, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1337, 14, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1338, 14, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1339, 15, 'A', 27);
INSERT INTO travel_schedules.seats VALUES (1340, 15, 'B', 27);
INSERT INTO travel_schedules.seats VALUES (1341, 15, 'C', 27);
INSERT INTO travel_schedules.seats VALUES (1342, 15, 'D', 27);
INSERT INTO travel_schedules.seats VALUES (1343, 1, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1344, 1, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1345, 1, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1346, 1, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1347, 2, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1348, 2, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1349, 2, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1350, 2, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1351, 3, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1352, 3, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1353, 3, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1354, 3, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1355, 4, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1356, 4, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1357, 4, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1358, 4, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1359, 5, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1360, 5, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1361, 5, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1362, 5, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1363, 6, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1364, 6, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1365, 6, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1366, 6, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1367, 7, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1368, 7, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1369, 7, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1370, 7, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1371, 8, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1372, 8, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1373, 8, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1374, 8, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1375, 9, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1376, 9, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1377, 9, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1378, 9, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1379, 10, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1380, 10, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1381, 10, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1382, 10, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1383, 11, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1384, 11, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1385, 11, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1386, 11, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1387, 12, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1388, 12, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1389, 12, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1390, 12, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1391, 13, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1392, 13, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1393, 13, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1394, 13, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1395, 14, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1396, 14, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1397, 14, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1398, 14, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1399, 15, 'A', 28);
INSERT INTO travel_schedules.seats VALUES (1400, 15, 'B', 28);
INSERT INTO travel_schedules.seats VALUES (1401, 15, 'C', 28);
INSERT INTO travel_schedules.seats VALUES (1402, 15, 'D', 28);
INSERT INTO travel_schedules.seats VALUES (1403, 1, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1404, 1, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1405, 1, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1406, 1, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1407, 2, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1408, 2, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1409, 2, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1410, 2, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1411, 3, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1412, 3, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1413, 3, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1414, 3, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1415, 4, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1416, 4, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1417, 4, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1418, 4, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1419, 5, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1420, 5, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1421, 5, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1422, 5, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1423, 6, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1424, 6, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1425, 6, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1426, 6, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1427, 7, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1428, 7, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1429, 7, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1430, 7, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1431, 8, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1432, 8, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1433, 8, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1434, 8, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1435, 9, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1436, 9, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1437, 9, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1438, 9, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1439, 10, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1440, 10, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1441, 10, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1442, 10, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1443, 11, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1444, 11, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1445, 11, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1446, 11, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1447, 12, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1448, 12, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1449, 12, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1450, 12, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1451, 13, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1452, 13, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1453, 13, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1454, 13, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1455, 14, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1456, 14, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1457, 14, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1458, 14, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1459, 15, 'A', 29);
INSERT INTO travel_schedules.seats VALUES (1460, 15, 'B', 29);
INSERT INTO travel_schedules.seats VALUES (1461, 15, 'C', 29);
INSERT INTO travel_schedules.seats VALUES (1462, 15, 'D', 29);
INSERT INTO travel_schedules.seats VALUES (1463, 1, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1464, 1, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1465, 1, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1466, 1, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1467, 2, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1468, 2, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1469, 2, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1470, 2, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1471, 3, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1472, 3, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1473, 3, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1474, 3, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1475, 4, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1476, 4, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1477, 4, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1478, 4, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1479, 5, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1480, 5, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1481, 5, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1482, 5, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1483, 6, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1484, 6, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1485, 6, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1486, 6, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1487, 7, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1488, 7, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1489, 7, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1490, 7, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1491, 8, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1492, 8, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1493, 8, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1494, 8, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1495, 9, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1496, 9, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1497, 9, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1498, 9, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1499, 10, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1500, 10, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1501, 10, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1502, 10, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1503, 11, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1504, 11, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1505, 11, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1506, 11, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1507, 12, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1508, 12, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1509, 12, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1510, 12, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1511, 13, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1512, 13, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1513, 13, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1514, 13, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1515, 14, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1516, 14, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1517, 14, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1518, 14, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1519, 15, 'A', 30);
INSERT INTO travel_schedules.seats VALUES (1520, 15, 'B', 30);
INSERT INTO travel_schedules.seats VALUES (1521, 15, 'C', 30);
INSERT INTO travel_schedules.seats VALUES (1522, 15, 'D', 30);
INSERT INTO travel_schedules.seats VALUES (1523, 1, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1524, 1, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1525, 1, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1526, 1, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1527, 2, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1528, 2, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1529, 2, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1530, 2, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1531, 3, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1532, 3, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1533, 3, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1534, 3, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1535, 4, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1536, 4, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1537, 4, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1538, 4, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1539, 5, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1540, 5, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1541, 5, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1542, 5, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1543, 6, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1544, 6, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1545, 6, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1546, 6, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1547, 7, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1548, 7, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1549, 7, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1550, 7, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1551, 8, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1552, 8, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1553, 8, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1554, 8, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1555, 9, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1556, 9, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1557, 9, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1558, 9, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1559, 10, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1560, 10, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1561, 10, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1562, 10, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1563, 11, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1564, 11, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1565, 11, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1566, 11, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1567, 12, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1568, 12, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1569, 12, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1570, 12, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1571, 13, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1572, 13, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1573, 13, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1574, 13, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1575, 14, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1576, 14, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1577, 14, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1578, 14, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1579, 15, 'A', 31);
INSERT INTO travel_schedules.seats VALUES (1580, 15, 'B', 31);
INSERT INTO travel_schedules.seats VALUES (1581, 15, 'C', 31);
INSERT INTO travel_schedules.seats VALUES (1582, 15, 'D', 31);
INSERT INTO travel_schedules.seats VALUES (1583, 1, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1584, 1, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1585, 1, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1586, 1, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1587, 2, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1588, 2, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1589, 2, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1590, 2, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1591, 3, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1592, 3, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1593, 3, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1594, 3, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1595, 4, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1596, 4, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1597, 4, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1598, 4, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1599, 5, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1600, 5, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1601, 5, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1602, 5, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1603, 6, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1604, 6, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1605, 6, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1606, 6, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1607, 7, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1608, 7, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1609, 7, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1610, 7, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1611, 8, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1612, 8, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1613, 8, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1614, 8, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1615, 9, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1616, 9, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1617, 9, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1618, 9, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1619, 10, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1620, 10, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1621, 10, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1622, 10, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1623, 11, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1624, 11, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1625, 11, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1626, 11, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1627, 12, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1628, 12, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1629, 12, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1630, 12, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1631, 13, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1632, 13, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1633, 13, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1634, 13, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1635, 14, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1636, 14, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1637, 14, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1638, 14, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1639, 15, 'A', 32);
INSERT INTO travel_schedules.seats VALUES (1640, 15, 'B', 32);
INSERT INTO travel_schedules.seats VALUES (1641, 15, 'C', 32);
INSERT INTO travel_schedules.seats VALUES (1642, 15, 'D', 32);
INSERT INTO travel_schedules.seats VALUES (1643, 1, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1644, 1, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1645, 1, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1646, 1, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1647, 2, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1648, 2, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1649, 2, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1650, 2, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1651, 3, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1652, 3, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1653, 3, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1654, 3, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1655, 4, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1656, 4, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1657, 4, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1658, 4, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1659, 5, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1660, 5, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1661, 5, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1662, 5, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1663, 6, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1664, 6, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1665, 6, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1666, 6, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1667, 7, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1668, 7, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1669, 7, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1670, 7, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1671, 8, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1672, 8, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1673, 8, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1674, 8, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1675, 9, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1676, 9, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1677, 9, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1678, 9, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1679, 10, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1680, 10, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1681, 10, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1682, 10, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1683, 11, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1684, 11, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1685, 11, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1686, 11, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1687, 12, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1688, 12, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1689, 12, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1690, 12, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1691, 13, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1692, 13, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1693, 13, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1694, 13, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1695, 14, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1696, 14, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1697, 14, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1698, 14, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1699, 15, 'A', 33);
INSERT INTO travel_schedules.seats VALUES (1700, 15, 'B', 33);
INSERT INTO travel_schedules.seats VALUES (1701, 15, 'C', 33);
INSERT INTO travel_schedules.seats VALUES (1702, 15, 'D', 33);
INSERT INTO travel_schedules.seats VALUES (1703, 1, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1704, 1, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1705, 1, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1706, 1, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1707, 2, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1708, 2, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1709, 2, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1710, 2, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1711, 3, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1712, 3, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1713, 3, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1714, 3, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1715, 4, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1716, 4, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1717, 4, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1718, 4, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1719, 5, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1720, 5, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1721, 5, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1722, 5, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1723, 6, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1724, 6, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1725, 6, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1726, 6, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1727, 7, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1728, 7, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1729, 7, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1730, 7, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1731, 8, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1732, 8, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1733, 8, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1734, 8, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1735, 9, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1736, 9, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1737, 9, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1738, 9, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1739, 10, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1740, 10, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1741, 10, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1742, 10, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1743, 11, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1744, 11, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1745, 11, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1746, 11, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1747, 12, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1748, 12, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1749, 12, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1750, 12, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1751, 13, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1752, 13, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1753, 13, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1754, 13, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1755, 14, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1756, 14, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1757, 14, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1758, 14, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1759, 15, 'A', 34);
INSERT INTO travel_schedules.seats VALUES (1760, 15, 'B', 34);
INSERT INTO travel_schedules.seats VALUES (1761, 15, 'C', 34);
INSERT INTO travel_schedules.seats VALUES (1762, 15, 'D', 34);
INSERT INTO travel_schedules.seats VALUES (1763, 1, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1764, 1, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1765, 1, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1766, 1, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1767, 2, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1768, 2, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1769, 2, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1770, 2, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1771, 3, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1772, 3, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1773, 3, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1774, 3, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1775, 4, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1776, 4, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1777, 4, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1778, 4, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1779, 5, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1780, 5, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1781, 5, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1782, 5, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1783, 6, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1784, 6, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1785, 6, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1786, 6, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1787, 7, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1788, 7, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1789, 7, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1790, 7, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1791, 8, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1792, 8, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1793, 8, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1794, 8, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1795, 9, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1796, 9, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1797, 9, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1798, 9, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1799, 10, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1800, 10, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1801, 10, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1802, 10, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1803, 11, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1804, 11, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1805, 11, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1806, 11, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1807, 12, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1808, 12, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1809, 12, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1810, 12, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1811, 13, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1812, 13, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1813, 13, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1814, 13, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1815, 14, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1816, 14, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1817, 14, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1818, 14, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1819, 15, 'A', 35);
INSERT INTO travel_schedules.seats VALUES (1820, 15, 'B', 35);
INSERT INTO travel_schedules.seats VALUES (1821, 15, 'C', 35);
INSERT INTO travel_schedules.seats VALUES (1822, 15, 'D', 35);
INSERT INTO travel_schedules.seats VALUES (1823, 1, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1824, 1, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1825, 1, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1826, 1, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1827, 2, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1828, 2, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1829, 2, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1830, 2, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1831, 3, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1832, 3, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1833, 3, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1834, 3, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1835, 4, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1836, 4, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1837, 4, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1838, 4, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1839, 5, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1840, 5, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1841, 5, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1842, 5, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1843, 6, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1844, 6, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1845, 6, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1846, 6, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1847, 7, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1848, 7, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1849, 7, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1850, 7, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1851, 8, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1852, 8, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1853, 8, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1854, 8, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1855, 9, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1856, 9, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1857, 9, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1858, 9, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1859, 10, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1860, 10, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1861, 10, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1862, 10, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1863, 11, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1864, 11, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1865, 11, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1866, 11, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1867, 12, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1868, 12, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1869, 12, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1870, 12, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1871, 13, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1872, 13, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1873, 13, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1874, 13, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1875, 14, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1876, 14, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1877, 14, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1878, 14, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1879, 15, 'A', 36);
INSERT INTO travel_schedules.seats VALUES (1880, 15, 'B', 36);
INSERT INTO travel_schedules.seats VALUES (1881, 15, 'C', 36);
INSERT INTO travel_schedules.seats VALUES (1882, 15, 'D', 36);
INSERT INTO travel_schedules.seats VALUES (1883, 1, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1884, 1, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1885, 1, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1886, 1, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1887, 2, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1888, 2, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1889, 2, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1890, 2, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1891, 3, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1892, 3, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1893, 3, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1894, 3, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1895, 4, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1896, 4, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1897, 4, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1898, 4, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1899, 5, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1900, 5, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1901, 5, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1902, 5, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1903, 6, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1904, 6, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1905, 6, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1906, 6, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1907, 7, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1908, 7, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1909, 7, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1910, 7, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1911, 8, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1912, 8, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1913, 8, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1914, 8, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1915, 9, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1916, 9, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1917, 9, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1918, 9, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1919, 10, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1920, 10, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1921, 10, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1922, 10, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1923, 11, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1924, 11, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1925, 11, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1926, 11, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1927, 12, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1928, 12, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1929, 12, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1930, 12, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1931, 13, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1932, 13, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1933, 13, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1934, 13, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1935, 14, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1936, 14, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1937, 14, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1938, 14, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1939, 15, 'A', 37);
INSERT INTO travel_schedules.seats VALUES (1940, 15, 'B', 37);
INSERT INTO travel_schedules.seats VALUES (1941, 15, 'C', 37);
INSERT INTO travel_schedules.seats VALUES (1942, 15, 'D', 37);
INSERT INTO travel_schedules.seats VALUES (1943, 1, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1944, 1, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1945, 1, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1946, 1, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1947, 2, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1948, 2, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1949, 2, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1950, 2, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1951, 3, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1952, 3, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1953, 3, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1954, 3, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1955, 4, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1956, 4, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1957, 4, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1958, 4, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1959, 5, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1960, 5, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1961, 5, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1962, 5, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1963, 6, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1964, 6, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1965, 6, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1966, 6, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1967, 7, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1968, 7, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1969, 7, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1970, 7, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1971, 8, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1972, 8, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1973, 8, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1974, 8, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1975, 9, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1976, 9, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1977, 9, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1978, 9, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1979, 10, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1980, 10, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1981, 10, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1982, 10, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1983, 11, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1984, 11, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1985, 11, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1986, 11, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1987, 12, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1988, 12, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1989, 12, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1990, 12, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1991, 13, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1992, 13, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1993, 13, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1994, 13, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1995, 14, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (1996, 14, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (1997, 14, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (1998, 14, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (1999, 15, 'A', 38);
INSERT INTO travel_schedules.seats VALUES (2000, 15, 'B', 38);
INSERT INTO travel_schedules.seats VALUES (2001, 15, 'C', 38);
INSERT INTO travel_schedules.seats VALUES (2002, 15, 'D', 38);
INSERT INTO travel_schedules.seats VALUES (2003, 1, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2004, 1, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2005, 1, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2006, 1, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2007, 2, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2008, 2, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2009, 2, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2010, 2, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2011, 3, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2012, 3, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2013, 3, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2014, 3, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2015, 4, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2016, 4, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2017, 4, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2018, 4, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2019, 5, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2020, 5, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2021, 5, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2022, 5, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2023, 6, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2024, 6, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2025, 6, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2026, 6, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2027, 7, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2028, 7, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2029, 7, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2030, 7, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2031, 8, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2032, 8, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2033, 8, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2034, 8, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2035, 9, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2036, 9, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2037, 9, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2038, 9, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2039, 10, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2040, 10, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2041, 10, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2042, 10, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2043, 11, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2044, 11, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2045, 11, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2046, 11, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2047, 12, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2048, 12, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2049, 12, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2050, 12, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2051, 13, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2052, 13, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2053, 13, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2054, 13, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2055, 14, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2056, 14, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2057, 14, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2058, 14, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2059, 15, 'A', 39);
INSERT INTO travel_schedules.seats VALUES (2060, 15, 'B', 39);
INSERT INTO travel_schedules.seats VALUES (2061, 15, 'C', 39);
INSERT INTO travel_schedules.seats VALUES (2062, 15, 'D', 39);
INSERT INTO travel_schedules.seats VALUES (2063, 1, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2064, 1, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2065, 1, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2066, 1, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2067, 2, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2068, 2, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2069, 2, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2070, 2, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2071, 3, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2072, 3, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2073, 3, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2074, 3, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2075, 4, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2076, 4, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2077, 4, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2078, 4, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2079, 5, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2080, 5, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2081, 5, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2082, 5, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2083, 6, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2084, 6, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2085, 6, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2086, 6, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2087, 7, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2088, 7, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2089, 7, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2090, 7, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2091, 8, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2092, 8, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2093, 8, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2094, 8, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2095, 9, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2096, 9, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2097, 9, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2098, 9, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2099, 10, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2100, 10, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2101, 10, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2102, 10, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2103, 11, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2104, 11, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2105, 11, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2106, 11, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2107, 12, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2108, 12, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2109, 12, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2110, 12, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2111, 13, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2112, 13, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2113, 13, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2114, 13, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2115, 14, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2116, 14, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2117, 14, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2118, 14, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2119, 15, 'A', 40);
INSERT INTO travel_schedules.seats VALUES (2120, 15, 'B', 40);
INSERT INTO travel_schedules.seats VALUES (2121, 15, 'C', 40);
INSERT INTO travel_schedules.seats VALUES (2122, 15, 'D', 40);
INSERT INTO travel_schedules.seats VALUES (2123, 1, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2124, 1, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2125, 1, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2126, 1, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2127, 2, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2128, 2, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2129, 2, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2130, 2, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2131, 3, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2132, 3, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2133, 3, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2134, 3, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2135, 4, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2136, 4, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2137, 4, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2138, 4, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2139, 5, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2140, 5, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2141, 5, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2142, 5, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2143, 6, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2144, 6, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2145, 6, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2146, 6, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2147, 7, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2148, 7, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2149, 7, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2150, 7, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2151, 8, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2152, 8, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2153, 8, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2154, 8, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2155, 9, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2156, 9, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2157, 9, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2158, 9, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2159, 10, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2160, 10, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2161, 10, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2162, 10, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2163, 11, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2164, 11, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2165, 11, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2166, 11, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2167, 12, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2168, 12, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2169, 12, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2170, 12, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2171, 13, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2172, 13, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2173, 13, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2174, 13, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2175, 14, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2176, 14, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2177, 14, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2178, 14, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2179, 15, 'A', 41);
INSERT INTO travel_schedules.seats VALUES (2180, 15, 'B', 41);
INSERT INTO travel_schedules.seats VALUES (2181, 15, 'C', 41);
INSERT INTO travel_schedules.seats VALUES (2182, 15, 'D', 41);
INSERT INTO travel_schedules.seats VALUES (2183, 1, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2184, 1, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2185, 1, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2186, 1, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2187, 2, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2188, 2, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2189, 2, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2190, 2, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2191, 3, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2192, 3, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2193, 3, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2194, 3, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2195, 4, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2196, 4, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2197, 4, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2198, 4, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2199, 5, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2200, 5, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2201, 5, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2202, 5, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2203, 6, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2204, 6, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2205, 6, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2206, 6, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2207, 7, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2208, 7, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2209, 7, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2210, 7, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2211, 8, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2212, 8, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2213, 8, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2214, 8, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2215, 9, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2216, 9, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2217, 9, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2218, 9, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2219, 10, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2220, 10, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2221, 10, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2222, 10, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2223, 11, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2224, 11, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2225, 11, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2226, 11, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2227, 12, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2228, 12, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2229, 12, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2230, 12, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2231, 13, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2232, 13, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2233, 13, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2234, 13, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2235, 14, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2236, 14, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2237, 14, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2238, 14, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2239, 15, 'A', 42);
INSERT INTO travel_schedules.seats VALUES (2240, 15, 'B', 42);
INSERT INTO travel_schedules.seats VALUES (2241, 15, 'C', 42);
INSERT INTO travel_schedules.seats VALUES (2242, 15, 'D', 42);
INSERT INTO travel_schedules.seats VALUES (2243, 1, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2244, 1, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2245, 1, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2246, 1, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2247, 2, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2248, 2, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2249, 2, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2250, 2, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2251, 3, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2252, 3, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2253, 3, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2254, 3, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2255, 4, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2256, 4, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2257, 4, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2258, 4, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2259, 5, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2260, 5, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2261, 5, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2262, 5, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2263, 6, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2264, 6, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2265, 6, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2266, 6, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2267, 7, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2268, 7, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2269, 7, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2270, 7, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2271, 8, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2272, 8, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2273, 8, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2274, 8, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2275, 9, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2276, 9, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2277, 9, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2278, 9, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2279, 10, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2280, 10, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2281, 10, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2282, 10, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2283, 11, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2284, 11, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2285, 11, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2286, 11, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2287, 12, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2288, 12, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2289, 12, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2290, 12, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2291, 13, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2292, 13, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2293, 13, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2294, 13, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2295, 14, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2296, 14, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2297, 14, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2298, 14, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2299, 15, 'A', 43);
INSERT INTO travel_schedules.seats VALUES (2300, 15, 'B', 43);
INSERT INTO travel_schedules.seats VALUES (2301, 15, 'C', 43);
INSERT INTO travel_schedules.seats VALUES (2302, 15, 'D', 43);
INSERT INTO travel_schedules.seats VALUES (2303, 1, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2304, 1, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2305, 1, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2306, 1, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2307, 2, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2308, 2, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2309, 2, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2310, 2, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2311, 3, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2312, 3, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2313, 3, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2314, 3, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2315, 4, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2316, 4, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2317, 4, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2318, 4, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2319, 5, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2320, 5, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2321, 5, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2322, 5, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2323, 6, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2324, 6, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2325, 6, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2326, 6, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2327, 7, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2328, 7, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2329, 7, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2330, 7, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2331, 8, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2332, 8, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2333, 8, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2334, 8, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2335, 9, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2336, 9, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2337, 9, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2338, 9, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2339, 10, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2340, 10, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2341, 10, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2342, 10, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2343, 11, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2344, 11, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2345, 11, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2346, 11, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2347, 12, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2348, 12, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2349, 12, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2350, 12, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2351, 13, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2352, 13, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2353, 13, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2354, 13, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2355, 14, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2356, 14, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2357, 14, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2358, 14, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2359, 15, 'A', 44);
INSERT INTO travel_schedules.seats VALUES (2360, 15, 'B', 44);
INSERT INTO travel_schedules.seats VALUES (2361, 15, 'C', 44);
INSERT INTO travel_schedules.seats VALUES (2362, 15, 'D', 44);
INSERT INTO travel_schedules.seats VALUES (2363, 1, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2364, 1, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2365, 1, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2366, 1, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2367, 2, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2368, 2, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2369, 2, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2370, 2, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2371, 3, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2372, 3, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2373, 3, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2374, 3, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2375, 4, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2376, 4, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2377, 4, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2378, 4, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2379, 5, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2380, 5, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2381, 5, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2382, 5, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2383, 6, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2384, 6, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2385, 6, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2386, 6, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2387, 7, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2388, 7, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2389, 7, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2390, 7, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2391, 8, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2392, 8, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2393, 8, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2394, 8, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2395, 9, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2396, 9, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2397, 9, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2398, 9, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2399, 10, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2400, 10, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2401, 10, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2402, 10, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2403, 11, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2404, 11, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2405, 11, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2406, 11, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2407, 12, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2408, 12, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2409, 12, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2410, 12, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2411, 13, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2412, 13, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2413, 13, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2414, 13, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2415, 14, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2416, 14, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2417, 14, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2418, 14, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2419, 15, 'A', 45);
INSERT INTO travel_schedules.seats VALUES (2420, 15, 'B', 45);
INSERT INTO travel_schedules.seats VALUES (2421, 15, 'C', 45);
INSERT INTO travel_schedules.seats VALUES (2422, 15, 'D', 45);
INSERT INTO travel_schedules.seats VALUES (2423, 1, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2424, 1, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2425, 1, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2426, 1, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2427, 2, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2428, 2, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2429, 2, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2430, 2, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2431, 3, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2432, 3, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2433, 3, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2434, 3, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2435, 4, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2436, 4, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2437, 4, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2438, 4, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2439, 5, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2440, 5, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2441, 5, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2442, 5, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2443, 6, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2444, 6, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2445, 6, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2446, 6, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2447, 7, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2448, 7, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2449, 7, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2450, 7, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2451, 8, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2452, 8, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2453, 8, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2454, 8, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2455, 9, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2456, 9, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2457, 9, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2458, 9, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2459, 10, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2460, 10, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2461, 10, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2462, 10, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2463, 11, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2464, 11, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2465, 11, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2466, 11, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2467, 12, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2468, 12, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2469, 12, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2470, 12, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2471, 13, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2472, 13, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2473, 13, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2474, 13, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2475, 14, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2476, 14, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2477, 14, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2478, 14, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2479, 15, 'A', 46);
INSERT INTO travel_schedules.seats VALUES (2480, 15, 'B', 46);
INSERT INTO travel_schedules.seats VALUES (2481, 15, 'C', 46);
INSERT INTO travel_schedules.seats VALUES (2482, 15, 'D', 46);
INSERT INTO travel_schedules.seats VALUES (2483, 1, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2484, 1, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2485, 1, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2486, 1, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2487, 2, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2488, 2, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2489, 2, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2490, 2, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2491, 3, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2492, 3, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2493, 3, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2494, 3, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2495, 4, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2496, 4, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2497, 4, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2498, 4, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2499, 5, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2500, 5, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2501, 5, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2502, 5, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2503, 6, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2504, 6, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2505, 6, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2506, 6, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2507, 7, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2508, 7, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2509, 7, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2510, 7, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2511, 8, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2512, 8, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2513, 8, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2514, 8, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2515, 9, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2516, 9, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2517, 9, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2518, 9, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2519, 10, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2520, 10, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2521, 10, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2522, 10, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2523, 11, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2524, 11, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2525, 11, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2526, 11, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2527, 12, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2528, 12, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2529, 12, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2530, 12, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2531, 13, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2532, 13, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2533, 13, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2534, 13, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2535, 14, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2536, 14, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2537, 14, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2538, 14, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2539, 15, 'A', 47);
INSERT INTO travel_schedules.seats VALUES (2540, 15, 'B', 47);
INSERT INTO travel_schedules.seats VALUES (2541, 15, 'C', 47);
INSERT INTO travel_schedules.seats VALUES (2542, 15, 'D', 47);
INSERT INTO travel_schedules.seats VALUES (2543, 1, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2544, 1, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2545, 1, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2546, 1, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2547, 2, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2548, 2, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2549, 2, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2550, 2, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2551, 3, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2552, 3, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2553, 3, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2554, 3, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2555, 4, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2556, 4, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2557, 4, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2558, 4, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2559, 5, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2560, 5, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2561, 5, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2562, 5, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2563, 6, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2564, 6, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2565, 6, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2566, 6, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2567, 7, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2568, 7, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2569, 7, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2570, 7, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2571, 8, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2572, 8, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2573, 8, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2574, 8, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2575, 9, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2576, 9, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2577, 9, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2578, 9, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2579, 10, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2580, 10, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2581, 10, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2582, 10, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2583, 11, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2584, 11, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2585, 11, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2586, 11, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2587, 12, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2588, 12, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2589, 12, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2590, 12, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2591, 13, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2592, 13, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2593, 13, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2594, 13, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2595, 14, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2596, 14, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2597, 14, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2598, 14, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2599, 15, 'A', 48);
INSERT INTO travel_schedules.seats VALUES (2600, 15, 'B', 48);
INSERT INTO travel_schedules.seats VALUES (2601, 15, 'C', 48);
INSERT INTO travel_schedules.seats VALUES (2602, 15, 'D', 48);
INSERT INTO travel_schedules.seats VALUES (2603, 1, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2604, 1, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2605, 1, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2606, 1, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2607, 2, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2608, 2, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2609, 2, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2610, 2, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2611, 3, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2612, 3, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2613, 3, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2614, 3, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2615, 4, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2616, 4, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2617, 4, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2618, 4, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2619, 5, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2620, 5, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2621, 5, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2622, 5, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2623, 6, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2624, 6, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2625, 6, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2626, 6, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2627, 7, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2628, 7, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2629, 7, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2630, 7, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2631, 8, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2632, 8, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2633, 8, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2634, 8, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2635, 9, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2636, 9, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2637, 9, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2638, 9, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2639, 10, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2640, 10, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2641, 10, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2642, 10, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2643, 11, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2644, 11, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2645, 11, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2646, 11, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2647, 12, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2648, 12, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2649, 12, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2650, 12, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2651, 13, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2652, 13, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2653, 13, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2654, 13, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2655, 14, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2656, 14, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2657, 14, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2658, 14, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2659, 15, 'A', 49);
INSERT INTO travel_schedules.seats VALUES (2660, 15, 'B', 49);
INSERT INTO travel_schedules.seats VALUES (2661, 15, 'C', 49);
INSERT INTO travel_schedules.seats VALUES (2662, 15, 'D', 49);
INSERT INTO travel_schedules.seats VALUES (2663, 1, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2664, 1, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2665, 1, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2666, 1, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2667, 2, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2668, 2, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2669, 2, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2670, 2, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2671, 3, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2672, 3, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2673, 3, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2674, 3, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2675, 4, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2676, 4, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2677, 4, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2678, 4, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2679, 5, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2680, 5, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2681, 5, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2682, 5, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2683, 6, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2684, 6, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2685, 6, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2686, 6, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2687, 7, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2688, 7, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2689, 7, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2690, 7, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2691, 8, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2692, 8, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2693, 8, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2694, 8, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2695, 9, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2696, 9, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2697, 9, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2698, 9, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2699, 10, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2700, 10, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2701, 10, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2702, 10, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2703, 11, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2704, 11, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2705, 11, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2706, 11, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2707, 12, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2708, 12, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2709, 12, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2710, 12, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2711, 13, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2712, 13, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2713, 13, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2714, 13, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2715, 14, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2716, 14, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2717, 14, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2718, 14, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2719, 15, 'A', 50);
INSERT INTO travel_schedules.seats VALUES (2720, 15, 'B', 50);
INSERT INTO travel_schedules.seats VALUES (2721, 15, 'C', 50);
INSERT INTO travel_schedules.seats VALUES (2722, 15, 'D', 50);
INSERT INTO travel_schedules.seats VALUES (2723, 1, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2724, 1, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2725, 1, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2726, 1, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2727, 2, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2728, 2, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2729, 2, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2730, 2, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2731, 3, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2732, 3, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2733, 3, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2734, 3, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2735, 4, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2736, 4, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2737, 4, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2738, 4, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2739, 5, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2740, 5, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2741, 5, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2742, 5, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2743, 6, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2744, 6, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2745, 6, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2746, 6, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2747, 7, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2748, 7, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2749, 7, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2750, 7, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2751, 8, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2752, 8, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2753, 8, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2754, 8, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2755, 9, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2756, 9, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2757, 9, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2758, 9, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2759, 10, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2760, 10, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2761, 10, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2762, 10, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2763, 11, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2764, 11, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2765, 11, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2766, 11, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2767, 12, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2768, 12, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2769, 12, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2770, 12, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2771, 13, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2772, 13, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2773, 13, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2774, 13, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2775, 14, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2776, 14, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2777, 14, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2778, 14, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2779, 15, 'A', 51);
INSERT INTO travel_schedules.seats VALUES (2780, 15, 'B', 51);
INSERT INTO travel_schedules.seats VALUES (2781, 15, 'C', 51);
INSERT INTO travel_schedules.seats VALUES (2782, 15, 'D', 51);
INSERT INTO travel_schedules.seats VALUES (2783, 1, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2784, 1, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2785, 1, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2786, 1, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2787, 2, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2788, 2, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2789, 2, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2790, 2, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2791, 3, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2792, 3, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2793, 3, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2794, 3, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2795, 4, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2796, 4, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2797, 4, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2798, 4, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2799, 5, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2800, 5, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2801, 5, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2802, 5, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2803, 6, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2804, 6, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2805, 6, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2806, 6, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2807, 7, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2808, 7, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2809, 7, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2810, 7, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2811, 8, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2812, 8, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2813, 8, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2814, 8, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2815, 9, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2816, 9, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2817, 9, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2818, 9, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2819, 10, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2820, 10, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2821, 10, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2822, 10, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2823, 11, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2824, 11, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2825, 11, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2826, 11, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2827, 12, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2828, 12, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2829, 12, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2830, 12, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2831, 13, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2832, 13, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2833, 13, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2834, 13, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2835, 14, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2836, 14, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2837, 14, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2838, 14, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2839, 15, 'A', 52);
INSERT INTO travel_schedules.seats VALUES (2840, 15, 'B', 52);
INSERT INTO travel_schedules.seats VALUES (2841, 15, 'C', 52);
INSERT INTO travel_schedules.seats VALUES (2842, 15, 'D', 52);
INSERT INTO travel_schedules.seats VALUES (2843, 1, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2844, 1, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2845, 1, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2846, 1, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2847, 2, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2848, 2, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2849, 2, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2850, 2, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2851, 3, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2852, 3, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2853, 3, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2854, 3, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2855, 4, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2856, 4, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2857, 4, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2858, 4, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2859, 5, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2860, 5, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2861, 5, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2862, 5, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2863, 6, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2864, 6, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2865, 6, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2866, 6, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2867, 7, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2868, 7, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2869, 7, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2870, 7, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2871, 8, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2872, 8, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2873, 8, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2874, 8, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2875, 9, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2876, 9, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2877, 9, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2878, 9, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2879, 10, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2880, 10, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2881, 10, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2882, 10, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2883, 11, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2884, 11, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2885, 11, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2886, 11, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2887, 12, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2888, 12, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2889, 12, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2890, 12, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2891, 13, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2892, 13, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2893, 13, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2894, 13, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2895, 14, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2896, 14, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2897, 14, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2898, 14, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2899, 15, 'A', 53);
INSERT INTO travel_schedules.seats VALUES (2900, 15, 'B', 53);
INSERT INTO travel_schedules.seats VALUES (2901, 15, 'C', 53);
INSERT INTO travel_schedules.seats VALUES (2902, 15, 'D', 53);
INSERT INTO travel_schedules.seats VALUES (2903, 1, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2904, 1, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2905, 1, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2906, 1, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2907, 2, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2908, 2, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2909, 2, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2910, 2, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2911, 3, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2912, 3, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2913, 3, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2914, 3, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2915, 4, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2916, 4, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2917, 4, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2918, 4, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2919, 5, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2920, 5, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2921, 5, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2922, 5, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2923, 6, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2924, 6, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2925, 6, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2926, 6, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2927, 7, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2928, 7, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2929, 7, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2930, 7, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2931, 8, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2932, 8, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2933, 8, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2934, 8, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2935, 9, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2936, 9, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2937, 9, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2938, 9, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2939, 10, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2940, 10, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2941, 10, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2942, 10, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2943, 11, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2944, 11, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2945, 11, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2946, 11, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2947, 12, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2948, 12, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2949, 12, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2950, 12, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2951, 13, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2952, 13, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2953, 13, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2954, 13, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2955, 14, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2956, 14, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2957, 14, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2958, 14, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2959, 15, 'A', 54);
INSERT INTO travel_schedules.seats VALUES (2960, 15, 'B', 54);
INSERT INTO travel_schedules.seats VALUES (2961, 15, 'C', 54);
INSERT INTO travel_schedules.seats VALUES (2962, 15, 'D', 54);
INSERT INTO travel_schedules.seats VALUES (2963, 1, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2964, 1, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2965, 1, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2966, 1, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2967, 2, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2968, 2, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2969, 2, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2970, 2, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2971, 3, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2972, 3, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2973, 3, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2974, 3, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2975, 4, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2976, 4, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2977, 4, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2978, 4, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2979, 5, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2980, 5, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2981, 5, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2982, 5, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2983, 6, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2984, 6, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2985, 6, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2986, 6, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2987, 7, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2988, 7, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2989, 7, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2990, 7, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2991, 8, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2992, 8, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2993, 8, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2994, 8, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2995, 9, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (2996, 9, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (2997, 9, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (2998, 9, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (2999, 10, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3000, 10, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3001, 10, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3002, 10, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3003, 11, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3004, 11, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3005, 11, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3006, 11, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3007, 12, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3008, 12, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3009, 12, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3010, 12, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3011, 13, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3012, 13, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3013, 13, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3014, 13, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3015, 14, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3016, 14, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3017, 14, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3018, 14, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3019, 15, 'A', 55);
INSERT INTO travel_schedules.seats VALUES (3020, 15, 'B', 55);
INSERT INTO travel_schedules.seats VALUES (3021, 15, 'C', 55);
INSERT INTO travel_schedules.seats VALUES (3022, 15, 'D', 55);
INSERT INTO travel_schedules.seats VALUES (3023, 1, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3024, 1, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3025, 1, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3026, 1, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3027, 2, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3028, 2, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3029, 2, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3030, 2, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3031, 3, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3032, 3, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3033, 3, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3034, 3, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3035, 4, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3036, 4, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3037, 4, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3038, 4, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3039, 5, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3040, 5, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3041, 5, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3042, 5, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3043, 6, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3044, 6, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3045, 6, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3046, 6, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3047, 7, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3048, 7, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3049, 7, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3050, 7, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3051, 8, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3052, 8, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3053, 8, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3054, 8, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3055, 9, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3056, 9, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3057, 9, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3058, 9, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3059, 10, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3060, 10, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3061, 10, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3062, 10, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3063, 11, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3064, 11, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3065, 11, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3066, 11, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3067, 12, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3068, 12, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3069, 12, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3070, 12, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3071, 13, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3072, 13, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3073, 13, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3074, 13, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3075, 14, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3076, 14, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3077, 14, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3078, 14, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3079, 15, 'A', 56);
INSERT INTO travel_schedules.seats VALUES (3080, 15, 'B', 56);
INSERT INTO travel_schedules.seats VALUES (3081, 15, 'C', 56);
INSERT INTO travel_schedules.seats VALUES (3082, 15, 'D', 56);
INSERT INTO travel_schedules.seats VALUES (3083, 1, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3084, 1, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3085, 1, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3086, 1, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3087, 2, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3088, 2, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3089, 2, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3090, 2, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3091, 3, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3092, 3, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3093, 3, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3094, 3, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3095, 4, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3096, 4, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3097, 4, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3098, 4, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3099, 5, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3100, 5, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3101, 5, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3102, 5, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3103, 6, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3104, 6, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3105, 6, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3106, 6, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3107, 7, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3108, 7, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3109, 7, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3110, 7, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3111, 8, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3112, 8, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3113, 8, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3114, 8, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3115, 9, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3116, 9, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3117, 9, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3118, 9, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3119, 10, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3120, 10, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3121, 10, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3122, 10, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3123, 11, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3124, 11, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3125, 11, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3126, 11, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3127, 12, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3128, 12, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3129, 12, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3130, 12, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3131, 13, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3132, 13, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3133, 13, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3134, 13, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3135, 14, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3136, 14, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3137, 14, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3138, 14, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3139, 15, 'A', 57);
INSERT INTO travel_schedules.seats VALUES (3140, 15, 'B', 57);
INSERT INTO travel_schedules.seats VALUES (3141, 15, 'C', 57);
INSERT INTO travel_schedules.seats VALUES (3142, 15, 'D', 57);
INSERT INTO travel_schedules.seats VALUES (3143, 1, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3144, 1, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3145, 1, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3146, 1, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3147, 2, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3148, 2, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3149, 2, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3150, 2, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3151, 3, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3152, 3, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3153, 3, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3154, 3, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3155, 4, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3156, 4, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3157, 4, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3158, 4, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3159, 5, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3160, 5, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3161, 5, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3162, 5, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3163, 6, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3164, 6, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3165, 6, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3166, 6, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3167, 7, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3168, 7, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3169, 7, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3170, 7, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3171, 8, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3172, 8, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3173, 8, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3174, 8, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3175, 9, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3176, 9, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3177, 9, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3178, 9, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3179, 10, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3180, 10, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3181, 10, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3182, 10, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3183, 11, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3184, 11, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3185, 11, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3186, 11, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3187, 12, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3188, 12, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3189, 12, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3190, 12, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3191, 13, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3192, 13, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3193, 13, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3194, 13, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3195, 14, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3196, 14, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3197, 14, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3198, 14, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3199, 15, 'A', 58);
INSERT INTO travel_schedules.seats VALUES (3200, 15, 'B', 58);
INSERT INTO travel_schedules.seats VALUES (3201, 15, 'C', 58);
INSERT INTO travel_schedules.seats VALUES (3202, 15, 'D', 58);
INSERT INTO travel_schedules.seats VALUES (3203, 1, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3204, 1, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3205, 1, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3206, 1, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3207, 2, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3208, 2, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3209, 2, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3210, 2, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3211, 3, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3212, 3, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3213, 3, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3214, 3, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3215, 4, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3216, 4, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3217, 4, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3218, 4, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3219, 5, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3220, 5, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3221, 5, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3222, 5, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3223, 6, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3224, 6, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3225, 6, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3226, 6, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3227, 7, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3228, 7, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3229, 7, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3230, 7, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3231, 8, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3232, 8, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3233, 8, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3234, 8, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3235, 9, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3236, 9, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3237, 9, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3238, 9, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3239, 10, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3240, 10, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3241, 10, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3242, 10, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3243, 11, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3244, 11, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3245, 11, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3246, 11, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3247, 12, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3248, 12, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3249, 12, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3250, 12, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3251, 13, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3252, 13, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3253, 13, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3254, 13, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3255, 14, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3256, 14, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3257, 14, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3258, 14, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3259, 15, 'A', 59);
INSERT INTO travel_schedules.seats VALUES (3260, 15, 'B', 59);
INSERT INTO travel_schedules.seats VALUES (3261, 15, 'C', 59);
INSERT INTO travel_schedules.seats VALUES (3262, 15, 'D', 59);
INSERT INTO travel_schedules.seats VALUES (3263, 1, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3264, 1, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3265, 1, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3266, 1, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3267, 2, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3268, 2, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3269, 2, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3270, 2, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3271, 3, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3272, 3, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3273, 3, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3274, 3, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3275, 4, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3276, 4, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3277, 4, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3278, 4, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3279, 5, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3280, 5, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3281, 5, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3282, 5, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3283, 6, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3284, 6, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3285, 6, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3286, 6, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3287, 7, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3288, 7, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3289, 7, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3290, 7, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3291, 8, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3292, 8, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3293, 8, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3294, 8, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3295, 9, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3296, 9, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3297, 9, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3298, 9, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3299, 10, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3300, 10, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3301, 10, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3302, 10, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3303, 11, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3304, 11, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3305, 11, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3306, 11, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3307, 12, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3308, 12, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3309, 12, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3310, 12, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3311, 13, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3312, 13, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3313, 13, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3314, 13, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3315, 14, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3316, 14, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3317, 14, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3318, 14, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3319, 15, 'A', 60);
INSERT INTO travel_schedules.seats VALUES (3320, 15, 'B', 60);
INSERT INTO travel_schedules.seats VALUES (3321, 15, 'C', 60);
INSERT INTO travel_schedules.seats VALUES (3322, 15, 'D', 60);
INSERT INTO travel_schedules.seats VALUES (3323, 1, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3324, 1, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3325, 1, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3326, 1, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3327, 2, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3328, 2, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3329, 2, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3330, 2, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3331, 3, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3332, 3, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3333, 3, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3334, 3, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3335, 4, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3336, 4, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3337, 4, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3338, 4, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3339, 5, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3340, 5, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3341, 5, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3342, 5, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3343, 6, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3344, 6, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3345, 6, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3346, 6, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3347, 7, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3348, 7, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3349, 7, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3350, 7, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3351, 8, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3352, 8, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3353, 8, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3354, 8, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3355, 9, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3356, 9, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3357, 9, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3358, 9, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3359, 10, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3360, 10, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3361, 10, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3362, 10, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3363, 11, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3364, 11, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3365, 11, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3366, 11, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3367, 12, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3368, 12, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3369, 12, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3370, 12, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3371, 13, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3372, 13, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3373, 13, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3374, 13, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3375, 14, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3376, 14, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3377, 14, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3378, 14, 'D', 61);
INSERT INTO travel_schedules.seats VALUES (3379, 15, 'A', 61);
INSERT INTO travel_schedules.seats VALUES (3380, 15, 'B', 61);
INSERT INTO travel_schedules.seats VALUES (3381, 15, 'C', 61);
INSERT INTO travel_schedules.seats VALUES (3382, 15, 'D', 61);


--
-- TOC entry 3478 (class 0 OID 24735)
-- Dependencies: 222
-- Data for Name: stations; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.stations VALUES ('GMR', 'Gambir', 'JKT');
INSERT INTO travel_schedules.stations VALUES ('CN ', 'Cirebon', 'CBN');
INSERT INTO travel_schedules.stations VALUES ('CNP', 'Prujakan', 'CBN');
INSERT INTO travel_schedules.stations VALUES ('SMC', 'Semarang Poncol', 'SMG');
INSERT INTO travel_schedules.stations VALUES ('SMT', 'Semarang Tawang', 'SMG');
INSERT INTO travel_schedules.stations VALUES ('SLO', 'Solo Balapan', 'SKT');
INSERT INTO travel_schedules.stations VALUES ('SK ', 'Solo Jebres', 'SKT');
INSERT INTO travel_schedules.stations VALUES ('SGU', 'Surabaya Gubeng', 'SBY');
INSERT INTO travel_schedules.stations VALUES ('SBI', 'Surabaya Pasarturi', 'SBY');
INSERT INTO travel_schedules.stations VALUES ('YK ', 'Yogyakarta', 'YYK');
INSERT INTO travel_schedules.stations VALUES ('LPN', 'Lempuyangan', 'YYK');
INSERT INTO travel_schedules.stations VALUES ('ML ', 'Malang', 'MLG');
INSERT INTO travel_schedules.stations VALUES ('TG ', 'Tegal', 'TGL');
INSERT INTO travel_schedules.stations VALUES ('BD ', 'Bandung', 'BDG');


--
-- TOC entry 3482 (class 0 OID 24808)
-- Dependencies: 226
-- Data for Name: train_cars; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.train_cars VALUES (1, 'CIR', 10, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (2, 'CIR', 10, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (3, 'CIR', 20, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (4, 'CIR', 20, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (5, 'HAR', 15, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (6, 'HAR', 15, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (7, 'HAR', 25, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (8, 'HAR', 25, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (9, 'CIR', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (10, 'CHE', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (11, 'CHE', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (12, 'CHE', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (13, 'CHE', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (14, 'CHE', 60, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (15, 'CHE', 60, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (16, 'CHE', 60, 2, 3);
INSERT INTO travel_schedules.train_cars VALUES (17, 'CHE', 60, 2, 4);
INSERT INTO travel_schedules.train_cars VALUES (18, 'PHR', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (19, 'PHR', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (20, 'PHR', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (21, 'PHR', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (22, 'PHR', 60, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (23, 'PHR', 60, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (24, 'PHR', 60, 2, 3);
INSERT INTO travel_schedules.train_cars VALUES (25, 'PHR', 60, 2, 4);
INSERT INTO travel_schedules.train_cars VALUES (26, 'TKS', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (27, 'TKS', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (28, 'TKS', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (29, 'TKS', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (30, 'TKS', 60, 1, 5);
INSERT INTO travel_schedules.train_cars VALUES (31, 'TKS', 60, 1, 6);
INSERT INTO travel_schedules.train_cars VALUES (32, 'TKS', 60, 1, 7);
INSERT INTO travel_schedules.train_cars VALUES (33, 'DWP', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (34, 'DWP', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (35, 'DWP', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (36, 'DWP', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (37, 'DWP', 60, 1, 5);
INSERT INTO travel_schedules.train_cars VALUES (38, 'DWP', 60, 1, 6);
INSERT INTO travel_schedules.train_cars VALUES (39, 'DWP', 60, 1, 7);
INSERT INTO travel_schedules.train_cars VALUES (40, 'SMU', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (41, 'SMU', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (42, 'SMU', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (43, 'SMU', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (44, 'SMU', 60, 1, 5);
INSERT INTO travel_schedules.train_cars VALUES (45, 'SMU', 60, 1, 6);
INSERT INTO travel_schedules.train_cars VALUES (46, 'SMU', 60, 1, 7);
INSERT INTO travel_schedules.train_cars VALUES (47, 'GJY', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (48, 'GJY', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (49, 'GJY', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (50, 'GJY', 60, 1, 4);
INSERT INTO travel_schedules.train_cars VALUES (51, 'GJY', 60, 1, 5);
INSERT INTO travel_schedules.train_cars VALUES (52, 'GJY', 60, 1, 6);
INSERT INTO travel_schedules.train_cars VALUES (53, 'GJY', 60, 1, 7);
INSERT INTO travel_schedules.train_cars VALUES (54, 'KLG', 60, 1, 1);
INSERT INTO travel_schedules.train_cars VALUES (55, 'KLG', 60, 1, 2);
INSERT INTO travel_schedules.train_cars VALUES (56, 'KLG', 60, 1, 3);
INSERT INTO travel_schedules.train_cars VALUES (57, 'KLG', 60, 2, 1);
INSERT INTO travel_schedules.train_cars VALUES (58, 'KLG', 60, 2, 2);
INSERT INTO travel_schedules.train_cars VALUES (59, 'KLG', 60, 2, 3);
INSERT INTO travel_schedules.train_cars VALUES (60, 'KLG', 60, 2, 4);
INSERT INTO travel_schedules.train_cars VALUES (61, 'KLG', 60, 2, 5);



--
-- TOC entry 3480 (class 0 OID 24802)
-- Dependencies: 224
-- Data for Name: trains; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.trains VALUES ('CIR', 'Ciremai');
INSERT INTO travel_schedules.trains VALUES ('HAR', 'Harina');
INSERT INTO travel_schedules.trains VALUES ('CHE', 'Argo Cheribon');
INSERT INTO travel_schedules.trains VALUES ('PHR', 'Argo Pahrahyangan');
INSERT INTO travel_schedules.trains VALUES ('TKS', 'Taksaka');
INSERT INTO travel_schedules.trains VALUES ('DWP', 'Argo Dwipangga');
INSERT INTO travel_schedules.trains VALUES ('SMU', 'Argo Semeru');
INSERT INTO travel_schedules.trains VALUES ('GJY', 'Gajayana');
INSERT INTO travel_schedules.trains VALUES ('KLG', 'Kaligung');


--
-- TOC entry 3488 (class 0 OID 24849)
-- Dependencies: 232
-- Data for Name: travel_fares; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.travel_fares VALUES (1, 1, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (3, 2, 110000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (5, 1, 80000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (9, 2, 90000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (10, 3, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (11, 3, 100000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (12, 4, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (13, 4, 100000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (14, 5, 200000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (15, 5, 120000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (16, 6, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (17, 6, 80000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (18, 7, 100000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (19, 7, 80000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (20, 8, 150000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (21, 12, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (22, 13, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (23, 14, 170000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (24, 16, 175000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (25, 16, 110000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (26, 17, 175000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (27, 17, 110000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (28, 18, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (29, 18, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (30, 19, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (31, 19, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (32, 20, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (33, 20, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (34, 21, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (35, 21, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (36, 22, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (37, 22, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (38, 23, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (39, 23, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (40, 24, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (41, 24, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (42, 25, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (43, 25, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (44, 26, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (45, 26, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (46, 27, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (47, 27, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (48, 28, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (49, 28, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (50, 29, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (51, 29, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (52, 30, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (53, 30, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (54, 31, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (55, 31, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (56, 32, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (57, 32, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (58, 33, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (59, 33, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (60, 34, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (61, 34, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (62, 35, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (63, 35, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (64, 36, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (65, 36, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (66, 37, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (67, 37, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (68, 38, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (69, 38, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (70, 39, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (71, 39, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (72, 40, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (73, 40, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (74, 41, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (75, 41, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (76, 42, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (77, 42, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (78, 43, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (79, 43, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (80, 44, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (81, 44, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (82, 45, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (83, 45, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (84, 46, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (85, 46, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (86, 47, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (87, 47, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (88, 48, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (89, 48, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (90, 49, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (91, 49, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (92, 50, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (93, 50, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (94, 51, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (95, 51, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (96, 52, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (97, 52, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (98, 53, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (99, 53, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (100, 54, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (101, 54, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (102, 55, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (103, 55, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (104, 56, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (105, 56, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (106, 57, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (107, 57, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (108, 58, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (109, 58, 180000, 2, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (110, 59, 250000, 1, 'IDR');
INSERT INTO travel_schedules.travel_fares VALUES (111, 59, 180000, 2, 'IDR');



--
-- TOC entry 3477 (class 0 OID 24731)
-- Dependencies: 221
-- Data for Name: travels; Type: TABLE DATA; Schema: travel_schedules; Owner: -
--

INSERT INTO travel_schedules.travels VALUES (2, '143', '2023-07-07 09:40:00+00', '2023-07-07 14:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (3, '126', '2023-07-07 20:25:00+00', '2023-07-08 01:32:00+00', 'BD ', 'TG ', 'HAR');
INSERT INTO travel_schedules.travels VALUES (5, '144', '2023-07-07 16:50:00+00', '2023-07-08 00:59:00+00', 'BD ', 'SMC', 'CIR');
INSERT INTO travel_schedules.travels VALUES (1, '144', '2023-07-07 16:50:00+00', '2023-07-07 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (6, '144', '2023-07-08 16:50:00+00', '2023-07-08 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (7, '144', '2023-07-09 16:50:00+00', '2023-07-09 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (4, '125', '2023-07-07 22:35:00+00', '2023-07-08 05:30:00+00', 'TG ', 'BD ', 'HAR');
INSERT INTO travel_schedules.travels VALUES (8, '144', '2023-09-07 16:50:00+00', '2023-09-07 22:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (16, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (13, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (14, '144', '2023-10-16 14:16:00+00', '2023-10-16 20:16:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (17, '144', '2023-10-19 14:16:00+00', '2023-10-19 20:16:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (18, '144', '2023-11-26 02:40:00+00', '2023-11-26 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (19, '144', '2023-11-26 09:50:00+00', '2023-11-26 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (20, '26 ', '2023-11-26 01:30:00+00', '2023-11-26 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (21, '27 ', '2023-11-26 06:30:00+00', '2023-11-26 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (22, '42 ', '2023-11-26 05:30:00+00', '2023-11-26 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (23, '47 ', '2023-11-26 01:45:00+00', '2023-11-26 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (24, '144', '2023-11-27 02:40:00+00', '2023-11-27 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (25, '144', '2023-11-27 09:50:00+00', '2023-11-27 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (26, '26 ', '2023-11-27 01:30:00+00', '2023-11-27 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (27, '27 ', '2023-11-27 06:30:00+00', '2023-11-27 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (28, '42 ', '2023-11-27 05:30:00+00', '2023-11-27 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (29, '47 ', '2023-11-27 01:45:00+00', '2023-11-27 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (30, '144', '2023-11-28 02:40:00+00', '2023-11-28 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (31, '144', '2023-11-28 09:50:00+00', '2023-11-28 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (32, '26 ', '2023-11-28 01:30:00+00', '2023-11-28 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (33, '27 ', '2023-11-28 06:30:00+00', '2023-11-28 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (34, '42 ', '2023-11-28 05:30:00+00', '2023-11-28 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (35, '47 ', '2023-11-28 01:45:00+00', '2023-11-28 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (36, '144', '2023-11-29 02:40:00+00', '2023-11-29 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (37, '144', '2023-11-29 09:50:00+00', '2023-11-29 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (38, '26 ', '2023-11-29 01:30:00+00', '2023-11-29 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (39, '27 ', '2023-11-29 06:30:00+00', '2023-11-29 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (40, '42 ', '2023-11-29 05:30:00+00', '2023-11-29 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (41, '47 ', '2023-11-29 01:45:00+00', '2023-11-29 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (42, '144', '2023-11-30 02:40:00+00', '2023-11-30 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (43, '144', '2023-11-30 09:50:00+00', '2023-11-30 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (44, '26 ', '2023-11-30 01:30:00+00', '2023-11-30 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (45, '27 ', '2023-11-30 06:30:00+00', '2023-11-30 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (46, '42 ', '2023-11-30 05:30:00+00', '2023-11-30 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (47, '47 ', '2023-11-30 01:45:00+00', '2023-11-30 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (48, '144', '2023-12-01 02:40:00+00', '2023-12-01 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (49, '144', '2023-12-01 09:50:00+00', '2023-12-01 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (50, '26 ', '2023-12-01 01:30:00+00', '2023-12-01 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (51, '27 ', '2023-12-01 06:30:00+00', '2023-12-01 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (52, '42 ', '2023-12-01 05:30:00+00', '2023-12-01 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (53, '47 ', '2023-12-01 01:45:00+00', '2023-12-01 12:45:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (54, '144', '2023-12-02 02:40:00+00', '2023-12-02 07:45:00+00', 'TG ', 'BD ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (55, '144', '2023-12-02 09:50:00+00', '2023-12-02 15:27:00+00', 'BD ', 'TG ', 'CIR');
INSERT INTO travel_schedules.travels VALUES (56, '26 ', '2023-12-02 01:30:00+00', '2023-12-02 05:39:00+00', 'GMR', 'TG ', 'CHE');
INSERT INTO travel_schedules.travels VALUES (57, '27 ', '2023-12-02 06:30:00+00', '2023-12-02 10:34:00+00', 'TG ', 'GMR', 'CHE');
INSERT INTO travel_schedules.travels VALUES (58, '42 ', '2023-12-02 05:30:00+00', '2023-12-02 08:25:00+00', 'GMR', 'BD ', 'PHR');
INSERT INTO travel_schedules.travels VALUES (59, '47 ', '2023-12-02 01:45:00+00', '2023-12-02 12:45:00+00', 'GMR', 'BD ', 'PHR');

--
-- TOC entry 3493 (class 0 OID 24945)
-- Dependencies: 237
-- Data for Name: id_types; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.id_types VALUES (1, 'KTP');
INSERT INTO users.id_types VALUES (2, 'SIM');
INSERT INTO users.id_types VALUES (3, 'Paspor');


--
-- TOC entry 3507 (class 0 OID 25160)
-- Dependencies: 251
-- Data for Name: permissions; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.permissions VALUES (1, 'GET');
INSERT INTO users.permissions VALUES (2, 'POST');
INSERT INTO users.permissions VALUES (3, 'DELETE');
INSERT INTO users.permissions VALUES (4, 'PUT');
INSERT INTO users.permissions VALUES (5, 'PATCH');


--
-- TOC entry 3509 (class 0 OID 25167)
-- Dependencies: 253
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.role_permissions VALUES (1, 1, 1);
INSERT INTO users.role_permissions VALUES (2, 1, 2);
INSERT INTO users.role_permissions VALUES (3, 1, 3);
INSERT INTO users.role_permissions VALUES (4, 1, 4);
INSERT INTO users.role_permissions VALUES (5, 1, 5);


--
-- TOC entry 3502 (class 0 OID 25112)
-- Dependencies: 246
-- Data for Name: roles; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.roles VALUES (1, 'admin');
INSERT INTO users.roles VALUES (2, 'user');


--
-- TOC entry 3505 (class 0 OID 25140)
-- Dependencies: 249
-- Data for Name: user_roles; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.user_roles VALUES (1, 1, 2);
INSERT INTO users.user_roles VALUES (2, 2, 2);


--
-- TOC entry 3491 (class 0 OID 24936)
-- Dependencies: 235
-- Data for Name: users; Type: TABLE DATA; Schema: users; Owner: -
--

INSERT INTO users.users VALUES (1, 'ardimr', 'ardi@gmail.com', 'Rizky Ardi Maulana', '$2a$04$piwEb1UECg22/dTEjED6puzMxfbkdkzwnrxbpesF.WHQQnxHoEZXC', '+628986983930', 1, '337602', '1999-11-04', '2023-07-08 11:16:21.472678', '2023-07-08 11:16:21.472678');
INSERT INTO users.users VALUES (2, 'shifava', 'shifa@gmail.com', 'Shifa Veronica Aulia', '$2a$04$7jhZb21NcIeFT484fHlY7ePP.Cvh0qJ0NN3HxF23m9k00L1P92v/q', '+62890123456', 1, '337601', '2000-07-07', '2023-07-08 11:25:40.787218', '2023-07-08 11:25:40.787218');
INSERT INTO users.users VALUES (4, 'shifavero', 'shifa@gmail.com', 'Shifa Veronica Aulia', '$2a$04$7jhZb21NcIeFT484fHlY7ePP.Cvh0qJ0NN3HxF23m9k00L1P92v/q', '+62890123456', 1, '337601', '2000-07-07', '2023-10-15 13:15:28.01111', '2023-10-15 13:15:28.01111');


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 243
-- Name: user_account_user_account_id_seq; Type: SEQUENCE SET; Schema: accounts; Owner: -
--

SELECT pg_catalog.setval('accounts.user_account_user_account_id_seq', 2, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 241
-- Name: passengers_passenger_id_seq; Type: SEQUENCE SET; Schema: bookings; Owner: -
--

SELECT pg_catalog.setval('bookings.passengers_passenger_id_seq', 23, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 239
-- Name: tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: bookings; Owner: -
--

SELECT pg_catalog.setval('bookings.tickets_ticket_id_seq', 13, true);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 247
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_roles_id_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 227
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.classes_id_seq', 2, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 229
-- Name: seats_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.seats_id_seq', 262, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 231
-- Name: travel_costs_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.travel_costs_id_seq', 27, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 220
-- Name: travel_travel_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.travel_travel_id_seq', 17, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 225
-- Name: untitled_table_213_id_seq; Type: SEQUENCE SET; Schema: travel_schedules; Owner: -
--

SELECT pg_catalog.setval('travel_schedules.untitled_table_213_id_seq', 9, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 236
-- Name: id_types_id_type_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.id_types_id_type_id_seq', 3, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 250
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.permissions_id_seq', 5, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 252
-- Name: role_permissions_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.role_permissions_id_seq', 5, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 245
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.roles_id_seq', 3, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.user_roles_id_seq', 2, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 234
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: users; Owner: -
--

SELECT pg_catalog.setval('users.users_user_id_seq', 4, true);


--
-- TOC entry 3311 (class 2606 OID 25061)
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (user_account_id);


--
-- TOC entry 3307 (class 2606 OID 25000)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_code);


--
-- TOC entry 3309 (class 2606 OID 25028)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 3301 (class 2606 OID 24926)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: finances; Owner: -
--

ALTER TABLE ONLY finances.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (currency_code);


--
-- TOC entry 3293 (class 2606 OID 24748)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_code);


--
-- TOC entry 3297 (class 2606 OID 24832)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 24903)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- TOC entry 3291 (class 2606 OID 24765)
-- Name: stations station_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_code);


--
-- TOC entry 3295 (class 2606 OID 24873)
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_code);


--
-- TOC entry 3289 (class 2606 OID 24896)
-- Name: travels travels_pkey; Type: CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_pkey PRIMARY KEY (travel_id);


--
-- TOC entry 3305 (class 2606 OID 24952)
-- Name: id_types id_types_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.id_types
    ADD CONSTRAINT id_types_pkey PRIMARY KEY (id_type_id);


--
-- TOC entry 3315 (class 2606 OID 25172)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 25119)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 24943)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3330 (class 2606 OID 25075)
-- Name: user_account user_account_currency_code_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 25070)
-- Name: user_account user_account_owner_fkey; Type: FK CONSTRAINT; Schema: accounts; Owner: -
--

ALTER TABLE ONLY accounts.user_account
    ADD CONSTRAINT user_account_owner_fkey FOREIGN KEY (owner) REFERENCES users.users(user_id);


--
-- TOC entry 3327 (class 2606 OID 25037)
-- Name: passengers passengers_passenger_id_type_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_passenger_id_type_fkey FOREIGN KEY (passenger_id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;


--
-- TOC entry 3328 (class 2606 OID 25047)
-- Name: passengers passengers_seat_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES travel_schedules.seats(seat_id) ON UPDATE CASCADE;


--
-- TOC entry 3329 (class 2606 OID 25042)
-- Name: passengers passengers_ticket_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES bookings.tickets(ticket_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3324 (class 2606 OID 25021)
-- Name: tickets tickets_booking_code_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_booking_code_fkey FOREIGN KEY (booking_code) REFERENCES bookings.bookings(booking_code) ON UPDATE CASCADE;


--
-- TOC entry 3325 (class 2606 OID 25006)
-- Name: tickets tickets_travel_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_travel_id_fkey FOREIGN KEY (travel_id) REFERENCES travel_schedules.travels(travel_id) ON UPDATE CASCADE;


--
-- TOC entry 3326 (class 2606 OID 25016)
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: -
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 24749)
-- Name: stations station_city_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.stations
    ADD CONSTRAINT station_city_code_fkey FOREIGN KEY (city_code) REFERENCES travel_schedules.cities(city_code) ON UPDATE CASCADE;


--
-- TOC entry 3320 (class 2606 OID 24833)
-- Name: train_cars train_cars_class_id_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_class_id_fkey FOREIGN KEY (class_id) REFERENCES travel_schedules.classes(id) ON UPDATE CASCADE;


--
-- TOC entry 3321 (class 2606 OID 24874)
-- Name: train_cars train_cars_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.train_cars
    ADD CONSTRAINT train_cars_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3322 (class 2606 OID 24927)
-- Name: travel_fares travel_costs_currency_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travel_fares
    ADD CONSTRAINT travel_costs_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES finances.currencies(currency_code) ON UPDATE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 24782)
-- Name: travels travels_departure_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_departure_station_fkey FOREIGN KEY (departure_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 24790)
-- Name: travels travels_destination_station_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_destination_station_fkey FOREIGN KEY (destination_station) REFERENCES travel_schedules.stations(station_code) ON UPDATE CASCADE;


--
-- TOC entry 3318 (class 2606 OID 24879)
-- Name: travels travels_train_code_fkey; Type: FK CONSTRAINT; Schema: travel_schedules; Owner: -
--

ALTER TABLE ONLY travel_schedules.travels
    ADD CONSTRAINT travels_train_code_fkey FOREIGN KEY (train_code) REFERENCES travel_schedules.trains(train_code) ON UPDATE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 25146)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES users.roles(id);


--
-- TOC entry 3333 (class 2606 OID 25151)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users.users(user_id);


--
-- TOC entry 3323 (class 2606 OID 24953)
-- Name: users users_id_type_fkey; Type: FK CONSTRAINT; Schema: users; Owner: -
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_id_type_fkey FOREIGN KEY (id_type) REFERENCES users.id_types(id_type_id) ON UPDATE CASCADE;
