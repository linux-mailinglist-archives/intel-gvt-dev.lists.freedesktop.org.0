Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0748AC5C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 12:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BFC1134AF;
	Tue, 11 Jan 2022 11:23:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A131134AF;
 Tue, 11 Jan 2022 11:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641900222; x=1673436222;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=UiVBC2Tehr5n5JRliv9xJFr/3TmXYOQljMhU2igphGk=;
 b=E3VzSCx8c9A8R1uv/kKn8Xw38PryzmEQ11NNMifZW/TwEvvgK+1ZMVWi
 nt+KT4XSOx9bFlBZLzBx3rysrnN1KW7HOiqdESxn0jLkYn34vml+Nlrpi
 yG571FgsQj/4yvfU+xPqBOQ429v6rB82+DpmtdOPBPudyRGF9gmA1CAJr
 Wl4hjI8qqHe/0xnIkZ/0zPqxN24xWpsibFbsaKksuwwitoVkLMleYNfFr
 V0G5JNMTSSYvKUFKyqk9acwx3MvQHvaGnxraB8vE50kBt90yBmvGRqTYb
 XdyxAyhH5P4YYQnSPzqiusaj4NICWK9SAdJUCTjw2unktbC9s3Mg7YUIo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="230804602"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="230804602"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 03:23:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="690965592"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 11 Jan 2022 03:23:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 03:23:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 03:23:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 03:23:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2hMQnro7vWhbDww96/d8iAhkTPz1cLavBbbFFCnLc1Uvvf5FEMC5/E0txE8VX0Ia1iz3g/sVR8mKqfhv+WjEc7GpLNeVf6fhfC9pkfCNh6+b4PZqUszssvYu/bA66wQKa/mcRVRVsocCOZ6yUcrjuoTn12Yzh1/MHBUPBgVIWn+rW/3a7ge9FdfspP0NEJaBUIhxp5r+/dFZwz0ep7pQueJ+UtQzEvOAHqLeR/r0stIuQ8HC8+77FjA4Sn6rRqphgY3ga+dTGu4EdQl+BZl4LPmJUQFqJIUDY6rU/k4VKpxD+G/Eevf/z060purp9bYV9/RmMdnIkiucR8gIPcXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Eivhu0Oo40U1ZZaII/vIQWslxyvMfzcTA3PMO+fHOU=;
 b=JKm+XKeea+TA1SXTHOx5TMyE6jUfMWCMEE2kc/EBUBntG0y/yyRVWKWJiHwPLszNtj2PHyql/ZBjdCSCona5tZH8AUlCrD4B4bC8l8tfnp+8x+htACVkD0hwsoVg+0c5Psb9zRwbwSSQHhmiuHzDFRFlnpi0mgxp6ENCU1PT238HgQWDoxjrKDb3TlaivcF71f/7AGLrO/4V7DYONoN1bDEQ3MnLceg3G8atP9PZ9BWdE0EAHjfIxXn5Jzps2kJ6H8hj2BTkR7BQPrCpZI9kefMRN8Sc4faZ7ja/57bw3g9f53qqdQF/nr6afi967zx+4ia5drUMDQmgTsNUozd6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Tue, 11 Jan 2022 11:23:38 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 11:23:38 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [GIT PULL RESEND] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL RESEND] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYBt2uCVmZpPe1YEi8RIiswB/1aA==
