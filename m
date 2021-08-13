Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC983EB45C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Aug 2021 13:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3CD6E5C0;
	Fri, 13 Aug 2021 11:04:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EC46E5C0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Aug 2021 11:04:36 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17DB1cDX031270; Fri, 13 Aug 2021 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VzzNHnKb8RKJnVynpebtHQONtqLvRUF8xG6Os/w+yWM=;
 b=DZKJ3zlBrhx803+C+u1dg+P1qO2AB2yDdIXTHNM0vGq/MIpy11/VoWV37lZK759bwPHQ
 0ISl8hNiK5r79xvW4gwytomCQa5MRDuCJQ1foss+0EeLEE2W3oRNVu0eVHZ0hYK2IaA2
 G2by3N6nhByr6BNyNtdfORXgOWgk7Eriz3fOECoMg7G4qEYD3mknQskjCpIZW6CuNXk7
 t/GApvFSyxv8KcA/e3NEb0c56SQpC0fRS59yWDPTt9Wnbj9P+tFOCtFjXFBI0rwwXNZ3
 q5f85XfBngZucaoo1FLOOhgEIdUhlVhIaQSoTjRHslQqDBRSJ/5SKy2A5RIg/BF8KHUy ZQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=VzzNHnKb8RKJnVynpebtHQONtqLvRUF8xG6Os/w+yWM=;
 b=KmnJSd+UfFaOqNbbo9QnaAm/sgf6za/t003/cVCaS3Sem0eiDC6pr2gJjA5M9tcgDFG2
 LmGDKU7CHlmKNyEPem98Sh/pV99Z9Rt6ewq6dDta+5J/kpZRGAO5+MqFOPaem0dQqWeF
 sKAM4Q9ilPaqWMYND8GdumkL3A05jYlqjEqqTLcHGPAbMaiQ3lQmyRUwl9uuBvZTJWY8
 pG64GQ00a5ne+GULtyRdG2TSyDjrTg2HTkc87TpRLcaUAf4v0ZREjpE5ZkVCdrHlfjdJ
 O0d9ikkxdDYBzsfDFMscKdWsB59prnoJ5/lbTynuA1sbcVpKB9sJjX4p8jTOPe3pBSvu tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aceudw39n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 11:04:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17DB1iaf054489;
 Fri, 13 Aug 2021 11:04:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 3aa3y06d5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 11:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEb+2i4Zf3zKiF11Ga2dTmKTQBjDdkANg65SZhrXlvLCnbVkAxKnOzY7xMdSKY0PZ3dQtsU/24sqLObeouvzzIW8kw+h7t+Nd0bKFrY+JRuxKFh1locwnsUS6L9vlhtAWuNR6UHCkeYUL7C1iT0y68SaGxI98sow2G+WXtzzwdZd3nPAJMOIn3zOKxRHAkVPLLjhDhpB89JkNaYAKTZOK9H3CYDDEX/zPB6QscelbrLQnpJiwE3aM+ts1yH4MmRttg+ybZCLPGWIqVOwoW+9hV82Rvx4tJlUNHIy/Y9+1Ni0lR7eax+nrfgAH1E1iupc4nbi+vW/HY34KfJ8g280dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzzNHnKb8RKJnVynpebtHQONtqLvRUF8xG6Os/w+yWM=;
 b=cBPr09Cfv0Nz2Nop68SN85Hm29IseE+vi3/ZFzQl5C/CcanZGBLbJfyTXG9Gpag0ZlgG/lagZ5piU2ChAWJgFYuMvAAGEwyg5lw+Q3iwiN4ixikPHyVIzCPdgpX+bm6G2ojZe1oUO/1+r2Vw6vJxGAkPdr5GpRu93xOAJ6am8q7xNZxxfS+431EHVCsk0LelXDO9zQH+1SiGAGZFFKVMoTikVUkSwoMLEa/H8D2qqJOXsImZYZ+Zr6bgqyI8erUtf6OlpmoygXi4KgYEs1fQYDAsV35CB4q9fRqPx1gb+DADKxViueZt4uqhsz2sbXgzmZB/WxU3poGaMLpIGpBAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzzNHnKb8RKJnVynpebtHQONtqLvRUF8xG6Os/w+yWM=;
 b=Y+0QLzWDiHcJfrdpcXyV+MQf0mfbjQVqwdCjUCcb/QAk5TXzFqLkV+srEbZCS2n4VUmLwRAviQjCM9UyNCJ5yeUOEyNrb8/5wmv94HS+bm4DnmZJh2Bcfq8dbLRkZrGpmPbCu+7GV6pP/vKyYOinBIOX48g4kcKJ1PdHg0PUNAc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4433.namprd10.prod.outlook.com
 (2603:10b6:303:6e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 11:04:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 11:04:31 +0000
Date: Fri, 13 Aug 2021 14:04:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: yan.y.zhao@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Subject: [bug report] drm/i915/gvt: hold reference of VFIO group during
 opening of vgpu
Message-ID: <20210813110419.GA28028@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Fri, 13 Aug 2021 11:04:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b8f58d3-ff01-457e-1b24-08d95e4a203b
X-MS-TrafficTypeDiagnostic: CO1PR10MB4433:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB443393DDE36BFCF618A71A2D8EFA9@CO1PR10MB4433.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FE45pRt5PzjtENeejOo1EAJJEGIzU8LLV3zFRtwjur6+TL2G3HMafRqQh4kuxo2ej9is/4mzD75zvN8g0CGTsmT8lL02LFoH2NrdTMZyvFWGM1SjDmeHuZeEZGv+TjX6gcoX+wlyR6GmM7KamdV9YtN2z54UoTaCYHbSbSc/wdscZHh+MJw7ebsOGyJ48w/HDgTveuITRiPBJSSXr+hFZEMdS2RUbv5VK79XwubMOfE+DeqYrIBev69LBvp54fUcCN+eph+AC7L50a86A32uE9iXobmxu2hErDWjkO+2ZKvnGmdlWHB3+MvyYPvvf1BEwCg1XrYwzprozVs9T4VNxC9AiUGkngYQz0wExnMakWmVu0Nm9OiU98HZivDtXLh1UvPoKBui4tNcaQC0uGWc9nIg7tiRydePjqkKqsQyrI/3S4oqJiC2061RXUCPCI3EU3/s9FKn2iQTBejaiwPtpZG06vaCBWA0G0PiHg/zKxb0DOyrYe/PG0aGV8GZBuY2cM3J7GWiglWhTAUjyGjPePaxyEOBFzL4W3ZOtuTGAa4zEeThQkULjXtIzgiuSaZlBflsnDW96Hx3AcnZgrFUim8jd8tZYLlysNkN8cejxIpezS3yZcGhgCwyfM/Iyzk9NOcjWFrZo609AGtIV5UiuPKi+HW4PhkggjpyZiWS4RuFS/Z/neIW1pLitEleox418ANsd5aJgpdvEz0Y8Jte0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(346002)(376002)(366004)(396003)(2906002)(316002)(5660300002)(33656002)(956004)(44832011)(83380400001)(6916009)(1076003)(4326008)(55016002)(66946007)(38350700002)(66556008)(66476007)(6666004)(8936002)(478600001)(33716001)(52116002)(9686003)(6496006)(9576002)(186003)(86362001)(26005)(8676002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLhpEask60G6qkPiVH6Uehp24OvZcgwhSX7pHjOYaEkCMXH/lkcS91DuQ14m?=
 =?us-ascii?Q?YZwwUSEnw5uBUZcmhFsS+FAZXoo53L6kWsBYpyAvpgQJIW40+mYxP7yVRlJz?=
 =?us-ascii?Q?QyPsFeVnPBcmsLr3xdOezy4NidMcjlM8tIfE/DRqqywYYhWLTB1Pn/7vCO3C?=
 =?us-ascii?Q?A0fCwXWFNT4VMbvytCMNg8LOCQHku1sjgBbjl3hhdneo4h9FgbKELK7xZjkZ?=
 =?us-ascii?Q?kc4pe6yfNQoVLaqGExMZjDACg8OS6oaPX7QsZTgFJeh4+Z7b+Z3fva6Ee5wM?=
 =?us-ascii?Q?gtr476s411IsQpE+zxUWXzRBle0W2Kho0RPBFhW9qnxehfY4JBEYcWRKbvhg?=
 =?us-ascii?Q?XZpDZodwlAr32BcG8uU1s+nggLfFTcsg6yTs/i1tydpyP9ODIJg/WmH1kahF?=
 =?us-ascii?Q?fTA0ZRV1FjKvsAZH1E/C6BCDyijTXJcTAE8pFjv5TfVL/mzuYgsGdTlc7L/L?=
 =?us-ascii?Q?3AA/705Ul5/TJW1epX2d3CvoglzMOkmBQ+N/Rq/Lc9OjgnYTJN1Agz4rSgvL?=
 =?us-ascii?Q?SGhZQC87V7u99vPiTUBSc2D8oIe9kKUiKo2bAHirYtPIULHWIixbvz9dHciA?=
 =?us-ascii?Q?/TlYVbQdvKpIuyjQBDe0htpHs5ffy2C1M9M3S0B06plWFFcmuzcCZUSK+54k?=
 =?us-ascii?Q?7QGp44IrgOldmcBH5ss59uJCS8LdS0kndpfQy5X5g1c6SHevVe4jK7YDXY1g?=
 =?us-ascii?Q?mVduGiI5+CfGEsjc4/NFjXykviRvmlp7lNqYsIMshA581es6V4pKDZEJe9rp?=
 =?us-ascii?Q?riy51Lkg6GzeCO4tOcOZahDNu9fCtn5OauwIHUEJesTsSXhISojWaBOIis+U?=
 =?us-ascii?Q?/3IK+XCjHQO0mN2kHrdflvXGK0lL8OGkqxfrfolbiUCtLmkGZwqqsE09/d8O?=
 =?us-ascii?Q?u5eXVNnHlHBkdJ+dkcVTf0E1WyJXYqftwxIJ1qo2ryBcs1E7cwJ6NMHs9M8c?=
 =?us-ascii?Q?xN+iY+yWkC/5x313BIIwNRrGta5Ii37nLx80eCTyZYlouJcRuhijwk29amqv?=
 =?us-ascii?Q?XNVdVs1Uss3HV+8nSjQ8GW/dRMPBHluvkMSUOSqGEeOiM7Fh5WOkmXzuHlyM?=
 =?us-ascii?Q?FuxuqafsKIkQzPyEmqseJMDi1gSMOPYaezG6AjRv0D6nP7nweOXgeGp0eZK/?=
 =?us-ascii?Q?DOXJ+krNJj9ZG7PRPKzB7Xn5woLZfQlVLg3Q2K0+JoXmds5mx6lkyMXj103f?=
 =?us-ascii?Q?Mou29d1YwH8QuLHjY6z1WPkS/umauprGI6XrNf9WmadvBwido7MhbXFt0eIE?=
 =?us-ascii?Q?scWrA3/N1dFi//MhO6RcCFYk9p4O3XK3MCrfemrhwDb8Goyqi1xUpHqz2Qof?=
 =?us-ascii?Q?zuGEvyetUGGakpjQxCkgzzFT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8f58d3-ff01-457e-1b24-08d95e4a203b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 11:04:31.2150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrzSIHL1arO9UUJ0WnZMKw8XdmVcjV2Q7pXS5mh10HGseENRMtPwRewAgoeW8f2b0v7GoVQLaAwcOXDykUCXfE/D7RybI2hEEonkf9Rjt2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4433
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10074
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130066
X-Proofpoint-ORIG-GUID: vNv1o6TO42dTO8-cjCWVDRPLbtggQAFR
X-Proofpoint-GUID: vNv1o6TO42dTO8-cjCWVDRPLbtggQAFR
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello Yan Zhao,

The patch 776d95b768e6: "drm/i915/gvt: hold reference of VFIO group
during opening of vgpu" from Mar 12, 2020, leads to the following
Smatch static checker warning:

	drivers/gpu/drm/i915/gvt/kvmgt.c:919 intel_vgpu_open_device()
	warn: 'vfio_group' is an error pointer or valid

drivers/gpu/drm/i915/gvt/kvmgt.c
    909 	ret = vfio_register_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY, &events,
    910 				&vdev->group_notifier);
    911 	if (ret != 0) {
    912 		gvt_vgpu_err("vfio_register_notifier for group failed: %d\n",
    913 			ret);
    914 		goto undo_iommu;
    915 	}
    916 
    917 	vfio_group = vfio_group_get_external_user_from_dev(mdev_dev(mdev));
    918 	if (IS_ERR_OR_NULL(vfio_group)) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
When a function returns both NULLs and error pointers, then the NULL is
NOT an error.  This normally happens when a feature has been
deliberately disabled:

	foo = get_optional_feature();

If the feature is disabled, then the code has to continue without
printing an error message or crashing.  If the feature has an error then
that has to be reported to the user and we return an error code.

In this case, I don't think vfio_group_get_external_user_from_dev()
returns NULL so the fix is to just change the check to IS_ERR().

--> 919 		ret = !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
    920 		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
    921 		goto undo_register;
    922 	}
    923 	vdev->vfio_group = vfio_group;
    924 
    925 	/* Take a module reference as mdev core doesn't take
    926 	 * a reference for vendor driver.
    927 	 */
    928 	if (!try_module_get(THIS_MODULE)) {
    929 		ret = -ENODEV;
    930 		goto undo_group;
    931 	}
    932 
    933 	ret = kvmgt_guest_init(mdev);
    934 	if (ret)
    935 		goto undo_group;
    936 
    937 	intel_gvt_ops->vgpu_activate(vgpu);
    938 
    939 	atomic_set(&vdev->released, 0);
    940 	return ret;
    941 
    942 undo_group:
    943 	vfio_group_put_external_user(vdev->vfio_group);
    944 	vdev->vfio_group = NULL;
    945 
    946 undo_register:
    947 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_GROUP_NOTIFY,
    948 					&vdev->group_notifier);
    949 
    950 undo_iommu:
    951 	vfio_unregister_notifier(mdev_dev(mdev), VFIO_IOMMU_NOTIFY,
    952 					&vdev->iommu_notifier);
    953 out:
    954 	return ret;
    955 }

regards,
dan carpenter
