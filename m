Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20B179DAA
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 03:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93B66E119;
	Thu,  5 Mar 2020 02:05:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926C96E119
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 02:05:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 18:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
 d="scan'208,217";a="287532366"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2020 18:05:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Mar 2020 18:05:25 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Mar 2020 18:05:25 -0800
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Mar 2020 18:05:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 4 Mar 2020 18:05:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhcmOKFeACNsiNSq7hkR95bpBwjsBTx5Prmi69GKxwVaSSa3IdI9bCJsMuV2F0CiSwveFx0N1c0e5OhnrvGnXJacJ3PBaYGiQPeerp0vjI4oLYPXHc4kekUr8dFWXNFpicMIJz1Uq6zPXzTFzgnmqhaf6c1miViM+M/6H6OI+8F7XI171lu+R/qI6Nhli0lsQFFyBH0GqVZs0SXr6YVrL4OuvpB8Ceq+VWUfmLJLddfc0jI17CjNpZv+TntCiNo9Y+HsJHIciCY58Nv64u5mma9vv/2mfQGpVgRkGkB3lzIx1H8NdWZt+P+klkXWzF+e0clauD8Q7HDcQJYGYwlJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH6PELVm9tawfKsbd3o0UBHRQU4xmyLhmIRTZ0lLqnM=;
 b=N03Oh5xLl3izUs4aiHuAReuIwzu9tm67ldG1af3fGi4kI1DqQdjFoIuSrFgzVvsEyXYJIAXBqNiPimoAvS0AoZeeoFq5BGbRhjHPc25S+rDIgd342mDKydwvsxIc0L/Usr3Z8zOzCCIwd8clgbsTM575W9FSXYqsAvi7okMn/rqvIvwPzdGJmwh+ZTlGET/uoceaEnqIo3VtORhC2ZSRrRmq6SOBPl+lFO6iUDxVPnKQlmVM76QC/p2yZiIk580o1PaM0BnMGQjzkgQAzUo/2l0unRASMRLN/EBvZSdB5ZBPPj1KpUO+XMTQDTDuRUr6js3AJCW8JU5KKdB6xAZi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH6PELVm9tawfKsbd3o0UBHRQU4xmyLhmIRTZ0lLqnM=;
 b=mMUur2FrVJ6uvNgXJ668Czo5js3/dSUvKSQmuu5ZIIzUZYhvhz2ik+uCwP6zqM1PSeBMRFULuGOR4Ilr+UIobqW+9xOwwexuRs5usvBiX4jdM+TZNIjd6Z8iaQSIJH4a/o+dKW3/QVLHy4Lt3+MD7KBoxJRX3qC3eCACgCOEjxs=
