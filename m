Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7A3DBBE0
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Jul 2021 17:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AC46E3EC;
	Fri, 30 Jul 2021 15:15:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE526E3EC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Jul 2021 15:15:13 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UF7Q3E029855; Fri, 30 Jul 2021 15:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=CRDmgDB463NElKvbm1+abwdqtXNHhPB/ZDim72Bx6TQ=;
 b=Di0WItv1JiwFKHMvpDYGmgMbet2fNKCVuLCGJ4kP5Le+xEN2ej/tGeRYPeuRnXeYRG7u
 pKUic2ZYHQp7t3JHP1E/baMwx5BU4zCaPGSsWyuHC+ZanRcL2fvwaPDtOABtHqOZSjQh
 ROFQzveLPWN7MfLnZOZrpICY89NC+yXbB+lqZQKL5pJBqhT2ziHliYSfHvUan//II5Va
 HccSaR/kESwpy7msm0TVBC+L28zpW5KAbVDP36ALKWnVHwwlE4tQZbWDNt1PXt/Zor50
 fGe49INdTBMnfGN7AwUgD6I8H7KSV8yL0xo9bJE/eEMbAYJDi3aAbBkH2acK8KMwlDhC BQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=CRDmgDB463NElKvbm1+abwdqtXNHhPB/ZDim72Bx6TQ=;
 b=ChbfgdctR8JZaml/kKssqT+yz5smgn5naXneDrjsk538Hg2RHEYBY2twVAGBsxTZC9zw
 ztIh9KPigBPBBMsrD3bwJInuMBpsC2Alr9OHDowYwVIE41XpYsw8s1tjUQp6E60wQ1EN
 blX4Q+c/G2AGpAXQWkCVSuqxPhh/rtYJZMV8UVR14Ift5pmpFgiiWK23b8EiOti9SApP
 TdTmmYSZr3KOYm8dVWQM++GLSu0Z1s5Dn/23AACp6xaFxqscKbBBvsmGBxmOkpqpYklJ
 6ReS6APCK8UQLedLZV1ddPSe9dllP2yHWubB5UN+vjJnJJHafigt/LReOkAREHAo+NpK +w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a3rukkgrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 15:15:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16UFF2u4061511;
 Fri, 30 Jul 2021 15:15:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by userp3020.oracle.com with ESMTP id 3a23535af8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 15:15:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4QPnW64vtZgbKVWybE6smbwlsqoPKFBmlXDu3S7QMri/aIdn/gPecvkEPnzkZ6zkwB1/Kfn3OdM1/mPRzzL8+sViO5maao1GLT43GPR1b0K+fZZZdgLA0G1/7EJZMuEJIayZSa9BPL/mfYkQd4DwXTW/yhVZqBFbHXKeUT7HUne2fYX0yvV+hTkiPABdUq+2KREydZziQm6+JUJUvnQSTp7U4/+84qjWAj6eplZSaZHNe/B4axbnYI0i4kGHWoar80xiXPZWurTJ8P/4ExNvz/bFLkMmZys+8tUNmxZmcU0hiV1i2DDaw1Oo5EVhsGlJzxr80ZAD/bG1AniyRnAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRDmgDB463NElKvbm1+abwdqtXNHhPB/ZDim72Bx6TQ=;
 b=UKtcMCZIWj5GezTBJIqPipvDrRDxWyTT6ktP6CBFDhSZidbZibkTni0b2EjWZSpejzw5xbPXG1CgX/fBRVRUO9W9mLbtQK930k87ygJWbEb03irM8flwDJZT9Jqyt4T6hcLXkHTU5iZs2w3Yz8r/TXniIABGZYtxmjdREUHCWE/vw8OGJU7kmcfX99Aa+FKr8MnaP+m8mYoyIbLwboeoDhdSYwRS6MwDuI5iDxt+pbS9f998dQ6ltNiWZ2BAaCtYoFCwAWzD1h+cgHJo0DwIxmy9GIAOvf6XySbJQ7dUNo2GaiVzwwbffSDE1ZNt8hJRKJTyVBhSsDw9j+NKOm+1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRDmgDB463NElKvbm1+abwdqtXNHhPB/ZDim72Bx6TQ=;
 b=A67rUq+J9R9OeLXSAPEcbeTrK8sUJYq084THbaQCgIdDxAaUPodiPoe8637vi2hUa8bG5htPk2AS+p/VlXnq05QW6hGL1zCxGsC3FlL98rzKnMWas27Nj7banstjAINT/hj7gEI4LfMCUXygHp+ODYwuP6acRQ7Unw1ska/+XB4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR10MB1398.namprd10.prod.outlook.com
 (2603:10b6:903:30::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 15:14:55 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::856c:c91e:aaf8:11d]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::856c:c91e:aaf8:11d%3]) with mapi id 15.20.4373.022; Fri, 30 Jul 2021
 15:14:55 +0000
