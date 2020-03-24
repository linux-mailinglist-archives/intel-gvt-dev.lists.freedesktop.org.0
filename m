Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921EB1903F2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Mar 2020 04:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4432A6E0A6;
	Tue, 24 Mar 2020 03:50:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC66E0A6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Mar 2020 03:50:31 +0000 (UTC)
IronPort-SDR: 66WvQAAL05DRUgNZZRabtcAwMD2IcnR0f2/rE0Q4ET5iGpwxpJp/jpB4p3wlUzmkmqT8pDbWW6
 Mgt4u0B/UhCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 20:50:31 -0700
IronPort-SDR: d+N5SNAFOBH1ybPNCcngF2JI7MLXcVgrR1ihj4U5DU8XDy7GTc/TReUL5mICuYCCkA4mhspH6t
 z5G6yJTTd0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; d="scan'208";a="447740244"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2020 20:50:31 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 20:50:30 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 20:50:30 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.55) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Mar 2020 20:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP/RpFRUtuNT0rqIj9RJDgQfXmu0Nwvx0ZdZW8/ljN+UOF/QMshmAS72y2oFkW5JwYZwUGVNVtRNEJws02rxOmxQQ/N3ub8klMv6cCPYr7F+XFb/xUV1xydRngTlLLT1rjU7wyi1+UAP0gTX4fj5ig1Hvo511ZpoCjTTR8Yh8YV165fwsWNz0EqloJPjQmNO19dN2PUjtHFMOfMb8bWDpfz2sRq3JV8zLy9aOzYmkj5rWCmOv6I+Yr5jwt9dJzMDkYvUrX0UMvpbCJLTKbOmctmaTMq01yWaWHI70vJxs1o8zlPR/VweSGPAMT9LoMMlu3/CxmZ2oDpBss73b5rEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXNqb+YRojDpCB+XmIrxs4MEoZ9mJey5lwH3ELQmsUw=;
 b=eCBwq1/pwz+6rveHw9lsNoZ60OPWjgFivWAlSDibLLooOYI+guBdcz23fm44iei8igRAl2n0UeHJV7spJ02LvuYli7N2SMBvmKXxFuBmWlHgzZbkyTL8mtvl08I9vvFRvAKpOl5KUWLcg0N1sPatsceRrMLP/N7WqTwXMqfR82ltdcP7rELHcq12IJbzPmC482zwjbYwi8O/BuOXtgOTUoueenFVu0goYrIk52+NxoppJ+umRGnvQRaat9xoZJQZX8D+PAzCMculWC6Ne/LJTTlHHv9x24voqbTXy23ct2iVKmAnz5A9E1kD3LsCTVOZlao1O1LJg/ojcy3CS1ekdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXNqb+YRojDpCB+XmIrxs4MEoZ9mJey5lwH3ELQmsUw=;
 b=XOnRnqWHdEARWugf7EjiBQ0VOFsa43+u2CwUv9pVDpg0/C1i6ipiEiPoKV1aP7PGJomaLcEfRP2LE91IuDl4MrWDd8n3cJIPe84ctxXOh1Fl1gD0TCutiG7y5QMZmL3fvcNYnBC0WbEuu+u+k7X3fGz+ItxVKj6ggoSGejkMzwk=
Received: from BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) by
 BN6PR11MB1971.namprd11.prod.outlook.com (2603:10b6:404:ff::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 03:50:29 +0000
Received: from BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::b9b6:973c:e464:5818]) by BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::b9b6:973c:e464:5818%12]) with mapi id 15.20.2835.023; Tue, 24 Mar
 2020 03:50:29 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Thread-Topic: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Thread-Index: AQHV/mTEjKHrLJits0+rx+8XG8oV5KhQ2hkAgAYQLcCAACe5gIAAD6Uw
Date: Tue, 24 Mar 2020 03:50:28 +0000
Message-ID: <BN6PR11MB1666D13324AB9A0A47F5DA7A89F10@BN6PR11MB1666.namprd11.prod.outlook.com>
References: <20200320030249.5759-1-tina.zhang@intel.com>
 <20200320035550.GC8880@zhen-hp.sh.intel.com>
 <BN6PR11MB16662C95A3B964B7AD8AB52B89F10@BN6PR11MB1666.namprd11.prod.outlook.com>
 <20200324025327.GV8880@zhen-hp.sh.intel.com>
