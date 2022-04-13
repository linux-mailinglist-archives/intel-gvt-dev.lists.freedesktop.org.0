Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CBE4FF7ED
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 15:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636FC10FCEF;
	Wed, 13 Apr 2022 13:41:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3397910FCF7;
 Wed, 13 Apr 2022 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649857262; x=1681393262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MJ/tH6MHvTg4nEZRP7I8PZZsaAWqVq17dx3qWr8ZG6M=;
 b=MGqDQsbOCZtdA3/9RWinmH5pkBcRMP4h3W6QmMcN611wl4F11BvROfS0
 BKYyxWW0cZq8IYdIum846kaGwC02L+RURx5Bq9MLG2ipz4Vz8sJuQwbLD
 /w/AYayeuY5qeoa62geIvjP4hPCLKZaVZqXaxMBXkMa6YnPFmO0g5hIkl
 e8kNbf1BzQLndUv/mrF1rLbhgTcjCNa/blaiBZ1Vsf4Hq1NdIsLItcCP2
 bCbXSAbsm0zx0bVicFGhZjFPyQLpqpOOSyIq48UuPasC2fMDKVFBdkgfj
 6ssFhKB62ljblS9HmiUUjdFsASNuBAqb/PhE9umi8BxoBX4d5IMTCR6uB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="325567761"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="325567761"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 06:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="645168758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2022 06:41:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 06:41:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 06:41:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 06:41:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 06:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msCu6CIC8HULsQUAs0tx6J99jmExW/zh6S+tPqO3pxUG8GeFzSLXbt6dlPxeO2bxeZv2+oHUJa6w+Wj32KfCEcPZd/56pRGWoLqNl5ZBT6flqPLjGsDC+lh+1tXROqxFtLee37PR/gs5gTQfwuwiAPDcdslgVQ06CWRBt/c4UUgRo8cMuzgwhVu87Su6yh+pkYccJphgXc+wTx4zQKyKAZ02rtTX9//9KRrV1ex6dujVHZLOSMPsxq6shYFYSOgZd+mNCsRT3Mt4JO9PQftIWlHKps7wVh80zE2GWM+8sviKlNj2pakDD0luycwgKHrGYRYCSZgVltzDEduz0dgT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xINMBQTQxWjFxPcRWYhjB2ReNkmsge4Af4dluVDl7U=;
 b=FSraI5an3ELVsrVPQoVMS+umcjI3/bDSmoXLBM3ySnYdics8LgGDA6AuVLDOfdOuubfer14GdWlxfGA1eyoUDIyJGF459t4v0tP2UPb5IZYIhW3fL7UiWYejoczpr7IjDOcXrtSFt+Jf5oYjRp5pFxpawrZ8cpFfswJMjftmPJ/RidCVOfVegAhTeOuielUHg+SqJy1rwSdE29d5mtj+j0KJ5vrwF+QEkLgJvDmhjhNRJdjcgSVS8ywhbJ0eptUwSiEa5TUKv+ebBFOy0yVjD4eTrVjbUpmcQMyrPGz212Pf9Hl7AUjTxTqPnJfQZG1OPVi4/O9YFq2HPewbfDh5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB4234.namprd11.prod.outlook.com (2603:10b6:5:1dc::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 13:40:57 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 13:40:57 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 0/2] drm/i915/gvt: clean up makefile
