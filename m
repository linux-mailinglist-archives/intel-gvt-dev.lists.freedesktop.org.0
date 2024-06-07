Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30841900537
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 15:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B95D10EC4C;
	Fri,  7 Jun 2024 13:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWg9rj2d";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5F10EC4E;
 Fri,  7 Jun 2024 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717767725; x=1749303725;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O/6M4fIRNVuRmyYe3lnpBtt8+/wDwgCbI/UmEvDKLg0=;
 b=iWg9rj2d0n/S8fhI7H0Qy7iM9L9gmzb5K3OiCtUBqLJT0PXLW9wDG1OC
 byztBuRS6qro7/TmkCyiwvMfYmpMncQRvBtLtWHYQm3ZHnLUeQR0zXYh9
 YBjNQRHAx8FdhXFuyY9xaunj0yTAAcxZqpJ/VxgYZwaT4H5B+m7QwD91Y
 vHAPPm6gKDRkcJjZvMuo7LeSYZWAer0KxJ9p02dV+iECi9lpcw5cCL8F/
 Y9EqPVHKx36dgCZBD5cuQRK4wnBWU3gGZ4Ax6SwycOwJrLdljJVaoVC66
 +wwAcs6C/Vkjj9doVj8/DVxooIKOW+AUKrmSqsFFc8rQQaS7JdLXrxLLa Q==;
X-CSE-ConnectionGUID: +YLDXFk3SUiUXfdLA9ABRg==
X-CSE-MsgGUID: 691fYZ58SdanQrAuUEd8pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37015657"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="37015657"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:42:05 -0700
X-CSE-ConnectionGUID: EGFhk75MQ8+TGdlojCx3tQ==
X-CSE-MsgGUID: Lqd9jbBeSeqLP+k2ShsSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38775367"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 06:42:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:42:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 06:42:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 06:42:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 06:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqFxE8eiYQi5AVwofeC0PIN+T2b+wOCjzQ7HRpoHxFIFSvj/dB38eFaAL094rg+gh4Vg/OM8rHw+9k2PWg4rnsigUmpHT9hOay4qUGJAi+MdsYc0oylVdPMsQjI1VZrnGqLLNYeG3NLVcoTWNfA1Vdie130MsFjMZM17jU0miwr+qdr738YNEy3kVpTWYYPVWYsFhJqrJdAcZhyiiOkO/fVDjeGS8BpfNTQX9Uxdp2TVGyB/ni0JdwJv7lnKTL7Df22RgVgwiU17hbK4gXjRnMKmqEQTrAtmYJNeWmHrQXieLxnxtSI3Y5vd28oVmOrX+RaoSZzCy6aXN1FxFOvqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nv03tatNVn3N4qnUEmxfAvnEF8ztuG2x1OLqo9SyFw=;
 b=Wu6strv7vo+rS+545AmupKDUMSTqWXUfznurlPpxjJnTzVUO4G+I1vdm5EmbXQLS6gqndx7mJ0r1JH+8GS+uQGxm0fIMJMqC+mKKoHK/FoR7FD1gnYK/3R0IRZpANezb9dstDTiuxbqaA5Cqgg2IWnMlCdqPhH9iwgtdm4EZjAYceRRbVA9egLUFf4Jps9a9OqricoyS1xNpBtBFGJ71xMou+BlfnQU0UGEhsVD0GVhn7Wa6IJUIAwd7l1aav79ehXQxtWRXzvdrXjbJefnOT7s9e+2Y4TlDr6Fwu1Fzgx1zv6aCqKEE/Ep/Aylxn3kqoGnPQ9z2N5tNAJcA8M54Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 13:42:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 13:42:01 +0000
Date: Fri, 7 Jun 2024 09:41:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register
 macros
