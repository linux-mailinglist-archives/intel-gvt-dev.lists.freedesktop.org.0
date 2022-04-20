Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8050831C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 10:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8510F185;
	Wed, 20 Apr 2022 08:04:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F110F185;
 Wed, 20 Apr 2022 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650441891; x=1681977891;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=n5LPidHKa1NxUxueA5vPWYgIyA7bubcrF0L6zyj8imk=;
 b=HaWxGHo8/q/IA0h7Yht6CUhEWmY+hEvNRO+x/hP+eKLDYnSsVcFkDEvm
 14MNksx1sVUl0WFTMZRvWJpQCHRmqKt1psOBEcw7XAefHHtn1wHvBwpsB
 BQ+lLwBexuhJ/AY79bEQtk2LxJr4LFoB4bC6dcTLT7NYcDAxEGXbnpNDY
 DC5mZdhHMoP/8IjQj7Hm1T5fasPRqkzb9rO3bCFSrKitA2l5OjsrdaBe+
 TfY3wNZB58iiPQRxnWGq+FIKpwHlR/S9Pi32KZ4De1Xq/I/rejedPycMQ
 EphTwQtseg6RteFyRjyPIo5bjCuCS+2LlfrcDf00W5pK/h4YzjGU+Mpi6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="251276588"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="251276588"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 01:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; d="scan'208";a="562017067"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga007.fm.intel.com with ESMTP; 20 Apr 2022 01:04:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 01:04:34 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 01:04:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 01:04:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 01:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNGID/Ruvti24UaNe0MFuN2cOY3RXVVOn/v7eDmYA2R0iQ//naskcTM1UbBad/lnQNpXP6XeBVMLsFWZ7nOwF04BC0oASmowyodAE383HInedtrIpdBaqoSUaBd3WQXFN5+uG3LiJQpNnMYesOH7Ngd/M7BTg/ARnPBTJXI1vcDFTvLIsi9etvL22lexfW4YHOgW/6QJXRTTgG6Z5grTbDZf/GbchTKpMUZBKExwupAY8u2pOeySoTxezi1C9/jzZUF6TuB/KRD/g+7nWpdjzJwBjDfzW67OgJpX/6DuKSlfgexpZg/r81Wq09bu7C4Rvbz9EX1scqfhSHpU0ayuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qMoesf7103ChjsTAFBf4xTOh5M9yURwsKtGa5MJa/M=;
 b=gGVW/3bi8B2bVplp1KZZp7fNTP0cYlKaWIvJYHLh1kJnG0NwngXmXzlLgR0YGeLnZ2l/YHihx9+vDzvoTu6mfcfAsCuRq0bOp1WDuKQ4DA3Sl0WMLn8ZRzEgw2VFy+Iow+F8bSiq2Ltfth4xF2Iq1BW+HCjdIVV+WHmHbRzmGfzjbKbIc3+MRuyJWucB6ZmVdh5q2TxbEZTAuIv6kP/QeYq2Nj6NnpTskTC/tjDQSvOfACIO3efZP+gCNGVPfansaBqpzw6ZqQTgiiVjb+PTm9l2xCJQ4/usW0ogli8ygtmRcdEuEOjo7D4xDLvCYTIsMksFqeMswLLWOrxcWZAS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4272.namprd11.prod.outlook.com (2603:10b6:208:196::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 08:04:31 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 08:04:31 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYVI1DfNiTLpeqnEGvHyikgylmNg==
Date: Wed, 20 Apr 2022 08:04:31 +0000
Message-ID: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7705de7-07ba-46cb-9435-08da22a4668f
x-ms-traffictypediagnostic: MN2PR11MB4272:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB427208E25223D6E1C8DC7161CAF59@MN2PR11MB4272.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YXPEncPc0XSXSgtVVpgSJNz85t0JdmHAcUqfe1U7TUR1q0znZ7AuEhYZWH0Tmd0k6QskLhZ/yWoFF52XN6ae4XPSF7Uqw06LlyEaGVz44qwD8+RtfUSR+9GLV5D+kGwgbWj5gq8QrtBgLY9YdoAUx3KBzOep3Q2CKEYJHZCq3zHn9K1RDpB5NTjS0/bI1VuRweHpo386+1E1LsZdv5+zMq2Vxdn54M0UfEK7sh3N8P4REiI/uZJJkgr3qMWZy6+dc8Z/Id5o/vzXoqqNwcsehqBeFPU4Q20gW8jall0YyJf4Ld9DCDRB8RKFG5HYxp6q/JPCFydKcWMseOPJWG+78hx7G+wMhLEyHtuYTiVkSqv+XEi7K7xL1I798cSJJiYI4QSQ0xyGl5BXEsV7Zlm2UvQ4AUP1TbjGsA3t6XQR/Lfzcno6jQ6RKpcxkc67oJp5N14vQKPSmj42+LZQ5wp2dA21XNxjLyxtAc1t0cxMV9wxbTN3RcHePvQRDnRqQQ+3AT488S8t55jj4aB3s4zS5oLXo6xxGdHP6eZ8my+IGJPRWerk8gChGtC9WdJyS/2Cp7q0xPOE9/GdgQX815EO/pRGdflSIsTCgv7RoFvuyOvmou2SojHR5VnRhjCKDM1epNG6WQ74AUKvT/KA3cBQ2lZMJcLMM+0OBXEfGciXBpaNGFdR1hMfsIflgJLMD6R66zPw6cdJaKkD66m6Y9N1Gm2i2D79LilIgoGtS92OW3/HSYam3MZkk3yfHl3Dd/NYPUqQfELKQ0d76LxnKFtS0ILYWfh5k9eyKy/HZ48B78MW+AF3rVTsg+MegwJR8wx/M0CMeIvAKsVqn6S4Ql1fG8oMtVijF5YOZcB2VLCeGpw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(26005)(31686004)(76116006)(66476007)(66446008)(71200400001)(36756003)(66556008)(83380400001)(91956017)(2616005)(8676002)(6512007)(66946007)(2906002)(6506007)(5660300002)(4326008)(186003)(508600001)(8936002)(38070700005)(38100700002)(966005)(6486002)(82960400001)(316002)(110136005)(31696002)(54906003)(122000001)(6636002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?wrpK5MbQW+JYkSPAQLByOz4MAfaTIsjU792qp8UxifbUvNQsvMUMxwAm?=
 =?Windows-1252?Q?q9uxhug9VYfyle19dIIzu7CN0R90eTH2freX8EK+EbIxWlCEif7PHJjQ?=
 =?Windows-1252?Q?0ClrN937IDJ0Z0rY9VLm3qATcRNtWpabc4TZyhRG7mltoxZ06GCYufhO?=
 =?Windows-1252?Q?dFz/+Z8WgupyUSzDrEgJcfhcmnXqLbcoO3PPKAnM/AMV0SpHygL9BEXa?=
 =?Windows-1252?Q?Tr4JrLlOd1Cezk6XS8sDXWBvuscOkP+meiLjK0ohUkauO0mgQrVT+IQ4?=
 =?Windows-1252?Q?D1HhfKT/LXNC1E0dKYwOqS8I+twdZ0xZZ9+kvF4vo9u4tSVvImf+Juti?=
 =?Windows-1252?Q?g7aPZyiLpc5s+WbnOCbAlTSLvbbaquyoYRmE3z3JIxiBbV1Olf3BMnEp?=
 =?Windows-1252?Q?IftCpD4Th4D3MlPun9W1FZQqAloK/6VLLfE6q9NIEtJ3RQER5PLH4ZkJ?=
 =?Windows-1252?Q?ffmrXzJAYSSzq4W+wThgjiOoa1eyGLCTZOctMj66HxQ0Jz6xHjvURYwN?=
 =?Windows-1252?Q?kTpOrW1bhF5BmzOEWlwXeFZBgrPDQ3QVMRt+mzrjfTRJwHzrKkcFoAUM?=
 =?Windows-1252?Q?JvUIjaelZatP2Isg3qQEDL2JDe0YwBm7k8yvNbWgt1Sc489xM6p7Fx0D?=
 =?Windows-1252?Q?mmg/WWotrz17srOgkAwZu7PjItXnVhu6glPm3e2Xww1jxjC8VqNv9T8T?=
 =?Windows-1252?Q?StmlLA2DlM77KFjJX/riog+aydD8Kgf/lUIq/A08Gsr9ncr0HQ71YWRE?=
 =?Windows-1252?Q?D12QWlKFIK9L2QRUsrnTt8rmaMelYFCWE5VPIIaArVLNsWR5veXD3ZMg?=
 =?Windows-1252?Q?uITjfk+B69J4RZY62VPBTvF0JbwILNZz3NaGLdVY7ibJWO9DcYXAgveQ?=
 =?Windows-1252?Q?yaLl9DDcKpe1zMzrr/NkJ2PxodJ0awU/ZNBO+Wecce/ivMO4WmW8HuKG?=
 =?Windows-1252?Q?Psewqqq2fiDMdh33GmXNxfVWDgGfFejID6N8PP9w5RoGylY8jiP4J0s7?=
 =?Windows-1252?Q?/piBaFfnkbd7nJdoH5rLg7d1e4+aFGUiGISNyOtEIPLcohul8wzlLWsX?=
 =?Windows-1252?Q?/rgqvGFqEnut6d3EIrlRHjMnUpN91qyVVMkGh6uat2pdCCPO3SfHu6G4?=
 =?Windows-1252?Q?RdZbq0ST2i28LU+VencYKODt5JbLpfnhg/DH7rbfAIUqzNf050/H1JiZ?=
 =?Windows-1252?Q?SsZf/aMIZm0Ygdkn44HF5yyK8YVDcrb71U8+AoP5FHx5oV7uJhid0vK+?=
 =?Windows-1252?Q?du5nu5aRHJYNHqPbnT8qaK0J9uCC6GkjuuTMn6hk6j0BDrJiGm7v2Ckz?=
 =?Windows-1252?Q?nNtnhspgx380NoHdh4FiJDnQdyAYQlRNxiD3rI+Qh5E4ydM4CRIoCySw?=
 =?Windows-1252?Q?Kzok0p/WZ4l9IDD7xl0OxuT8ANQwMbWtoRgjT7TR+Bemd8j0xXjKTK1W?=
 =?Windows-1252?Q?vpoCzfm9BitbHRe36dmKI16HPXlXkp8eDRCYm278iCNZ/lJWUjiD+S98?=
 =?Windows-1252?Q?7AIrZHq/vwfwWRiCm8DWjSn3kuZC6s+827ykiKFv1RfTlsrlHPOPXMye?=
 =?Windows-1252?Q?JtOHWeulv8SYUVzOVcKQwu50VOrzxt2v2ksAnkqWz6lX0kskQ2aT/2pw?=
 =?Windows-1252?Q?ff69iSR6laHWbBTQSsdOLTc1DbVt/c6r6alWbpqyM3w4g1ASwVQJfy1V?=
 =?Windows-1252?Q?rR+teglPy4MJbqewRTckiiWRfNP4Y2ycVIFZ+Zv/q0quVmUIepO/RNVD?=
 =?Windows-1252?Q?32ES3Ot5kOV6TIePz3M0CbJxYUYbx0re+2w+B1MCUvHBG7dKIcKLY22H?=
 =?Windows-1252?Q?gCHImtn6AkOMnqhdb7tJfpswaYE23wcaB/js4GQoevlaCETl1FfldMFY?=
 =?Windows-1252?Q?nfHFWumpJFfMDA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <32286F568FB8794F929C7E800B43BADE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7705de7-07ba-46cb-9435-08da22a4668f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 08:04:31.6231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fe5fKq5xZsnjXhTkd6mZvcFP8jxoDG2CW9PHJENK+lEWv6d4BrzuX2anKWT+DxfXnFzWnge0EUqRh1iK/JDNlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4272
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi folks:

Here is the PR of gvt-next.

Mostly it includes the patch bundle of GVT-g re-factor patches for adapting=
 the GVT-g with the
new MDEV interfaces:

- Separating the MMIO table from GVT-g. (Zhi)
- GVT-g re-factor. (Christoph)
- GVT-g mdev API cleanup. (Jason)
- GVT-g trace/makefile cleanup. (Jani)

Thanks so much for making this happen.

This PR has been tested as following and no problem shows up:

$dim update-branches
$dim apply-pull drm-intel-next < this_email.eml

The following changes since commit b39d2c6202426b560641e5800c5523851b5db586=
:

  drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer flush (=
2022-04-13 17:20:49 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-20

for you to fetch changes up to 888471711a80b22c53547f3a625f20f487714f28:

  vfio/mdev: Remove mdev drvdata (2022-04-20 03:20:16 -0400)

----------------------------------------------------------------
gvt-next-2022-04-20

- Separating the MMIO table from GVT-g. (Zhi)
- GVT-g re-factor. (Christoph)
- GVT-g mdev API cleanup. (Jason)
- GVT-g trace/makefile cleanup. (Jani)

----------------------------------------------------------------
Christoph Hellwig (27):
      drm/i915/gvt: remove module refcounting in intel_gvt_{,un}register_hy=
pervisor
      drm/i915/gvt: remove enum hypervisor_type
      drm/i915/gvt: rename intel_vgpu_ops to intel_vgpu_mdev_ops
      drm/i915/gvt: move the gvt code into kvmgt.ko
      drm/i915/gvt: remove intel_gvt_ops
      drm/i915/gvt: remove the map_gfn_to_mfn and set_trap_area ops
      drm/i915/gvt: remove the unused from_virt_to_mfn op
      drm/i915/gvt: merge struct kvmgt_vdev into struct intel_vgpu
      drm/i915/gvt: merge struct kvmgt_guest_info into strut intel_vgpu
      drm/i915/gvt: remove vgpu->handle
      drm/i915/gvt: devirtualize ->{read,write}_gpa
      drm/i915/gvt: devirtualize ->{get,put}_vfio_device
      drm/i915/gvt: devirtualize ->set_edid and ->set_opregion
      drm/i915/gvt: devirtualize ->detach_vgpu
      drm/i915/gvt: devirtualize ->inject_msi
      drm/i915/gvt: devirtualize ->is_valid_gfn
      drm/i915/gvt: devirtualize ->gfn_to_mfn
      drm/i915/gvt: devirtualize ->{enable,disable}_page_track
      drm/i915/gvt: devirtualize ->dma_{,un}map_guest_page
      drm/i915/gvt: devirtualize dma_pin_guest_page
      drm/i915/gvt: remove struct intel_gvt_mpt
      drm/i915/gvt: remove the extra vfio_device refcounting for dmabufs
      drm/i915/gvt: streamline intel_vgpu_create
      drm/i915/gvt: pass a struct intel_vgpu to the vfio read/write helpers
      drm/i915/gvt: remove kvmgt_guest_{init,exit}
      drm/i915/gvt: convert to use vfio_register_emulated_iommu_dev
      drm/i915/gvt: merge gvt.c into kvmgvt.c

Jani Nikula (2):
      drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
      drm/i915/gvt: better align the Makefile with i915 Makefile

Jason Gunthorpe (5):
      vfio/mdev: Remove vfio_mdev.c
      vfio/mdev: Remove mdev_parent_ops dev_attr_groups
      vfio/mdev: Remove mdev_parent_ops
      vfio/mdev: Use the driver core to create the 'remove' file
      vfio/mdev: Remove mdev drvdata

Zhi Wang (3):
      i915/gvt: Separate the MMIO tracking table from GVT-g
      i915/gvt: Save the initial HW state snapshot in i915
      i915/gvt: Use the initial HW state snapshot saved in i915

 Documentation/driver-api/vfio-mediated-device.rst |   27 +-
 drivers/gpu/drm/i915/Kconfig                      |   36 +-
 drivers/gpu/drm/i915/Makefile                     |    8 +-
 drivers/gpu/drm/i915/gvt/Makefile                 |   30 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c              |   89 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c             |    4 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c                 |   36 +-
 drivers/gpu/drm/i915/gvt/execlist.c               |   12 +-
 drivers/gpu/drm/i915/gvt/firmware.c               |   25 +-
 drivers/gpu/drm/i915/gvt/gtt.c                    |   55 +-
 drivers/gpu/drm/i915/gvt/gvt.c                    |  340 ------
 drivers/gpu/drm/i915/gvt/gvt.h                    |  128 +-
 drivers/gpu/drm/i915/gvt/handlers.c               | 1033 +++-------------
 drivers/gpu/drm/i915/gvt/hypercall.h              |   82 --
 drivers/gpu/drm/i915/gvt/interrupt.c              |   40 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                  | 1097 +++++++++--------
 drivers/gpu/drm/i915/gvt/mmio.c                   |    4 +-
 drivers/gpu/drm/i915/gvt/mmio.h                   |    1 -
 drivers/gpu/drm/i915/gvt/mpt.h                    |  400 -------
 drivers/gpu/drm/i915/gvt/opregion.c               |  148 +--
 drivers/gpu/drm/i915/gvt/page_track.c             |    8 +-
 drivers/gpu/drm/i915/gvt/reg.h                    |    9 +-
 drivers/gpu/drm/i915/gvt/scheduler.c              |   37 +-
 drivers/gpu/drm/i915/gvt/trace.h                  |    2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c                   |   22 +-
 drivers/gpu/drm/i915/i915_driver.c                |    7 -
 drivers/gpu/drm/i915/i915_drv.h                   |    3 +
 drivers/gpu/drm/i915/intel_gvt.c                  |  248 +++-
 drivers/gpu/drm/i915/intel_gvt.h                  |   32 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c       | 1292 +++++++++++++++++=
++++
 drivers/s390/cio/vfio_ccw_ops.c                   |    7 +-
 drivers/s390/crypto/vfio_ap_ops.c                 |    9 +-
 drivers/vfio/mdev/Makefile                        |    2 +-
 drivers/vfio/mdev/mdev_core.c                     |   52 +-
 drivers/vfio/mdev/mdev_driver.c                   |   10 -
 drivers/vfio/mdev/mdev_private.h                  |    6 +-
 drivers/vfio/mdev/mdev_sysfs.c                    |   37 +-
 drivers/vfio/mdev/vfio_mdev.c                     |  152 ---
 include/linux/mdev.h                              |   82 +-
 samples/vfio-mdev/mbochs.c                        |    9 +-
 samples/vfio-mdev/mdpy.c                          |    9 +-
 samples/vfio-mdev/mtty.c                          |   39 +-
 42 files changed, 2531 insertions(+), 3138 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/gvt.c
 delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
 delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h
 create mode 100644 drivers/gpu/drm/i915/intel_gvt_mmio_table.c
 delete mode 100644 drivers/vfio/mdev/vfio_mdev.c
