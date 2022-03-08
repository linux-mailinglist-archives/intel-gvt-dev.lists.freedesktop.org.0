Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB94D1436
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 11:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D3110E2E4;
	Tue,  8 Mar 2022 10:07:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404210E2E4;
 Tue,  8 Mar 2022 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646734029; x=1678270029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9Z5Qm56FtYNbCspioOQ+gTE+5MLjq1qzsKVg2WNwfn0=;
 b=PeocyqMzOy/MfhuqxFGqvezBELSGshm6iwnu576SwBcgrC3LGq2xsuar
 qEa93d/V2U06pN8wATrNknXOOO3TW09ZHyIqVdD8oDKDuQLtF9PRyCk/f
 u29gc30KxPhsK0MgvjBBk2nQF/wVbXZQ5Kr7C3GFCHoWyQROYeH1OcZAS
 24HkZ22Gcqrl1psZP+qjXgTNlT/1IagwrnpbIC4xmrkB3rfKiCB4m04H/
 YkBmkHiWBaN6lyHqRO6KNJRGeJcqPjnTxgpngkvcV0SHFU9mjrgiswlzr
 5jqbik/AhMqk5+F8GAyieB+dEl5E2oLb/fauQHBQHkuGNB2ALBa/oAp97 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254374619"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="254374619"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="595837440"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2022 02:07:07 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 02:07:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 8 Mar 2022 02:07:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Tue, 8 Mar 2022 02:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx8/MltPI994QpYcRKb5wuHGShmvPOJZPUxf9hP/J0zKP0tN41a8nRLHXXCPxWJ1Jxq/5EB91zQYyggck/IIIKl7+T8ls4aTGMYNnqQSVblerSF5Z3vv2N/BD2bm4ruRwOqU+3hEx0ehIsxseje0QvYrQXZkeqtFp+N1kdKKMQYRjc+Zb3zJCjE6orAKO35FtDiqbz6OAvsLywWdr3r9oz6gz2+s5/XBTN20+Zk0vXaX8TcysAMGgAsl3b17STBRsP2dcOnx7Kl8ODp5vIG1Sk9IJIfTaLVlaBdz+T4MOVOrvB0Fwk/+X2oOpzBsb2cy7o2/uBtl9QaBo7NXqB6rig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/jYaCzHqkQPNBCON1pDvDRLBpFPyLzPzZ4hhpF5oPQ=;
 b=c5mE2qG0mqw3Qk0kDj50Kj+9Dl9Xn+OHYazj7C3cs+nW1oQqLVFJp/H56y3/H2dFrhzf5P/dGghKWtmwJpo3jpXqR+oozlBWi0l7mpmyGiL4IkIeDao8jV8fV5ucTIAV2qEiIWFzDCzgTs+VzP7stLGqJvnIhq5xt1qH/6l4KxqejU7sn3cT9xrvVNiiDnP8H//0OST5aPmakVWnnLWKovbI6sml4fGT44SaGs7fd1nswe8mj4FiVBcXrFq2KcicFYgWkn665j9xZMyBquiy1L7rKm4HIs4DzUBA0whiJF6LrAeUYU5mJaK5ZzobTs/Ve6P7JCT4EYKsiOYsHoLzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Tue, 8 Mar
 2022 10:07:05 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4c9:5841:3761:6945%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 10:07:05 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [GIT PULL] GVT next changes for drm-intel-next
Thread-Topic: [GIT PULL] GVT next changes for drm-intel-next
Thread-Index: AQHYMresZ/14w/uEPUO59mgSWWfBhqy1QA2AgAADCAA=
Date: Tue, 8 Mar 2022 10:07:04 +0000
Message-ID: <ebfe0e0f-d240-8435-0517-2be3b89252ba@intel.com>
References: <e87298d5-0efb-981c-03d6-8b1bb7ab2cd6@intel.com>
 <f869fab00a4b5757fd272b3b7e178b4dcd921e6b.camel@intel.com>
 <02808c4c-7725-2afa-1968-2177ba112872@intel.com>
 <ab642779-7efd-2bf0-6484-ca6bfd20f2d0@intel.com> <Yd2W4T1Y8X0cP/PL@intel.com>
 <0233a744-d02f-7b72-ff95-389dbc42fcbd@intel.com>
 <e38f0725-6b22-8e49-b8f6-41986b0ece06@intel.com> <87wnh422f6.fsf@intel.com>
