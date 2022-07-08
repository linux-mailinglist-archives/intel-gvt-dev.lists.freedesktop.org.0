Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4756B49E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jul 2022 10:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616CD1128A2;
	Fri,  8 Jul 2022 08:41:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732CD1128A1;
 Fri,  8 Jul 2022 08:41:29 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26876xbg013695;
 Fri, 8 Jul 2022 08:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=lZV4fvYGG9/ryEbkKZlQXt7Kvb2t8elcMSdT+82qar8=;
 b=Zj9ODdcCqRDG9y4IzIZACoRXfjZ87RVwglYld+W0zS61RIae5pl4hLxjxFG+8EG6WmK7
 CqfwmdBhCcyLrZ7mO/IBT4jMSJBhp2fo6GMyBk8mgbIZfINfVY347AmicX/r0WJ23OYn
 rErV39PPttADskDdjpS7UthJPHqxj4gk2Cy66IJD/UDtLrNe5+ScjCCYSDEo3ElAzOIo
 APKiUv2Q0al2xl6ofUSO9foRPHkAfcDpk8QzikfJJaBBKRxMwQND7pcgBwJZ2bn58Gjd
 Jo+sJU0Ik934qe9thHC+uTyBPUz8eSZuyqRB+f+JfuHTyKDX4m12BUBQe9osaWogUkmt 1g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubyfh16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:41:21 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2688Zpq7002234; Fri, 8 Jul 2022 08:41:20 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h4ud9ngk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jul 2022 08:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nj8BXaLCm/CXufooZ99mqysNwcDMQH65tgcznw40r36o5AIPf6EcVC8RuYgneOF99umgrQJqGOPmZhhspUubYC7CW4EPf4o+NC1O+/4tNVPJViWENzYjL7sl3tSw9OZQ1Sn2QJer0S6sEPWaIZsTqIOo5K82NoZpL6EqMkehsWSUt2rITCX0TeYv527q9z7LGkQbpY7Z4hYcZ2dXus5rTAU+c5bqQpYJCqRpq2e/Q8TFBELgbXjOPpr3W81b1VzWbNWV0C19YHPndEQFUSyURajW48EfdUkGQoaVQ1c2PedxZ8TzjVWfwGQ16bIxHzQ8bD7oNIbVXbyGmxhS//ME6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZV4fvYGG9/ryEbkKZlQXt7Kvb2t8elcMSdT+82qar8=;
 b=gNTyE80AMCKaGDN3T0L1QNl5jWYT4q/+Hnv641FaxzXUD/pOhIs27FlMly5hnZBfjdRWiAsCZBthB5tadRV/y9DERq1IFzEZZQW26b7/7D/gJvgDfbzHGkvoMLdwhUXydGUYP+YS4gjdU7BVXdhVqxiny5B8MoqFix4eOC34LOEvumyhxM8cIMtNg4MeFCLnecSekImIsruUZKqVU7vm62ign6skBvwY6X2XI4GAxYZ8iyLIGQO0mc0qT4V5hHenFSeMbarNDAx51SgVlauCfspZ/fJU9Hn4nicbvXHje5jBS0+0YU2a+qhR2cKMryQJYkiTJLoYv9R3RfQnDJG/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZV4fvYGG9/ryEbkKZlQXt7Kvb2t8elcMSdT+82qar8=;
 b=M+CojtRC6uk+NqiN8/4glN6yRjZpg0j4zFmSqMZJrvbfg2t5f0yBE2gRfQgTzsgHe4WBiko5aXpgYDnpTflidAHgc6uGDr+LOz9ROoEs+mdiS5a16bCXSgelBDvSSUJDf+Pphebes6lnt58iUyhKh+0MsjExFZpHfeMQHVBgnH0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by IA1PR10MB6123.namprd10.prod.outlook.com
 (2603:10b6:208:3a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 8 Jul
 2022 08:41:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 08:41:18 +0000
Date: Fri, 8 Jul 2022 11:41:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] drm/i915/gvt: IS_ERR() vs NULL bug in
 intel_gvt_update_reg_whitelist()
