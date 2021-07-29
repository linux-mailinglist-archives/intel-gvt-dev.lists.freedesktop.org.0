Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC353D9F53
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Jul 2021 10:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AF86ECDB;
	Thu, 29 Jul 2021 08:19:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF536ECD1;
 Thu, 29 Jul 2021 08:19:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="210945017"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="210945017"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="567148206"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 29 Jul 2021 01:19:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 01:19:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 01:19:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 01:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T85KWJeIypJ/vAm92ta+HyT0UmUPbyiZGg636G65FkQfWkeK9K2M+rbvk7hMYWU4vra+q7ZNaLNfAbuzctlw0Rb7nLTHjZQLqwj6aEqPB3AQBScoT0cBgXtHlhwjGizpk6SLBTOQZKF+JLPTFZeuqaLyLHSFjQ26/Zc6snyWBdQ5VWH/C3y59mf1QJiF9edoxded1KIsQ8BjitWMXGHYfo+rsFM2s0W9nsPHXZOL7Eoutvkzfp+/a6Dzl7VtYdFvbrV5tjLJjMXoS/C8G7NX9et/apgTjNmKki96DrgdPpC6afIS0aeoXGl+LdpCKmfd5NpR5WAeNa0ENf0sthwi2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqoyHbRKr+RTvtT38NfTkJKeNDd6xtC5O9YQxQlO9aI=;
 b=jg7c+Q78vGOFUWJOfHvZTkxI48vjUqaoMvoAk77JfHxre2HOcNIfz71e/+LEyveJxqaifaNDR389ACyHRwjUrKQdB6ABta4TDqf5b+ye0hoJ3xWcwwfYKKhEmN7JDtBijgEoAcQG3g1HyKLrYu08Q03Sz0CTDq4MpC8oL6iOYeXu0JMI60lzrytLn+lNK/NqNzYqeqHeiARBV/9MLUes43nmSCB+R6ZFtBU4m+l6knKcKNDJCPqF9XiJy/3n0qjFKnuqaaPS2FE9A3zQO3lTw5rzwiOSqclifSqdUy79UigKmtKbT+bectb0ZJqLwlSa7cXGCarR0LXgrSvhJAuw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqoyHbRKr+RTvtT38NfTkJKeNDd6xtC5O9YQxQlO9aI=;
 b=pKqxd+wxLshs5MK9Z0vv8Bu2m6DhQKGpwW8yau9Uv6TyRlIDhPQTaUmzQrcnHXAUOuqEr79F6UngdEIAGZFm35hHDF3IA+KD/Sn2Rbd9WgskYU0xrZjbNXUfheJ4Sokw4vwoCTT5aUXZLXF6eoku+SdI7lxS1NkONbU2WzYUPVQ=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB2937.namprd11.prod.outlook.com (2603:10b6:5:62::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19; Thu, 29 Jul 2021 08:19:15 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d%9]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 08:19:15 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQgABTFICAAPA6AA==