In-Reply-To: <87wnh422f6.fsf@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 259d614b-d78d-4dfe-a17e-08da00eb65b8
x-ms-traffictypediagnostic: BN9PR11MB5292:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5292084368F960CDF7EE1D59CA099@BN9PR11MB5292.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ybKiDuQzleSFlf1AIZdSuMqfGoAqGvBYNHMGU2T26mFnAJvcoFmOa1P5yfkFtFIx+iD9QRt63f2ufzr/+QiAfxTKb4xrxO8K1rS1QvI5IjUDHwF2vGoLVMFwtiD51OZAUFgNICFbiGIn+rdvOeTHebGT/N7RjHH1vkXh4UyiigHpOOt6W+c8F42KLvbK6aZyLpEIRmlhJ+3UCiKGpYPnnWlItvL4+NqMCQd11I7pY5JpRfph8MpyV/8mSGfwuhFb+LnLGXCMB2b2F78RlDKw86EvK6O7mLjFjt9KcWrunOIM2OhfWGXCihmqHZQK3GmxDM9wILjFEiCrhU6tDgd1CX9diHOM8ZH6Qh+11NdxumAJQGPeec4aNJf4KS4L5ZKEXXuBO9LejLTG4IlVkNDbIUVt3pcUO06c5d0FOaFzs9ILe8LtXdoFpA607dnyz7WAvGVSfC9qwEuOF3gQBhkpnUUu8gNqF9duahG/OkgM91elDONagOP57/XkZtx+LmZmrgVWDxlVU/XtSk1vOsFHr2BGjVib9P5+G3TQvlr2WlihgbqWQx/6y/D0AdeF46+YGeVQXmEPcuBSdPbwu2cScvL5mrXvbBqwxMfcy559GyVbUCk0pt4z2Sc0ee62Tu1O2QRH6B0rpifl5dmn7MNYuUetWfkZlMdB403zpYW/Y5uP+4z1Bmbsla6TL6MzIz2MnW5qmssYCEU8ox0M6fmu309tLqrl544f/mUPZ7MDc6+wNuYCFv0SFThcA9tpfkTZ2oZuU4EOsB6hXCD0isMJhJokaQjw5810F8GPLw5Lnz7NSZ53JeYnb30SnQNC0fSQkjx2ILnU88WC89fZs4oSmy9QpNAXb0JnGINn0px8Mg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(6512007)(508600001)(64756008)(66476007)(66446008)(6506007)(966005)(6486002)(8936002)(76116006)(66946007)(316002)(54906003)(110136005)(31686004)(36756003)(71200400001)(86362001)(53546011)(2906002)(38100700002)(186003)(26005)(66556008)(82960400001)(5660300002)(2616005)(91956017)(4326008)(8676002)(83380400001)(31696002)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ihmxe5qSCLV6RhkEWfFvd7sdrgTh5Y3vkcH1EmwIB9yO72A3cxdEH1eZ?=
 =?Windows-1252?Q?H1t6w3OzESbsp0x+NIhJ5N4GxhVTzckbcwPdmiVpkgDzNsy/llK/Uneo?=
 =?Windows-1252?Q?PaU7P7VKpceLrA0rM6mjiNlGq+U0LV7doXePrh+NUcqWMokPdXLhlULE?=
 =?Windows-1252?Q?3UzAgumrLLkp9QGw1OSAc3+XlkBNY7uyyFRVsBbjGQWU5Abr/sL7e2r2?=
 =?Windows-1252?Q?dgQxcC0i4scOuLLqCoKDsCwkmA1DhSsVacZ6PqG1Ja9cQVuKF+r9JD1I?=
 =?Windows-1252?Q?m+eKiixCAoGOs3qLpCyPQXuzuS/F8wFJhCHVmPh5vYlxqJm6rXEJqpvi?=
 =?Windows-1252?Q?KRJ9vvxWLxg0UoHcPRmh1K6lz334x6aIabi8L92WreNa9Qj3/QCLmjWx?=
 =?Windows-1252?Q?9uRNNNxfJ23jOSlz1sdxRTl7ziAOKrd0jh3M9K11L37xGgtW5QA2e7NK?=
 =?Windows-1252?Q?beZLMih125UlFhampca/DcaHHfrDchDvrQm/EKcES9F20OKwxqtUw1wR?=
 =?Windows-1252?Q?5vTyjPmRfB0spI8Llk2FsVhBbdDGyOD6ba6ptd/hFWQXxO0HghmqQ80F?=
 =?Windows-1252?Q?coqxGItflTPU3BmCQRpleIRCZSFAwFnCnJo0hv2jzNe6q3Bpcb2Rz7Zk?=
 =?Windows-1252?Q?rtXZy7XAn/NLLH080zqxdjTOM+x5sOiaKP/MfoYfVlynskAgAn2H1IzF?=
 =?Windows-1252?Q?xsK33ERcKjlZ7cZW5AWcKb+qd/E7s/cy206r/zp+ssmWlEm86ZPMq6zW?=
 =?Windows-1252?Q?VuB8ublS7KkbVA2wFCORZtTx5UhkXJbCfW8lf4ChFkO6h5i4FZgXq/qx?=
 =?Windows-1252?Q?UeDCjvetEQ8tANkdaYOYsK1VG7nOEVa9rwEa4pezp9tb/7ay6afCuvjR?=
 =?Windows-1252?Q?GEa+zfy+cSD9njYTundiELJgBq5bTfeWvBEeEPTrDug82I2hLpzAAY0y?=
 =?Windows-1252?Q?/oATG7rTfPylJdDI2URM1psUNpmhE4hdIIFiK0P1IFO/8ds15s9HTS6s?=
 =?Windows-1252?Q?IzezMbzACIeZXXS+86mn4xFchutNlEmkKi4+iLy6wncE8Iw8gle5M8ms?=
 =?Windows-1252?Q?9bLotzoE4MYo9TcFi7RoO6a3D7oLGVQO0swSpMJZrbpYAefza3Sgssgt?=
 =?Windows-1252?Q?k0B7NV3C+vF1UEiL6U8TvYpMqEf6lii0EDvM0SnIKCXMBX+ZwyXPA8Pp?=
 =?Windows-1252?Q?LJXJO5gWrWGCFuFuzSi4y/1uglLcqUbaU0uR5zYFVYmWAM6iGm8Q6hTe?=
 =?Windows-1252?Q?X/m6y9mJPlLF1rJE4VFNzMhlo4KipLBW3k6mY2cKTFs3F5gdqDzT19EW?=
 =?Windows-1252?Q?3kQFzWqpEy/9xpx88CjE96P1+xBzd5aBio5+bKKT5MCblVVLV+NNTCPb?=
 =?Windows-1252?Q?h7ink0DSzx529EkEAoBqEbLC/VnPTqEz4b0OMTu4sA+bVVylbkjoP17H?=
 =?Windows-1252?Q?H/cPFgjUnmtezdb8+19stewxD4eJ8Yk170JDsPpgPdfVzaO1guxuQwaS?=
 =?Windows-1252?Q?+yG46TRWsmrNu6O7WjjCnNtQzFb0qvtV33wadPwXpuJH/XKlHDiKsERv?=
 =?Windows-1252?Q?t6hTRi3CrYOObRNZDkzLQew3W9fwtZoVPBI7dI3wDglK7Nzgv1hqx24W?=
 =?Windows-1252?Q?z58PcqnYIWm5O6Rvy5KvrAwvJFEc4+UQ7HgKSTayqmwlZaAPplxa4kpv?=
 =?Windows-1252?Q?67AVR2807UqDB0xQjOzRdUzFUaRlBqeDRxa3acolMLSP2EmSo0RjTAXc?=
 =?Windows-1252?Q?fO7S7BdKoTjcyrLEAZs=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <EE173FDB8369CC4AAB0E1085E70F9898@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259d614b-d78d-4dfe-a17e-08da00eb65b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 10:07:04.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8lcXqifKXQF/zqy1PEjy3ZeANyT68GRmyHIiPZuMV44ZmavemnTUeZOCs0/RRKRZchfkFYV9B9E5s7ri3DYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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
