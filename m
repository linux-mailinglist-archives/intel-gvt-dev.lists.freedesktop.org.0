Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB00508D1C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 18:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BFA10EF7E;
	Wed, 20 Apr 2022 16:20:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632510E3B5;
 Wed, 20 Apr 2022 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650471616; x=1682007616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7DOC0KbwwLCW/eZCjEAw7QyLhvHjK+4yGm1/cWqqrgY=;
 b=U0ODgn72E6IstIu6cb7dKW90YtFMnTOb6ErMhKTGq+QcJOopeRrZ638f
 +oYqOEk43kTXK11XUwJjWhYaz54nshT+TW3Ri5uAVrF5n8+inT8P8zLvZ
 l9aTswFhJZHsWtlALdFF+jsr8OfNvtRbpKzQoPkcr72H1p7M0ZnJzThWO
 cl0z+JDrsQsE+acRMKHmSFFQJVVYk7/qr5qkoiI82+KElZchT2aIq2jEx
 EPzh9s8mzYhFbM9iswXyNHwXsm+bkj7miBZ1Jy2/Kivrz4e7osz0Gdmwk
 ZBT+du+3h2ELEyrejO9u/nZ6oIJSmlxWt5zvCzrdVitP0M4gKSPA2cCdW A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251384955"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="251384955"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 09:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="555271933"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 09:13:38 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 09:13:37 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 20 Apr 2022 09:13:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 20 Apr 2022 09:13:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Apr 2022 09:13:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8JbiuQH7vXEP4BY02E0l+HYvs3zZHA8vLS4/eozm2Gl7mYod0IzmipRZOmFace/mW/7QfgH2pye2YVVrJ4B3UkURhLMULOzxSJTkPA/8yixoRRKZQRKrbCGvkDTUgDmm8INJNPtSRDxfqwXmqYUBcfoHbmbPI13+hUyaQsaricxjRq7talWYZ6Re4LySB0z4mFK/Pgo/WVb0ETc6aDKG22j3jcm23+XhxBg5wdOBiSz24yWbV2UPKNRgZQ7e+ZmBdlD7JxncpSGkk9PrNdgYeIToLWTUtTEzy2o7Z+zmKpNFGyv7OPxGtvT++LU9pQ5LkEStGEviAJ9qudjOYbONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFYzHmERDV9ci6x/RLTP+kM3yMQXrsIMsVpeV557F1w=;
 b=Ohy4k1iHRwpOEPM3G0uFLJoBgK/C/z7ND4QhRzA+YkXxkK0e2zzimYWegrumi37dXadyAo07//nydZ0WVJ6Z8C3Tt+o7ulmEtn4n+Xw9cNfmgsHXxBkvZB4COTzUP9YcMbEepDvRv+TjPyDGcBcJPHdfWYeokbpsij0GHWWBRGk3ZRz1iO3rmZXMcTreUwf9VXDtX+48jw//HPCEV3RUa/Vi4EbCP3tH8W31c8pWAaM+babe7j6iMHbW08L3C3Bh2WyC/wYkMYPd9G9xXYZpo7Qvk68retxvB1jcDEuu76uz/KTv3seYmYnyQlfezg9FDGhNj5H0GRiUCP20BsIPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MN2PR11MB4496.namprd11.prod.outlook.com (2603:10b6:208:18e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 16:13:34 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 16:13:34 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PULL] gvt-next
Thread-Topic: [PULL] gvt-next
Thread-Index: AQHYVI1DfNiTLpeqnEGvHyikgylmNqz4tu6AgAApSYCAAAXsgIAAE+0A
Date: Wed, 20 Apr 2022 16:13:34 +0000
Message-ID: <b36e6a2b-74f4-83be-a1ab-383536cd486d@intel.com>
References: <18c3c1b1-6f78-6140-4ec8-e18bc7916352@intel.com>
 <20220420121317.GV2120790@nvidia.com>
 <16fd439d-6a6d-63d0-76d8-16daadfe5bde@intel.com>
 <20220420150215.GA2120790@nvidia.com>
