Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29019030C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Mar 2020 01:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98776E43B;
	Tue, 24 Mar 2020 00:45:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777F86E43B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Mar 2020 00:45:48 +0000 (UTC)
IronPort-SDR: pUumYcPhuvGRvcf3DILb5yAhxcyrCQWRXl+5V4y/GiIhEey1TYXuv332033z0FCUWSaUJDXdA9
 1IC0vsNrp1Kw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 17:45:47 -0700
IronPort-SDR: zIuFdF+c4asC9xEcOaaANwIQFtOvwGcMxXbpr0c9gPcMK1mMUA3pt+Oscllj8my3u8T7Q/SfkP
 ZJ/5pNa3KCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,298,1580803200"; d="scan'208";a="325745472"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 23 Mar 2020 17:45:47 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 17:45:46 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 17:45:46 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.58) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 23 Mar 2020 17:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCSQu5Lta7O9C4zLqSoi5MgLpvnhbNlsqyUtZH3k+jFSyY37zf2WHQB3OjaYz/H5NDAM1e64dzgAaoyM9Nb5wQfPGbv/GWA+ro70dQAeKfkg9PQ8S0Yy7RRAQjCqm7vrTjaiUKTh7lPUDLn9l9pKVz06JdgzpjH0Kh6lUlEBUIluLzAfsSE0vdqhTi8kRXS6r/iMB6D7nZm9sdNrU8tKcjenUcdG1auDvCG8yqrL1uDq1FGMC2hve7s1Gr2RFXV1pniYUGqu2kWx4Zs+XW6rUZVInHfK1V3Qv3ggOCBFFjO2HztDQN1ALvP22Hdv4BkSRoIhBwB/YUeE6GLBqIU7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edx5r4sesBdjBk5bBfsrI6y1Ef3etCdSu1KicxOfce0=;
 b=dLfpE9gTnlHPnvOTgqnGaCxO+sgrk5e6lP67zzYR0uM2xjnPtnuqUQuPiafyTDEkDaVDAQwdXTfYeDKHpGyaZ3ytSuCDfmpBkufwoL3YmCmfYxHk7ZVU49FDUQV8jQSDrzrlDg3qPVwmRcR3zOcHthpONQDE/3HnAOh4/33bKbaywyDlXnS/SxDuU+SkYiJ10kiWbxEYSXS3cO1hiof5rpr8tttVvINKUvYIWWLmRjyPEGBJ20nOslYHWDsot8lh7RNn+K46nVBuoluNbu2J6lL+Tcu9Sy4JsMBJ0iE2jS1QnUd+KdQIiTa3AyK6aoUWV9a0tQSiY3AE+RjitdjyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edx5r4sesBdjBk5bBfsrI6y1Ef3etCdSu1KicxOfce0=;
 b=DyztAKDhMVCX4xixlaz03sxuRMXmMnPmz0Eev+AQpjEmTPcWOxvW4dTp5QhpPFDNm8eTqA0TnPV5qde817Xbl0qY51BS+HbNAYdoQ42G7NBH0aQw9q1+y0czPAT95Me09Y4+WjBJ4dOKYt4pE7siUMWH14Z+pKwdl9u2+9a9tBg=
Received: from BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) by
 BN6PR11MB2034.namprd11.prod.outlook.com (2603:10b6:404:43::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.20; Tue, 24 Mar 2020 00:45:44 +0000
Received: from BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::b9b6:973c:e464:5818]) by BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::b9b6:973c:e464:5818%12]) with mapi id 15.20.2835.023; Tue, 24 Mar
 2020 00:45:43 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Thread-Topic: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Thread-Index: AQHV/mTEjKHrLJits0+rx+8XG8oV5KhQ2hkAgAYQLcA=
Date: Tue, 24 Mar 2020 00:45:42 +0000
Message-ID: <BN6PR11MB16662C95A3B964B7AD8AB52B89F10@BN6PR11MB1666.namprd11.prod.outlook.com>
References: <20200320030249.5759-1-tina.zhang@intel.com>
 <20200320035550.GC8880@zhen-hp.sh.intel.com>