Date: Tue, 11 Jan 2022 11:23:38 +0000
Message-ID: <789d3357-c016-8db1-185a-f9ab074a15d8@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa88a787-525a-4aff-ec95-08d9d4f4d0aa
x-ms-traffictypediagnostic: PH0PR11MB4840:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB48404A866C1C36413A68F243CA519@PH0PR11MB4840.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P33FLsY+YIFPtUsYwXR3jQ1SR6/wEend8DotPc3lXWxROrfN5EB9SwLZo6AZ47Fc7TCXbU44WY5EgI6mBsk/joS88ZLN3nNrs0M8GVU4VvRmzwfMbzVfd9rjhLcPrD+SVUy/E6PHiO1farQThjGBFM9QuJKAq6QQKoKHzxT6dC9kH/l01Zxf/700UzVffe4VoIZPm/PNSGBGWjzGpJHeYvviwlp/HUjvVRKXu1bmmgbWufKyP92AhpWKQRwXWHRXLMvkNFTCrQ7xCeA84yjWhR/VfO/pj5IoCPddIKPma2BBvGRzPVsqKPXdgP+XazWA7Y5IA4Ni7WWGPwOflbEO3o8zWQvz1GEGr1e3iTATweQnFhJKHN6rxZOQTD8VrOB9k86Qx2TLVg33/j8g2zDZB9SeleVpy+K69cNDlcg7g5UH4ZcN5g1CNKBFZWoqywAt1s/jVng1tY/T3f/VY8DqqvWKl8h5nm3kYOJn1fUNM72OsiKpcMyo4VgL4boOjEhU0k2DWB2E2JkhcG3rFjNRuOsL9SA2sOZ50A0LMHVm0Pb9ZQIC/8r6QSi2jPFcLxCec2ruvSPdrAjLMbBX9Vky9xwwhKQm4IVjojOWVyRKX30XxfGmRbgJVKP39pQVV64acUDcb+rRUHuQl3j2y+byBqT0938ZbNb7qTvddrCIhDalDUQIVtEPcmrH1CS4ZVrJCPfE77OCahWLWmJVtRrhwxSVPzItMNNjCZmRf4z6/PMC88bj8BBbD1miwO+2kGAi4KzwDerM26qYVUujfqO7D2tKyhuYAz09ggLFcmYvoxLg2lMCYfQTCf9fQwQFDU6ddQb+UTTWn7zcVK6EtYCloqKDWU4CCe4oVBkByQEYo70=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(186003)(6636002)(91956017)(966005)(2906002)(8936002)(5660300002)(82960400001)(6512007)(6506007)(36756003)(4001150100001)(54906003)(8676002)(83380400001)(2616005)(26005)(110136005)(4326008)(31696002)(76116006)(66946007)(31686004)(64756008)(66556008)(38100700002)(66476007)(66446008)(316002)(71200400001)(122000001)(86362001)(38070700005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?3OH7pmYwflQHMWT8KD3i7w0dvfu091w6psIp1dLAEthDnNQ4yU6kfJrs?=
 =?Windows-1252?Q?fKedTKea2d93BQDGt+jYQbDkjQD85H5GuikF3kfTMTB2LMd3xU/giPLH?=
 =?Windows-1252?Q?FsDk6vZ8imn9tdxRPKwTk2/OLDtNlx7ynvEQSAzXhKMaME/729mjlC7X?=
 =?Windows-1252?Q?kXG6aqSBACREr54MWnenWFcwOTjqp2Jw3GVxRP8/ApkzNsf9cPXpyOzN?=
 =?Windows-1252?Q?j4KlNQXBpLmuh/2vqQYySpn8ADu0J0dA8tgy+J1FuSeTRRYcUJ5ovV0h?=
 =?Windows-1252?Q?fovK5cLMGs+kbNpZ+AzYEHlq9s3BAzy8cesMdxCcizgLrhFTNSb9qQrJ?=
 =?Windows-1252?Q?3Ji7g4rHBEW9Gj0S53xUCD+x5HGywmO54/RGTqVq64GQxKPb9wlo8b3P?=
 =?Windows-1252?Q?u64OOZ/4+lWgz7Tuz7BwRBgrPGwONHNa8iTXhJh1Pum9Zh0StAovdj5M?=
 =?Windows-1252?Q?6+uHeSxNop8LQ3u878zOklUWYS58OHXZqcKdP6mT2pif6fLoGPG6++Yv?=
 =?Windows-1252?Q?qfsrsgO3XUzAqnr4QSJUSfSv+ms1qoxmUH8PJPZOmboTY9Bfcm+ngdnD?=
 =?Windows-1252?Q?HwpeYAuYt9tmunMpgPcVfhmF46t9qPYBl+3OX6EZpB4CKYoi8hbJOgR1?=
 =?Windows-1252?Q?Uc987SBtPGr4y6Hlw5oQ+2+L40hGlzgChoH1j/1AfGycPdDAPtjs7y5S?=
 =?Windows-1252?Q?9h+LFwqE2Uz3Vf8l2WGZIy+cH0tsP7sMHuCLjf3cat5at8A0tDlAFzvY?=
 =?Windows-1252?Q?ktWMp07BsGYhAxBLqla4y96dvIpnHF7+Xd1SSvYVRHPgqQB2aQ7vHLLf?=
 =?Windows-1252?Q?TnuIpAe4Rf4jSa7yGnIuqxW+Te49Rzp7yntOC/LdPthdhgjHHodEDxWP?=
 =?Windows-1252?Q?hgYzBB0E2/fXh5cG8hlK4OS9us2dmdhxI3weXQ1Y/cUl9voFJnXkEk7l?=
 =?Windows-1252?Q?2a7w6nfRaEbsa2aZ9s9mshtIPrkoiHFCP/iqCIiEHQwO3vQZLS60bkg3?=
 =?Windows-1252?Q?cBfcj8FY9lY3f7/fe3M46izQLg89J/1GhF38XY5q+hm5Z102CB7cJsjd?=
 =?Windows-1252?Q?JvHzauolNzf6/W3Dtd/e7gCAjYlPO6KRUBTz6qkprfv65gSJNSug2VP6?=
 =?Windows-1252?Q?yrlG81/QzHkk1uXxm6Rmwge9Uyjm4Lcx/unfc3kAqhW0EVk8cZjS/v8z?=
 =?Windows-1252?Q?mCxyrEeGkniy3vcOCPju7wLE3iaisUfPJxYE2kzJqsvpP+CQgMXlSmcn?=
 =?Windows-1252?Q?TyCA9N9zeHyw8twlZuUHFVKE3HqhxNetCzsJAW695LRcZaIoGbQWCktM?=
 =?Windows-1252?Q?mabIKQPXgi610GicjQYP9gVrIpaVEeD8ZStodniveNdKiFX3qx4J56SV?=
 =?Windows-1252?Q?GzKsdZAZhpJmaj090cN/ALY6JyNWTLRJVaSInexA2APiBDCUmOUVLljQ?=
 =?Windows-1252?Q?cqVBSv4AuYDv7nnyg5VaLHP2cHVl27qG//QgjmKM5ajs+ESS9FaRuhHT?=
 =?Windows-1252?Q?Rhub/3St60i04FxB5OB2XUWrfACuVLcqq9i1L9ghWaBXK3Ree7feVdr0?=
 =?Windows-1252?Q?o5xbwRV3cso93zt6zbpSbcvwYW0iWexmluhnmJI9lfXrmls8OlBK3CiB?=
 =?Windows-1252?Q?RDflcQDDMD20QUGot7PbD/4o4NuBBoWpoEugnp3Te/zG6VSQ48g8lrxM?=
 =?Windows-1252?Q?TUbCsteRgeaXNxpZb01qJj6//SAaOBNco+b3g7SLXp2Wv7gtKNIEhXTE?=
 =?Windows-1252?Q?pJ4gmq6eUAe1s42Y1ys=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <4846EEF681A7F1419636ABA46022EE82@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa88a787-525a-4aff-ec95-08d9d4f4d0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 11:23:38.6669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaBEkpdebqgo4OWUeUMkgoFmn66MNO7tpWVcOkKQbTC/Ih+v7t12qm/MDJ+W2N7Fkfo/tTh/UKC/OsFQntICYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi folks:

Happy holidays! This pull mostly contains the code re-factors patches from =
Guenter Roeck and Rikard. Also a minor change from Zhenyu.

v2:

- Fix the problem of message body encoding in Thunderbird.

The following changes since commit 3bfa7d40ce736ffbbfe07127061f54b359ee2b12=
:

  drm/i915/dg2: Add support for new DG2-G11 revid 0x5 (2021-08-06 09:03:10 =
-0700)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-01-07

for you to fetch changes up to d7a8585430f2b6df5960bbc305edcec5a55180f3:

  drm/i915/gvt: Constify vgpu_types (2021-12-16 09:13:02 -0500)

----------------------------------------------------------------
Guenter Roeck (1):
      drm/i915/gvt: Use list_entry to access list members

Rikard Falkeborn (9):
      drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
      drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
      drm/i915/gvt: Constify intel_gvt_irq_ops
      drm/i915/gvt: Constify intel_gvt_sched_policy_ops
      drm/i915/gvt: Constify gvt_mmio_block
      drm/i915/gvt: Constify cmd_interrupt_events
      drm/i915/gvt: Constify formats
      drm/i915/gvt: Constify gtt_type_table_entry
      drm/i915/gvt: Constify vgpu_types

Zhenyu Wang (1):
      drm/i915/gvt: Fix cmd parser error for Passmark9

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c       | 18 +++------
 drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++++------
 drivers/gpu/drm/i915/gvt/gtt.c          | 68 ++++++++++++++++-------------=
----
 drivers/gpu/drm/i915/gvt/gtt.h          |  4 +-
 drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c     | 13 ++++---
 drivers/gpu/drm/i915/gvt/interrupt.c    | 10 ++---
 drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
 drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
 drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         |  4 +-
 12 files changed, 72 insertions(+), 79 deletions(-)