Date: Thu, 29 Jul 2021 08:19:15 +0000
Message-ID: <9cab9765-79ce-fca0-3599-474f7ffb2034@intel.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
In-Reply-To: <20210728175925.GU1721383@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4860a5c-fade-40ac-1f21-08d952698dec
x-ms-traffictypediagnostic: DM6PR11MB2937:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB293786FDBDE10C6DF62A3191CAEB9@DM6PR11MB2937.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ecwKHf6tyhchKv/kxb+42nvquhAHj/ECx0s2gbuox6+ZWK/2ZcwLFsyCKi/qYEnDML9F3tnhR8A4/FQSY5NdqSIPfaaIaQTpJ/dzJmq19JIGa1C3fBYD9FWRQcAFndK6KxwK+Z5ktqYuIZZJHLJgkjgZZb2IVKzMkIc7QK0M2riyr1feR7yyVSZt+J8wSe8OuOtqxbVP6L2eWV9Da+KPJWykbvfRKyuuFf91tWVKwkx3XJfpIXD8CNw3OtgGRRh7zy/qbDTpPpmY1d6wvSjET0gdOa2ESTKbF02/MghTvFV7JEccGBxaYgQ9mGq3U0P1tkf6NS1KlxhynCvdJitNKiei0krLqqaEpzC51FKvkyhUg82HcwrVmFOMcurRqQTNtuMtJiS+zW0po1I35/LqVQNYmjQb+ce4qzhbysl1ZMLFnvijSVbNBKK90Onl63flJ0u8X+4ZJmrxBcNnVA+cxE+29CgYTQDRCg67SoTNQYm17mAFTgH2emiBgLnyhzYDLkfqoty8wd3RaE4x9EQnz+26wLZ+nQjYCnFgWZ3kt6ZUizzUibw4jbv9L60EghsfxY7iIAEQ+xfZ0HFwGmw9lWv69+LkhH1wUzZaM/2l9aLkNB66H3swBnuOzEnDHNdkGwC/9w29ogAYtBWOVcaHt5tXAacYTVlCDZkqvZrGpmzPCj9sOqND94GYMme4zOk0byTPBjwgpLqNQGtrrTT0htzpFE1ncUK+YUZ4SBUHYOAd6FWPS0mXZ8LBWC5RKKcEmg9kncLyyp5njmDIlsA0Bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(71200400001)(54906003)(66946007)(76116006)(66476007)(8936002)(86362001)(478600001)(66556008)(6916009)(66446008)(91956017)(64756008)(2906002)(83380400001)(36756003)(31696002)(316002)(7416002)(122000001)(4326008)(5660300002)(38100700002)(26005)(38070700005)(8676002)(53546011)(6506007)(6486002)(2616005)(6512007)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmhSb2tDUFJuNWVIcW84ZzNQYU9OTmRYenkxZEFaOHJtTEx3aVlvdHAvOVM5?=
 =?utf-8?B?clg4L3kwV2NPVUxOb0lDUnp4cTFiMmZLbUlqVm92ZTlGelBtcWV0cHFub2pp?=
 =?utf-8?B?S2ZpOHlHZ29sVlhyUGprRWRXVUVDbUM2SkNQUWE0UVExZDN2ajBBdjhmS3ZE?=
 =?utf-8?B?TkpWWFFmR2JxZ21nUWdYQnNVUTZFOUx3OHN0MnFuakY3OGNXZjFJRXVyMnd2?=
 =?utf-8?B?QVQ5ekRTVmlOaXlmQWxKY3EzZzZwamQ2eFpUNWZHZmNiRXNWd2xjVEhETW5V?=
 =?utf-8?B?TkdqTEJZaFZwZjJ6c3l4Rm5lWTUyd1AwNWQxdDJLeGJkQ0FDM3lwRlFVbGVs?=
 =?utf-8?B?SnkrR0N5a2NsWGVlZzdSdHNCZ3dHRU5DYXRsazNmTk05dndVaWJ6dTJZanVB?=
 =?utf-8?B?S3VIdEhXcjU2ODVENVVxMWt1SzF5c2ZTVDg0Z3RSK0JISnRDSUxVM3NnMGNE?=
 =?utf-8?B?M2N4Wk9JRENTM3d5bm9mWUFkeEJ0NVlBYyt2Wm1ZTzlsazBYekx6T1M4bkFH?=
 =?utf-8?B?VE1OMUxLZ1l2TC9wNHVUYWtVVEhsRUJ2dlR0cHlucjZXQ2tlbE1XUW52UmNa?=
 =?utf-8?B?U0xjdmMzWmcxVnJTbzRXeGVrN09xSVpNZk9xNkM2TlM0azExOGFCZU1MWVFT?=
 =?utf-8?B?QzNJeS9KOHlabFJNUXVWbUVJckZlY2hSZ1NocG50REZzZmlKOUNOZDFneXJo?=
 =?utf-8?B?a0FSNm5RMktpQmRrZXVvYitNeVIzYjNsMDY0eVIwakNNWUNnUlJUbWJVd1ZM?=
 =?utf-8?B?TGZqWWd4UU05bmVRczl4UU55MC8yTFk2MTgvL3pONXNLL2pXT0tvNy93ZWdl?=
 =?utf-8?B?dkU3d0NHcDl1dHNadFpGVFY5VUtMTHA4dS9KanBBQ1VFakZ4ckNqZHZTeEpy?=
 =?utf-8?B?NEFFZE1BanZpbUdPL2x0Tmh3U2JsUGVCcHJ3RGRRU3RSdTVFNk1XWU96SlJ5?=
 =?utf-8?B?bm1lUGxOaFdsOUxzaWNsajdUL1FMUUVuSEpuVGt5L29jUVlUTDV4TTNGbGVT?=
 =?utf-8?B?Y1pHL3pLUk9RWDRSOVlpQ2J2K2xmaDRrS0lxMWprTllxNHEzMjlReFFnb2dJ?=
 =?utf-8?B?bFRFSkRIMzlrekc4Q0xxeWVFOWgyczVvWnlaZzMxY2lMUFRuYjJ0SEFhMlNj?=
 =?utf-8?B?dE91Q0wzR2JOdGtFeUYrYVZTN2gxaVZONWNhaTRVYXQwN0dDMXdhYjRSRXdo?=
 =?utf-8?B?alo0aStDY1ZsL0xtUVpsWUxsSFBUem1uQXZmamJwVFZDL0VOQ3Yrd2IvT0Nz?=
 =?utf-8?B?ZTk2NWpYQ255andFcDZ5OExOWlZFWXBWZVhwd1VFTnNJWXQyV0xwRGVaNFhR?=
 =?utf-8?B?QlRPSWdxU3c0ejJVZHk2QmwzR095VnFpWlcwajRnanJRbmNwbzFtUnNmSWxq?=
 =?utf-8?B?WlBNNndjT3VBeGprUzZ6bGw4TUxEdnVFL1JBZVlXNFdpMWsrS1Jrd3V2a1Nm?=
 =?utf-8?B?WkZ3eWt0blpyVEhyS1pDNDZqclEzM2xQa2U0QkVoUVR0NUVWNWFIVE9zZjQ4?=
 =?utf-8?B?OS9pc0lOaU9Ua1NIUzZIU3RoUk52VVd6K09CRUVQeHNIbVhrR2h3YXRHdzRZ?=
 =?utf-8?B?VVhNRkp1QWova0RKbGRLSWpMdkdZVTlodWxXM1dQbEcwV0hta3RNM1VTb2Rq?=
 =?utf-8?B?cXFoblhCbmdnOGF6eFVheWp4b1BhMDF5ZmpmQ1FuR3YxNWxXZ3RmMm8yUE45?=
 =?utf-8?B?RjNnNjB3R1NDRVFYandGVGdaVTVpTE5Td2dzWW9EYnlnZElPZHFJWCtKZnhF?=
 =?utf-8?Q?ZucgD1Yh3kgXn52fu4=3D?=