Received: from BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) by
 BN6PR11MB4068.namprd11.prod.outlook.com (2603:10b6:405:7c::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 02:05:23 +0000
Received: from BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f]) by BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f%8]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 02:05:23 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix display port type issue.
Thread-Topic: [PATCH 2/2] drm/i915/gvt: Fix display port type issue.
Thread-Index: AQHV8pDH0JWDXVpODEqsze8WU8YKBQ==
Date: Thu, 5 Mar 2020 02:05:23 +0000
Message-ID: <BN6PR11MB16667DC180EA243E524632EA89E20@BN6PR11MB1666.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tina.zhang@intel.com; 
x-originating-ip: [192.102.204.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3685f1e-e9e4-4b9c-d1ef-08d7c0a9aa3a
x-ms-traffictypediagnostic: BN6PR11MB4068:
x-microsoft-antispam-prvs: <BN6PR11MB4068D8B0803008494CDD787B89E20@BN6PR11MB4068.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(199004)(189003)(71200400001)(45080400002)(33656002)(66476007)(64756008)(2906002)(52536014)(66946007)(6916009)(86362001)(66446008)(26005)(66556008)(81166006)(8936002)(4326008)(81156014)(5660300002)(186003)(19627405001)(7696005)(8676002)(9686003)(53546011)(6506007)(498600001)(76116006)(91956017)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB4068;
 H:BN6PR11MB1666.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7JQcdXlqmC/59PW3eWWqM1shqQSKDMyWBv34uC71ZuyzINJn8dTszQNq+lceRa0USMHwWosOW0LZle/YA/7VYdnOR8GtajRw3wEyr+L9EBR5NCc4o4nslQieYbcfYfPCzHiFilmlexHf6ngNmN1+/jLl3fqnDd+USikP8exB1qTpbX76aefIh/1bURM2GhxsKNtT1YRYOIDQSpwyksrxvZ2qWL47rjehMsTH9FQlvHzWiXgSKIYWuBxyPSdbz5pROcYxitMAwtJsshpKGgd6Sha3Enx3nkgARRanCq3yzAwkDOzcDumhLxBim3XQtERzEzXetsfRR/TcHhy2nkVr5oRxH5CzzltkmSCib8fzFjq3sZQ55l4GQVKsZKzjQ3RpBi/rBWU+xnZJqqaymqinf1IB8zII11YqLQyb3THv9hJQAjVhE/EdgMdUqvmDiP5K
x-ms-exchange-antispam-messagedata: 4OMz/OaQ7/xjJYD+CzPXEmIqJPwucRo4ghOwi8Ezxmq87+mZTD8VLhN+Z5VbOL3VIqe3WJwp0iXS+Hi/oAUMvX+wI91jV4vtxQ9jY8Nu/dvEjVJhxKuEoqdzMqikV9Iyjs994lNxkiW376mNHolXLg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3685f1e-e9e4-4b9c-d1ef-08d7c0a9aa3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 02:05:23.2572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrIa9cFlDBYDCFVCEvQiDUWYfn1gFrzICkAql/XBcqzHTftTfBBhG7Fzfwa81+3xfiD0a9dRvm4opN9/gvvEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4068
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
Content-Type: multipart/mixed; boundary="===============1772650719=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1772650719==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR11MB16667DC180EA243E524632EA89E20BN6PR11MB1666namp_"

--_000_BN6PR11MB16667DC180EA243E524632EA89E20BN6PR11MB1666namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Those warning just came out when our opregion got fixed. (Yeah, our opregio=
n has been broken for a while).

Background is since our opregion can work now, guest i915 gets the configur=
ation in opregion can understand that port A/B/C/D should be the display po=
rt type. However, when later it gets the DDI port information from PCH, it =
found that the connector is DVI (i915 considers DVI the same as HDMI when d=
oing the display initialization). Although guest i915 gets confused (you ca=
n check the details with drm.debug=3D0x27 and you can see guest i915 is ver=
y confused by this), guest i915 decides to accept the fact that the port is=
 working for HDMI and it continues to do the initialization. But gvt-g does=
n't provide HDMI emulation, so guest i915 later run into the following warn=
ings about the vblank and so on.

The patch has been tested on SKL and CFL. And the good news is it really ca=
n solve the confusion in guest i915 about which type of port should be usin=
g, HDMI or DP.

BR,
Tina


________________________________
From: Zhenyu Wang
Sent: Wednesday, March 4, 2020 9:05 PM
To: Zhang, Tina
Cc: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix display port type issue.

On 2020.03.04 17:50:35 +0800, Tina Zhang wrote:
> According to the emulated opregion, the emulated display should support
> dp type output instead of HDMI or DVI.
>

What's the test result for this? Does guest probe DP and does it work fine?

As below error looks vblank related, not sure if caused by this and what's
the state after this change, could you elaborate?

> Otherwise, guest complains about the failures in HDMI initialization like=
:
>
> [   57.746829] WARN_ON(drm_crtc_vblank_get(crtc) =3D=3D 0)
> [   57.746944] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/i915/display/in=
tel_display.c:1322 assert_vblank_disabled+0x45/0x50 [i915]
> [   57.748593] Modules linked in: i915(E) intel_rapl_msr video drm_kms_he=
lper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_bit fb_sys_fo=
ps syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pclmul ghash_cl=
mulni_intel aesni_intel crypto_simd cryptd glue_helper joydev input_leds in=
tel_rapl_perf serio_raw mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev l=
p parport ip_tables x_tables autofs4 psmouse floppy e1000 pata_acpi i2c_pii=
x4
> [   57.752619] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G            E  =
   5.6.0-rc3+ #13
> [   57.753445] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> [   57.754746] Workqueue: events output_poll_execute [drm_kms_helper]
> [   57.755394] RIP: 0010:assert_vblank_disabled+0x45/0x50 [i915]
> [   57.755973] Code: bd 67 12 00 00 48 c7 c6 b0 a9 51 c0 48 c7 c7 1b e7 5=
3 c0 75 10 e8 3b 87 e9 ff 48 89 df e8 53 ae e9 ff 5b 5d c3 e8 4b c1 c6 c0 <=
0f> 0b eb ec 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 89 e5 41 56
> [   57.757904] RSP: 0018:ffffc9000010f928 EFLAGS: 00010286
> [   57.758434] RAX: 0000000000000000 RBX: ffff88812129b000 RCX: 000000000=
0000000
> [   57.759203] RDX: 0000000000000027 RSI: ffffffff82b83c07 RDI: 000000000=
0000246
> [   57.759919] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R09: 000000000=
0000027
> [   57.760631] R10: ffff88811f9ca800 R11: 0000000000000024 R12: ffff88812=
8e25000
> [   57.761354] R13: ffff888100f06300 R14: ffff888128e25000 R15: ffff88812=
8e27000
> [   57.762128] FS:  0000000000000000(0000) GS:ffff888133d00000(0000) knlG=
S:0000000000000000
> [   57.763095] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   57.763675] CR2: 0000555c6091f628 CR3: 000000011f80a004 CR4: 000000000=
0360ee0
> [   57.764391] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   57.765108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   57.765836] Call Trace:
> [   57.766122]  intel_crtc_vblank_on+0x1a/0x50 [i915]
> [   57.766631]  intel_enable_ddi+0x4b/0x3f0 [i915]
> [   57.767110]  intel_encoders_enable+0x85/0xb0 [i915]
> [   57.767624]  hsw_crtc_enable+0x420/0x6b0 [i915]
> [   57.768104]  intel_update_crtc+0x1b8/0x1e0 [i915]
> [   57.768601]  skl_commit_modeset_enables+0x61b/0x6d0 [i915]
> [   57.769175]  intel_atomic_commit_tail+0x328/0x1530 [i915]
> [   57.769729]  ? flush_workqueue_prep_pwqs+0xfa/0x130
> [   57.770225]  ? flush_workqueue+0x198/0x3c0
> [   57.770662]  intel_atomic_commit+0x2ad/0x320 [i915]
> [   57.771173]  drm_atomic_commit+0x4a/0x50 [drm]
> [   57.771636]  drm_client_modeset_commit_atomic+0x1c4/0x200 [drm]
> [   57.772244]  drm_client_modeset_commit_locked+0x47/0x170 [drm]
> [   57.772838]  ? mutex_lock+0x12/0x40
> [   57.773202]  drm_client_modeset_commit+0x26/0x50 [drm]
> [   57.773732]  drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_=
kms_helper]
> [   57.774490]  drm_fb_helper_set_par+0x2d/0x60 [drm_kms_helper]
> [   57.775076]  drm_fb_helper_hotplug_event.part.21+0xb7/0xc0 [drm_kms_he=
lper]
> [   57.775783]  drm_fb_helper_hotplug_event+0x1f/0x30 [drm_kms_helper]
> [   57.776435]  intel_fbdev_output_poll_changed+0x6b/0xa0 [i915]
> [   57.777045]  drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
> [   57.777769]  output_poll_execute+0x181/0x1b0 [drm_kms_helper]
> [   57.778353]  process_one_work+0x1fa/0x3f0
> [   57.778808]  worker_thread+0x34/0x410
> [   57.779182]  kthread+0x121/0x140
> [   57.779513]  ? process_one_work+0x3f0/0x3f0
> [   57.779940]  ? kthread_park+0x90/0x90
> [   57.780314]  ret_from_fork+0x35/0x40
> [   57.780681] ---[ end trace b40a2ff1454022b5 ]---
> [   57.781195] ------------[ cut here ]------------
> [   57.781742] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/drm_vblank.c:13=
36 drm_crtc_set_max_vblank_count+0x44/0x50 [drm]
> [   57.782811] Modules linked in: i915(E) intel_rapl_msr video drm_kms_he=
lper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_bit fb_sys_fo=
ps syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pclmul ghash_cl=
mulni_intel aesni_intel crypto_simd cryptd glue_helper joydev input_leds in=
tel_rapl_perf serio_raw mac_hid qemu_fw_cfg sch_fq_codel parport_pc ppdev l=
p parport ip_tables x_tables autofs4 psmouse floppy e1000 pata_acpi i2c_pii=
x4
> [   57.786706] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G        W   E  =
   5.6.0-rc3+ #13