Message-ID: <Ysftoia2BPUyqVcD@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0120.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18e65ef-7c13-4e1c-a106-08da60bda046
X-MS-TrafficTypeDiagnostic: IA1PR10MB6123:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCDYlr8QQRKRpY8k3CdWqjMs9O+31MTSvwuQMXdKBhCDa8ipbN3BEl2b00BCWRsIovqmctPXwA5CcrzvEcrxVmL+0cCquVbIDE9Z4Gd4ipZdBfFWgwWK2U1QuCRa/Do7CBcU4RGdvkRhyohpUoY9761m1JeZ3Da5tYFH8UTSgcxm46/uurKXu6UX1+vf/jakYpkl8iCICl9NcSJ8HthlZMUw+5vnRhEAhejjcpySNIVxyhdKfHE955nyCwq5oERTNXaCzsajemeucvBjfQ43SxPt84phxD44hprC65fKY4HvAdIiUaqQQ6byZ39idKyPQ+jdZ3RrzuT9dGuqrEkZQ6o+GBYghPkOCUWKCsc7YJ1BllOPjhVExOyc+J2ye01KEMjPvVmWpCi+fymjrRr0/1iWitkTcCcWIRczcSLHG9kkJ2vzYcfs79yRAOP+A2E6gdjHXOBVTqtZ/GZu2ZNRxDPnNthtRLbrtPv9Vir8JgKy6h6ZtxI0RK7occrfnMBsEIN/LyYAnBKBPJ34F/zTulO+q5QifDWy5hnY+4QWLZThjDoPp8/9Nm3CvqpH1X6Vuq4Sx2hNuST626FrxjqcJTzS81kOQmBG3/2rx5lTpeuREJJUr5EQM42MxJo09/ZDBx3SReRTO+UFJd7C9QcRpl378pd7lu2jLoxtTojvasGzwIaWdvo+jVPQbOie6MsMIlgfHnuRQmVM3LJz8jiAIHmYAasfcjm4XSe/MdmQ8ZBY7hherRWJ8LmleQddLIVfF+kYg34bkt4T3jf2h7SKzpzl3btKTzXCBTPsKqGFz/rTKjCSQONAKsmE3f6pO+Zm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(478600001)(2906002)(5660300002)(6666004)(4744005)(8936002)(52116002)(44832011)(33716001)(6506007)(7416002)(86362001)(26005)(6512007)(66556008)(54906003)(41300700001)(110136005)(316002)(38350700002)(8676002)(38100700002)(66476007)(6486002)(4326008)(83380400001)(9686003)(186003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PER9GAvFndXF9YBTkUb4vTGL7MHGTKBbiTZy/fOL3lRxNl7iG6QwV2gLUg3n?=
 =?us-ascii?Q?Gpq/9AbKMu7DKaWYK5kqrE3Sc8YrZdewKraBCsM6k37g8izur+LsVQksQ8ai?=
 =?us-ascii?Q?yuYUJJiwFV8oiixEzj0XLaXr5FhzYXSeecGXI380BEA6bYhgVOhL64KsRfdl?=
 =?us-ascii?Q?7I8rTtKtfiyzp2/kgG6Onza9SF+ILMPhSX9S2tpc8zR2O1EXTXpQp9xLhGMx?=
 =?us-ascii?Q?C6sosy5DtvG2sFbLBxkNtOhvaD2t38+iaoopTk+pxwaX8Cm+Al41l042rjV9?=
 =?us-ascii?Q?JiW6uPVK6t3l8uxm2aVkNrPjkOvgasr+zrPGF1EOMg+3Sm0b5nufyf/miFCM?=
 =?us-ascii?Q?fVqvfKVgsfLTK51yPe/Tt/ZfVmqdCu3aa5vm7fy7fXKZZqcLyjGXN0HCHfkD?=
 =?us-ascii?Q?NE4OzYifSKnPm+qj6DnhoxLExgnjj9bfCJLe4XUsFTHr/8pFhmn9Eejgxnpa?=
 =?us-ascii?Q?MkqaVDYocao6E9sMkLAwD4fSpU9yUl0QmsDtVgATdzMBi2nDXveKVnnD1uL5?=
 =?us-ascii?Q?Svg/aNQChAiXYrHRqME1bR3rUB+76MlK2ui7odLINlKges7e3Nbc4f8DJbZK?=
 =?us-ascii?Q?VZCziLIujpf1ru18ZaVOKx+nIoW1Aumt25aJL71bax6O/awUxEDZ+7p3D7Y3?=
 =?us-ascii?Q?VH9Rcb1eUPsz/JZoFI8aeJR9Fwrk5aqtREiGWiRFAD+dyTQIlGIL/QJwkh9X?=
 =?us-ascii?Q?mYji4iSPq/xcjhC4ZJqLYveU87NlCEHlqkiJ9YZe1EGhHldix29O+3BN3jTU?=
 =?us-ascii?Q?LeJ27vTpC/W2Usm7nqETzIJ0tPvRg0REG/GtdwyAzYmy7+I5G5jhn1e6wDeu?=
 =?us-ascii?Q?AM7qaegjA/405y3HSgFGsMvuoqmJYc0fQhMNv4myHqAS14dlCRWTOkrc2bT7?=
 =?us-ascii?Q?6Fs2BrDAkMpt+mGqd542mtb8mcLSxyW9GiO4YfTGYNu3qoKifsdJ2PG/hu7k?=
 =?us-ascii?Q?8eB4ocvNXIYLwT/dz5At0FZUpUJxK4boDBsgKz+SM/sEIy7uNWJbla3dLPkQ?=
 =?us-ascii?Q?UqNzsLtkwwLyznMweujL9kalE+DB4Zms2TlGVIc/FLT5AdRtVlqA5PBxE/o1?=
 =?us-ascii?Q?n6dP1D7+reOg+cUwkuxZYhCsYYHPHG+kdfQP9cinIkEF4rj0tDbERxL36knP?=
 =?us-ascii?Q?cu9irCzxK1y+po9cPwuftfKplms7ABMZH6YP7YBWXJObXFVERg4Nw4LYZANN?=
 =?us-ascii?Q?gRJg23vKQa5mRue1+cxRibla0CXHGYnHg6q+T/XniCmB6sm6+xm16f3/P+6W?=
 =?us-ascii?Q?gThORnangE8tzxPqW8OyP3xG15cLQgdrP2GwL723HAUUCxke0NgDKPqb335L?=
 =?us-ascii?Q?3UfXNw5T9FaBAGQzzbY/xmJubcRIQ1lDOs9gsJGMesZpvqT/FHHsBibUuffl?=
 =?us-ascii?Q?MQ6ro6hLNn67DaYXD+ZJS5FUgwzHdshEJ01ZNgnvu/F6w8pmzs2vGnpxcCvh?=
 =?us-ascii?Q?fl5K7NuO9DBIRqD6gbUcOR0GgvuMIB+A6dyMxJpKTIfrVqcEuriw4iMHfHeg?=
 =?us-ascii?Q?LxzDX3XFmMdyq67Qk/RfIxkwbn+bDk/x8PccF2msAs7Wg7GLVIC+CTfteucB?=
 =?us-ascii?Q?rUfibPZ3/8iac93LMffAOENVuI1CKt5Ib5u6ZlyjpBGCYYfP2Lvl8sANzUHS?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18e65ef-7c13-4e1c-a106-08da60bda046
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 08:41:18.3071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wq2Us77Pey8GsxlvQFidw0AyJWql0O/ZEJldqPWlgszZxRI67bfYisAuz2Wk49aJIAkZt82ezKv9at2X74LFBbNDvjeK159egDXHoVD3ceA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-08_06:2022-06-28,
 2022-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080032
X-Proofpoint-ORIG-GUID: QLtkGc64rLSGBCAyu8jBqJ1cX8kpRbLE
X-Proofpoint-GUID: QLtkGc64rLSGBCAyu8jBqJ1cX8kpRbLE
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The shmem_pin_map() function returns NULL, it doesn't return error
pointers.

Fixes: 97ea656521c8 ("drm/i915/gvt: Parse default state to update reg whitelist")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index b9eb75a2b400..1c35a41620ae 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -3117,9 +3117,9 @@ void intel_gvt_update_reg_whitelist(struct intel_vgpu *vgpu)
 			continue;
 
 		vaddr = shmem_pin_map(engine->default_state);
-		if (IS_ERR(vaddr)) {
-			gvt_err("failed to map %s->default state, err:%zd\n",
-				engine->name, PTR_ERR(vaddr));
+		if (!vaddr) {
+			gvt_err("failed to map %s->default state\n",
+				engine->name);
 			return;
 		}
 
-- 
2.35.1