Message-ID: <ZmMOJrGj_TherJn_@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
 <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
 <ZmLwmxPly3lKZRhp@intel.com> <87r0d9kkot.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0d9kkot.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ed255f-08db-443d-8cc4-08dc86f79bbe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9t3uQEbZmRql9hQMomZb/LcH30eohNmdYagmExrV+gNT42KNXXOTiXLIB9?=
 =?iso-8859-1?Q?KL/pX/8b6KpOXqQki0+jHvlcDS1yCc7qMPQ692VQh9Z/ORNCH1e8mE5nrN?=
 =?iso-8859-1?Q?LwK29dr6y9mBF8VMoeMya0rB7+VSSMgogJGoxGiXvFbtImCo4KXkhHkAzg?=
 =?iso-8859-1?Q?U6D3yiux003Qrxqz1Wn/nvv4gX3gh5/4WtjNOLSDSWjgDwNB3Pi2/uIcVQ?=
 =?iso-8859-1?Q?k5ZP5lzNO9NZM3oqy/nSuV8yWw9LStdKzBh3aK8MflrnI8WUVGJ+Fspe35?=
 =?iso-8859-1?Q?zDSn+mSrIjvD4WrI/irq01sdWQWlSlY8/CmJZaBAwrBCxGgcqgpWJOlltd?=
 =?iso-8859-1?Q?rc97f6fOl/zCxjx9Rro89eErhT72/7MFcOKAycepLPZpbVsRiU5vouxUKJ?=
 =?iso-8859-1?Q?0P9BLMjDoniASzd84K7QoaCzkiKoEoK7XpdNx9NCzv6dtjBnXlwAunlbVF?=
 =?iso-8859-1?Q?d7R9XewMMVWotuTuECTkWj4oEildrm9JdMlbpGGSrh3s2+AGBOglSuU6IY?=
 =?iso-8859-1?Q?U6B/3Vnvmgy51nE6fMJJPeLqbPN3+iVsI7d1ZwGZuUJEaRNgdpfpBuONjz?=
 =?iso-8859-1?Q?kHSKz9pNlng8z8K+DkxQgA+6GuTrCbTJDu3muzQBDJ1zRZoFFeyuctd4LG?=
 =?iso-8859-1?Q?7INnzo2oN7RxhD95W7mK5Vr+9zWaXkFh1r8DUNAzqCA8zSuAK7kEIeDpc1?=
 =?iso-8859-1?Q?tg7U1kSZSP1b1jd7fhHESDQmki8GjRb2YdA3+SYKsJfl4ysxX+rVs4Yg7l?=
 =?iso-8859-1?Q?foIeblkVr+5AeAZJawUHDjbReQ4gKlg54AIdAWBs8ZFnbEzmTTaretH2ZW?=
 =?iso-8859-1?Q?5ekIrLaNxa/G+zTanmf/AQNXuBpUHEPiE1NONJwwfyOTaCQlgy2THQ5CZu?=
 =?iso-8859-1?Q?/nFgI1pU/p/5sBQcVL44CXXCGHyp11c1BWXEQqLqnquSWWDWjhF2EOTfsL?=
 =?iso-8859-1?Q?Dr98HV0m5KVbXMFYhmZg6s8cZjW0T1M0qcKosl+3OVqnUP/cGTvHJlMBJ4?=
 =?iso-8859-1?Q?DWddcsbLq6UGwYOFnou1xH9TTx5Z0nhF53aKTlHTXpxOp1x+5blZ+HtRg/?=
 =?iso-8859-1?Q?gwX7ElS2EKO7R1wQfSdk5R+4g3i1hXJHTlWfS/LUe4qlqg94QJ3yIxEjsI?=
 =?iso-8859-1?Q?unJVpj4e00Y1lstd9/4nkPDSYRvuOc5aXvGvMu1k0oytDMfXPwjfUksmtU?=
 =?iso-8859-1?Q?2J9tb9HhAgb8QZVfZJmQVEra5cOYpYhJiBliioIEGpQB2ehKOU1wJBOci6?=
 =?iso-8859-1?Q?eG6LLW2mK9WPz0nVz0dTgnvw38JRc0noniPWVkpoNkINBWJcUJvm6mx61G?=
 =?iso-8859-1?Q?1xpoQGfXulV+u/9t7jUZKq1pc5Y3MehuPJxGicddCR16pDAIK6cGkSetO9?=
 =?iso-8859-1?Q?Cr5xuzLy6d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RvNpTN8N9/UlLbdks8R+oyFoy+AIUOZ3GFDzC6Uxr8L7OeXiqaLkZ4Q4dg?=
 =?iso-8859-1?Q?sAAiwPbfe3mDpX/SVAFOeShmvjN43W52syTxfBWcUh+RoNOXUiOWuoA1eF?=
 =?iso-8859-1?Q?HR1u81aA8KjOH0GvPR956UolKLMl+aMbNgQhpIB96dodz5gPVTtg24Y2z1?=
 =?iso-8859-1?Q?R+/eIuNQgB4G2DeSAGEas5pCqt5qbZsvrCXC2xw80zm49FZ8ch5lWLhe3F?=
 =?iso-8859-1?Q?RGV2RVqG3+lwvXDnOpdDx4OXguM1fQ+gEaKdvv50GnAnaNFzzDRa65rs2w?=
 =?iso-8859-1?Q?UThlHRvb3KkA0Zf2maI36RqORNP7TMr3Le18uNRfk4I9VxOhWbMa1OJPhS?=
 =?iso-8859-1?Q?kQ5tFDg4X3hJ2z5ZO2otmlhBFRLDyQ2XCa/+GtQE+ZgOhPG6F6DgurQUF/?=
 =?iso-8859-1?Q?zPL+6KhYbk0pbE4sCSL6LjH7z0su6Y2s2Q+/jBatzGq50K0Tv1rFd4faTr?=
 =?iso-8859-1?Q?DjWceuE6IwfujjdAmsq7tDFg0ACt0Y2IVIUTU7u7Wob/Sksw8lrafwKemE?=
 =?iso-8859-1?Q?z+PsvAeYUSo6tEKKneFiVqoRRyDfMehmSdWDiGisNbOUffUYEPU0k9L1h7?=
 =?iso-8859-1?Q?b8oD+yNt0g0dYH0IXc7irh10IOpPg5Jbdi9grIahYmwfE9T6Qp/Y5QK9qq?=
 =?iso-8859-1?Q?Wd4A0Oi33nPQ3kX+oBHvJAz/BQY1gt5VlgtgpQ2o4qI456a0M+GDq9mfkH?=
 =?iso-8859-1?Q?EfchmBj2FP723cTHYLNJZOh1pv+oDm9DnrNR0tsHSHq8G4U1x16MyLKXg4?=
 =?iso-8859-1?Q?0pIFr5hkfWqGKAqrBnwlFMcAuycZ+CLAN5di5GZ4fbTwKCwhcn0De4REdO?=
 =?iso-8859-1?Q?3Pvq03aURVyaXqFee9DRsJdevROoccPIP4nZwRyp/26UcbSw122QiRFz/i?=
 =?iso-8859-1?Q?y9dCjmrQRmrgMGl3Ngdi8qfAqLhJ5dxZ3VBVXndBBAyJdOWtdobHiFlIQI?=
 =?iso-8859-1?Q?sGz/mh50+Ok4bGi5wPSoZCuUhJy1vUjm4eABwf0zbX5JLJ2CMQQuC90lXi?=
 =?iso-8859-1?Q?gPEweuJORO6q9kd0r8pBe//h9xk7BnNi/veBrX8mm+C1rWrDC+sDco93ft?=
 =?iso-8859-1?Q?g/UCRM7IkwsjnLeL3k9BLf19cP2Tyh9iK5grqRINsoZh6fW8S3Bmr5J0h7?=
 =?iso-8859-1?Q?BUR48UYVMtbLnVw5WCkvpbdtvGc2o/xv+kJxabc6nZZMOyElzMQ58ZmG0i?=
 =?iso-8859-1?Q?O2cbW0XfSHP4O+/VB8Ac0kQ6iIlPFicLJBNHHqsI9HB2sqlQk5ubh4O8ds?=
 =?iso-8859-1?Q?ST9k1Fvp6zOqzeZITiS021xXL89tEAqzWZ5XowanY9mk3iIqdhUUHD9IB6?=
 =?iso-8859-1?Q?2AhVUigLgMz2q/bgLb4GgL/0n1mjgvks3JFTzW9EVWgFb2LuzK9TyDF0MR?=
 =?iso-8859-1?Q?TyI4r4b6TcbZfacEUrKR0bGhJu+qiKIU/97MU9/FDecPAUnbmlCWw2TT19?=
 =?iso-8859-1?Q?QRRjfraY8OljKtvH2Oo2CWnR3smhodd5p8dE0LgPYrywAQZSSTxs4XiwlA?=
 =?iso-8859-1?Q?WL20Flrrp0YQaX89faIb7THQV/5FquDvKdpgoEdV+KBhgWY6o7QMTTeAqT?=
 =?iso-8859-1?Q?Mf9c/4v+s2GkXOi5VobtrhUrjGENow3AS2vUC9GB5h33EXrECYFBskxpL+?=
 =?iso-8859-1?Q?xqvJtc13Db6JSm4zjVRkaieKhBwDxd0rDk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ed255f-08db-443d-8cc4-08dc86f79bbe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:42:01.0078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQrxH1SeWV+bwmy3X92PNIHkoLwCdI5Kz6y3ISP/SXIQknbAHAE1TAEDpRSk/owCAyihaswd00YZk7l6zzVWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jun 07, 2024 at 03:21:22PM +0300, Jani Nikula wrote:
> On Fri, 07 Jun 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Jun 07, 2024 at 01:51:29PM +0300, Jani Nikula wrote:
> >> Remove the unused HSW_STEREO_3D_CTL register macros.
> >
> > I don't enjoy having to trawl the specs to find registers.

I really doubt that this register will be ever useful for anything.
IIRC it was not even useful when we introduced it.

> > So I prefer to keep everything that isn't actually wrong.

on this side we could just get the autogenerated headers from spec
and dump them all here with all the bits, is this what we really want?

> 
> Shall I apply this [1] then?

ack from my side on either way.

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/76f980f5ed3638746c6b58dec7d0bd8c43a37987.1717514638.git.jani.nikula@intel.com
> 
> 
> >
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/i915_reg.h | 6 ------
> >>  1 file changed, 6 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> >> index 2d834c32a3fa..127b113189ef 100644
> >> --- a/drivers/gpu/drm/i915/i915_reg.h
> >> +++ b/drivers/gpu/drm/i915/i915_reg.h
> >> @@ -3385,12 +3385,6 @@
> >>  #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans,\
> >>  							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
> >>  
> >> -#define _HSW_STEREO_3D_CTL_A		0x70020
> >> -#define   S3D_ENABLE			(1 << 31)
> >> -#define _HSW_STEREO_3D_CTL_B		0x71020
> >> -
> >> -#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_STEREO_3D_CTL_A)
> >> -
> >>  #define _PCH_TRANS_HTOTAL_B          0xe1000
> >>  #define _PCH_TRANS_HBLANK_B          0xe1004
> >>  #define _PCH_TRANS_HSYNC_B           0xe1008
> >> -- 
> >> 2.39.2
> 
> -- 
> Jani Nikula, Intel