> [   57.787571] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> [   57.788911] Workqueue: events output_poll_execute [drm_kms_helper]
> [   57.789546] RIP: 0010:drm_crtc_set_max_vblank_count+0x44/0x50 [drm]
> [   57.790177] Code: 48 c1 e0 04 48 03 82 30 01 00 00 8b 92 40 01 00 00 8=
5 d2 75 0c 8b 50 6c 85 d2 74 0e 89 70 68 5d c3 0f 0b 8b 50 6c 85 d2 75 f2 <=
0f> 0b 89 70 68 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41
> [   57.792168] RSP: 0018:ffffc9000010f930 EFLAGS: 00010246
> [   57.793752] RAX: ffff88811f9ca800 RBX: ffff88812129b000 RCX: 000000000=
0000000
> [   57.794589] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ffff88812=
129b000
> [   57.795298] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R09: 000000000=
0000027
> [   57.796009] R10: ffff88811f9ca800 R11: 0000000000000024 R12: ffff88812=
8e25000
> [   57.796721] R13: ffff888100f06300 R14: ffff888128e25000 R15: ffff88812=
8e27000
> [   57.797439] FS:  0000000000000000(0000) GS:ffff888133d00000(0000) knlG=
S:0000000000000000
> [   57.798244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   57.798820] CR2: 0000555c6091f628 CR3: 000000011f80a004 CR4: 000000000=
0360ee0
> [   57.799531] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   57.800243] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   57.800956] Call Trace:
> [   57.801373]  intel_crtc_vblank_on+0x35/0x50 [i915]
> [   57.801881]  intel_enable_ddi+0x4b/0x3f0 [i915]
> [   57.802357]  intel_encoders_enable+0x85/0xb0 [i915]
> [   57.802865]  hsw_crtc_enable+0x420/0x6b0 [i915]
> [   57.803338]  intel_update_crtc+0x1b8/0x1e0 [i915]
> [   57.803829]  skl_commit_modeset_enables+0x61b/0x6d0 [i915]
> [   57.804397]  intel_atomic_commit_tail+0x328/0x1530 [i915]
> [   57.804942]  ? flush_workqueue_prep_pwqs+0xfa/0x130
> [   57.805436]  ? flush_workqueue+0x198/0x3c0
> [   57.805866]  intel_atomic_commit+0x2ad/0x320 [i915]
> [   57.806369]  drm_atomic_commit+0x4a/0x50 [drm]
> [   57.806827]  drm_client_modeset_commit_atomic+0x1c4/0x200 [drm]
> [   57.807458]  drm_client_modeset_commit_locked+0x47/0x170 [drm]
> [   57.808087]  ? mutex_lock+0x12/0x40
> [   57.808445]  drm_client_modeset_commit+0x26/0x50 [drm]
> [   57.808966]  drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_=
kms_helper]
> [   57.809719]  drm_fb_helper_set_par+0x2d/0x60 [drm_kms_helper]
> [   57.810296]  drm_fb_helper_hotplug_event.part.21+0xb7/0xc0 [drm_kms_he=
lper]
> [   57.810993]  drm_fb_helper_hotplug_event+0x1f/0x30 [drm_kms_helper]
> [   57.811642]  intel_fbdev_output_poll_changed+0x6b/0xa0 [i915]
> [   57.812219]  drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
> [   57.812925]  output_poll_execute+0x181/0x1b0 [drm_kms_helper]
> [   57.813640]  process_one_work+0x1fa/0x3f0
> [   57.814045]  worker_thread+0x34/0x410
> [   57.814415]  kthread+0x121/0x140
> [   57.814745]  ? process_one_work+0x3f0/0x3f0
> [   57.815166]  ? kthread_park+0x90/0x90
> [   57.815537]  ret_from_fork+0x35/0x40
> [   57.815900] ---[ end trace b40a2ff1454022b6 ]---
>
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 14e139e66e45..86dc80405977 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -261,7 +261,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>                        ~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK =
|
>                        TRANS_DDI_PORT_MASK);
>                vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -                     (TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +                     (TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>                        (PORT_D << TRANS_DDI_PORT_SHIFT) |
>                        TRANS_DDI_FUNC_ENABLE);
>                if (IS_BROADWELL(dev_priv)) {
> --
> 2.17.1
>

--
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--_000_BN6PR11MB16667DC180EA243E524632EA89E20BN6PR11MB1666namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Those warning just came out when our opregion got fixed. (Yeah, our opregio=
n has been broken for a while).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Background is since our opregion can work now, guest i915 gets the configur=
ation in opregion can understand that port A/B/C/D should be the display po=
rt type. However, when later it gets the DDI port information from PCH, it =
found that the connector is DVI
 (i915 considers DVI the same as HDMI when doing the display initialization=
). Although guest i915 gets confused (you can check the details with drm.de=
bug=3D0x27 and you can see guest i915 is very confused by this), guest i915=
 decides to accept the fact that the
 port is working for HDMI and it continues to do the initialization. But gv=
t-g doesn't provide HDMI emulation, so guest i915 later run into the follow=
ing warnings about the vblank and so on.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The patch has been tested on SKL and CFL. And the good news is it really ca=
n solve the confusion in guest i915 about which type of port should be usin=
g, HDMI or DP.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Tina</div>
<div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Zhenyu Wang<br>
<b>Sent:</b> Wednesday, March 4, 2020 9:05 PM<br>
<b>To:</b> Zhang, Tina<br>
<b>Cc:</b> intel-gvt-dev@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/i915/gvt: Fix display port type issue.
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2020.03.04 17:50:35 &#43;0800, Tina Zhang wrote=
:<br>
&gt; According to the emulated opregion, the emulated display should suppor=
t<br>
&gt; dp type output instead of HDMI or DVI.<br>
&gt;<br>
<br>
What's the test result for this? Does guest probe DP and does it work fine?=
<br>
<br>
As below error looks vblank related, not sure if caused by this and what's<=
br>
the state after this change, could you elaborate?<br>
<br>
&gt; Otherwise, guest complains about the failures in HDMI initialization l=
ike:<br>
&gt; <br>
&gt; [&nbsp;&nbsp; 57.746829] WARN_ON(drm_crtc_vblank_get(crtc) =3D=3D 0)<b=
r>
&gt; [&nbsp;&nbsp; 57.746944] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/i9=
15/display/intel_display.c:1322 assert_vblank_disabled&#43;0x45/0x50 [i915]=
<br>
&gt; [&nbsp;&nbsp; 57.748593] Modules linked in: i915(E) intel_rapl_msr vid=
eo drm_kms_helper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_=
bit fb_sys_fops syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pc=
lmul ghash_clmulni_intel aesni_intel crypto_simd
 cryptd glue_helper joydev input_leds intel_rapl_perf serio_raw mac_hid qem=
u_fw_cfg sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs=
4 psmouse floppy e1000 pata_acpi i2c_piix4<br>
&gt; [&nbsp;&nbsp; 57.752619] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E&nbsp;&nb=
sp;&nbsp;&nbsp; 5.6.0-rc3&#43; #13<br>
&gt; [&nbsp;&nbsp; 57.753445] Hardware name: QEMU Standard PC (i440FX &#43;=
 PIIX, 1996), BIOS rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-li=
nux-1 04/01/2014<br>
&gt; [&nbsp;&nbsp; 57.754746] Workqueue: events output_poll_execute [drm_km=
s_helper]<br>
&gt; [&nbsp;&nbsp; 57.755394] RIP: 0010:assert_vblank_disabled&#43;0x45/0x5=
0 [i915]<br>
&gt; [&nbsp;&nbsp; 57.755973] Code: bd 67 12 00 00 48 c7 c6 b0 a9 51 c0 48 =
c7 c7 1b e7 53 c0 75 10 e8 3b 87 e9 ff 48 89 df e8 53 ae e9 ff 5b 5d c3 e8 =
4b c1 c6 c0 &lt;0f&gt; 0b eb ec 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55 48 8=
9 e5 41 56<br>
&gt; [&nbsp;&nbsp; 57.757904] RSP: 0018:ffffc9000010f928 EFLAGS: 00010286<b=
r>
&gt; [&nbsp;&nbsp; 57.758434] RAX: 0000000000000000 RBX: ffff88812129b000 R=
CX: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.759203] RDX: 0000000000000027 RSI: ffffffff82b83c07 R=
DI: 0000000000000246<br>
&gt; [&nbsp;&nbsp; 57.759919] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R=
09: 0000000000000027<br>
&gt; [&nbsp;&nbsp; 57.760631] R10: ffff88811f9ca800 R11: 0000000000000024 R=
12: ffff888128e25000<br>
&gt; [&nbsp;&nbsp; 57.761354] R13: ffff888100f06300 R14: ffff888128e25000 R=
15: ffff888128e27000<br>
&gt; [&nbsp;&nbsp; 57.762128] FS:&nbsp; 0000000000000000(0000) GS:ffff88813=
3d00000(0000) knlGS:0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.763095] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033<br>
&gt; [&nbsp;&nbsp; 57.763675] CR2: 0000555c6091f628 CR3: 000000011f80a004 C=
R4: 0000000000360ee0<br>
&gt; [&nbsp;&nbsp; 57.764391] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.765108] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400<br>
&gt; [&nbsp;&nbsp; 57.765836] Call Trace:<br>
&gt; [&nbsp;&nbsp; 57.766122]&nbsp; intel_crtc_vblank_on&#43;0x1a/0x50 [i91=
5]<br>
&gt; [&nbsp;&nbsp; 57.766631]&nbsp; intel_enable_ddi&#43;0x4b/0x3f0 [i915]<=
br>
&gt; [&nbsp;&nbsp; 57.767110]&nbsp; intel_encoders_enable&#43;0x85/0xb0 [i9=
15]<br>
&gt; [&nbsp;&nbsp; 57.767624]&nbsp; hsw_crtc_enable&#43;0x420/0x6b0 [i915]<=
br>
&gt; [&nbsp;&nbsp; 57.768104]&nbsp; intel_update_crtc&#43;0x1b8/0x1e0 [i915=
]<br>
&gt; [&nbsp;&nbsp; 57.768601]&nbsp; skl_commit_modeset_enables&#43;0x61b/0x=
6d0 [i915]<br>
&gt; [&nbsp;&nbsp; 57.769175]&nbsp; intel_atomic_commit_tail&#43;0x328/0x15=
30 [i915]<br>
&gt; [&nbsp;&nbsp; 57.769729]&nbsp; ? flush_workqueue_prep_pwqs&#43;0xfa/0x=
130<br>
&gt; [&nbsp;&nbsp; 57.770225]&nbsp; ? flush_workqueue&#43;0x198/0x3c0<br>
&gt; [&nbsp;&nbsp; 57.770662]&nbsp; intel_atomic_commit&#43;0x2ad/0x320 [i9=
15]<br>
&gt; [&nbsp;&nbsp; 57.771173]&nbsp; drm_atomic_commit&#43;0x4a/0x50 [drm]<b=
r>
&gt; [&nbsp;&nbsp; 57.771636]&nbsp; drm_client_modeset_commit_atomic&#43;0x=
1c4/0x200 [drm]<br>
&gt; [&nbsp;&nbsp; 57.772244]&nbsp; drm_client_modeset_commit_locked&#43;0x=
47/0x170 [drm]<br>
&gt; [&nbsp;&nbsp; 57.772838]&nbsp; ? mutex_lock&#43;0x12/0x40<br>
&gt; [&nbsp;&nbsp; 57.773202]&nbsp; drm_client_modeset_commit&#43;0x26/0x50=
 [drm]<br>
