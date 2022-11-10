Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12732623DAF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 09:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E8510E67C;
	Thu, 10 Nov 2022 08:42:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922C610E67C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668069718; x=1699605718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xwvFtaGZcpe5FlaLk+6GEt1Kb05fiY2MQpbqni52WgI=;
 b=PiaUaQCyim16TK1NZF9OlhmMk0oDucdLibNlWZRf79/25Y84JGo9/eMQ
 YOJWGAlECZx3Ah9raG3jGJR+ne2yH0HCnEFG9uj4nt83DEfcMUam7/rHE
 e3dVVyqSqmJaHoUBk/m8qEbFRxvdzz5u3FkV02EdHUzcHFdlWXOitmwB/
 Nh2tYYFrloUMoICM7laFtzgha8fBFiYgV7j9iQUbClEf6LCP+TV6ts0c0
 S39M35Rw9cZo9LNE0ml9uX0Rp52Br/a8hHmI/zssdd6E9HbqqmjsiRtvw
 6lzLGPmMmpqdKv9zAm9X+c5vTZGMVIufI757kQYxmVUCR+Hcy8X0ehb49 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="308879190"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="308879190"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 00:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="882281481"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="882281481"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2022 00:41:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 00:41:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 00:41:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 00:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETUTfyGkTXBl06opvMsK8ByDTeOXYmEIYZSDZDrBCdMQ4ro9y9VZqRwJjnXqWiWZaKXwt42SrWt2Su8y3pxWzIpvEOSwE4eBWRoZFDNOa99R17fGot19sWDaN7X2AKWR+SmgpOt0NLdfc/XvufrGtlwDDEmv5yNgYZC4RBusFoz4qSf+5Wp/dv8PkmxUTRpXyPukWLx1tex09WOKlfLjtP9EJSUMzcGNSjJSFUCM4iCWiABFTrszMCbD4DRG5sgPnrH32LsaMILbp8dE/9cy8+Q8SXc1eAz4CqyrWwJWN3JIFdQWA6vgGt+4z0Wrqf2i6+Pyg1ykpQJBa1ZfyIxsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNLDFsTjUQCgeqUTOnxvm9fvww0FYRaluVLTRfQ2z3A=;
 b=JH8CnLM2d9zZinzUf5V7iylIlkM37UOTK2fIH9syJYv3Ysgkv5Ybp8BhOJ+709ndIvDPKwDX4Nl9pQwALNWzZYN0euFWMTlDKEjkqFVU3uA4djZ4zQbm7lO7wP/fXI8QPElYpQOV6RVhooMrK3bT1CITziV882cH0ZraEv9VK/jjMvkQhIIUrsb8Z9gC7GxcnR+OB7Hs88voY3C9kQh0x3yNOVfc5Cgqb2JkZS3I5VRkW2LNQ4qzoQGAbiEr4lhYmghpqouFQTmHjzfaLhxGaSuOPEtlFJkRy1eanF/Ityx7bdHm4qchwKe93xWHtXSFEuFSWMPUD14EWw0PiFiBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 08:41:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 08:41:34 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: RE: [PATCH v2 2/3] drm/i915/gvt: use atomic operations to change the
 vGPU status
Thread-Topic: [PATCH v2 2/3] drm/i915/gvt: use atomic operations to change the
 vGPU status
Thread-Index: AQHY9NIviQICQGVeDEOj8MiA+kQGz64303ag
Date: Thu, 10 Nov 2022 08:41:34 +0000
Message-ID: <BN9PR11MB5276BC1A3DB53E5FF5A4973F8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221110065959.32249-1-zhi.a.wang@intel.com>
 <20221110065959.32249-2-zhi.a.wang@intel.com>