In-Reply-To: <20200324025327.GV8880@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tina.zhang@intel.com; 
x-originating-ip: [192.55.52.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e687fe44-7f83-48aa-aeea-08d7cfa67e86
x-ms-traffictypediagnostic: BN6PR11MB1971:
x-microsoft-antispam-prvs: <BN6PR11MB19712FB3E2019D7CE92CA02C89F10@BN6PR11MB1971.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(346002)(136003)(366004)(396003)(64756008)(76116006)(66476007)(66446008)(66946007)(5660300002)(52536014)(478600001)(966005)(66556008)(71200400001)(81156014)(81166006)(8676002)(8936002)(86362001)(6506007)(4326008)(7696005)(9686003)(2906002)(186003)(53546011)(55016002)(33656002)(316002)(6916009)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1971;
 H:BN6PR11MB1666.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BYJtIuMBgAKoV/EgY145QxIkJMARNEsLa75gqeMTmTeo5bELJoa0EfdSuep17nHe8PvUH/+jyU6+xh020ZIu47sqI/gsuqaHbfoB34vliThaZhorFGHc0ARIKs858zZ/f8p07oE9uAmQTMrogDke7a3aGBF3cLKJyFT7aT05vdG/Y/j/mxSYyCE160rxX1mrn19HY8IGPqTGTLRKk6cqilv3RzUx+Q3UPAcZ+eWdaSBhl7UbdoWruSvX8k0tRTb2jp5RT5BEwPZjEtPuzCF4Y83bB0mHGWSh6iRU/xfsnahAGyfOk7EJAw1tlzr88wk9LbI2Nm9jBzcxx1ZWIokCLQMUk2KmJTL8D94g0GjVVy0o7/6gv/7pvV9op5AbVkOXvZRFfBvyhvabgRLUxREBGoXy9C+Iq5H+Ex661NmwWQZCxUIEXHbjO77oIQ8sSK9S4B2l4WYQobJXhPGom9ZC7oxgJv+iHd0PIp+4LsqbnsvC5+3yGj2WBsqyQCVnIUtBI5UJIVDGUcJm8QyaayonrA==
x-ms-exchange-antispam-messagedata: 8v+6gmFVE45stQt1ARfXtjOLNfeXSg8T12fG/XO0ar2OJQMfDDWmJI55JtSAATEuvBHEPEyMOvm6aO+kxCh5BQhxPTZ4+k/FTQYTKuiqEklz/+DdUJeZjhaZwhMGY4bRJNG78jE7EPPNjTcgpfvmFA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e687fe44-7f83-48aa-aeea-08d7cfa67e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 03:50:28.8432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unTqMlyA/vyY2eZx/ViTfVFvOgepfAiBWvkaUJYyKEwT9IpfWOTH+Ig6Ha76C1M2B9MvqkqFXcQ/CLCwoOT4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1971
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Guest driver just gets those values from registers, instead of edid or something else.

BR,
Tina

> -----Original Message-----
> From: Zhenyu Wang <zhenyuw@linux.intel.com>
> Sent: Tuesday, March 24, 2020 10:53 AM
> To: Zhang, Tina <tina.zhang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
> 
> On 2020.03.24 00:45:42 +0000, Zhang, Tina wrote:
> >
> >
> > > -----Original Message-----
> > > From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On
> > > Behalf Of Zhenyu Wang
> > > Sent: Friday, March 20, 2020 11:56 AM
> > > To: Zhang, Tina <tina.zhang@intel.com>
> > > Cc: intel-gvt-dev@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
> > >
> > > On 2020.03.20 11:02:49 +0800, Tina Zhang wrote:
> > > > GVT-g provides guest with dp type connectors and does the dp
> emulations.
> > > > For crtc timing, GVT-g just copys the parameters from host, which
> > > > is fine when host has dp type connectors as the vgpu's crtc timing
> > > > never goes to hardware and the reasonable data got by guest is
> > > > mostly for the sanity checking and clock related calculating.
> > > >
> > > > But when host doesn't have any dp ports, GVT-g may get invalid
> > > > data from dp related timing registers on host. And those invalid
> > > > data cannot let guest pass the sanity checking.
> > > >
> > > > So, solve the issue by providing reasonable defauts for the
> > > > transcoder mn registers no matter whether host has or has not dp type
> connectors.
> > > >
> > > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/display.c | 23 +++++++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gvt/display.c
> > > > b/drivers/gpu/drm/i915/gvt/display.c
> > > > index a83df2f84eb9..44185cda0905 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/display.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > > > @@ -167,6 +167,17 @@ static u8 dpcd_fix_data[DPCD_HEADER_SIZE] =
> {
> > > >  	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> > > > 0x00 };
> > > >
> > > > +/* Set defaults to transcoder nm registers to gererate reasonable
> > > > +crtc
> > > clock */
> > > > +#define PIPE_MN_REG_NUM	0x4
> > > > +
> > > > +static u32 trans_m_n[4] = {
> > > > +	/*
> > > > +	 * PIPE_LINK_M1, PIPE_LINK_N1, PIPE_DATA_M1, PIPE_DATA_N1
> > > > +	 * generate crtc.clock = 89099 kHz
> > > > +	 */
> > > > +	0x46666, 0x80000, 0x7e34cccc, 0x800000
> > >
> > > I can't remember clearly, but is this clock related to our virtual
> > > EDID mode timing? Would that be different for different mode? e.g If
> > > we want to extend for 4k resolution, does this need to be changed as
> well?
> > According to https://01.org/sites/default/files/documentation/intel-gfx-
> prm-osrc-skl-vol12-display.pdf page171, they don't come from edid.
> >
> 
> Pixel rate clock is from modeline timing, e.g 30/60hz refresh would have
> different clock.
> 
> > It seems things won't go bad, as we don't let the clock go on hardware
> really. So far we didn't see any kernel complains about those values. And we
> can check it again when 4k is introduced.
> >
> 
> Pls at least note the m/n value in above calculation and what's mode clock
> generated against, instead of just register value which is vague to understand.
> 
> > Cheers,
> > Tina
> >
> > >
> > > > +};
> > > > +
> > > >  static void emulate_monitor_status_change(struct intel_vgpu *vgpu)  {
> > > >  	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915; @@ -
> > > 233,6
> > > > +244,10 @@ static void emulate_monitor_status_change(struct
> > > > +intel_vgpu
> > > *vgpu)
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=
> > > DDI_BUF_CTL_ENABLE;
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=
> > > ~DDI_BUF_IS_IDLE;
> > > >  		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTB_HOTPLUG_CPT;
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> > > trans_m_n[0];
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> > > trans_m_n[1];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> > > trans_m_n[2];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> > > trans_m_n[3];
> > > >  	}
> > > >
> > > >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) { @@ -253,6
> > > > +268,10 @@ static void emulate_monitor_status_change(struct
> > > > +intel_vgpu
> > > *vgpu)
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=
> > > DDI_BUF_CTL_ENABLE;
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=
> > > ~DDI_BUF_IS_IDLE;
> > > >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> > > SFUSE_STRAP_DDIC_DETECTED;
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> > > trans_m_n[0];
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> > > trans_m_n[1];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> > > trans_m_n[2];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> > > trans_m_n[3];
> > > >  	}
> > > >
> > > >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) { @@ -273,6
> > > > +292,10 @@ static void emulate_monitor_status_change(struct
> > > > +intel_vgpu
> > > *vgpu)
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) |=
> > > DDI_BUF_CTL_ENABLE;
> > > >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) &=
> > > ~DDI_BUF_IS_IDLE;
> > > >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> > > SFUSE_STRAP_DDID_DETECTED;
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> > > trans_m_n[0];
> > > > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> > > trans_m_n[1];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> > > trans_m_n[2];
> > > > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> > > trans_m_n[3];
> > > >  	}
> > > >
> > > >  	if ((IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
> > > > --
> > > > 2.17.1
> > > >
> > > > _______________________________________________
> > > > intel-gvt-dev mailing list
> > > > intel-gvt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > >
> > > --
> > > Open Source Technology Center, Intel ltd.
> > >
> > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> 
> --
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