&gt; [&nbsp;&nbsp; 57.773732]&nbsp; drm_fb_helper_restore_fbdev_mode_unlock=
ed&#43;0x4e/0xa0 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.774490]&nbsp; drm_fb_helper_set_par&#43;0x2d/0x60 [dr=
m_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.775076]&nbsp; drm_fb_helper_hotplug_event.part.21&#43=
;0xb7/0xc0 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.775783]&nbsp; drm_fb_helper_hotplug_event&#43;0x1f/0x=
30 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.776435]&nbsp; intel_fbdev_output_poll_changed&#43;0x6=
b/0xa0 [i915]<br>
&gt; [&nbsp;&nbsp; 57.777045]&nbsp; drm_kms_helper_hotplug_event&#43;0x2a/0=
x40 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.777769]&nbsp; output_poll_execute&#43;0x181/0x1b0 [dr=
m_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.778353]&nbsp; process_one_work&#43;0x1fa/0x3f0<br>
&gt; [&nbsp;&nbsp; 57.778808]&nbsp; worker_thread&#43;0x34/0x410<br>
&gt; [&nbsp;&nbsp; 57.779182]&nbsp; kthread&#43;0x121/0x140<br>
&gt; [&nbsp;&nbsp; 57.779513]&nbsp; ? process_one_work&#43;0x3f0/0x3f0<br>
&gt; [&nbsp;&nbsp; 57.779940]&nbsp; ? kthread_park&#43;0x90/0x90<br>
&gt; [&nbsp;&nbsp; 57.780314]&nbsp; ret_from_fork&#43;0x35/0x40<br>
&gt; [&nbsp;&nbsp; 57.780681] ---[ end trace b40a2ff1454022b5 ]---<br>
&gt; [&nbsp;&nbsp; 57.781195] ------------[ cut here ]------------<br>
&gt; [&nbsp;&nbsp; 57.781742] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/dr=
m_vblank.c:1336 drm_crtc_set_max_vblank_count&#43;0x44/0x50 [drm]<br>
&gt; [&nbsp;&nbsp; 57.782811] Modules linked in: i915(E) intel_rapl_msr vid=
eo drm_kms_helper cec intel_rapl_common rc_core drm kvm_intel kvm i2c_algo_=
bit fb_sys_fops syscopyarea sysfillrect sysimgblt crct10dif_pclmul crc32_pc=
lmul ghash_clmulni_intel aesni_intel crypto_simd
 cryptd glue_helper joydev input_leds intel_rapl_perf serio_raw mac_hid qem=