In-Reply-To: <20221110065959.32249-2-zhi.a.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB6325:EE_
x-ms-office365-filtering-correlation-id: d438d4fb-6e47-491a-a186-08dac2f75feb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hZcdGCmQZy4FYhsX71SjdMBUQUGfhjwBeGCcEjwU80hHgMfghA3+VHuV9VEBFELhYTw0QUYoXWdRLX/TfwIoWaIPTpWB1EoyjkKcblOc9v0fawDVhnApNhkGBwWFg5u2v4EwD7YEVXYFM2sjcuWAN91bZ0uPtVi+fMzUlskSAq0W0/jBxyXY9lO8GN8O4tQDEFd7dubJXPbG6hpY8rQ9hq2m3eAXa7KV0asL0O1opamTGVxOBEOxzynN6+g23Ni5ZBepeH3rK7aH1g06GGROXi6HHUwA1EOGE9YxWiWwrquM+6jSfoQF6xUv/5J/yJDxq7iI1hmpoE0AUnao3fqI+Th1+dbqET/+9GLDvSyOjUlJ6xmrBnbE9FxyaI39IWnTt0M93X+Q7UBbyWZmrcWPZgRKlBkfaDzwRjJCUzVECtaeC8XLoxdHsIiEQpwbW3azZY+nUWDCaHkztnVtNeHa2SuPOLLLs9UJv4XKThR+aKpQnvYmtiP+M02xXd7fDiv2JOiZHUW8md+8vrOhl1hj3O1X7bv4Q5sqIm8s8TNZy2FHDL2oEfo4vGHiQ2GL2Bt5oMeLzmLtVPbaJMARF06uiANMCcmWOImw8SXgsvwo+/AM2+T7dNBWi3CAqGBs+FsxvEeMRuN6iDQZeHZTNte+qU44OBJpeb7OPVVMTRzVKq/IWORN1+cC7KQi8gzTJ/+LjC1q/LoB+7rmoSDz8kZg5aWQLE929AFZzDkFOiPILPi66P7a9BPIR583RU0jcWF0wydysYluhcQEOIf8sF+i+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(8936002)(26005)(52536014)(54906003)(9686003)(41300700001)(6916009)(5660300002)(186003)(478600001)(55016003)(38070700005)(2906002)(316002)(83380400001)(66556008)(66446008)(4326008)(71200400001)(122000001)(66476007)(64756008)(76116006)(66946007)(8676002)(33656002)(86362001)(6506007)(38100700002)(82960400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7M/nASgs6+fSOVqskpUqXxO2mNlasxYUN1rFub4qJckr+rGJJMwna+a06mbI?=
 =?us-ascii?Q?Ad+9jW+QYg/ArcY5kmFCcg2gfXtBK/wVDLrepeu20xsY0K5Uq3kufEcjMkqC?=
 =?us-ascii?Q?9IcwXp8uRDhW8B7dCA/bxi9wn8hAxQFKvZ4BLce1ocSLsLCUOKgybOxd7hfg?=
 =?us-ascii?Q?8QiKGCfLG0Vkmo1zGlPf5KqYTJSQaUyvh3Nz/u79cNXM1Ym9zIpW5hf9iGG2?=
 =?us-ascii?Q?Vj2cNX3r8sP92FepF8KVR3gVd/LbtX4KDc6bDvWDrNQRGd/q3VTXIgwMc5cj?=
 =?us-ascii?Q?VchIu/dCW6lMkdtgM6XKUxG7EN63F+84LDQ2f/ZtrV5dVRlWP2OxxIB8dIjz?=
 =?us-ascii?Q?7aVwtWTE3Pts4c8qqJTO1gt+Utbi/TVcNloE2gKQDsFG5g/Fo/chjvMflZ4g?=
 =?us-ascii?Q?iThBruJlxQX2p346YXBGGZgzXLfFlh6/scCsmiLoaM6v6vMygo70poyRfDDM?=
 =?us-ascii?Q?VzXoHmmN7hGY49lV0+o6xYhR5J3L4K2QUAgGF/whJUo0tEOOJgaJ9wTiL6is?=
 =?us-ascii?Q?VixJuSqGKXna0hq49y4iClKhOCPFQwGS13NVb4yUK4w+Y02KJ9LH1355ZwE6?=
 =?us-ascii?Q?OvggVkg0qpH+2rDWLhh9hcu/v5SbABdQdBFhXF9nz3K95Tjo6k3UhC6vUL2D?=
 =?us-ascii?Q?ibRh0MqM8q2xmX5IqjU2pMQLK/wVcv4Bmc0vnHDcMPWyvxuwGyfqrs4VFVlg?=
 =?us-ascii?Q?w3WFaLkKcutWH1gbUzNAtMiZiJ+xGPg+SyET9jeC33mMfsAiLDUAGR0KRcl3?=
 =?us-ascii?Q?FbNYkl/TIM4jL8dZl6zkhgzWPeL+5QT30KrxvSBECAkBEi5JTxzGNe8U4O6d?=
 =?us-ascii?Q?dzFLnvN2WkIp6O6CxTP+7AX8iDDW1J5ossD1NV9r4DocH6Woiyg7u1x9ifto?=
 =?us-ascii?Q?j163b3yr2wJMdrH+8Cib4dG9WU+qalcY1+FPg7FVD/NMZretORgxsbw3gc0X?=
 =?us-ascii?Q?44QNfDP/kSBk0kPBMZt0ZWITz3WfkvN9EIANznLpWJQY8Qf2s52vZRnRjynp?=
 =?us-ascii?Q?n5q45MirkUkE4FJz4OCOrN5G7SoNeY+kaEOeHhzml4sUoihThzUArVUVkWuR?=
 =?us-ascii?Q?SvoSE60FlMJsrkYA8FWctvS7vGGKvEMDSbfiMHpTbCVu/qvWUezvqWwnA+Zd?=
 =?us-ascii?Q?/79EhJSii+/O0UcSxLPoCNJS4/FKzZZhzt8R97WQDZH55+VQV9HFJyx1WU/j?=
 =?us-ascii?Q?LPOvSJ0t2CSnTy1AIcivY0C7xVjB/GJ+yBU1ToABE7BRq1+HhkEvS+f1ZSJv?=
 =?us-ascii?Q?zD3fKHhpjZMpnekb7P1XxkziXL1geV46Y07UImBMT3y8C3uKPiehBYQPkOt/?=
 =?us-ascii?Q?kwRuFmuKCIz7caFSwD7RLZHOP0LR6Z77EkOUIRF42KXORQf/mv7wqi/27dgY?=
 =?us-ascii?Q?u/xiTqa3k6WjjU8dY/Mc/OkBWJ8Tyd9kDkA4dHOuxTeZTglUfJRX+KlLz7O6?=
 =?us-ascii?Q?Ig7bsjY7qgqClLWm3qzlU1hIiz6FAuXUYxB06WlTwhQZGpTHy/jHqnR0izk4?=
 =?us-ascii?Q?DzjZq38EABQoIhdGY5d8n5M25TiPTFxzc3BcM270/yt5Ysk/WKydbGK3mnpu?=
 =?us-ascii?Q?7Uw3ohrFdPDLALlbY4H527xV3IgqYP09/+W2xqYM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d438d4fb-6e47-491a-a186-08dac2f75feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 08:41:34.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKIFIVyFlOAdYBX/9YtovFlcMnQeOlEbq0xsPnDnrem28ZbpQB62aIMeUlP0sC1AW4Zm0J3CG9Jc6fh1EAj2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
X-OriginatorOrg: intel.com
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
Cc: Alex Williamson <alex.williamson@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Zhi Wang
> Sent: Thursday, November 10, 2022 3:00 PM
>=20
> Several vGPU status are used to decide the availability of GVT-g core log=
ics
> when creating a vGPU. Use atomic operations on chaning the vGPU status to

chaning -> changing

> @@ -162,7 +162,6 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu
> *vgpu)
>  	snprintf(name, 16, "vgpu%d", vgpu->id);
>  	vgpu->debugfs =3D debugfs_create_dir(name, vgpu->gvt-
> >debugfs_root);
>=20
> -	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);

this is incorrect implying userspace might be broken when doing bisect.

just merge with next patch.

> @@ -655,7 +655,7 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
>=20
> -	if (vgpu->attached)
> +	if (test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
>  		return -EEXIST;

this check is unnecessary. It's guaranteed by vfio core.

> @@ -702,11 +702,12 @@ static void intel_vgpu_close_device(struct
> vfio_device *vfio_dev)
>  {
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
>=20
> -	if (!vgpu->attached)
> -		return;
> +	WARN_ON_ONCE(!test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu-
> >status));

no need.