Content-ID: <A0FD113E3BAC2F42867660D9E2F90829@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4860a5c-fade-40ac-1f21-08d952698dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 08:19:15.4636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RiDc/xdpDikth3CaOLq75dh94znoXMaXvwrkcMfOm5EJSvYNGrUFNN3mr3xYcgLJ2oPA0RoeT/kmWCvoS2goA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2937
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 7/28/2021 8:59 PM, Jason Gunthorpe wrote:
> On Wed, Jul 28, 2021 at 01:38:58PM +0000, Wang, Zhi A wrote:
>
>> I guess those APIs you were talking about are KVM-only. For other
>> hypervisors, e.g. Xen, ARCN cannot use the APIs you mentioned. Not
>> sure if you have already noticed that VFIO is KVM-only right now.
> There is very little hard connection between VFIO and KVM, so no, I
> don't think that is completely true.
>
> In an event, an in-tree version of other hypervisor support for GVT
> needs to go through enabling VFIO support so that the existing API
> multiplexers we have can be used properly, not adding a shim layer
> trying to recreate VFIO inside a GPU driver.

We were delivering the presentation of GVT-g in Xen summit 2018 and we 
were thinking and talking about supporting VFIO in Xen during the 
presentation (the video can be found from Youtube). But we didn't see 
any motiviation from the Xen community to adopt it.

If people take a look into the code in QEMU, in the PCI-passthrough 
part, Xen is actually not using VFIO even nowadays. We would be glad to 
see someone can influence on that part, especically making all the 
in-kernel hypervisor to use VFIO in PCI-passthrough and supporting mdev. 
That would be a huge benefit for all the users.

>> GVT-g is designed for many hypervisors not only KVM. In the design,
>> we implemented an abstraction layer for different hypervisors. You
>> can check the link in the previous email which has an example of how
>> the MPT module "xengt" supports GVT-g running under Xen.  For
>> example, injecting a msi in VFIO/KVM is via playing with
>> eventfd. But in Xen, we need to issue a hypercall from Dom0.
> This is obviously bad design, Xen should plug into the standardized
> eventfd scheme as well and trigger its hypercall this way. Then it can
> integrate with the existing VFIO interrupt abstraction infrastructure.
>
>> others, like querying mappings between GFN and HFN.
> This should be done through VFIO containers, there is nothing KVM
> specific there.
>
>> As you can see, to survive from this situation, we have to rely on
>> an abstraction layer so that we can prevent introducing coding
>> blocks like in the core logic:
> No, you have to fix the abstractions we already have to support the
> matrix of things you care about. If this can't be done then maybe we
> can add new abstractions, but abstractions like this absoultely should
> not be done inside drivers.
>
> Jason

That's a good point and we were actually thinking about this before and 
I believe that's the correct direction. But just like the situation 
mentioned above, it would be nice if people can really put a great 
influence on all in-kernel hypervisors to use VFIO which can really 
benefit all the users.

For now, we are just going to take christoph's patches.

Zhi

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