u_fw_cfg sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs=
4 psmouse floppy e1000 pata_acpi i2c_piix4<br>
&gt; [&nbsp;&nbsp; 57.786706] CPU: 1 PID: 36 Comm: kworker/1:1 Tainted: G&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; W&nbsp;&nbsp; E&nbsp;&nbsp;&nbsp;&=
nbsp; 5.6.0-rc3&#43; #13<br>
&gt; [&nbsp;&nbsp; 57.787571] Hardware name: QEMU Standard PC (i440FX &#43;=
 PIIX, 1996), BIOS rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-li=
nux-1 04/01/2014<br>
&gt; [&nbsp;&nbsp; 57.788911] Workqueue: events output_poll_execute [drm_km=
s_helper]<br>
&gt; [&nbsp;&nbsp; 57.789546] RIP: 0010:drm_crtc_set_max_vblank_count&#43;0=
x44/0x50 [drm]<br>
&gt; [&nbsp;&nbsp; 57.790177] Code: 48 c1 e0 04 48 03 82 30 01 00 00 8b 92 =
40 01 00 00 85 d2 75 0c 8b 50 6c 85 d2 74 0e 89 70 68 5d c3 0f 0b 8b 50 6c =
85 d2 75 f2 &lt;0f&gt; 0b 89 70 68 5d c3 0f 1f 44 00 00 0f 1f 44 00 00 55 4=
8 89 e5 41<br>
&gt; [&nbsp;&nbsp; 57.792168] RSP: 0018:ffffc9000010f930 EFLAGS: 00010246<b=
r>
&gt; [&nbsp;&nbsp; 57.793752] RAX: ffff88811f9ca800 RBX: ffff88812129b000 R=
CX: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.794589] RDX: 0000000000000000 RSI: 00000000ffffffff R=
DI: ffff88812129b000<br>
&gt; [&nbsp;&nbsp; 57.795298] RBP: ffffc9000010f930 R08: ffffffff82b83be0 R=
09: 0000000000000027<br>
&gt; [&nbsp;&nbsp; 57.796009] R10: ffff88811f9ca800 R11: 0000000000000024 R=
12: ffff888128e25000<br>
&gt; [&nbsp;&nbsp; 57.796721] R13: ffff888100f06300 R14: ffff888128e25000 R=
15: ffff888128e27000<br>
&gt; [&nbsp;&nbsp; 57.797439] FS:&nbsp; 0000000000000000(0000) GS:ffff88813=
3d00000(0000) knlGS:0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.798244] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033<br>
&gt; [&nbsp;&nbsp; 57.798820] CR2: 0000555c6091f628 CR3: 000000011f80a004 C=
R4: 0000000000360ee0<br>
&gt; [&nbsp;&nbsp; 57.799531] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 57.800243] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400<br>
&gt; [&nbsp;&nbsp; 57.800956] Call Trace:<br>
&gt; [&nbsp;&nbsp; 57.801373]&nbsp; intel_crtc_vblank_on&#43;0x35/0x50 [i91=
5]<br>
&gt; [&nbsp;&nbsp; 57.801881]&nbsp; intel_enable_ddi&#43;0x4b/0x3f0 [i915]<=
br>
&gt; [&nbsp;&nbsp; 57.802357]&nbsp; intel_encoders_enable&#43;0x85/0xb0 [i9=
15]<br>
&gt; [&nbsp;&nbsp; 57.802865]&nbsp; hsw_crtc_enable&#43;0x420/0x6b0 [i915]<=
br>
&gt; [&nbsp;&nbsp; 57.803338]&nbsp; intel_update_crtc&#43;0x1b8/0x1e0 [i915=
]<br>
&gt; [&nbsp;&nbsp; 57.803829]&nbsp; skl_commit_modeset_enables&#43;0x61b/0x=
6d0 [i915]<br>
&gt; [&nbsp;&nbsp; 57.804397]&nbsp; intel_atomic_commit_tail&#43;0x328/0x15=
30 [i915]<br>
&gt; [&nbsp;&nbsp; 57.804942]&nbsp; ? flush_workqueue_prep_pwqs&#43;0xfa/0x=
130<br>
&gt; [&nbsp;&nbsp; 57.805436]&nbsp; ? flush_workqueue&#43;0x198/0x3c0<br>
&gt; [&nbsp;&nbsp; 57.805866]&nbsp; intel_atomic_commit&#43;0x2ad/0x320 [i9=
15]<br>
&gt; [&nbsp;&nbsp; 57.806369]&nbsp; drm_atomic_commit&#43;0x4a/0x50 [drm]<b=
r>
&gt; [&nbsp;&nbsp; 57.806827]&nbsp; drm_client_modeset_commit_atomic&#43;0x=
1c4/0x200 [drm]<br>
&gt; [&nbsp;&nbsp; 57.807458]&nbsp; drm_client_modeset_commit_locked&#43;0x=
47/0x170 [drm]<br>
&gt; [&nbsp;&nbsp; 57.808087]&nbsp; ? mutex_lock&#43;0x12/0x40<br>
&gt; [&nbsp;&nbsp; 57.808445]&nbsp; drm_client_modeset_commit&#43;0x26/0x50=
 [drm]<br>