Cc: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Which suits better for you? For me, I am OK with both. If you are not in a =
rush of closing the window, I can submit through drm-intel-next-fixes.

Thanks,
Zhi.

On 3/8/22 9:56 AM, Nikula, Jani wrote:
> On Tue, 08 Mar 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>> Hi folks:
>>
>> Here is a new pull request of gvt-next. It contains a small patch to add=
 the missing
>> mdev attribute name, which will be used by the middleware, like kubevirt=
.
>=20
> I'm wondering if I should pull this to drm-intel-next, which is already
> targeting v5.19, or if it should be pulled to drm-intel-next-fixes
> targeting v5.18. It does look like a fix.
>=20
> BR,
> Jani.
>=20
>=20
>>
>> This pull has been tested by:
>>
>> $ dim apply-pull drm-intel-next < this_email.eml
>>
>> The following changes since commit 30424ebae8df0f786835e7a31ad790fa00764=
f35:
>>
>>   Merge tag 'drm-intel-gt-next-2022-02-17' of git://anongit.freedesktop.=
org/drm/drm-intel into drm-intel-next (2022-02-23 15:03:51 -0500)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/intel/gvt-linux tags/gvt-next-2022-03-07
>>
>> for you to fetch changes up to 43d26c4fc6c446d766253d546f0083d78023d34a:
>>
>>   drm/i915/gvt: add the missing mdev attribute "name" (2022-03-07 12:21:=
58 -0500)
>>
>> ----------------------------------------------------------------
>> - add the missing attribute "name" in VFIO mdev hierarchy.
>>
>> ----------------------------------------------------------------
>> Zhi Wang (1):
>>       drm/i915/gvt: add the missing mdev attribute "name"
>>
>>  drivers/gpu/drm/i915/gvt/kvmgt.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>=20