In-Reply-To: <20220420150215.GA2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2a628e0-24f5-4ca5-7f8a-08da22e8b868
x-ms-traffictypediagnostic: MN2PR11MB4496:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB4496E7BC7EABBEF6E9F9AC92CAF59@MN2PR11MB4496.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c3l0qmIsab01fsuy4DelNzMbj7nvg+occX8/Ph7yBgjzlipQn7bVX9WVM2BEHgmxQzqIbj14EQPQJ/+cmUcrwacIFVWDDfx+R49jGSY0j/YiPAXv33rMitml7UMGdU6KfEGh+nSgXY3wpBNrCe8uiZ94N98vNFqASLcEx94OnNnPa/jqJ1G/p1SBlSLucXPLqRQYW08nju2YCH9s+rk7G1yel84Wd/Lg7yzukH/VMB1qBcmTYyQwxvrS6yXu2uJx2HLW96gCuLPYYMSHn0/bQ8BngUsPBcDfjDkAkz0gslYqJI/S6W+Di8FkwYHu/05OKff7G68UaMbzeGvWvEPoDw0eJKuPOdpubVBcl0MHN6Zk0fowN0Jih/7d504u8IWTGlKZXsm4mZ4aIp1RfrD4J/sHLAJBbTafsQTTE9PlxsuVTUZecDMa5AJj9sHBz+GDimnppUCUannpvaI99ly2Oim4Ef3q+mtwfjRZOWB1PlbDw/S0A9/pXQSTW6rkREWo5LeKFiOAVnSypIPm3puGxfiXlssYJX+JlIrJqaa/2XtasGx/18Y5Eau4bRj3nCf9Q2j2GDM01rWl3tO8IgLgqJ0Ocdxe4Rfd6uScENKoxa/31YtEZ6UaM6wqHIqzMV5Sn1qhywCKiLe6SuIAL+F8lqZU9kr77Wmh8efLaJEIU0h8sE2Hor9W5M4VmT0bfUoPcPGOESK5id/L86TwXynxB6wKYCxAZnxGL51k+D4sINoZT3UMfA/J3KiMi+GDwzc2Ri/OzMCaPNLoQ4xaUo3BdgeOc7NM4PRUH0uOSvd5vRtPS5zz88QGJpEeFb37XZqNCUCXiSxFfFsSed65yLa0aq9iBBtxJegqShHewUV/bVpqy0Q0u6NbsYy0Z6FQ++aP4i0Fk3TiD77Eqlyzl5ds5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(66556008)(31686004)(76116006)(26005)(64756008)(4326008)(53546011)(71200400001)(36756003)(91956017)(66476007)(2616005)(66446008)(8676002)(6512007)(2906002)(66946007)(6506007)(5660300002)(186003)(8936002)(508600001)(38070700005)(966005)(6486002)(38100700002)(82960400001)(316002)(31696002)(122000001)(6916009)(54906003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?9radLZI2CpUcAanE0lmnwbc2xKvHK2wDMFUlDv/0Odh9CWL23q4umA/x?=
 =?Windows-1252?Q?uHOEqN5FWx73U5cc2w07Voe0Msw0ECysScIGd7o+RzJd5OStYwZm3pc9?=
 =?Windows-1252?Q?X++Jdy1y8uSuh7FM1Nlefejlk0GHZT8SJWJ+1DarfhPT1Q0kcfJ7KoHB?=
 =?Windows-1252?Q?87sZRrmwmUyhXNjO+xtbw4Y3J9VVDWomYGGws4EG2s7MkqFpV/BjfCYY?=
 =?Windows-1252?Q?l7/El+R4h0VhayasXpMSSkIJzVSXIfHK08khex8Dk9hpbwK8C3/faNsr?=
 =?Windows-1252?Q?wGdb6xI8FlEL88+UoPUJ2NJ1Ae6wgxOwdSlj9sqmB/xboBGx5iVnVE9J?=
 =?Windows-1252?Q?Xnf/oAldTUt3Pn1pUch+bInIohnRQlCcr5MKd9LJ3a5D1YUWdrDxswRs?=
 =?Windows-1252?Q?8HGZJ26g16qa57Z8NZOEBg8Br+4ArzOjy17/OZjUiktAumVZEkgLfzxB?=
 =?Windows-1252?Q?dcAqBcHLYtmut0tyawwJ8xziBf8xC3e9e8ptbrNPHFF17I9C4F7yCx6G?=
 =?Windows-1252?Q?KQqAaD8dExOC+7lsmhcYMWQD10AeHe5h2elfwd+Tp5ci9yGSK/gi5Kvd?=
 =?Windows-1252?Q?10StgpaiTxF88v66fRAkI5C3VMHnnh9n5xHDVzENZnbLGGv0BGJ3NVV4?=
 =?Windows-1252?Q?hDGRndq6qf6lD9zPDp4Gmqnc5OT0l3e5lhtsBJaf5+I4YGAP/jZZdr0w?=
 =?Windows-1252?Q?CpaOKGwJ1coNzbf3ZO3bvVP2uWGyY8Eg2lIwBHKoI9R/G4W8RTplUpWO?=
 =?Windows-1252?Q?n/45X6KTYgsu4XBoHkFIZZYp9cBVmL7tc5AfbOB3jamdu/LDb1kR+22u?=
 =?Windows-1252?Q?DBTNNH3+0fiJbxAdkfp602zPqTWp+MglgnvSmnmRIY0Yj/HiCB2Weyja?=
 =?Windows-1252?Q?NSkszd7zjZW05UAG6pZHTaAQ0+E5kMtDpDEoY1wX2HFjZPxr2x/9zF84?=
 =?Windows-1252?Q?iMMKxPGAAzh3Tt5xEKYXV5YnxQ48wvfDIx40SLTtEnLsriiW8uiIEExY?=
 =?Windows-1252?Q?fyhuad/p5jDA9E0UcmQT+708SAGn/xJZhSWXU3IPFeV5CjK5034J1oS+?=
 =?Windows-1252?Q?LMa41y3MAg/TpuL+Boko2LikOkg8tdSDRlcgSUOBEFka98+KdbHUa9Ej?=
 =?Windows-1252?Q?9540B0yeSgLoevnv2UxI2+IccZYThkYv0Oe44wVjyIia2jhSY+qAPhds?=
 =?Windows-1252?Q?+D6KKxWNFEt9NcTP2J+nNlMCTYue53Pc4mqesOu7Ku9yi1Bh45B2rNVx?=
 =?Windows-1252?Q?7O1j/YJnK+gKmVeeqjpAIht2prrfHRC+6oNsZK0xzGuz8pOiCxzUUbyY?=
 =?Windows-1252?Q?WmlGwm868BCt9IIUo+3+jQCeMinVccxapvfeqfhrHRdOOf24WaPl5mL6?=
 =?Windows-1252?Q?xtt2oJoW1CQ4/4ssrUL3/MQqzAD3ekgVlO3Ix4ugoafEzUuLRpwquTej?=
 =?Windows-1252?Q?n6fsaVLCrSugMGZHMZffezcVTkrg/lq9oeD1ewB8HliT/3Q7nl7pNgsj?=
 =?Windows-1252?Q?VVjh4LDWSpvQoRpZwlN6WSWvi5NefkjPETT+qAVrPzROZQ/GGI/QoxpE?=
 =?Windows-1252?Q?jyjPzIzLCg2NdYXD5j+AR7GdFk5YaHekC4WJoMbr5gFCA/ybFup0lgbe?=
 =?Windows-1252?Q?FhJZxoHCsGC2AqDLVzNTza9m2Fgt34SH5hBy7YeLwMY9LQG3MNA82fhX?=
 =?Windows-1252?Q?RZVCb+f9ApFxllyhPj3nziOzZeBBYwXpfT+bC4gTxdSFvS2+DJ8Gc1xU?=
 =?Windows-1252?Q?XPkgcDedqXT7iPWiYHeH63/tBG1XxhIRiVE6IclreimwPlGxB0HK4rW8?=
 =?Windows-1252?Q?zvHoOS/nwYMrNCRcfQNWuVx9IO+ZAgvB0yljqE0+f/Q7WJ/pTzIlojHY?=
 =?Windows-1252?Q?uHrrSFeJArCQyA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <62D5A6F553597F41A4A0EEBF1DC06A81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a628e0-24f5-4ca5-7f8a-08da22e8b868
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 16:13:34.7178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWLTrf2VwfE/54pD+b0GiwTiamy2vUeT78CNRDdJDa4wCnnJ/2x14ZmqB5QSABu4fQ3POcgCom+NA5SCXbTG/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4496
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 4/20/22 3:02 PM, Jason Gunthorpe wrote:
> On Wed, Apr 20, 2022 at 02:41:04PM +0000, Wang, Zhi A wrote:
>> On 4/20/22 12:13 PM, Jason Gunthorpe wrote:
>>> On Wed, Apr 20, 2022 at 08:04:31AM +0000, Wang, Zhi A wrote:
>>>> Hi folks:
>>>>
>>>> Here is the PR of gvt-next.
>>>>
>>>> Mostly it includes the patch bundle of GVT-g re-factor patches for ada=
pting the GVT-g with the
>>>> new MDEV interfaces:
>>>>
>>>> - Separating the MMIO table from GVT-g. (Zhi)
>>>> - GVT-g re-factor. (Christoph)
>>>> - GVT-g mdev API cleanup. (Jason)
>>>> - GVT-g trace/makefile cleanup. (Jani)
>>>>
>>>> Thanks so much for making this happen.
>>>>
>>>> This PR has been tested as following and no problem shows up:
>>>>
>>>> $dim update-branches
>>>> $dim apply-pull drm-intel-next < this_email.eml
>>>>
>>>> The following changes since commit b39d2c6202426b560641e5800c5523851b5=
db586:
>>>>
>>>>   drm/i915/fbc: Call intel_fbc_activate() directly from frontbuffer fl=
ush (2022-04-13 17:20:49 +0300)
>>>
>>> ??
>>>
>>> Why did you rebase this again? It needs to be on a rc release tag as
>>> you had in your github, not whatever this is.
>>>
>> Hi Jason:
>>
>> Here is what I understand, the pull going to the drm-intel-next
>> needs to be based on drm-intel-next from the branch gvt-next.=20
>=20
> No, there cannot be two pulls, as I explained when using topic
> branches you must never rebase.
>=20
>> The pull going to the VFIO needs to be based on -rc, the
>> topic/for-christoph brnach.
>=20
> Yes, so what you need to do is:
>=20
> # Get a clean tree on drm-intel-next
> $ git worktree add /tmp/gvt-next
> Preparing worktree (new branch 'gvt-next')
> $ cd /tmp/gvt-next
> $ git reset --hard b39d2c6202426b560641e5800c5523851b5db586  # drm-intel-=
next commit you tested
>=20
> # Merge Christoph's topic:
> $ git fetch https://github.com/intel/gvt-linux.git topic/for-christoph
> $ git merge FETCH_HEAD
> Auto-merging drivers/gpu/drm/i915/Makefile
> Auto-merging drivers/gpu/drm/i915/gvt/handlers.c
> Auto-merging drivers/gpu/drm/i915/i915_driver.c
> Auto-merging drivers/gpu/drm/i915/i915_drv.h
> Merge made by the 'ort' strategy.
>=20
Exactly what I did on my branch except that I sent the pull request based o=
n my gvt-next. :(
> [..
> Merge branch 'topic/for-christoph' of https://github.com/intel/gvt-linux =
into gvt-next
>=20
> # By Christoph Hellwig (27) and others
> # Via Zhi Wang
> * 'topic/for-christoph' of https://github.com/intel/gvt-linux: (37 commit=
s)
> ]
>=20
> And then check it against what you prepared in this PR here:
>=20
> $ git diff HEAD 888471711a80b22c53547f3a625f20f487714f28
> [empty]
>=20
> *do not rebase a topic branch* this is very important.
>=20
> Now - given that we can see there is no merge conflict you don't need
> to do anything! Just send topic/for-christoph, exactly as-it-is to
> drm-intel-next as a PR and that is all.
>=20
>> Sorry this is way too complicated to me. Let me prepare the new pull
>> as what you ask. Shall I send the exact same pull to i915 and VFIO ?
>=20
> Yes, exact same, this is important.
>=20
> You were very close before, the only issue was rebasing
> topic/for-christoph instead of merging.
>
I will send it by the end of the day. Thanks so much for your patience.
=20
> Jason
>=20