&gt; [&nbsp;&nbsp; 57.808966]&nbsp; drm_fb_helper_restore_fbdev_mode_unlock=
ed&#43;0x4e/0xa0 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.809719]&nbsp; drm_fb_helper_set_par&#43;0x2d/0x60 [dr=
m_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.810296]&nbsp; drm_fb_helper_hotplug_event.part.21&#43=
;0xb7/0xc0 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.810993]&nbsp; drm_fb_helper_hotplug_event&#43;0x1f/0x=
30 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.811642]&nbsp; intel_fbdev_output_poll_changed&#43;0x6=
b/0xa0 [i915]<br>
&gt; [&nbsp;&nbsp; 57.812219]&nbsp; drm_kms_helper_hotplug_event&#43;0x2a/0=
x40 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.812925]&nbsp; output_poll_execute&#43;0x181/0x1b0 [dr=
m_kms_helper]<br>
&gt; [&nbsp;&nbsp; 57.813640]&nbsp; process_one_work&#43;0x1fa/0x3f0<br>
&gt; [&nbsp;&nbsp; 57.814045]&nbsp; worker_thread&#43;0x34/0x410<br>
&gt; [&nbsp;&nbsp; 57.814415]&nbsp; kthread&#43;0x121/0x140<br>
&gt; [&nbsp;&nbsp; 57.814745]&nbsp; ? process_one_work&#43;0x3f0/0x3f0<br>
&gt; [&nbsp;&nbsp; 57.815166]&nbsp; ? kthread_park&#43;0x90/0x90<br>
&gt; [&nbsp;&nbsp; 57.815537]&nbsp; ret_from_fork&#43;0x35/0x40<br>
&gt; [&nbsp;&nbsp; 57.815900] ---[ end trace b40a2ff1454022b6 ]---<br>
&gt; <br>
&gt; Signed-off-by: Tina Zhang &lt;tina.zhang@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/i915/gvt/display.c | 2 &#43;-<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915=
/gvt/display.c<br>
&gt; index 14e139e66e45..86dc80405977 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; @@ -261,7 &#43;261,7 @@ static void emulate_monitor_status_change(stru=
ct intel_vgpu *vgpu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~(TRANS=
_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TRANS_D=
DI_PORT_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=
=3D<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TRANS_DDI_BPC_8 | TRAN=
S_DDI_MODE_SELECT_DVI |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TRANS_DDI_BPC_8 | =
TRANS_DDI_MODE_SELECT_DP_SST |<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (PORT_D=
 &lt;&lt; TRANS_DDI_PORT_SHIFT) |<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TRANS_D=
DI_FUNC_ENABLE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (IS_BROADWELL(dev_priv)) {<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
-- <br>
Open Source Technology Center, Intel ltd.<br>
<br>
$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN6PR11MB16667DC180EA243E524632EA89E20BN6PR11MB1666namp_--

--===============1772650719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1772650719==--
