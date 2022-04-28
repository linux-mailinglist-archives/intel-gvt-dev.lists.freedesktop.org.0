Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FB51339E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 14:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC5110E38F;
	Thu, 28 Apr 2022 12:25:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D8410E38F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Apr 2022 12:25:51 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S9OVV4003699;
 Thu, 28 Apr 2022 12:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=96KxKWZp4KJC7RGOYU+awHNl38OGcb0xWHlUqfhC4e0=;
 b=YW7rC9H+ob5rt5VMOazCR1ZHD6stvvw5PErrzv6dREOzehH2NQJc5f52VLmrXn0Y4cH0
 kaHPiAGMKTUEBIT8N4A140hoRyUyEpKipNXwi8N0SJgJUeENCbOtIy78lALyP7TBo71E
 NT7euZATRnSBzYbSw9yoPL16J3WMuZXSg9nbHanD2zExXLF5yNPgDHDTQE0enbU77o27
 eGij8cJL/3UItCzplBagnHIK/v9v4JYqqWrQq9kwuLX8XyfsnMWI2lKaoA1QVhVkWUxW
 KgaS2LXdwf6lNasj/MMeIzgMsXoo2CGhAkprja05XLvl25kGqC/79LhNAQXBCaDTmmM8 Tg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4ue9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:25:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SCAcbZ015008; Thu, 28 Apr 2022 12:25:48 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ynprwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:25:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeortA6CQ774VvoFy3oQrqlQxZWbC7XmL6DVGhzdRZfEqGRtKNVjbcRYc5zTxr7CaEaItwTjit1a8PWtXcAYx2xi+wgWc8R/FjcC6202EOj3tUjT5220xDrkToAJx0ZWb0N6Kc50xYH7NAmMkduevelw0sdaR/SFwV77jPeX62nNW3RNttFO6s8bZTlUz5WJapej5oOeBQl3ItQrMud4UR3awwm7yXic7zAfd5ygmoaR8alUwO8nlehbdxBiHrPDMq673vmikaJfvo45jGoOxABwBtyHpbnWSA08h3MGvczAS8Ys1uov6A1Dhj7EOM16r9IoL9O1X+mx4z3Fkd19+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96KxKWZp4KJC7RGOYU+awHNl38OGcb0xWHlUqfhC4e0=;
 b=ChaS+E37YE84EaWrovDX25c91L8cVM5WbIvcavpyI2aPyT+zAFlmIQzLecYLy6ttOAgYmWC5tbTsrRUQ+YQmujRsg90NnphgNtudKz+IIdN+yFGKBV3gd7WZmrH6KT0x9HPMWRoCS/qGjoIZ5JRKx8DzYXYg15VI3gcYWkzQbtRKW8WRY0i+k3AcwhdbfJmbYpsFvh08MHtWFvKgNUy9Bsrpu2vRs+ifVxB86G7WKzYv6PZHlXNoFMuBOMxnLVUm4IpxhAAuu6lb3a1Qqs7m0NtOG0YSDaeOJkgidH0Y+lUOK3hjetaklhjfUyUK9gMZU9aObskNxzplASFgF566cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96KxKWZp4KJC7RGOYU+awHNl38OGcb0xWHlUqfhC4e0=;
 b=wPy9JHzdMI/7+sV64wzP5OjNVfgHBoVq444N29sjUSqSLQg0qM1nnsHBaWc+YdiJ802Z6RPab6KHwzp49Df3jukoeKiZNemAFGzxclAkCsFsqPfY9UL2GShfDLoh+hw1ZtSHz28FRkT6BQm3BTrld5zQR1GG7unK/QapVzfNRlg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5800.namprd10.prod.outlook.com
 (2603:10b6:806:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 12:25:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 12:25:46 +0000
Date: Thu, 28 Apr 2022 15:25:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: zhi.a.wang@intel.com
Subject: [bug report] i915/gvt: Separate the MMIO tracking table from GVT-g
Message-ID: <YmqHwQVpRR+ZaG7J@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29e5d83-2ca4-4306-98ac-08da291238c5
X-MS-TrafficTypeDiagnostic: SN4PR10MB5800:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB58000A5CC7F10193D478C65B8EFD9@SN4PR10MB5800.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ClWNWbyTE2LbZ8r7rKnD4vhSCoF1Euc3VU9aigkDA4ubZ6VdupS7+g3gvl6qvngIN7zFGYpc2X3IoD1+8h6gzZVG5DuU/iOFnpkd+Caukz2IVtJ34yeaWqpFKaooNRA5HkqItUBMYwDE9qVjYvUQ7/gODvwpeqo7013N1qHMNgfaOiQ5jBZsmhg3ZskPXNohpGMfx1iEmpLxS5jNTzTeynaXkpok25+vr/u5dBaGefozZzb5dybXF+XSNZUP/Z4DXQOUwQ9/SlqETghE5BTbW2OnvNvLNMaIod01Ch3ybTADTnn46EVbRKcjBLRUth6jl5PF6mMLoru+I3vC8OktSH8MHd5B778lnKoEa/ZBWMUjLPY+6BcKEkobIzemyT3HenrmL0USF531KHYOQlSenlzstf6Y1bWGNoyqdk4WlbZCIcfujPJ599JoyqflQwlOWXdIZ1Dk9+fo6JEqFD45gpDHygx8wJqRiWDMZov/TnxyMAcJXHVEJjLLWUo/lCOmQ4QsuzLmEoG/dw5QO7nqwD3knJ8lXA72DMmEkMieCctnAt/A7tyLxLlu2UFVe3NKPkOSbxSJjqX/1Gr9J/XxnF60WQ0NqOqWp+vKEmk511N1tOD/nBme/fMr/q9vhugnUF6zoldyev+yVVEKTw92FENuAdWdbmdThDwmVWpmWr78T/XP4zNYvK5SHgzf9wjpTKlu/1gweCN7yJr3NT+fw9zu3BFSksIXCpmR9czLdns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(33716001)(6916009)(8936002)(4326008)(316002)(186003)(66946007)(8676002)(66556008)(66476007)(26005)(6486002)(52116002)(4744005)(44832011)(38350700002)(38100700002)(508600001)(2906002)(86362001)(6512007)(9686003)(6506007)(5660300002)(6666004)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ZePB+i7kUJNnh0X/bFAvPMUY64g5lLr+Q0Kq3Fg4H814BIGuftFZqM0sp82?=
 =?us-ascii?Q?rT2JB6WbH/YK7VXP4vAwVf3I9aB71hVzEsS2axvyXrH4UNiuEzllCm1yNk0Y?=
 =?us-ascii?Q?gKjObEfzOCcy/2Foa0BxOyHm7+7K+Bt+ck2+H+ecucr+9JHJLOY0TLy2fNDv?=
 =?us-ascii?Q?8dWSbtscts9AxIq834T2ISN6inL1pyhK+Ar5K6yf9pvMPWqbcmMG0JE5s3yf?=
 =?us-ascii?Q?VorZa15bYVbsbxrVos4/thyD/qJI09pRFkdlftWQW5jMp8OfUZl2ODE1HxD3?=
 =?us-ascii?Q?t4Xj3Mu8rWC8gXL8ZBEkwbV79qFU3Cm9+rVB5Ux+qgnXTbO8GXD6LKbjmHqC?=
 =?us-ascii?Q?OuOVtspzXO5mebIeannRUjrujznsuQGr37QmhvV1cZN2EOQ0ZIxxSQsRdKQA?=
 =?us-ascii?Q?NSilpMYDCjhIRg4wGUxGbqJumIQKfzAZNPdrc0ivPON/GbR27VIJ/WYdvMGq?=
 =?us-ascii?Q?OFFTWiRdaZ7jrA4sHVrMwdrRdo2/JtlwLLXtKkQZ8MPtKOeeHKuADjUS6U6I?=
 =?us-ascii?Q?zo4Ljjv0n2ovpqyylisUa6+ERoFusUm/1FNdSdoNWOjO5Ui4RYS9ibmGaT1d?=
 =?us-ascii?Q?WBseyMpr+Sw2CFNZfTrYVgr3HlkIe9prQ0Ll2hgzYuF3x0IfTifC1GGu4OIH?=
 =?us-ascii?Q?cwqR7W2A8F/Wne4V2WN+y/C7gMq+B5X5WiS6CLVC090g25uKqNstwzumqn/T?=
 =?us-ascii?Q?sZRsTYG7ucCuSxPzke4l4i/RCdUcYIFkCo32tGARXrua3P92KkhbfMMaClgn?=
 =?us-ascii?Q?Vcu/fRO4mBqIrmk6kYoLEwKrX/38oPwmAlVqber06rzEMwCiE+8gSXTvqPRG?=
 =?us-ascii?Q?wJmCZ49WWJSLd8qtYezDN8G9lFMprQOoeGTB4U5Z2fQq8VCESyYp17bREcb1?=
 =?us-ascii?Q?OHQEkK3LeceySP+fQGTR24jHAy90eVNv/MeOMOPOfrHKWA66q3cjSlrIfuwD?=
 =?us-ascii?Q?Ruf3gdGYmlui0QgrYMYRoCy2kCu0WuMdVc2OhpxVEXUaathNU5T6xDZT04Aq?=
 =?us-ascii?Q?WaW0QJotOf2dgWHaxAIIgFtqPTu4tTD32+uIa5SwEQQAIjAyCOu0rrPTSa04?=
 =?us-ascii?Q?tjTLo2e2/hmWTmK390o5xiojU3zlkZSjbb/Ojmd3z8O01xnMiiK7KOnh7XQt?=
 =?us-ascii?Q?ik1shZvzymku3z/C8CJ6PHAIQVJiQtaxClWre432SPJ+zqyAO9xd+cam1lbT?=
 =?us-ascii?Q?RQkgfxsNm9sKmqhVe2hCBAKoansKKZ/wn+p5Y9X5Kysviu0L9YnS515B6Bm2?=
 =?us-ascii?Q?MlRbJuUSH8nM9jUjkmE/CKSkJbJ5PR7j++UIA9VC1kAHgEH1P70MbmV7udRz?=
 =?us-ascii?Q?jrS5JxQhpXXmX9vgsSJcWGNdiwWSIHqplCPdRSZ70GcOFAcboHjRFSqT41iR?=
 =?us-ascii?Q?kJhOcuJ87p8pO9f1hriPfmXj64XSh0fiW/8RlftoJ4bdHwVuID+fYXAqUYTw?=
 =?us-ascii?Q?dtAAApwZqW355Ya4bSaL8GlxZ2HPB6TvyhC1hRpsdm39t30ktM6cu/NCXUHp?=
 =?us-ascii?Q?sALvdHpl1FR4hAtY105sKarc8R4rNThgLqlLVUM1FlzqNrVBsRz+hKvZfur4?=
 =?us-ascii?Q?elUf9pFNVJyOdt95AK+0ab3M2hoC43u53ULhe8I04Th/Y1slWEiTpjJKPozE?=
 =?us-ascii?Q?DzrGFx6kU8JCbWvT/D6DK8YqSoq8v51nrfurNVWA6QyjWKQ+zXkWJ0Tf1ogE?=
 =?us-ascii?Q?WUtk35MLmjc1qAWHjXtbffGBA6v4I+xLKX1NU6MECvTtvPfW3Tb/sxfRg3PJ?=
 =?us-ascii?Q?X4iKPUMTxLLpOg5yecgC6b4WEIIAkyw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29e5d83-2ca4-4306-98ac-08da291238c5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 12:25:46.5751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNgRA7NGsgJrVMlttwI3JrC+3lD1Pmsfmw8vmEPQciVQd5mxEhBmdpdwgI1i5wM3OTaX/+IaGGcpYJ+GfduI7w/5Vib6I4jxnBYMO69Zr2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-28_01:2022-04-28,
 2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=771 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204280076
X-Proofpoint-ORIG-GUID: rV2e35Rq_C36nIXc4dCv-VMjRWYpBTvi
X-Proofpoint-GUID: rV2e35Rq_C36nIXc4dCv-VMjRWYpBTvi
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
Cc: intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello Zhi Wang,

This is a semi-automatic email about new static checker warnings.

The patch e0f74ed4634d: "i915/gvt: Separate the MMIO tracking table 
from GVT-g" from Apr 7, 2022, leads to the following Smatch complaint:

    drivers/gpu/drm/i915/gvt/handlers.c:2924 init_mmio_block_handlers()
    error: we previously assumed 'block' could be null (see line 2923)

drivers/gpu/drm/i915/gvt/handlers.c
  2922		block = find_mmio_block(gvt, VGT_PVINFO_PAGE);
  2923		if (!block) {
                    ^^^^^^
This is NULL

  2924			WARN(1, "fail to assign handlers to mmio block %x\n",
  2925			     i915_mmio_reg_offset(block->offset));
                                                  ^^^^^^^^^^^^^
Crash!

  2926			return -ENODEV;

regards,
dan carpenter
