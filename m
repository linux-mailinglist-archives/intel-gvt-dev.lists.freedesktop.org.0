Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D448B561
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jan 2022 19:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1601510E173;
	Tue, 11 Jan 2022 18:09:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85C10E173;
 Tue, 11 Jan 2022 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641924541; x=1673460541;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XpwEa9jC6lY9aPfvmXOAIMETtUSQei557PlJOmBFb20=;
 b=eoi/JHOApuqWwFmog6HtOOOp7VNKjtA69/HCp6usZ1PbKmkUe+pzgwJE
 e1upVbOoWhIqrSNHpynizTsR7n+Sd8g0KETz/0Ho+v2SFzeJGR/w9LqBX
 ElYH3mm3q5Ia8ZjbawoZJaF1kswvfVPDFwv8GfTp0jUr0xuq5D1IDpmCV
 6rkOf9oth6QW2Z4i4V6HZxA+4icHPoXp7hIUwOTMeskh7LTCXRaKXUXTR
 XIV5aHCwwQ9U+wSmKSLrJDgclKWkNVhdUVGX7vIO0Ebf3JgiFSZPzyuQ0
 ek8gABVLHxzaQDsElnmhp5jOSpqB5q0kcSsU1Jo+6RMR1e2ARdHVj4RIl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243349880"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243349880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 10:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528389606"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jan 2022 10:08:39 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 10:08:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 10:08:39 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 10:08:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neY0g1lfPsurQFlp5H2scXksATcLzn9RD3LLzctKxl40gKt7M+Qw4D1VYWI6aVsgoFkdnfNRpxtlHzudoulhkHlNYTVpcy5gK8Gqnfgim1cuFt8I4omTS31gGOpnm49TR0g0WHU8qC3V4syqFKSh2xwjX/nuVsVbC8NKrxP5wNpAdFyWL243VVmct6Cc6xvjLXJIKf+5HPU+kqLbNvMAveTedp60WwGRcfAR1hHClK7TldvB5g9YmrFzS0c38n9+478yzmF5H6Otw6eLn/I6vNTdnRz25wJtZ/hMbr7c+LKhZY2TLVnt7R04VIN0lJyJO/SdjPEO3D3MIessxSQz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWYBQtKgoBlGHGDKx2CFZAbO2eCZALkv0+bQManrFXU=;
 b=WaIkz8i5tHuOCo4ygNahCMpD5lcA25KvN7h8+/FPQqoSLa7SABWjU/H2fljWlwc9wsIXnujJVXXYK4lot1xUCrY1PGiwc4uxi9VFt1qPoKHuEoqxV5ww76hdLdld1kkvzb5PFVBnAJMdLhC2lu+Fi0ciwa48pSur2CG//D5eZRKVirORHJReoRVlzSR2BeOXJjLwHYrF2WTa2ZkLUX4CebiUmMiHGfMCxQ8sFyJCYf5J35C2O4dCnmW0iKNEgBaOy4UNif6TL0bSBTIr+YONjI2hCiKv0VMtHj0gzB9HDPrmk92ZmIwNy+SW3VCFOPDqSE/w+bchbBQaXDmFoUvRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Tue, 11 Jan 2022 18:08:25 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2cb5:24ec:fe40:2d47%9]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 18:08:25 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next-queued
