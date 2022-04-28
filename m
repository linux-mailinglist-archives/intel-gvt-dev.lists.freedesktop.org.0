Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42251339D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 14:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3866810E38F;
	Thu, 28 Apr 2022 12:25:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF17610E38F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Apr 2022 12:25:41 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S9VAtF003693;
 Thu, 28 Apr 2022 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=hROruO7ArSuQt4zP56ComeSvRd2Sxhvoqq5M8sa65zI=;
 b=YFgFcKIFv+C+iBLDd+Q8zP+sAnv+UX7SCYXPYXSIMw8e4FslTDfMy1qWo9bO+GSKS3+F
 Leg1H3SbEaDiCgqiWNYh9lRuOe1WZpM5B2zRRWlE2UlJlkoFXzYQkT2CQQKT6KmfKxG8
 clo4pO+xuljjqRyPMI7H95aWtBnJD5yCvmbEP7QB0kMIWjz2ZvXVdMuErHhLgZ9SP/mo
 KiJwNKj4tDNX5MnJhTUUjc+Ruw1s+7uEJyg0AJGkGnv6j+87MwGvsTW8TUHjY0t6o4p/
 k7s1CVPZFefzgymiTZb7qOrZ/JOExUGF4Oql3nW23o1lsGATgN6RuCUS4p1q3FOwhP6A bg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4ue95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:25:39 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23SCANHr020395; Thu, 28 Apr 2022 12:25:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w6hn0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 12:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC3w8ty2F06XdBY8dIoog0D0RT80chPh4xGmvd52eUu0VYqw7l5Zjq6k4gG+2TYb+Inl6eN/KCmJ5YA+3mmGdl3OpSrAyl0Ztlh2TH+BI8w3ntoSSCku/IiKDw0OeOZHorjUXmQfNKRG+nVeRThP1i3K0bBPPA6+VDuGSM7EmFyhFg3w4m9Kn3UyL05J5f7QcPITdM+P/qZalzjJfgT3Tw5S8cthNCaJV47U+O/kq6frWqX5DF/2h7wMDO7u/5NO+/112btIvrYaAecaim4aa15sXPR7Ss9VJQcI7qertnZlvl0QIWthYt4wxEoyDdYNVM3hK7LHNLFvYVAd3W64rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hROruO7ArSuQt4zP56ComeSvRd2Sxhvoqq5M8sa65zI=;
 b=ckWXx86FNhjZ1ErFswD/voglpMb8zGH6zxUy2e0QchiWiKnnbb9+5f7HVaqi2QlRqv0orB6S16lSYGbzDFlFMMnkaBzt+v/pEUjFKv9F+tEjwCnsYu73vkvq24CM2MUWpyCC5JHrOqjcWh1ItWNxKt25OPJNtLlZ6AmvJwY8xMoU5TJ+horc2WJ8DezgwTJkRs0muiUijr51+vuk6fxTU6XhUbRfuqic11YCz+mZ15rll6b8pdbOsseNT18bwxxJx2+SaxEu4ZJGxI5+nQa2IMZJj3bRnctwlCUfSfjqb4EOKlv8n8KaIUQ/m1lmYxb0YFdJu0gNaOU4brblGVnK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hROruO7ArSuQt4zP56ComeSvRd2Sxhvoqq5M8sa65zI=;
 b=Z/a9x4NGQQ1KhGyR2UCezTi6AAPH5n7ATKJsWSv6EI6LOiyHC5nwzqfIgSGT1Xri5lrWba0VYCUpOQrsq1b7Nrweyr/ofvTRAiL/B3ixaGIHhv14UmF+dKk72D5Nv5X1wGXqQ5DoTUiF/lSKZyjeln5K7m7TTDiggdx+h+g0H0E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5800.namprd10.prod.outlook.com
 (2603:10b6:806:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 12:25:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 12:25:36 +0000
Date: Thu, 28 Apr 2022 15:25:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hang.yuan@linux.intel.com
Subject: [bug report] drm/i915/gvt: update vreg on inhibit context lri command
Message-ID: <YmqHtmHH3kkqiooa@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0147.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 683d978f-4aac-4a1c-dedf-08da29123272
X-MS-TrafficTypeDiagnostic: SN4PR10MB5800:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB580079D80CBCAEBB5788254D8EFD9@SN4PR10MB5800.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6AKqMbSD4mdgm+PKcaAO7Qgtm96vOZ4ytYxW8/8hlTb14P3k0bDiA4jY8X0MLzGTdiZHSSAgHYkoZER3OdSuDh/Fcjv1QzKwF04nsq7T6Mi6GMT5jzgZNcLj5zAjtoBtSy3jzCJ87W3vMSzrEYqGvxQ+u5w5iDHmUYZjWHPnWn16ptv/KuJ916st2HN+rdOynhCBYE5XWfvNbi/T1MWxjPlzaQo0aOw+uzIBmv+B9dWYQsfVNhPJAIqfJteFLfTPGoTg+H6YQ9NNmxSJOeNdG/APYQhrqCS3dDuMZWDbnmWjx/5rZ2WOyTGrA+dIKr8qIbdxttwDfYuq46cs+XjswkEkd2UTIOBUoWJLK/TJRXR6ryjBhaOZclS9tj+kn6Ez2KaNR8N9xaTQiLCMeWeDrxgLYjCx46uyETgOoo0Agw9MSAkGhSHI0C+RlKvQVV7bGC1B1I4rh0LYXLj5HBRzlGWxyBxsjd5QQVBjWXhKrJSWUBIAAJ1G+fr/oPajJZHaALdyX6+GUFWeHiVcBjG57YsqLGILgTKLO8wusLue0wK2cgWdud4eLh4VbadZVhOjPAS/c46hKdPeFwO2m7muFrJyUR/DCMYDBCIO3NUkEmPfkyXMsmzL/TGitTCiXMJHIMZbKbQM01N8hnxPlymHed4KPgwfP7agQKC1JGcv9rkehbTeN75ahwXJ87V+7qqtXZN2YIfw4hwSbrUFsrDBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(33716001)(6916009)(8936002)(4326008)(316002)(186003)(66946007)(8676002)(66556008)(66476007)(15650500001)(26005)(6486002)(52116002)(44832011)(38350700002)(38100700002)(508600001)(2906002)(86362001)(6512007)(9686003)(6506007)(5660300002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0mYjGG3UgttLLWeg7+zspMZLWmnMpife5P6GLZnHqrZ6SW++hKqrTJMK+V/L?=
 =?us-ascii?Q?hOSv5IoM06yiwxqbJRlcIw2GJfPMxHBv0LT8nwWAmhJzVgl/gvo/38e3lGj2?=
 =?us-ascii?Q?cDxqWUbjTkRJj3TUkK+Z62BIwBAy3vt9ncjq9+sYM/Y+lGPfo1BAWBG7765C?=
 =?us-ascii?Q?Y5bRzqUySgPpUl+e8YhnwnrnCjdGWXjBJ9N2W5k03Oy4SXAAmdJYiGk1TCi9?=
 =?us-ascii?Q?Z4C3oK7+w8FJkn1S6O1GVd0VzztNc7MP7HxPzj4LPltIiEDUpAe2BoTU73ui?=
 =?us-ascii?Q?BVdvpNGsHhVodhxks9cl4bSleQ3Wj1TPcUJWCk2KIZRSMXtHAamJsCJnzKWU?=
 =?us-ascii?Q?grKGadJcKz9IcFP6QVhhX3qfRBpunAiBpxkLGFNaBs4uHBMINVI6vsa6urmI?=
 =?us-ascii?Q?PZxthXIB1Ur4uR4YBSFiR3SjjkbBmOZDVm9oJdsB+EmoKbyUBc3GODzcl6Fh?=
 =?us-ascii?Q?blVl8g1xOz/Rzp7/8/zExDo20lFL+6P/yK+OfzospPhHUqENCzEJzwoO6w20?=
 =?us-ascii?Q?sEdTySw0L1G1Rc44Txh4UgNBMzSiOymKhcLLAZfA2hjoxHbaQnUEDqETr+lI?=
 =?us-ascii?Q?VVg9toZhkrq2CCj3Ae3ggDPrgAlhRI0Jok9JCLURAQFXFrH8umZnuczwJftP?=
 =?us-ascii?Q?6F6FR1TsytW8VRjBuUnt+HuqRy4fsD/35uCtc9ejDTEyeRUPYrjV3pTu7a+G?=
 =?us-ascii?Q?yy2BYUYnkFFX37ztmtAZdnpxhRwJw2debo+BWh4SDv/mwkBCJn1dy1YIf+n2?=
 =?us-ascii?Q?6kwFZJ13Vae/Yjx/RX1Zf6jbxqhCCRpL3yQE3uxe3D5rZiXcZ8855fntHCJI?=
 =?us-ascii?Q?5ctxV8L1omij934lDNVgArigsbg/apYKbsQNVX/uDJU5evPY5TkmAQmvuhsI?=
 =?us-ascii?Q?obXWwZq6x5NN1GNiIZefhHI4g3jKZG9mQa1mDW17sv+dMgb6h7255zVmktfD?=
 =?us-ascii?Q?zkc2r+vVvHHaGHFJqAm64es+2Fh5+V/7tmCqPeymDNPKo24LxcpIQEoinC3r?=
 =?us-ascii?Q?+ylH6vKoNCMsmCly1GeKN2gkpsVMrdIM7ypXX2+Fjhaw6coW1Gkv18Lzyyo5?=
 =?us-ascii?Q?dAwcIjVEnbMc7is+g0Za3IinSoFiN0SFHiBSFjXPM1pGYDIUQDBd0q5IsHLn?=
 =?us-ascii?Q?dYOQOVeVZwVaaCpiRDSDMiH+zKl3bd2fn1K3wqnGB6A1kd6WBs0laZpyewcX?=
 =?us-ascii?Q?xtyZTHURx5NiMZvCVoRDfigEkRJ2NZCfpxbuI+ShFEXTEeMQRcAl+hdU77co?=
 =?us-ascii?Q?z7c+IilvIHX8i8wPjfD048FTzpR2p+nEmDon42cS0dxtRMCtz7VaAf9ux6zE?=
 =?us-ascii?Q?3ZhW4f2VKraLAhEMKurHiNAC8F56qhRVFJK/kL5IoxA41QP2QQ1AchN7VAul?=
 =?us-ascii?Q?W+Ovp0s7iysW8T6iO33UhL++baTJxv5qTtmmSfNBlANYfuytBp1cOdfUv6M6?=
 =?us-ascii?Q?6q+kSD2sUPAUNgGdo4Io4lcxmf7JVIteBmUUOsJnlocnJvVQg6xWM8H+F1sC?=
 =?us-ascii?Q?ni/ZoAhuoW65x1qk59JN2t7bqJwb42AEcL5qzTqdZAIHfPrewnKo+uy9C7D0?=
 =?us-ascii?Q?QisRPCkXkUD7AaZEO8+nnX5or3T8vpTzmOYOrAtoyrpVBnQ8AUgNtEoPAfJ/?=
 =?us-ascii?Q?/Y2Jb4N3fNieLFbzI3ShC5knYluuDfUqp4NFa/5ZZbY4DyMmb+Kai/+lx2Gs?=
 =?us-ascii?Q?qgnFJ8jCdAEQTMtksOOH7aT0TvCK5BrYXO2MeYe499qKGBOCaPSy9mwwrYyA?=
 =?us-ascii?Q?PFMWz36tkyjsc5K8hOiExI2D2GLXw9Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683d978f-4aac-4a1c-dedf-08da29123272
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 12:25:36.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqkE5ULj+k+t1T8Fc2LAGDHgsVmtllHheQHtuMKhM41lTmy6iHMWqfNfKjTi2PGKuTOWqGRasOs0hZ0/TrGKDYcMLcm0VBAfD/iritlUqdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-28_01:2022-04-28,
 2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280076
X-Proofpoint-ORIG-GUID: -V5uHP0NM-pvEvnMhTOalVFvN11Zgrs4
X-Proofpoint-GUID: -V5uHP0NM-pvEvnMhTOalVFvN11Zgrs4
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

Hello Hang Yuan,

The patch 6cef21a19649: "drm/i915/gvt: update vreg on inhibit context
lri command" from Jul 3, 2018, leads to the following Smatch static
checker warning:

drivers/gpu/drm/i915/gvt/cmd_parser.c:1017 cmd_reg_handler() error: uninitialized symbol 'ctx_sr_ctl'.
drivers/gpu/drm/i915/gvt/scheduler.c:1652 intel_vgpu_create_workload() error: uninitialized symbol 'head'.
drivers/gpu/drm/i915/gvt/scheduler.c:1655 intel_vgpu_create_workload() warn: uninitialized special assign 'tail &= ((1 << 21) - (1 << 3))'
drivers/gpu/drm/i915/gvt/scheduler.c:1683 intel_vgpu_create_workload() error: uninitialized symbol 'start'.
drivers/gpu/drm/i915/gvt/scheduler.c:1684 intel_vgpu_create_workload() error: uninitialized symbol 'ctl'.
drivers/gpu/drm/i915/gvt/scheduler.c:1709 intel_vgpu_create_workload() error: uninitialized symbol 'indirect_ctx'.
drivers/gpu/drm/i915/gvt/scheduler.c:1726 intel_vgpu_create_workload() error: uninitialized symbol 'per_ctx'.
drivers/gpu/drm/i915/gvt/handlers.c:2847 handle_mmio() error: potentially dereferencing uninitialized 'info'.

drivers/gpu/drm/i915/gvt/cmd_parser.c
    889 static int cmd_reg_handler(struct parser_exec_state *s,
    890         unsigned int offset, unsigned int index, char *cmd)
    891 {
    892         struct intel_vgpu *vgpu = s->vgpu;
    893         struct intel_gvt *gvt = vgpu->gvt;
    894         u32 ctx_sr_ctl;
    895         u32 *vreg, vreg_old;
    896 

[ snip ]

    997 
    998         /* only patch cmd. restore vreg value if changed in mmio write handler*/
    999         *vreg = vreg_old;
    1000 
    1001         /* TODO
    1002          * In order to let workload with inhibit context to generate
    1003          * correct image data into memory, vregs values will be loaded to
    1004          * hw via LRIs in the workload with inhibit context. But as
    1005          * indirect context is loaded prior to LRIs in workload, we don't
    1006          * want reg values specified in indirect context overwritten by
    1007          * LRIs in workloads. So, when scanning an indirect context, we
    1008          * update reg values in it into vregs, so LRIs in workload with
    1009          * inhibit context will restore with correct values
    1010          */
    1011         if (GRAPHICS_VER(s->engine->i915) == 9 &&
    1012             intel_gvt_mmio_is_sr_in_ctx(gvt, offset) &&
    1013             !strncmp(cmd, "lri", 3)) {
    1014                 intel_gvt_read_gpa(s->vgpu,
    1015                         s->workload->ring_context_gpa + 12, &ctx_sr_ctl, 4);

There is no error checking for if intel_gvt_read_gpa() fails.  It looks
like ctx_sr_ctl comes from copy_from_user() so it could easily fail.

    1016                 /* check inhibit context */
--> 1017                 if (ctx_sr_ctl & 1) {
                             ^^^^^^^^^^
Uninitialized on error path.  The other warnings seem to be similar.

    1018                         u32 data = cmd_val(s, index + 1);
    1019 
    1020                         if (intel_gvt_mmio_has_mode_mask(s->vgpu->gvt, offset))
    1021                                 intel_vgpu_mask_mmio_write(vgpu,
    1022                                                         offset, &data, 4);
    1023                         else
    1024                                 vgpu_vreg(vgpu, offset) = data;
    1025                 }
    1026         }
    1027 
    1028         return 0;
    1029 }

regards,
dan carpenter