In-Reply-To: <20200320035550.GC8880@zhen-hp.sh.intel.com>
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
x-ms-office365-filtering-correlation-id: d2cec826-91e2-409a-192e-08d7cf8caf31
x-ms-traffictypediagnostic: BN6PR11MB2034:
x-microsoft-antispam-prvs: <BN6PR11MB20349DCD65E03DC740BC5E7889F10@BN6PR11MB2034.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(396003)(346002)(366004)(39850400004)(4326008)(966005)(186003)(6916009)(8936002)(86362001)(26005)(8676002)(6506007)(7696005)(53546011)(81156014)(81166006)(52536014)(33656002)(76116006)(64756008)(66556008)(66476007)(55016002)(5660300002)(316002)(66946007)(66446008)(2906002)(478600001)(9686003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB2034;
 H:BN6PR11MB1666.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wqWaYdQGZxvnv7l9OU476XRUlullEODjQNiN0D8id1aG4EHExW/TCBwCERssYhXoKuUZQBRTHApQLSziD7IX9CKpECWdjSDI5Bw/nynCIU9tha8V2BXOa6od3/gWxA2HiDXCYj9dao3u0uiaSv5petLuqvE3tZ5B0BWKqe20GfD8+BdoDscDG0Oo7dwzWHy5ReFKsGZ6wQxtgqa3U7m4YeFhFaFGyqQ6CSk63/7AavUgYmqcoafg4ktC7cYPvJw0V6Atqs9fmCWXfzOXBpRbFw6zP7bNNnbtAbiQFvwpfZru6bVeGosvekLqttua7qmyNN5h7JbsWviRZW77AtZJsk7XQFHLkSR57JkRquEk2TU3dxgEKKzo559uo0Hh4oBzK+1eniEDSsMH8dt+hFwegcadBRoBm+gX6GDBwnNZQfblXhtAlyR4T9HDFMdItSEFlaaKWwZRKBRP/OMpIbljCB3O/OJFtUxLK7BJ5ZTQQQDolGRt5lGVL4H4/HLLOGhTRmd67m5iW0Gzt8BQCulAzQ==
x-ms-exchange-antispam-messagedata: ulXSHiuvn0neZdJKy6pIRB36sH40PqDeKJ64r45T1aYZ4Lv8xDe+GCdo9ZpthbzrmjLYOQA3+9y3NC6B6Eg3AQ3vYFR/kBBDnrto1TsL6LSG4rc3I1wzkhh/bS87eufjT4W59656SGeLmK6+xDP4Rg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cec826-91e2-409a-192e-08d7cf8caf31
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 00:45:42.8170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKyMkoHlFzjapQk50SS2s2ie641ZzzPxK6WIzOa5fOAofKObksEHIs3zWt2ZbwZG1X8D7yO66q4EYdWMK2qPHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2034
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



> -----Original Message-----
> From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Behalf
> Of Zhenyu Wang
> Sent: Friday, March 20, 2020 11:56 AM
> To: Zhang, Tina <tina.zhang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
> 
> On 2020.03.20 11:02:49 +0800, Tina Zhang wrote:
> > GVT-g provides guest with dp type connectors and does the dp emulations.
> > For crtc timing, GVT-g just copys the parameters from host, which is
> > fine when host has dp type connectors as the vgpu's crtc timing never
> > goes to hardware and the reasonable data got by guest is mostly for
> > the sanity checking and clock related calculating.
> >
> > But when host doesn't have any dp ports, GVT-g may get invalid data
> > from dp related timing registers on host. And those invalid data
> > cannot let guest pass the sanity checking.
> >
> > So, solve the issue by providing reasonable defauts for the transcoder
> > mn registers no matter whether host has or has not dp type connectors.
> >
> > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/display.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/display.c
> > b/drivers/gpu/drm/i915/gvt/display.c
> > index a83df2f84eb9..44185cda0905 100644
> > --- a/drivers/gpu/drm/i915/gvt/display.c
> > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > @@ -167,6 +167,17 @@ static u8 dpcd_fix_data[DPCD_HEADER_SIZE] = {
> >  	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> > };
> >
> > +/* Set defaults to transcoder nm registers to gererate reasonable crtc
> clock */
> > +#define PIPE_MN_REG_NUM	0x4
> > +
> > +static u32 trans_m_n[4] = {
> > +	/*
> > +	 * PIPE_LINK_M1, PIPE_LINK_N1, PIPE_DATA_M1, PIPE_DATA_N1
> > +	 * generate crtc.clock = 89099 kHz
> > +	 */
> > +	0x46666, 0x80000, 0x7e34cccc, 0x800000
> 
> I can't remember clearly, but is this clock related to our virtual EDID mode
> timing? Would that be different for different mode? e.g If we want to extend
> for 4k resolution, does this need to be changed as well?
According to https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-skl-vol12-display.pdf page171, they don't come from edid. 

It seems things won't go bad, as we don't let the clock go on hardware really. So far we didn't see any kernel complains about those values. And we can check it again when 4k is introduced.

Cheers,
Tina 

> 
> > +};
> > +
> >  static void emulate_monitor_status_change(struct intel_vgpu *vgpu)  {
> >  	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915; @@ -
> 233,6
> > +244,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> *vgpu)
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=
> DDI_BUF_CTL_ENABLE;
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=
> ~DDI_BUF_IS_IDLE;
> >  		vgpu_vreg_t(vgpu, SDEISR) |= SDE_PORTB_HOTPLUG_CPT;
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> trans_m_n[0];
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> trans_m_n[1];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> trans_m_n[2];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> trans_m_n[3];
> >  	}
> >
> >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) { @@ -253,6
> > +268,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> *vgpu)
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=
> DDI_BUF_CTL_ENABLE;
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=
> ~DDI_BUF_IS_IDLE;
> >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> SFUSE_STRAP_DDIC_DETECTED;
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> trans_m_n[0];
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> trans_m_n[1];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> trans_m_n[2];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> trans_m_n[3];
> >  	}
> >
> >  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) { @@ -273,6
> > +292,10 @@ static void emulate_monitor_status_change(struct intel_vgpu
> *vgpu)
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) |=
> DDI_BUF_CTL_ENABLE;
> >  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) &=
> ~DDI_BUF_IS_IDLE;
> >  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=
> SFUSE_STRAP_DDID_DETECTED;
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =
> trans_m_n[0];
> > +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =
> trans_m_n[1];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =
> trans_m_n[2];
> > +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =
> trans_m_n[3];
> >  	}
> >
> >  	if ((IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
> > --
> > 2.17.1
> >
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