Thread-Index: AQHYA9Tuucz5FdQejkegRXcQeTo5nqxdZ/oA///zkQCAAFPpAIAAO0KAgAA6EgA=
Date: Tue, 11 Jan 2022 18:08:25 +0000
Message-ID: <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com> <Yd2W4T1Y8X0cP/PL@intel.com>
In-Reply-To: <Yd2W4T1Y8X0cP/PL@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45a6082f-50b0-49dd-131c-08d9d52d5cdb
x-ms-traffictypediagnostic: DM8PR11MB5621:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM8PR11MB5621F63443DF7C83C457115DCA519@DM8PR11MB5621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekoskOOhdrC9MbwmybvliInDMxveM4lGv+YzDrfEhjHo63IyQfEbC5FzrvNOc4p/08BXvhe+otmhrnMy0BWgOtM5SqJZMKEZYiMNrAWEWsEDbFVDWt3m5QdszxvbU59/vPjfmTZHyX/0CSK0zGHmDGcAblf1NO518VA1dsC7yYl1b9DXrVUqGFVJGufyfyk4eyIs/9Y9qqoMEX4YuJ/mPJ5GO5UyWyHIV6JDL/rsu6FrdF++K+CYl6EAtwDGpudKXYpSDvg8smlxxuIA+WuSZVWRB5Zu4tB8Ejri0qFz8QoQ7nY/xyNOhU5kXSjhTKF/5yuh07MyWkzj/xQ8goHx7yuAv3H3RTkl1L+gZHdEymKMgUoZhtUS7PN4BzZq2wqGWUfS+j4wRRFRU20UtDXq6w6SHWk3FtGBnRs4GpkXTLie0HAOd8jykyQWrpw0hfKFIjz1RWfKTAtKOCkd5lYeekgs3XdIF7EKKFSWh/G26eFajnURH2m67n37OSiCgSsx+7wFK0easH0jM45xKqsaRfCa6XeQ1BQIAaCIippFTJm4QHz5gkNL3eMN2yGog5zMbaVlcuo5FCyg4EMuv8lfgT9+rMHLZnCr1hwale+el81OHrQUDd16hcyX1+3BcpGU+DAmQHCFIn321HmJbs5ysA28lTuPByE8pFanBAY3CJQO7wkxIJ7t8SDplot2DemdpflnVE9fl909xF2gjDgCkGfNEJgBMW11HpSXiDNT6YBEx1qse1LY0wCQ311leZbIMlCdwSb33vs49SdVJ+/8akaoFsO2sRwfhwbU1miGX4LWeeUrQh12frz+fJO5YpbRKCMLzzm+LXtIlILhnbfHq/FlNogNYGRriv1BANA65cs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(76116006)(31696002)(91956017)(86362001)(4001150100001)(6512007)(316002)(36756003)(31686004)(38070700005)(83380400001)(54906003)(6636002)(66446008)(66946007)(6862004)(37006003)(66476007)(66556008)(64756008)(71200400001)(6486002)(26005)(38100700002)(966005)(122000001)(508600001)(53546011)(4326008)(6506007)(2616005)(8676002)(2906002)(5660300002)(186003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Vi0KFmEIFuSmda7Kj+MABZn32HtNP4Hds+/elBU/oYHdSXzvdprTyku/?=
 =?Windows-1252?Q?j1f0rM3zkubAqvV96+uViS1Vq+uKFdECKl0WvEOHT+Y7b7CaNnDfSk+g?=
 =?Windows-1252?Q?YwYD2z+LUBTZj1jhZ/O2DurD8GGQbTp6J6MM3xQVueemb3k2/8A76lfh?=
 =?Windows-1252?Q?wrdpxf57jdRakBsbiwjWQLQCKptKlBtYCFbWY6QD+hS2plTgFlxdk4yb?=
 =?Windows-1252?Q?pjO2tWKaN4CTY3Jow8b32kWOnkZtXNn2TwO62K/DsKwrzM1xZRVDIMrf?=
 =?Windows-1252?Q?C5m6t64tOD7v7NXo64mV99SGZS5RrOWyWkFJSq8ojsIqoAfKDIBMM/d5?=
 =?Windows-1252?Q?2xgjG01lI48M5PdJOrrEbRoxRf9XasdjWV/t8WLr5Fg/yfarCMxjqIx8?=
 =?Windows-1252?Q?Yg0CJHreDMxI7OXnVqkH0+igwJtXnWjOc54NjrnOcfaSgNdcYWfvy+z/?=
 =?Windows-1252?Q?Vp6j1k0a/MIsoC4GFDvEZudn2JUU9cRo8JX49R75oiHTAWNC5sD1eW+m?=
 =?Windows-1252?Q?rl7J8lej0Dra8W3u9UHT5V0bh3sdtWzhc0h2zkQhgLdlWBp5bW8LTzTs?=
 =?Windows-1252?Q?5KewzFkCuXRAy5HsZWS+TcJ8mSWKAQAvYM2IwuJVYG8+8XI6dDkySE7C?=
 =?Windows-1252?Q?OWv6AIVZ8d74iJRrie8HNCRCexO0YXNo815uX7vm4yJxenh5Sq6HRT8D?=
 =?Windows-1252?Q?eQhdU6PNq3tsr9RGX5IpNlIl9CmV40e+dWWOKjM7+H7d/Ufdbvz8jh4P?=
 =?Windows-1252?Q?MA3kAYGkwCSp/n4hEasT/GbVenEKq0/xDeY7YwYHgQqYa5ChuKzKC4VK?=
 =?Windows-1252?Q?P3AijxjfMd/ZtY2CU2aHR8GzC/1LcVXPX0QeO89VZaIlHjV7mKs14+hi?=
 =?Windows-1252?Q?UBOuhwjphXZ0OLKjUyrhMKPLKCx3z4yGP1K3sl3YLaey+U9P+iV63NSE?=
 =?Windows-1252?Q?O/SQQAVKgDLIg9XwGg0deffcZwOXkgRCttOguvQCJV+ideMfMn9KDcqh?=
 =?Windows-1252?Q?ey2Si1yC5iFdBEtZJxScHw6xAIDBmB7cUL7uXvfI8M3TbDoKE7IU72FE?=
 =?Windows-1252?Q?IUGPvqSZo945fdtbJOlplxljgISN6U5huI+98vHPxckF4vdLKJ8eSCN/?=
 =?Windows-1252?Q?CgDh46pCcJlXDNpfSXLzBXJzdFZuE46HB8vHQBCHKc7zW5mhJd3oxDvA?=
 =?Windows-1252?Q?pmkLoyzY6ZY/vlVMbKXKzpawgRW2gWHdLuAQv/q97Ql7t+LBpVg4UnRf?=
 =?Windows-1252?Q?mKYnIpG/i2pw1PovrR8E2vc6/KFBUAalTeU5NyPjheFiUPpmCosPwWTZ?=
 =?Windows-1252?Q?7eIjDVW8a/GXJ35FJKcYx+h41+Wq+maaq4+C2J7E/6PONIoHoWPpvmBM?=
 =?Windows-1252?Q?B0Bd/n5Gm2WS4BBb4DPp/KaA3k7FANdTk/g1chIN8HCDPKtZTEjZIh/D?=
 =?Windows-1252?Q?bCA0OGM5Ya9iUD0pKSEHrSVglzMJFKEzMepDL3gpZxDidfMZQMNhu5vS?=
 =?Windows-1252?Q?SXaj4dnqZ8ErKuqALwq8lXWt7PVjVhSvNvjP9CIiY+bEdi7dXzpFJ4b0?=
 =?Windows-1252?Q?syH9681il6Qv4Nur7VGYc1jiY12vqKkDmK9jOiQDA5NezCIZKbsjO96F?=
 =?Windows-1252?Q?2ltp1hlbBPG/Z587zxzj9+9ouOEP6NXe++SmsQm/5uUzE/l8hXH+mKrS?=
 =?Windows-1252?Q?sTRSJHhRq458+CxmyUJUhaq/1Wb8s/EY/VeMTf/GkASPSznS11IKW0EC?=
 =?Windows-1252?Q?6JaXS7gezAaL3BOuDko=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <E4615CDEDDF30544B4F4C89A2CA1D049@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a6082f-50b0-49dd-131c-08d9d52d5cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 18:08:25.6491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewiDkjW6zNnLBSkJOeF902QYlewTs7HN84VfDE05ENkL7SoFVMX8a/HUcXvW4WJ575nhIQRL+EfqCqDYZrPFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 1/11/22 2:40 PM, Vivi, Rodrigo wrote:
> On Tue, Jan 11, 2022 at 06:08:28AM -0500, Wang, Zhi A wrote:
>> On 1/11/22 6:08 AM, Wang, Zhi A wrote:
>>> On 1/11/2022 12:52 AM, Vivi, Rodrigo wrote:
>>>> On Fri, 2022-01-07 at 14:43 +0000, Wang, Zhi A wrote:
>>>>> Hi folks:
>>>>>
>>>>> Happy holidays! This pull mostly contains the code re-factors patches
>>>>> from Guenter Roeck and Rikard. Also a minor change from Zhenyu.
>>>>>
>>>>> Zhi
>>>>>
>>>>> The following changes since commit
>>>>> 3bfa7d40ce736ffbbfe07127061f54b359ee2b12:
>>>>>
>>>>>     drm/i915/dg2: Add support for new DG2-G11 revid 0x5 (2021-08-06
>>>>> 09:03:10 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://github.com/intel/gvt-linux tags/gvt-next-2022-01-07
>>>>>
>>>>> for you to fetch changes up to
>>>>> d7a8585430f2b6df5960bbc305edcec5a55180f3:
>>>> I'm not sure what's going on here, but:
>>>>
>>>> dim: no pull request found
>>>>
>>>> did you do anything different on this round for generating and sending
>>>> out this pull request email?
>>> Strange.
>>>
>>> I generated this pull request by git pull-request since there is no
>>> support for generating pull-request for gvt-next right in dim now. Can
>>> you share me the command line of dim you were using for apply this pull
>>> request? I can try to apply it before sending the pull request.
>>>
>>> Thanks,
>>>
>>> Zhi.
>>>
>> Hi Vivi:
>>
>> I did some checks and dumped the plain source of the email I sent. I
>> guess I figured out the reason. It's the problem of thunderbird in
>> Windows. When it sends the plain email, it will replace some space with
>> "=C2", which caused the dim cannot find the git repo url. I have no idea
>> how that can happen since Thunderbird in Linux worked totally fine with
>> the same settings.
>>
>> Before the vacation, my VPN certificate in Linux has been expired. I had
>> to use the thunderbird in Windows, which caused the problem above.
>>
>> Will re-sent. Sorry for the bumps.
>=20
> understood. no problem at all. it happens.
>=20
> Thanks for resending, but there's something else now...
>=20
> dim attempt a mega rebase of thousands and thousands of patches
> when trying to apply this.
>=20
> Could you please rebase on a more recent drm-intel-next tag?
>=20
> Thanks,
> Rodrigo.
>=20
Hi Vivi:

I sent the V3 just now. Thanks so much for the patience. I just took this o=
ver from Zhenyu recently. Feel free to let me know if I make any mistakes. =
Appreciate it!

Thanks,
Zhi.

>>
>> Zhi.
>>
>>>>>     drm/i915/gvt: Constify vgpu_types (2021-12-16 09:13:02 -0500)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Guenter Roeck (1):
>>>>>         drm/i915/gvt: Use list_entry to access list members
>>>>>
>>>>> Rikard Falkeborn (9):
>>>>>         drm/i915/gvt: Constify intel_gvt_gtt_gma_ops
>>>>>         drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
>>>>>         drm/i915/gvt: Constify intel_gvt_irq_ops
>>>>>         drm/i915/gvt: Constify intel_gvt_sched_policy_ops
>>>>>         drm/i915/gvt: Constify gvt_mmio_block
>>>>>         drm/i915/gvt: Constify cmd_interrupt_events
>>>>>         drm/i915/gvt: Constify formats
>>>>>         drm/i915/gvt: Constify gtt_type_table_entry
>>>>>         drm/i915/gvt: Constify vgpu_types
>>>>>
>>>>> Zhenyu Wang (1):
>>>>>         drm/i915/gvt: Fix cmd parser error for Passmark9
>>>>>
>>>>>    drivers/gpu/drm/i915/gvt/cmd_parser.c   |  2 +-
>>>>>    drivers/gpu/drm/i915/gvt/dmabuf.c       | 18 +++------
>>>>>    drivers/gpu/drm/i915/gvt/fb_decoder.c   | 24 ++++++------
>>>>>    drivers/gpu/drm/i915/gvt/gtt.c          | 68
>>>>> ++++++++++++++++-----------------
>>>>>    drivers/gpu/drm/i915/gvt/gtt.h          |  4 +-
>>>>>    drivers/gpu/drm/i915/gvt/gvt.h          |  2 +-
>>>>>    drivers/gpu/drm/i915/gvt/handlers.c     | 13 ++++---
>>>>>    drivers/gpu/drm/i915/gvt/interrupt.c    | 10 ++---
>>>>>    drivers/gpu/drm/i915/gvt/interrupt.h    |  2 +-
>>>>>    drivers/gpu/drm/i915/gvt/sched_policy.c |  2 +-
>>>>>    drivers/gpu/drm/i915/gvt/scheduler.h    |  2 +-
>>>>>    drivers/gpu/drm/i915/gvt/vgpu.c         |  4 +-
>>>>>    12 files changed, 72 insertions(+), 79 deletions(-)
>>>>>
>>>
>>