Date: Fri, 30 Jul 2021 18:14:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: zhi.wang.linux@gmail.com
Subject: [bug report] drm/i915/gvt: Introduce per object locking in GVT
 scheduler.
Message-ID: <20210730151445.GA2202@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Fri, 30 Jul 2021 15:14:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22297271-e312-464f-55a9-08d9536cc96f
X-MS-TrafficTypeDiagnostic: CY4PR10MB1398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR10MB1398F604D5D88D874AB934FF8EEC9@CY4PR10MB1398.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZLpk8TDcjj1Lh3LK54lpZ2e1lceVmcUwJnB4Rt8Z2DhTKLEaVVCkJAjrlGkZMuhPQrwe0eDK/gLvfMDN6MBfMMyuQYSoff7QdRoGPlQpdLMTiBIr0dXqtLF8QD/u25t+jS2qIiuiUaOeXGtTvlL+vgU2xoavkfkFXvtdz9FeBOsx+QV0AA4qb8mGhzR2ewc+NeXVSFRSibfuScB3Glht8JpcXwK+eIA0GePwBKeAius43PhhJb1GboKtEyxJHDN2VlbYB3UHc8+Xi0X4VZn8FVu88m3UIT+QiOWcxGgBuT1jX1NYOKOuGk/oJnEHr8d7+IHo4AxnX+yZC5BsHaIUkvCXu0b2qzJFx3TPXR0TSpHOe2bnsZyFTmW7PA2r1lYBZIoxsY7piX1O0PnYT+gR7S/oQ6dYyqo/KUF0qfr90LRxr7vllj3n5GPTwsdKVPBmN6BjkbwbbpWYcbzqHR1mEE84a8iLG94Cy0mmJJte7SNTUkd+CHK0wTQgwBF1Kp+FdOCfy2gT/ltj+lNr7dtd5ejXPEsx7mkL7y28VSWgb1nKt6jjvNQNMOTqfLaB5QW3okEBA3v9AVsXUSTwYAbX0kr+fcDLscWMiJpVq1nSVTAXiaP9eeT64uksBTGgFUjoU9Xe4W6ojWrsKArEu+Wi4dqqZJG9+Ckb1hfZk7KNrfQDz+WTmqupLqx4nt76y+XQQaUlx7TLvdXBbcHppTX7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(346002)(376002)(39860400002)(38350700002)(33716001)(1076003)(316002)(52116002)(9576002)(6496006)(86362001)(6666004)(38100700002)(2906002)(478600001)(44832011)(5660300002)(83380400001)(956004)(26005)(55016002)(8936002)(4326008)(33656002)(6916009)(66476007)(66556008)(186003)(9686003)(66946007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cSa0mdZ4Wm14CceXf3E/HqPAjVFbjRLaSs+m6ZWLni9x+8r9pj/vwtd9M+UI?=
 =?us-ascii?Q?+uNGeSlN4d803NziSPIwNevAlGBWAxhNrDpzsaIyp7fNhN44jBwekpLiT3CJ?=
 =?us-ascii?Q?rFC/0R9xs5bSZWhYKC6rZxHfxV13yYX9TlxETkHuIO8lzbp1qj+f3DrbyLik?=
 =?us-ascii?Q?LqgYJMZPgqlVyIG1zJHleD+iwNppdeYy6piTVbyRMlk8N/XQ1zi7VDCMrJDk?=
 =?us-ascii?Q?AA8U1+RisYduItSurkOL/pNKLwehiIPROTfPLE/T0oMzK7Vb8WQCDDyziyV4?=
 =?us-ascii?Q?E+JfDPpUzMJb6WR3Dyut18ZpNI6Mgp9xkNDXjHu+43SD/P3h1q1Ahnr5w0zF?=
 =?us-ascii?Q?1IbOrSzg3gq0qQcui/Py0ZKT8boTfwBK47/Ne3NyP5rxQOKqThf5Q3MMT+Vc?=
 =?us-ascii?Q?Vbq045gIpyuF1UPQ/mX4cPEHCQx1p8oBa+HVrYH9KGRSSuEiYjWa+spN4nHR?=
 =?us-ascii?Q?phj5v0N2dGMwAs+K7JW4HAl/bha5KOL5TJKaSPA3yzr9Gpo4/tpxRR0tU7l/?=
 =?us-ascii?Q?QPOqHj0TPqtSnhv37kZ2IFMNwbyPN82czZSlOuCmby3sezFCLT/xsCdO0zei?=
 =?us-ascii?Q?8YtuLKdYz0wd8/sB4nnvc5BrFVOceN+Z0L+8YIDhBxO0KqrLGMpC9OVERpk2?=
 =?us-ascii?Q?k29JuJQpvhcpxOPJPydMywhxdr27eQbcG/NfBTGCXzqOK2kXTT9/DbloMoLV?=
 =?us-ascii?Q?QMPA1uuu8j/0+NzEYafm8Nkk0QvDCHhGXm4zqCt/9ecViUwYSDyEBhMibHgM?=
 =?us-ascii?Q?vgAfqUcYLzlfXgdt3KEoe+dyYJXMnJ0IjGP1fLKQQA/ZR3fghIS1unRrcmZ2?=
 =?us-ascii?Q?BpqjqKwSchEAIsU5gJntLDaofLBNToaxpTA4lHVBF+OBFR6ViUeaDfBG1SOJ?=
 =?us-ascii?Q?DSxg6cpQdXFmJo+tqLSqv4DANTV0/2I7jod3BF6L2yxexQIFRbD2yPZ7fMgR?=
 =?us-ascii?Q?kn4crDyGyP9t8S8aoCjGnepXVXUIvUVrSDZF5BlFW6TR2LTg4qZvHk/hEWMA?=
 =?us-ascii?Q?UiW4KgVY6DKpgUbRUggko1DptuNTi7u3R4XLygqe1+1ElVh+6Nff84ApE6gm?=
 =?us-ascii?Q?lq84OPTvs8zSO0G5pZGjyA2LBCBT3D5omCLWeqIJqRg+lS1Mmh56S9dqeUoA?=
 =?us-ascii?Q?4u1+U7LW5uFrLG2gCXNeks8UJnwzdYHCEYjjOkH0X2C/+u8Nj/jdEfqWNdsZ?=
 =?us-ascii?Q?3lw0gmt5EN6gP5OL04/zkxo64jmv0HfYRW/MTXTNmo3BQwBYqJ70UnIKpX2d?=
 =?us-ascii?Q?etVh/wwTxRKVy1JCiSD1Ozzkmo0UH44t7YbEoodUhFk/UX9bxLKEjnsRapWx?=
 =?us-ascii?Q?T9XLuAmGzLnkNlnW03NyXI0H?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22297271-e312-464f-55a9-08d9536cc96f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 15:14:55.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOPST8DR8RcN8ZSbLM+i6CHj9sCiq7LC2hablmILfRxEmgI93rtO3xTENdevsfSOjFWuRWGxhYVIc5n+WbezYc0UY7E46B3XjOxWTFG4QNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1398
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10061
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300101
X-Proofpoint-GUID: czudrvp21Z5Nn92YIqFMj_DSoDy4ozZr
X-Proofpoint-ORIG-GUID: czudrvp21Z5Nn92YIqFMj_DSoDy4ozZr
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

The patch 67f1120381df: "drm/i915/gvt: Introduce per object locking
in GVT scheduler." from Jan 10, 2021, leads to the following static
checker warning:

	drivers/gpu/drm/i915/gvt/scheduler.c:646 prepare_shadow_wa_ctx()
	warn: inconsistent returns 'wa_ctx->indirect_ctx.obj->base.resv'.

drivers/gpu/drm/i915/gvt/scheduler.c
    605 static int prepare_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
    606 {
    607 	struct i915_vma *vma;
    608 	unsigned char *per_ctx_va =
    609 		(unsigned char *)wa_ctx->indirect_ctx.shadow_va +
    610 		wa_ctx->indirect_ctx.size;
    611 	struct i915_gem_ww_ctx ww;
    612 	int ret;
    613 
    614 	if (wa_ctx->indirect_ctx.size == 0)
    615 		return 0;
    616 
    617 	i915_gem_ww_ctx_init(&ww, false);
    618 retry:
    619 	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, &ww);
    620 
    621 	vma = i915_gem_object_ggtt_pin_ww(wa_ctx->indirect_ctx.obj, &ww, NULL,
    622 					  0, CACHELINE_BYTES, 0);
    623 	if (IS_ERR(vma)) {
    624 		ret = PTR_ERR(vma);
    625 		if (ret == -EDEADLK) {
    626 			ret = i915_gem_ww_ctx_backoff(&ww);
    627 			if (!ret)
    628 				goto retry;
    629 		}

Call i915_gem_object_unlock(wa_ctx->indirect_ctx.obj); before returning?

    630 		return ret;
    631 	}
    632 
    633 	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
    634 
    635 	/* FIXME: we are not tracking our pinned VMA leaving it
    636 	 * up to the core to fix up the stray pin_count upon
    637 	 * free.
    638 	 */
    639 
    640 	wa_ctx->indirect_ctx.shadow_gma = i915_ggtt_offset(vma);
    641 
    642 	wa_ctx->per_ctx.shadow_gma = *((unsigned int *)per_ctx_va + 1);
    643 	memset(per_ctx_va, 0, CACHELINE_BYTES);
    644 
    645 	update_wa_ctx_2_shadow_ctx(wa_ctx);
--> 646 	return 0;
    647 }

regards,
dan carpenter
