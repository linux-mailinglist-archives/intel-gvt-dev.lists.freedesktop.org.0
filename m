Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF350E087
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 25 Apr 2022 14:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23210E5E5;
	Mon, 25 Apr 2022 12:39:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E5E10E372;
 Mon, 25 Apr 2022 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650890339; x=1682426339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eL28oUlqbOc1c7HqfsxfETACO38W26PT8M0y17LbdQc=;
 b=H6J+bilSQkeqeUxSaPNRzEMHO2HU7TZq4wvB1UihZmqi1XBqdFKK1ltw
 Oj8QAfZ5m79vjLDZ1fLbazjzJRvNKi2N5VtbGW/wqXssvO06upDfZTsNH
 MQSkYF7vp0zKwj+cZCj0r3a/k55JVMJzbPdwkTzqekHeD/dXUdhVtcihS
 F4x49nHHSERdQnxrtwEauFm0HNBfoVrXa9rDUc17jaaBZZj1dEisaaDPc
 rRAMlTfU6dV9/9siqfu7rG54hEibelnN9uPh5dcvudRZon4pKg5dxJ7VH
 9oFCVrI9Np1UkAb0FRpT/rGtS9OzP3vkwM4zKLaGgTLI6z4oLIOE6q7xj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351681864"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="351681864"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 05:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="512621163"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 25 Apr 2022 05:38:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 05:38:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 05:38:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 25 Apr 2022 05:38:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 25 Apr 2022 05:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8eErruxAdZCx1xZXklmwGc2mIMhU+Zeay80yGuSWC+nfM6X/5PFXFauriFIX/e2q0JQfzXkzJ3Ayoo3KdYbfoiyCfzwrignlM3WpJSfiTS/9F9zc4Mg8V1dKsh9oyF3Fn+z82orgKDLVEgEwze55L+AZ6IwJVmNTLcpi9HFyKALkwQJTFKOYOmWq3A9VlxfpLJfdBRfpw1UaglX8Qv3pXRgHqWdhVsbUEjQENhopMt0Om4IkFwa4YQajhUdYC5oyjt+NnhCelpVCH2BdWT6Ljuu5ZetxhyABEEpc+DcJLYT8VIx/TBw1v2Ohcqg7HT0bQU2S4tlixvzmqoHDgTwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL28oUlqbOc1c7HqfsxfETACO38W26PT8M0y17LbdQc=;
 b=k0x1QT6HwOUqse5uAlcCA4TWGL/FlcL8inWbwY6Nbat+X9UK9sv9Dg8XgXsyAxgr4IVsmuOSjbhAGEV9ZjmeFCgv44BuRLUxS1OmtcoCP7aAf9MeLNEJi5n8McMfMUwUiKZNt6h5Adzz/ooSPolA9Y6xD8G5twbItgeuh/VtVsjGD2Jxxw3EYbeRyWpoiOAgOXwQjYGm18/zNZCys2izurdoaEKtn2d2MIuqZvmZQ1vRsUkEwkz2oyESHZqF9xIJ21JpHBkgY+UhiOMgLq6IJOWoB3mbe5oC2u9oiog6ELTk8OUDbV1ZWBTti5P2c+F62MvlqAX4HWWqv4/f2x/nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BN6PR11MB0049.namprd11.prod.outlook.com (2603:10b6:405:67::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.17; Mon, 25 Apr 2022 12:38:54 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 12:38:54 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PULL v3] gvt-next
Thread-Topic: [PULL v3] gvt-next
Thread-Index: AQHYVaXIPXN/NhB81UavXULnJXGvwa0AhJsAgAARfACAAAF2AA==
Date: Mon, 25 Apr 2022 12:38:54 +0000
Message-ID: <bf7e848c-4435-f265-a328-52e5da0cb6c8@intel.com>
References: <25a713cd-0b7d-4c09-7d91-4f4ef6c9eb11@intel.com>
 <87o80pv1qd.fsf@intel.com> <87ilqxuyu3.fsf@intel.com>