Thread-Topic: [Intel-gfx] [PATCH 0/2] drm/i915/gvt: clean up makefile
Thread-Index: AQHYTzGi7LJRMUGLUUG1T3TwDvy4D6zt2dGA
Date: Wed, 13 Apr 2022 13:40:57 +0000
Message-ID: <b15cfec4-68f7-7106-8f34-a1f3017b12b3@intel.com>
References: <cover.1649852517.git.jani.nikula@intel.com>
In-Reply-To: <cover.1649852517.git.jani.nikula@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5544d510-1856-4dfe-7d2b-08da1d533d79
x-ms-traffictypediagnostic: DM6PR11MB4234:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB4234200D65C40F6C5874DC98CAEC9@DM6PR11MB4234.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dHgoliiibiVeUjaDEpeBCZW1Mjityo/Mr2VzvuDSvTcBldPoOJSS/WhK/+16GhwPJUgaJ2dmozQSR6Z7OOVEXReaVbimac70eDFpU9Jmi11meGwiJMu2ToWI4gIz3MEVXS2J+aOGyc5JYWUHC5m7VVehsKe9hvI6tgwAMdUf1tWoFB4PkYra/aj2oHubpN0PFls7CYRvfNWQdi4I6RlW5401UeMCvJkZ8tIq5f12cIc5G30uBg59MUzq7XHklPg0SV/cZriPCepoM3tPngZEYSyCWx9OoepsKRKHrplaHGabxjb5O80t66iTeWVuwcN1KMAVpgYgQClPDfBwvL4QKNgEk82HhWQCCBGvdaeRqSSREmZD78nN+jGrkhjmN8kb3DynkZ3RjxB0FQUuilQ0vVz0tc3CFbUfnvyTz/SGhp158Z1hTzpMVVghDB4R8O6pboCoY3h63wXlrAjNkkbsrYZ5EgbH1DwJ0+8h4ZuTelhYpYfqZC+GsyzLLtIX1g0OT6Dg0wAfG7q3/x96fwDHXSUmLXBvaHKvFiGHjtaVrOfJevoWy6uYP0j75I9BThl2y9Pho5vLYflZLeqsn7p+F/pmp5zOYczbmtwV4IQTVJaOFZn4aAOHUEL8u9tcydQ2W+AqYkMaHX7+FtfHSWUW73fKyJX5g/wb0JphDYOgob06K7J5jhjzT0bjoo2RQdafOwbyyk3JXaV1sYCNAF3vGCwYp+c1VLZ8nb0+LMc0jMfgYcSzJtXx2L74mE1IZ6Ab68SAqWBWeijC+qJmNxtTow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(91956017)(54906003)(316002)(6506007)(31696002)(86362001)(966005)(31686004)(38100700002)(38070700005)(82960400001)(122000001)(2616005)(508600001)(6486002)(36756003)(110136005)(76116006)(53546011)(6512007)(5660300002)(2906002)(4744005)(26005)(8936002)(66476007)(4326008)(186003)(71200400001)(66946007)(66446008)(66556008)(8676002)(64756008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?6t627G0oGUhNfpZbUYzbc1NzGV4RxeihYwA9La07mH9pDN0Bbq5U5Hdw?=
 =?Windows-1252?Q?tEatO12aUBQlOCwaFOtb6tf/e3Ly2P0tG23jfA4fPmWOrmXYxAhc4mUJ?=
 =?Windows-1252?Q?t4DXCEhgyyPoWC2Nv2aNmqfZTMA/tHEdoTyn/7gUI1IkVpjGT7usmVKw?=
 =?Windows-1252?Q?GPx6v/ZlXPdkZc7Iyzu7B1nu/ZbxGP8n19MCEqiI5Hqi//1L+g8u05E4?=
 =?Windows-1252?Q?RHtG0iMWCLASeAyzd759KSnJsmuK6dCzdPp2CrvB9DyR2dyGinz6O7H9?=
 =?Windows-1252?Q?MsYT29IgFS+tAwp1csDFsJXDzV0WaQJ6tVCWwyJGlLXBh9PFYCp8R3wD?=
 =?Windows-1252?Q?qy0WCN7zz68xfSs+/vNN2pQTVnfCiy3FUzNaw3TAbUR1Fpq5zR6MGDJT?=
 =?Windows-1252?Q?9gUQV8TmYjVs+2E4GQCOXBiqtV6rfQQW9gii7JxU4VsuW5NZ/e9u34Bk?=
 =?Windows-1252?Q?ugz9RCoIUacogtYoDkTvmFt74zmTW/JPc6kglmB2TMMA/yZL8PxctS7p?=
 =?Windows-1252?Q?R6nQ6nYmiVMqBeabzSCTinvSVnME7LPOCaLmimo+XKEKNxdiZA3/ch7p?=
 =?Windows-1252?Q?ffLyByZW0D74VmMyMPrL7J2jhwPfrUdMJa2P+/zwxnphdTi862O6dfjU?=
 =?Windows-1252?Q?4PmcptOCS3EhmS8HGEZBFTAWWMTDHGyuRl0+X6Mq1pBrT9pB5327xN2p?=
 =?Windows-1252?Q?2UV/xJI85MMOKs0uWA//ksdXVIpdZh6PMg26BpE0zfI+DOBsVD7oOfSF?=
 =?Windows-1252?Q?f6xf7MOefqaTyNN0ue3wZ70MwWabaaGOCZjJgmMEv7AEvOLKIpoz49A9?=
 =?Windows-1252?Q?UdQxyS78nRLS/M56bjBhX++wyFzBNi8oMOEjZh3hookqCPkXQ4I3dJBf?=
 =?Windows-1252?Q?uY8ZBB1QXbY8KbkeDZt1phzITfa0BVtbrZlZ7vEa20hsh9NcgeCffCBI?=
 =?Windows-1252?Q?4mPx3siShIPv0a005epkbUbaOLT/kc4qI+tWmZdnl6rIS1q2IZRRAFrF?=
 =?Windows-1252?Q?X05d4Q8bcSl+hrPw+4NHME74k7wwGAb/RugUZ7p2SaeM64uq5mTd0HDJ?=
 =?Windows-1252?Q?SSIo4Httbi/o9uQOoh9pLT8XcIDuxl15Olgu+76yzte/0CH8+/gvliOc?=
 =?Windows-1252?Q?PBL0u4yECWqJtFuKgpXLNnp8C9l7/BWpg0gk2QC9P4mQ18V/2efgIZB+?=
 =?Windows-1252?Q?OMoraNMIU7EuQAsy31ELxgvzaKIQntCQ7j5BRn0j6tJFILOzIcl76XDR?=
 =?Windows-1252?Q?aGGS4Gq+xs0Fn4tLSC/4sVs7zgtS8X4bN9w+qZn/kicnlZIImSZsIzYy?=
 =?Windows-1252?Q?1kJO+YWiM3skVBp4wG8kc/9mrd5Bnlo+Yxk60AjQDpF6FXAPenzwHg6e?=
 =?Windows-1252?Q?VzbnpWCbXlwX0DL8EvutLpkydsBtMOh3Ou5rN+ieTbCHFDja2hq3XA+J?=
 =?Windows-1252?Q?IBBR37S6oJNamjp1RC/aK7d+ZQXw/Pv/CtnE5b35NVySb/VryH3YWQBR?=
 =?Windows-1252?Q?P1KdqTo03Kowbc0BmmB15GgT42iOBYcMFL/U09hquXmzQFGsxgbP10or?=
 =?Windows-1252?Q?cT0TbHan+54wuIHkexAa3oowUc/kol1pNikEnfHAygs49taSD8tmgitK?=
 =?Windows-1252?Q?wIWsx66AedWUrir0Rrd60iX13nH6oTgVi5hLIA/M1Q9AWgySaolmd3HU?=
 =?Windows-1252?Q?LmLN5MoTmBgTTzkBevPONMdeQV202LIj/wwqYfxv0YjQVfdYx0zf9EaN?=
 =?Windows-1252?Q?txEvQODZWjRmwlgUTNXM4sRceR7L2XIzziDYtwdy7pGiDUhqRsk4yscr?=
 =?Windows-1252?Q?Dry3QCYHgv6pRN8UPG4pLy6GZ10VMfBOz1WnjxFKfhNAMQlu8tRFHceo?=
 =?Windows-1252?Q?yk8i0nfsTdeXwg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <489DBAD68D11A848B2DF3CB4BC1B911E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5544d510-1856-4dfe-7d2b-08da1d533d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:40:57.6116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJklsDfWcWcJMl21Sp5SONhRV+gdUD206m44lh7ZXgSXVKuEcBB/9QfUIDMf5bQJp/HcEoKxE70zXyoc3e+WKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4234
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Zhi
 Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/13/22 12:25 PM, Jani Nikula wrote:
> This is [1] rebased on gvt-next. (Which means it won't build on CI.)
>=20
> BR,
> Jani.
>=20
>=20
> [1] https://patchwork.freedesktop.org/series/102003/
>=20
>=20
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: Christoph Hellwig <hch@lst.de>
>=20
>=20
> Jani Nikula (2):
>   drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
>   drm/i915/gvt: better align the Makefile with i915 Makefile
>=20
>  drivers/gpu/drm/i915/Makefile     |  6 +++---
>  drivers/gpu/drm/i915/gvt/Makefile | 30 +++++++++++++++++++++++-------
>  drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
>  3 files changed, 27 insertions(+), 11 deletions(-)
>=20

Thanks so much for the patch.=20
Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