In-Reply-To: <87ilqxuyu3.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0d6bb1d-bd6e-4e7d-522b-08da26b88f69
x-ms-traffictypediagnostic: BN6PR11MB0049:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB00499DBF01F41C27BCCAAE3CCAF89@BN6PR11MB0049.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 69Xo9xgX7Y8NhcYMINpCfPOVwpUdz10E+gv50bLYnNsUBXhKJ7vvk52SKsnduMkKBn5bsFFt1ThAcFJ7II372ugxPFHxkd89zYraaaeTjbOPvSNSmC3qTF87/PDUt/PEi/LZY3RHu7O4KY5jFo0hOxO5whb6KfmKfZFKZtqACnM9MIQe1qRAEMcZOdLJp6YIYVFsVEnIrFRskmkYHuUjTNFnJVTOLzFCMzfBIk2iJuHTCKAbTZzGvqCgYL2rsBzIM5xi3uNlLlSD+5t1XUcERR9c8PYkZVWrz8OoXZE6K0qcmIG0o4mpv8Z8qcZmgb6XmOp0jMemd0pGaGBjMsptRQ69P9cqdKtQf49Tc/OIR66SuYPD4gFNEncl62yuNr6KxUs8/CgBFQqS3jyXtaLTt9toxyCjYioYAwHHLG1xqyLAs0FFh+GllNiySnViIjk6Dk+yBSCUnM4LgXDCZfCO8gdrD24p24qZ5k6l2YQmI6N8Q5Ail7rXFAuEokDq+neSfTlWQeEhqd72BhJUKJV+rcwmLT/8PXbHHnN3EnWtMTvBgMZiXrP8UgJGhhMCR2MwYwzo4Vis9k9b6D6gdulCNudGiVsK+ZpkaLNW+FVAc+pEOtxhHvfZdMUJwbE1+/gxgL5Osq2inw4yOWcd+/gj7mlSMKVZTDPsG110aMFyCK/YihuOu2eHRn0IwApM9SdEPfHnLZwChP1noVOt3zvXbhRu/9IrsJlU1cqgEKfOAaPSV5ODSNo3HmlnPAxJDhBx7YF0znu8Hn2Qr0SixsB1uWfp8VITH84R+rwdH0FjG1AP2EJ25W4jZFUF9XkqQ+qmg2Fcm/hIdKBaz1pLb8FG19FzvVJl23OzVSTdXcLVgBU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(86362001)(54906003)(110136005)(966005)(6486002)(5660300002)(508600001)(71200400001)(8936002)(2906002)(7416002)(82960400001)(31686004)(83380400001)(2616005)(186003)(8676002)(76116006)(91956017)(4326008)(66946007)(66446008)(66476007)(64756008)(66556008)(26005)(6512007)(6506007)(316002)(53546011)(38070700005)(31696002)(38100700002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enFMSWR1VU9hYTBIRnJxZ3Q3b2liaG9aNEl4VU1Vam5QT3hoaUlBYVRsWStG?=
 =?utf-8?B?M1ZWTENEUHhmOGtyZTQ0MmlMOGFNU2g2MkhQTUtmVkJjL2FDWlNkR1RFYjBF?=
 =?utf-8?B?OWZnRTROaElBV0NRTkZvaW9pdzUwL3BRMVR5bVllbWl6ek1FUVY4Zm5hM0RQ?=
 =?utf-8?B?N1hsNThYREZiUWpubEt2TW83bGUvRGhyOThFYTBTa2NEeE1vTzVXa1h6cXNi?=
 =?utf-8?B?VmdRVlFwM2RkZGd4aDVJeXRtSU12NVZxVFN6VHFzWEtmOXdEYXhnRVFCUWdW?=
 =?utf-8?B?TnBmUTNSWnErYUVPTGFKTHc3R0l6SVdyYXpiWm9aVWx0RU1pdGUzR3MvZXBt?=
 =?utf-8?B?UDYvdWQ1QkhNNHB1YVFRQklyd2JpOWFOWFZwUURUajRTMFNZU3hzNENKRGJj?=
 =?utf-8?B?RzExVjd0RjU4Ui9iVzEwSHAwL2xDQklreElEdnp3YTQ3QnVHN01DMUptVHZp?=
 =?utf-8?B?ZXErYUVLN3RmL0FpUS9lcTBWV3phQWlrYWpXOExjT1FsS1NxcVZudHRVall0?=
 =?utf-8?B?U3FoQmVtSVBqOU1kV3cwcWtZUHk2dklMejE3V2xHcU14aDR1dVRtVEZ2cld5?=
 =?utf-8?B?MEFFODlEVEhlVS9XT28zK3p1RmdYSXh0QkxSOVJkcHZjRUlTalJqemF0YmI2?=
 =?utf-8?B?ajZzazNHZ3JoYW9YdGN0NVc2Y0ZiSG1leUhFb0l5TmVKZ09NRmdGNS8zVmk3?=
 =?utf-8?B?WCtKMnYwbzFHMStBNDl5SW9NNy9zd1k4cjdhdkcrbXVBc0NGYURpMjV1aUZh?=
 =?utf-8?B?aElCVHlub3dzVWxGK1I3alZoQ0F6S2tmTGdxZE80ZWxFb24vREs0Q2MvclBz?=
 =?utf-8?B?emxSSFd4VTVsd1p1MTFiMjE4Szh3QkthMFhieGIvaFFRQktQYm91QWZ6NGZS?=
 =?utf-8?B?QUhLdm5rdGQwWjAzdUdzY2l2T0J3ckNRY1lTaElPY1N2RFpRMnZmUi9ST3RU?=
 =?utf-8?B?OG8xVmxSTHVySU5SVW9ndy9zYWZUYytKV0V2RU1Qa2x2eG9lSCtaM1I3VG9T?=
 =?utf-8?B?d2g0aDFzSzdwZFp6YTFIOWJRMXZsSGhnK0RHNFR5blZIMW5pdzB1UzkwVk5s?=
 =?utf-8?B?Ukh6NkkzTWtRYnNyMERxNGlLdEdlaUNLMms3MHJlNnlIbm52eVcwK3IxOTBD?=
 =?utf-8?B?NUhHSjVlbWZFOVNad1pvL25LekNhU2pIT3JOQzNiSnpZTTBwcnc4SzFsWXZL?=
 =?utf-8?B?bjU0TVNZUFV1M215cUxQYVNENmVsZi9sRm5NM1VUN1JvVjVBUi92bTBBOElj?=
 =?utf-8?B?QlIrSW1rOVlhOTBNZlBRZUhzOUhVMi9NMUxIOFRhakMxc1pHRGR6ZTBtNGtv?=
 =?utf-8?B?VVk1OFRLSEg4anhFMnJCbTV1L2s0MUt4MFBmNkF3cnlXZkZtU3ltQi9MUWt2?=
 =?utf-8?B?blBITlBJQU5aNzdqMnVjTGVEQmZvS2daSEw4RnNnYkdIcHpoTkpCYUhDVmlN?=
 =?utf-8?B?cDRqSHJicklBM2tOK0tsNTI0Q2NrWGpHQ044RHBjL2ZCNHIxb29VSUZnV2Ex?=
 =?utf-8?B?b05ZZ05nd0lnb1ZDbUZ6VkVRUzZ5UnY2TFNKTG9HVnYwVnlqVFdLSmFGUlZ6?=
 =?utf-8?B?VFhuMUdpQVBxR3cwQ1JtSExQY05uVHZjcDVrU2lDNWdlcVJodWMzQkIxV2ti?=
 =?utf-8?B?THRwQTRwWW9nMnAvSFh0SWdaMGN0UVk4ek91ZC9MZGVkRS9HNGZtVE9KUHBH?=
 =?utf-8?B?RWFBQktFWVlCL0xNdS8zMEFma3IrT0d6MlhyanRJWlEwSm1Nd2Jnd2VFQWYr?=
 =?utf-8?B?dldpZTYrUGFVT1pEaHRJdFRSRXo4MzdBak9iQ1FvQ1Zqb1ArWWhNOSt2a0la?=
 =?utf-8?B?MXBHRTE0M21IQko4bXYzS21rNXRuK2RxT1lTY1lnM0NFZ29GTVZDWmJ5b2xk?=
 =?utf-8?B?YlYvMlBodUpyVWFBK1Bhc3FYaHVHd0VBbWZQZnhPR3VmanBTKzY2VWUrMkRJ?=
 =?utf-8?B?MHYzcC9wUmRSU2hadFJuOEdvMVU4K245M0JRcCtjTjNEZHE5ZFlDdWlacVFS?=
 =?utf-8?B?RzFkbkw2b0t2akowVVI2Y2ZYYmxOSWsxaUtNQXUxQjM4SjNmN05QT0k3TkVk?=
 =?utf-8?B?akYzOEllVHBaM2QrMWYycGcxOFBrYjVJNkYwSmphNHoxSCtTc3c2OFlDU0gw?=
 =?utf-8?B?M1NWS0dPMkZ6SzNrOTJvUXlrbDZyajBxQWw4a1A2aFlSUDQya1dSQWtrQVdC?=
 =?utf-8?B?dFdieGJ1T0QyUEU4Nkpkc3p3bDJZRVU4NEJOb2phdHo1Wk5LWTNHV1BITEJV?=
 =?utf-8?B?Zit2NnR2eTE4QXlkaUZaSDBsMTI0d2ZmeW41b2Zubjc5NytaOWhwNE5GckY3?=
 =?utf-8?B?YlZPVzNEdHNsbjNkalZHeS9ENzcvZTcvZXlrZnpIc0FyK044SVlpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <740AF416679633468046124987EF0317@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d6bb1d-bd6e-4e7d-522b-08da26b88f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 12:38:54.8072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVwdfofgqwIzyv8xgRg18c6r2MaPzrD0YjyUTCLo1bPhpW2z1D7lCVcgeSNrR9KQT43nAIhcZ8Td1vNb9BsUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0049
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
Cc: "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gNC8yNS8yMiAxMjozMyBQTSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIE1vbiwgMjUgQXBy
IDIwMjIsIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
Pj4gT24gVGh1LCAyMSBBcHIgMjAyMiwgIldhbmcsIFpoaSBBIiA8emhpLmEud2FuZ0BpbnRlbC5j
b20+IHdyb3RlOg0KPj4+IEhpIGZvbGtzOg0KPj4+DQo+Pj4gSGVyZSBpcyB0aGUgUFIgb2YgZ3Z0
LW5leHQuIFRoYW5rcyBzbyBtdWNoIGZvciB0aGUgcGF0aWVuY2UuDQo+Pg0KPj4gVGhhbmtzLCBw
dWxsZWQgdG8gZHJtLWludGVsLW5leHQsIGFwcGxpZWQgdGhlIGJlbG93IGZpeCBmb3IgdGhlIHNp
bGVudA0KPj4gY29uZmxpY3Qgb24gdG9wLCBhbmQgcHVzaGVkIG91dC4gU2hvdWxkIHNob3cgdXAg
aW4gbGludXgtbmV4dCBzaG9ydGx5Lg0KPiANCj4gQXd3IGNyYXAsIHRoaXMgYnJlYWtzIGRlYnVn
IGJ1aWxkcy4NCj4gDQo+IEVSUk9SOiBtb2Rwb3N0OiAiaW50ZWxfcnVudGltZV9wbV9wdXQiIFtk
cml2ZXJzL2dwdS9kcm0vaTkxNS9rdm1ndC5rb10gdW5kZWZpbmVkIQ0KPiBFUlJPUjogbW9kcG9z
dDogImk5MTVfZmVuY2Vfb3BzIiBbZHJpdmVycy9ncHUvZHJtL2k5MTUva3ZtZ3Qua29dIHVuZGVm
aW5lZCENCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTM0OiBtb2R1
bGVzLW9ubHkuc3ltdmVyc10gRXJyb3IgMQ0KPiBtYWtlWzFdOiAqKiogRGVsZXRpbmcgZmlsZSAn
bW9kdWxlcy1vbmx5LnN5bXZlcnMnDQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTc0OTogbW9kdWxl
c10gRXJyb3IgMg0KPiANCj4gVGhlIGZpcnN0IGlzIHRyaWdnZXJlZCB3aXRoIENPTkZJR19EUk1f
STkxNV9ERUJVR19SVU5USU1FX1BNPXksIHRoZQ0KPiBsYXR0ZXIgd2l0aCBDT05GSUdfRFJNX0k5
MTVfREVCVUdfR0VNPXkuDQo+IA0KPiBQbGVhc2UgYWRkIHRoZSBwcm9wZXIgZml4IG9uIHRvcCBv
ZiB0aGUgdG9waWMgYnJhbmNoLCBhbmQgc2VuZCBhbg0KPiBhZGRpdGlvbmFsIHB1bGwgcmVxdWVz
dC4gTG9va3MgbGlrZSBleHBvcnRzIHdpbGwgZG8gaXQuDQo+IA0KPiBPbiB0aGF0IG5vdGUsIEkn
bSB3b25kZXJpbmcgYWJvdXQgdGhlIHVzZSBvZg0KPiBFWFBPUlRfU1lNQk9MX05TX0dQTCgpLiBJ
dCdzIGJldHdlZW4gdHdvIE1JVCBsaWNlbnNlZCBtb2R1bGVzIGFmdGVyDQo+IGFsbC4gTWF5YmUg
anVzdCBFWFBPUlRfU1lNQk9MX05TKCk/DQo+IA0KV2lsbCBkby4gVGhhbmtzIHNvIG11Y2ggZm9y
IGNhdGNoaW5nIHRoaXMuIA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPj4NCj4+IEJSLA0KPj4g
SmFuaS4NCj4+DQo+Pj4NCj4+PiBNb3N0bHkgaXQgaW5jbHVkZXMgdGhlIHBhdGNoIGJ1bmRsZSBv
ZiBHVlQtZyByZS1mYWN0b3IgcGF0Y2hlcyBmb3IgYWRhcHRpbmcgdGhlIEdWVC1nIHdpdGggdGhl
DQo+Pj4gbmV3IE1ERVYgaW50ZXJmYWNlczoNCj4+Pg0KPj4+IC0gU2VwYXJhdGluZyB0aGUgTU1J
TyB0YWJsZSBmcm9tIEdWVC1nLiAoWmhpKQ0KPj4+IC0gR1ZULWcgcmUtZmFjdG9yLiAoQ2hyaXN0
b3BoKQ0KPj4+IC0gR1ZULWcgbWRldiBBUEkgY2xlYW51cC4gKEphc29uKQ0KPj4+IC0gR1ZULWcg
dHJhY2UvbWFrZWZpbGUgY2xlYW51cC4gKEphbmkpDQo+Pj4NCj4+PiBUaGFua3Mgc28gbXVjaCBm
b3IgbWFraW5nIHRoaXMgaGFwcGVuLg0KPj4+DQo+Pj4gVGhpcyBQUiBoYXMgYmVlbiB0ZXN0ZWQg
YXMgZm9sbG93aW5nIGFuZCBubyBwcm9ibGVtIHNob3dzIHVwOg0KPj4+DQo+Pj4gJGRpbSB1cGRh
dGUtYnJhbmNoZXMNCj4+PiAkZGltIGFwcGx5LXB1bGwgZHJtLWludGVsLW5leHQgPCB0aGlzX2Vt
YWlsLmVtbA0KPj4+DQo+Pj4gV2hlbiBtZXJnaW5nIHRoaXMgcHVsbCB0byBkcm0taW50ZWwtbmV4
dCwgcGxlYXNlIGluY2x1ZGUgdGhlIGZvbGxvd2luZyBjb2RlIGluIHRoZSBtZXJnZSBjb21taXQ6
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0X21t
aW9fdGFibGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2d2dF9tbWlvX3RhYmxlLmMN
Cj4+PiBpbmRleCAwM2E3ZmNkMGY5MDQuLjcyZGFjMTcxOGYzZSAxMDA2NDQNCj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnRfbW1pb190YWJsZS5jDQo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZ3Z0X21taW9fdGFibGUuYw0KPj4+IEBAIC0zLDYgKzMs
NyBAQA0KPj4+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4+ICAg
Ki8NCj4+PiAgDQo+Pj4gKyNpbmNsdWRlICJkaXNwbGF5L2ludGVsX2RtY19yZWdzLmgiDQo+Pj4g
ICNpbmNsdWRlICJkaXNwbGF5L3Zsdl9kc2lfcGxsX3JlZ3MuaCINCj4+PiAgI2luY2x1ZGUgImd0
L2ludGVsX2d0X3JlZ3MuaCINCj4+PiAgI2luY2x1ZGUgImd2dC9ndnQuaCINCj4+Pg0KPj4+DQo+
Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzMTIzMTA5Mjg0MTc2YjE1MzI4
NzQ1OTFmN2M4MWYzODM3YmJkYzE3Og0KPj4+DQo+Pj4gICBMaW51eCA1LjE4LXJjMSAoMjAyMi0w
NC0wMyAxNDowODoyMSAtMDcwMCkNCj4+Pg0KPj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0Og0KPj4+DQo+Pj4gICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxp
bnV4IHRhZ3MvZ3Z0LW5leHQtMjAyMi0wNC0yMS1mb3ItY2hyaXN0b3BoDQo+Pj4NCj4+PiBmb3Ig
eW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMjkxN2Y1MzExM2JlM2I3YTBmMzc0ZTAyY2ViZTZk
NmI3NDkzNjZiNToNCj4+Pg0KPj4+ICAgdmZpby9tZGV2OiBSZW1vdmUgbWRldiBkcnZkYXRhICgy
MDIyLTA0LTIxIDA3OjM2OjU2IC0wNDAwKQ0KPj4+DQo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+IGd2dC1uZXh0
LTIwMjItMDQtMjEtZm9yLWNocmlzdG9waA0KPj4+DQo+Pj4gLSBTZXBhcmF0aW5nIHRoZSBNTUlP
IHRhYmxlIGZyb20gR1ZULWcuIChaaGkpDQo+Pj4gLSBHVlQtZyByZS1mYWN0b3IuIChDaHJpc3Rv
cGgpDQo+Pj4gLSBHVlQtZyBtZGV2IEFQSSBjbGVhbnVwLiAoSmFzb24pDQo+Pj4gLSBHVlQtZyB0
cmFjZS9tYWtlZmlsZSBjbGVhbnVwLiAoSmFuaSkNCj4+Pg0KPj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiBDaHJp
c3RvcGggSGVsbHdpZyAoMjcpOg0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDogcmVtb3ZlIG1vZHVs
ZSByZWZjb3VudGluZyBpbiBpbnRlbF9ndnRfeyx1bn1yZWdpc3Rlcl9oeXBlcnZpc29yDQo+Pj4g
ICAgICAgZHJtL2k5MTUvZ3Z0OiByZW1vdmUgZW51bSBoeXBlcnZpc29yX3R5cGUNCj4+PiAgICAg
ICBkcm0vaTkxNS9ndnQ6IHJlbmFtZSBpbnRlbF92Z3B1X29wcyB0byBpbnRlbF92Z3B1X21kZXZf
b3BzDQo+Pj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBtb3ZlIHRoZSBndnQgY29kZSBpbnRvIGt2bWd0
LmtvDQo+Pj4gICAgICAgZHJtL2k5MTUvZ3Z0OiByZW1vdmUgaW50ZWxfZ3Z0X29wcw0KPj4+ICAg
ICAgIGRybS9pOTE1L2d2dDogcmVtb3ZlIHRoZSBtYXBfZ2ZuX3RvX21mbiBhbmQgc2V0X3RyYXBf
YXJlYSBvcHMNCj4+PiAgICAgICBkcm0vaTkxNS9ndnQ6IHJlbW92ZSB0aGUgdW51c2VkIGZyb21f
dmlydF90b19tZm4gb3ANCj4+PiAgICAgICBkcm0vaTkxNS9ndnQ6IG1lcmdlIHN0cnVjdCBrdm1n
dF92ZGV2IGludG8gc3RydWN0IGludGVsX3ZncHUNCj4+PiAgICAgICBkcm0vaTkxNS9ndnQ6IG1l
cmdlIHN0cnVjdCBrdm1ndF9ndWVzdF9pbmZvIGludG8gc3RydXQgaW50ZWxfdmdwdQ0KPj4+ICAg
ICAgIGRybS9pOTE1L2d2dDogcmVtb3ZlIHZncHUtPmhhbmRsZQ0KPj4+ICAgICAgIGRybS9pOTE1
L2d2dDogZGV2aXJ0dWFsaXplIC0+e3JlYWQsd3JpdGV9X2dwYQ0KPj4+ICAgICAgIGRybS9pOTE1
L2d2dDogZGV2aXJ0dWFsaXplIC0+e2dldCxwdXR9X3ZmaW9fZGV2aWNlDQo+Pj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBkZXZpcnR1YWxpemUgLT5zZXRfZWRpZCBhbmQgLT5zZXRfb3ByZWdpb24NCj4+
PiAgICAgICBkcm0vaTkxNS9ndnQ6IGRldmlydHVhbGl6ZSAtPmRldGFjaF92Z3B1DQo+Pj4gICAg
ICAgZHJtL2k5MTUvZ3Z0OiBkZXZpcnR1YWxpemUgLT5pbmplY3RfbXNpDQo+Pj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBkZXZpcnR1YWxpemUgLT5pc192YWxpZF9nZm4NCj4+PiAgICAgICBkcm0vaTkx
NS9ndnQ6IGRldmlydHVhbGl6ZSAtPmdmbl90b19tZm4NCj4+PiAgICAgICBkcm0vaTkxNS9ndnQ6
IGRldmlydHVhbGl6ZSAtPntlbmFibGUsZGlzYWJsZX1fcGFnZV90cmFjaw0KPj4+ICAgICAgIGRy
bS9pOTE1L2d2dDogZGV2aXJ0dWFsaXplIC0+ZG1hX3ssdW59bWFwX2d1ZXN0X3BhZ2UNCj4+PiAg
ICAgICBkcm0vaTkxNS9ndnQ6IGRldmlydHVhbGl6ZSBkbWFfcGluX2d1ZXN0X3BhZ2UNCj4+PiAg
ICAgICBkcm0vaTkxNS9ndnQ6IHJlbW92ZSBzdHJ1Y3QgaW50ZWxfZ3Z0X21wdA0KPj4+ICAgICAg
IGRybS9pOTE1L2d2dDogcmVtb3ZlIHRoZSBleHRyYSB2ZmlvX2RldmljZSByZWZjb3VudGluZyBm
b3IgZG1hYnVmcw0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDogc3RyZWFtbGluZSBpbnRlbF92Z3B1
X2NyZWF0ZQ0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDogcGFzcyBhIHN0cnVjdCBpbnRlbF92Z3B1
IHRvIHRoZSB2ZmlvIHJlYWQvd3JpdGUgaGVscGVycw0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDog
cmVtb3ZlIGt2bWd0X2d1ZXN0X3tpbml0LGV4aXR9DQo+Pj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBj
b252ZXJ0IHRvIHVzZSB2ZmlvX3JlZ2lzdGVyX2VtdWxhdGVkX2lvbW11X2Rldg0KPj4+ICAgICAg
IGRybS9pOTE1L2d2dDogbWVyZ2UgZ3Z0LmMgaW50byBrdm1ndnQuYw0KPj4+DQo+Pj4gSmFuaSBO
aWt1bGEgKDIpOg0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDogZml4IHRyYWNlIFRSQUNFX0lOQ0xV
REVfUEFUSA0KPj4+ICAgICAgIGRybS9pOTE1L2d2dDogYmV0dGVyIGFsaWduIHRoZSBNYWtlZmls
ZSB3aXRoIGk5MTUgTWFrZWZpbGUNCj4+Pg0KPj4+IEphc29uIEd1bnRob3JwZSAoNSk6DQo+Pj4g
ICAgICAgdmZpby9tZGV2OiBSZW1vdmUgdmZpb19tZGV2LmMNCj4+PiAgICAgICB2ZmlvL21kZXY6
IFJlbW92ZSBtZGV2X3BhcmVudF9vcHMgZGV2X2F0dHJfZ3JvdXBzDQo+Pj4gICAgICAgdmZpby9t
ZGV2OiBSZW1vdmUgbWRldl9wYXJlbnRfb3BzDQo+Pj4gICAgICAgdmZpby9tZGV2OiBVc2UgdGhl
IGRyaXZlciBjb3JlIHRvIGNyZWF0ZSB0aGUgJ3JlbW92ZScgZmlsZQ0KPj4+ICAgICAgIHZmaW8v
bWRldjogUmVtb3ZlIG1kZXYgZHJ2ZGF0YQ0KPj4+DQo+Pj4gWmhpIFdhbmcgKDMpOg0KPj4+ICAg
ICAgIGk5MTUvZ3Z0OiBTZXBhcmF0ZSB0aGUgTU1JTyB0cmFja2luZyB0YWJsZSBmcm9tIEdWVC1n
DQo+Pj4gICAgICAgaTkxNS9ndnQ6IFNhdmUgdGhlIGluaXRpYWwgSFcgc3RhdGUgc25hcHNob3Qg
aW4gaTkxNQ0KPj4+ICAgICAgIGk5MTUvZ3Z0OiBVc2UgdGhlIGluaXRpYWwgSFcgc3RhdGUgc25h
cHNob3Qgc2F2ZWQgaW4gaTkxNQ0KPj4+DQo+Pj4gIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS92
ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgfCAgIDI3ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDM2ICstDQo+Pj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgICA4ICstDQo+Pj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDMw
ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jZmdfc3BhY2UuYyAgICAgICAgICAg
ICAgfCAgIDg5ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMg
ICAgICAgICAgICAgfCAgICA0ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFi
dWYuYyAgICAgICAgICAgICAgICAgfCAgIDM2ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9leGVjbGlzdC5jICAgICAgICAgICAgICAgfCAgIDEyICstDQo+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9maXJtd2FyZS5jICAgICAgICAgICAgICAgfCAgIDI1ICstDQo+Pj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICAgICAgICAgICAgfCAgIDU1ICst
DQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICAgICAgICAgICAgICAg
fCAgMzQwIC0tLS0tLQ0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAg
ICAgICAgICAgICAgIHwgIDEyOCArLQ0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYyAgICAgICAgICAgICAgIHwgMTAzMyArKystLS0tLS0tLS0tLS0tLQ0KPj4+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmggICAgICAgICAgICAgIHwgICA4MiAtLQ0K
Pj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmMgICAgICAgICAgICAgIHwg
ICA0MCArLQ0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgICAg
ICAgICAgIHwgMTA5NyArKysrKysrKystLS0tLS0tLQ0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvbW1pby5jICAgICAgICAgICAgICAgICAgIHwgICAgNCArLQ0KPj4+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbW1pby5oICAgICAgICAgICAgICAgICAgIHwgICAgMSAtDQo+Pj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaCAgICAgICAgICAgICAgICAgICAgfCAgNDAwIC0t
LS0tLS0NCj4+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L29wcmVnaW9uLmMgICAgICAgICAg
ICAgICB8ICAxNDggKy0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9wYWdlX3RyYWNr
LmMgICAgICAgICAgICAgfCAgICA4ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9y
ZWcuaCAgICAgICAgICAgICAgICAgICAgfCAgICA5ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9zY2hlZHVsZXIuYyAgICAgICAgICAgICAgfCAgIDM3ICstDQo+Pj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC90cmFjZS5oICAgICAgICAgICAgICAgICAgfCAgICAyICstDQo+Pj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgICAgICAgICAgICAgICAgfCAgIDIy
ICstDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJpdmVyLmMgICAgICAgICAgICAg
ICAgfCAgICA3IC0NCj4+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgICAg
ICAgICAgICAgICB8ICAgIDMgKw0KPj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9ndnQu
YyAgICAgICAgICAgICAgICAgIHwgIDI0OCArKystDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX2d2dC5oICAgICAgICAgICAgICAgICAgfCAgIDMyICstDQo+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2d2dF9tbWlvX3RhYmxlLmMgICAgICAgfCAxMjkxICsrKysrKysrKysr
KysrKysrKysrKw0KPj4+ICBkcml2ZXJzL3MzOTAvY2lvL3ZmaW9fY2N3X29wcy5jICAgICAgICAg
ICAgICAgICAgIHwgICAgNyArLQ0KPj4+ICBkcml2ZXJzL3MzOTAvY3J5cHRvL3ZmaW9fYXBfb3Bz
LmMgICAgICAgICAgICAgICAgIHwgICAgOSArLQ0KPj4+ICBkcml2ZXJzL3ZmaW8vbWRldi9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQ0KPj4+ICBkcml2ZXJzL3ZmaW8v
bWRldi9tZGV2X2NvcmUuYyAgICAgICAgICAgICAgICAgICAgIHwgICA1MiArLQ0KPj4+ICBkcml2
ZXJzL3ZmaW8vbWRldi9tZGV2X2RyaXZlci5jICAgICAgICAgICAgICAgICAgIHwgICAxMCAtDQo+
Pj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfcHJpdmF0ZS5oICAgICAgICAgICAgICAgICAgfCAg
ICA2ICstDQo+Pj4gIGRyaXZlcnMvdmZpby9tZGV2L21kZXZfc3lzZnMuYyAgICAgICAgICAgICAg
ICAgICAgfCAgIDM3ICstDQo+Pj4gIGRyaXZlcnMvdmZpby9tZGV2L3ZmaW9fbWRldi5jICAgICAg
ICAgICAgICAgICAgICAgfCAgMTUyIC0tLQ0KPj4+ICBpbmNsdWRlL2xpbnV4L21kZXYuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4MiArLQ0KPj4+ICBzYW1wbGVzL3ZmaW8tbWRl
di9tYm9jaHMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArLQ0KPj4+ICBzYW1wbGVz
L3ZmaW8tbWRldi9tZHB5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArLQ0KPj4+
ICBzYW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAz
OSArLQ0KPj4+ICA0MiBmaWxlcyBjaGFuZ2VkLCAyNTMwIGluc2VydGlvbnMoKyksIDMxMzggZGVs
ZXRpb25zKC0pDQo+Pj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3Z0LmMNCj4+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oeXBlcmNhbGwuaA0KPj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L21wdC5oDQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9ndnRfbW1pb190YWJsZS5jDQo+Pj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3ZmaW8vbWRldi92ZmlvX21kZXYuYw0KPiANCg0K
