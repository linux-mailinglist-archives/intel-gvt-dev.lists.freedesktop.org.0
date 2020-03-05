Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A451179D9B
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Mar 2020 02:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10BD6EA23;
	Thu,  5 Mar 2020 01:51:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A96E119
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Mar 2020 01:51:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 17:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; 
 d="scan'208,217";a="387348260"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 04 Mar 2020 17:51:28 -0800
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Mar 2020 17:51:27 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Mar 2020 17:51:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 4 Mar 2020 17:51:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofN6GKxypg+oLJqsFLv1eJi5etREr5Lyubw2a/zAH34o9mQYRxvZY96xjWHqTcP10M0Kvoft8xtQjxwQ//x/XS2EsxJKD6aMc1500homg/EPnJph7WBGS93kntIUP+OrMtkrbyzaAOR0TjKSy0Sp/ZYLhg4bNzG/fRNvF6nO3QjqxYWIwcpnHiZ31nYENqmjE4/7zfFYuXqA0t43G/V92jGkdgkX8NRIqp3z4tvhR3nTEd6OnApunY2hLt5tDnjem4hBELSwMt+jKSBnfexinPCtgp2i9LauJuYwpgmmMSkA8xN2KL4dvPrI0FCgOaHPspnP8mROGvVcaey9z2vWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6zb72hsHfZP7o5P533PTL+FeFHmK1lLKkcBCy3eKBk=;
 b=JVDxnLeNFzdkLv9/fa0Ut6KmpmKUebn5nbicIE0XSqeaFwU2GAczT4hesDsTBzsUwienSfOVwo0qy9bqEDlAorBoGFsgrHK1e0V5ZHs6L/cL86lpMxAAWnkFIdfJ6BVeJ3NskIjO4pVuCHqKHdBHDjlVBN8ofqJ3JmW3+lwVELFj7qKxf+J7q1QsIXb8p6G8T1gFQRI7LtIt2TvuY6r89DrKgI67TMbgdN1B7BV3DZmRuIS9eK9YIYe9iP67+PthFC3ANv0n3Hqr0Rz/84hwIaKT35Dmgov1GDBDVGNZAmZRe0ixsbP4B7oGHmuj4/8nGUidR3JeFMJvVVDmCRGfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6zb72hsHfZP7o5P533PTL+FeFHmK1lLKkcBCy3eKBk=;
 b=u3yflTNVN7BXO9lOyo/IsIUzjiwLcnRbY97zFL6Wj22A8C3Mtx3npJQuvMnRDDK6HVhbzuobJNNmYmQjfqN2tLy0LEMUqyyAP3HSM/g+8pRcJ/PK2zsEHiVtsjPJqmOW0kkAhTAx4cuacHTS5ScprhIcI35SeyR0Y00XOcmGV9A=
Received: from BN6PR11MB1666.namprd11.prod.outlook.com (2603:10b6:405:4::8) by
 BN6PR11MB1745.namprd11.prod.outlook.com (2603:10b6:404:103::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Thu, 5 Mar 2020 01:51:24 +0000
Received: from BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f]) by BN6PR11MB1666.namprd11.prod.outlook.com
 ([fe80::707b:809e:d058:f14f%8]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 01:51:24 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size issue
Thread-Topic: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size issue
Thread-Index: AQHV8o64cxQ7z19iKkyvl3qpSLbZ0w==
Date: Thu, 5 Mar 2020 01:51:24 +0000
Message-ID: <BN6PR11MB1666BA10DD924835EAB80D1B89E20@BN6PR11MB1666.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tina.zhang@intel.com; 
x-originating-ip: [192.102.204.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ce28452-5234-44b2-8dba-08d7c0a7b639
x-ms-traffictypediagnostic: BN6PR11MB1745:
x-microsoft-antispam-prvs: <BN6PR11MB17456B24FB4651587581950189E20@BN6PR11MB1745.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(376002)(366004)(39860400002)(199004)(189003)(81156014)(81166006)(8676002)(186003)(45080400002)(478600001)(26005)(71200400001)(8936002)(33656002)(7696005)(6506007)(53546011)(55016002)(86362001)(5660300002)(6916009)(19627405001)(52536014)(4326008)(316002)(9686003)(66446008)(64756008)(91956017)(66556008)(66476007)(76116006)(66946007)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1745;
 H:BN6PR11MB1666.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9FkdJkFZvGjoWCPaYUD2szDSwf6T+F0Okwdz6OLXnSEs/1kC4BpHheJdY7jI+6h5bMW9nW216ercIwlSeewDPbMbdEpvd12aDeAczPpJvnrTGU1+073zNh0gkrJi6revh1hEiOZYtJtJpQDXgeQvDQ+moFJTUISRq/3caGGKHiJlt8tnjQAJAtOmjp9vw3eTqX5rkjej55ajr77m1nvFLH+kAUVc0ijrJEKVd1fMgejjwQX+H9Hpl1e71EXUGyx71Cpuupf94xhvDoESUOQGP9fXHhXOh0iXbtA2FgDGtDZbWLa3mWH3kamRlKEO1rWRclQiS/VZ1OGuaIE1XgO2q92U5aDrKJbgmtYm0LPFyoXp88u4lEQ2k5EeoRH6FiJ51TboPNZ79ohD0QcStmNzd4Pd2KNsCTbROhC/bFYUVZ4rIveZlP2bjnoHixNCJ/83
x-ms-exchange-antispam-messagedata: hvEZ31CIl3+tuwlZmRpsHZmnF4kvWyUWmtyPPjZkxuGrVO7OLpCaPeajGiCA962iZjyu34CigjDPGo5NrLUJKxVq/dqS5ySC0jw7KhviuGXBahZw41iLEWVjIfMwcVzPkllV0xMemCkB1S1nUa0qlQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce28452-5234-44b2-8dba-08d7c0a7b639
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 01:51:24.2762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDO7dHkEJYHLDgIFCotdc4RAfVwEt7HNWG+3BWGBWNwtGqtHNqsCnghZw0Qb7RX6JlZ1xHHmKEpQZtQV5vvUHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1745
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
Content-Type: multipart/mixed; boundary="===============2062167964=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2062167964==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR11MB1666BA10DD924835EAB80D1B89E20BN6PR11MB1666namp_"

--_000_BN6PR11MB1666BA10DD924835EAB80D1B89E20BN6PR11MB1666namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The background of the warns is this: since our opregion was considered as b=
roken, guest i915 driver directly used the configurations in the fuse regis=
ter. On CFL, gvt-g got the fuse register's data from hardware, and the real=
 hardware told us that the port F was used. However, gvt-d doesn't emulate =
port F. The following warnings are guest i915 guest driver complaining abou=
t the port F doesn't configured correctly.

So, it looks we can have two options:
1) Support port F emulation in gvt-g and fix our opregion and add port F su=
pport to the opregion.
2) Fix our opregion and let it tell guests OS that we only support port A/B=
/C/D with dp type output.

As we all agree that we should have only one opregion configuration which c=
an deal with all the supported platforms, I think the option 2 is better. O=
therwise, we have to bring platform knowledge into opregion, as not all pla=
tforms support port F.

Thanks.

BR,
Tina


________________________________
From: Zhenyu Wang
Sent: Wednesday, March 4, 2020 9:00 PM
To: Zhang, Tina
Cc: intel-gvt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size issue

On 2020.03.04 17:50:34 +0800, Tina Zhang wrote:
> The emulated opregion doesn't tell its size correctly. According to the
> intel_vbt_defs.h, vbt_header.vbt_size should the size of VBT (VBT Header,
> BDB Header and data blocks), and bdb_header.bdb_size should be the size
> of BDB (BDB Header and data blocks).
>

The fix looks sane to me, but is below warning directly related to this?
Looks that need some explanation.

> This fixes guest warnings on cfl like:
>
> [   41.054953] Missing case (encoder->hpd_pin =3D=3D 9)
> [   41.055572] WARNING: CPU: 0 PID: 145 at drivers/gpu/drm/i915/display/i=
ntel_dp.c:5443 cpt_digital_port_connected.isra.28+0x31/0x70 [i915]
> [   41.056805] Modules linked in: intel_rapl_msr intel_rapl_common kvm_in=
tel kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915 aesni_intel =
crypto_simd video drm_kms_helper cec rc_core drm cryptd glue_helper intel_r=
apl_perf joydev i2c_algo_bit fb_sys_fops syscopyarea input_leds sysfillrect=
 mac_hid serio_raw sch_fq_codel sysimgblt qemu_fw_cfg parport_pc ppdev lp p=
arport ip_tables x_tables autofs4 psmouse e1000 i2c_piix4 pata_acpi floppy
> [   41.060685] CPU: 0 PID: 145 Comm: kworker/u4:2 Not tainted 5.6.0-rc3+ =
#13
> [   41.061369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-linux-1 04/01/2014
> [   41.062670] Workqueue: events_unbound async_run_entry_fn
> [   41.063578] RIP: 0010:cpt_digital_port_connected.isra.28+0x31/0x70 [i9=
15]
> [   41.064274] Code: fe 06 48 89 f8 48 89 e5 53 74 57 83 fe 07 74 4b 83 f=
e 05 74 1c 89 f2 48 c7 c7 7f 64 56 c0 48 c7 c6 d8 65 56 c0 e8 5f 3e bc c0 <=
0f> 0b 31 c0 5b 5d c3 bb 00 00 20 00 48 8d b8 b8 07 00 00 ba 01 00
> [   41.066161] RSP: 0018:ffffc9000019fac8 EFLAGS: 00010286
> [   41.066716] RAX: 0000000000000000 RBX: ffff888116266000 RCX: 000000000=
0000000
> [   41.067429] RDX: 0000000000000001 RSI: ffff888133c19808 RDI: ffff88813=
3c19808
> [   41.068196] RBP: ffffc9000019fad0 R08: 000000000000042a R09: ffff88813=
8017378
> [   41.068907] R10: ffff888116266000 R11: ffffc9000019f918 R12: 000000000=
0000000
> [   41.069619] R13: ffff88811ea00000 R14: ffff88811ea00000 R15: ffff88811=
6266000
> [   41.070334] FS:  0000000000000000(0000) GS:ffff888133c00000(0000) knlG=
S:0000000000000000
> [   41.071136] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   41.071712] CR2: 00007f08b0ca6320 CR3: 0000000131f3a006 CR4: 000000000=
0360ef0
> [   41.072427] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   41.073142] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   41.073862] Call Trace:
> [   41.074187]  intel_digital_port_connected+0x345/0x470 [i915]
> [   41.074792]  intel_dp_detect+0x279/0x540 [i915]
> [   41.075371]  ? ww_mutex_lock+0x64/0x70
> [   41.075760]  drm_helper_probe_detect+0x50/0x90 [drm_kms_helper]
> [   41.076360]  drm_helper_probe_single_connector_modes+0xe5/0x710 [drm_k=
ms_helper]
> [   41.077113]  drm_client_modeset_probe+0x211/0x14b0 [drm]
> [   41.077646]  ? __schedule+0x294/0x710
> [   41.078025]  ? wq_worker_running+0xe/0x40
> [   41.078431]  ? schedule+0x72/0xb0
> [   41.078770]  ? __switch_to_asm+0x40/0x70
> [   41.079169]  ? __switch_to_asm+0x34/0x70
> [   41.079564]  ? __switch_to_asm+0x40/0x70
> [   41.079963]  ? __switch_to_asm+0x34/0x70
> [   41.080361]  ? __switch_to_asm+0x40/0x70
> [   41.080758]  ? __switch_to_asm+0x34/0x70
> [   41.081152]  ? __switch_to_asm+0x40/0x70
> [   41.081554]  __drm_fb_helper_initial_config_and_unlock+0x46/0x520 [drm=
_kms_helper]
> [   41.082320]  ? __switch_to_asm+0x34/0x70
> [   41.082716]  ? __switch_to_asm+0x40/0x70
> [   41.083119]  ? __switch_to_xtra+0x130/0x4b0
> [   41.083546]  ? __switch_to_asm+0x34/0x70
> [   41.083948]  ? __switch_to_asm+0x40/0x70
> [   41.084345]  drm_fb_helper_initial_config+0x35/0x40 [drm_kms_helper]
> [   41.085014]  intel_fbdev_initial_config+0x18/0x30 [i915]
> [   41.085553]  async_run_entry_fn+0x3c/0x150
> [   41.085972]  process_one_work+0x1fa/0x3f0
> [   41.086368]  worker_thread+0x34/0x410
> [   41.086742]  kthread+0x121/0x140
> [   41.087073]  ? process_one_work+0x3f0/0x3f0
> [   41.087499]  ? kthread_park+0x90/0x90
> [   41.087869]  ret_from_fork+0x35/0x40
> [   41.088235] ---[ end trace 18d9147ae17b62df ]---
>
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/g=
vt/opregion.c
> index 867e7629025b..33569b910ed5 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -147,15 +147,14 @@ static void virt_vbt_generation(struct vbt *v)
>        /* there's features depending on version! */
>        v->header.version =3D 155;
>        v->header.header_size =3D sizeof(v->header);
> -     v->header.vbt_size =3D sizeof(struct vbt) - sizeof(v->header);
> +     v->header.vbt_size =3D sizeof(struct vbt);
>        v->header.bdb_offset =3D offsetof(struct vbt, bdb_header);
>
>        strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
>        v->bdb_header.version =3D 186; /* child_dev_size =3D 33 */
>        v->bdb_header.header_size =3D sizeof(v->bdb_header);
>
> -     v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct vbt_h=
eader)
> -             - sizeof(struct bdb_header);
> +     v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct vbt_h=
eader);
>
>        /* general features */
>        v->general_features_header.id =3D BDB_GENERAL_FEATURES;
> --
> 2.17.1
>

--
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--_000_BN6PR11MB1666BA10DD924835EAB80D1B89E20BN6PR11MB1666namp_
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
The background of the warns is this: since our opregion was considered as b=
roken, guest i915 driver directly used the configurations in the fuse regis=
ter. On CFL, gvt-g got the fuse register's data from hardware, and the real=
 hardware told us that the port
 F was used. However, gvt-d doesn't emulate port F. The following warnings =
are guest i915 guest driver complaining about the port F doesn't configured=
 correctly.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
So, it looks we can have two options:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
1) Support port F emulation in gvt-g and fix our opregion and add port F su=
pport to the opregion.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
2) Fix our opregion and let it tell guests OS that we only support port A/B=
/C/D with dp type output.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
As we all agree that we should have only one opregion configuration which c=
an deal with all the supported platforms, I think the option 2 is better. O=
therwise, we have to bring platform knowledge into opregion, as not all pla=
tforms support port F.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks.</div>
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
<b>Sent:</b> Wednesday, March 4, 2020 9:00 PM<br>
<b>To:</b> Zhang, Tina<br>
<b>Cc:</b> intel-gvt-dev@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/i915/gvt: Fix emulated opregion size is=
sue
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2020.03.04 17:50:34 &#43;0800, Tina Zhang wrote=
:<br>
&gt; The emulated opregion doesn't tell its size correctly. According to th=
e<br>
&gt; intel_vbt_defs.h, vbt_header.vbt_size should the size of VBT (VBT Head=
er,<br>
&gt; BDB Header and data blocks), and bdb_header.bdb_size should be the siz=
e<br>
&gt; of BDB (BDB Header and data blocks).<br>
&gt;<br>
<br>
The fix looks sane to me, but is below warning directly related to this?<br=
>
Looks that need some explanation.<br>
<br>
&gt; This fixes guest warnings on cfl like:<br>
&gt; <br>
&gt; [&nbsp;&nbsp; 41.054953] Missing case (encoder-&gt;hpd_pin =3D=3D 9)<b=
r>
&gt; [&nbsp;&nbsp; 41.055572] WARNING: CPU: 0 PID: 145 at drivers/gpu/drm/i=
915/display/intel_dp.c:5443 cpt_digital_port_connected.isra.28&#43;0x31/0x7=
0 [i915]<br>
&gt; [&nbsp;&nbsp; 41.056805] Modules linked in: intel_rapl_msr intel_rapl_=
common kvm_intel kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel i915=
 aesni_intel crypto_simd video drm_kms_helper cec rc_core drm cryptd glue_h=
elper intel_rapl_perf joydev i2c_algo_bit fb_sys_fops
 syscopyarea input_leds sysfillrect mac_hid serio_raw sch_fq_codel sysimgbl=
t qemu_fw_cfg parport_pc ppdev lp parport ip_tables x_tables autofs4 psmous=
e e1000 i2c_piix4 pata_acpi floppy<br>
&gt; [&nbsp;&nbsp; 41.060685] CPU: 0 PID: 145 Comm: kworker/u4:2 Not tainte=
d 5.6.0-rc3&#43; #13<br>
&gt; [&nbsp;&nbsp; 41.061369] Hardware name: QEMU Standard PC (i440FX &#43;=
 PIIX, 1996), BIOS rel-1.10.1-0-g8891697-dirty-20180511_165818-tinazhang-li=
nux-1 04/01/2014<br>
&gt; [&nbsp;&nbsp; 41.062670] Workqueue: events_unbound async_run_entry_fn<=
br>
&gt; [&nbsp;&nbsp; 41.063578] RIP: 0010:cpt_digital_port_connected.isra.28&=
#43;0x31/0x70 [i915]<br>
&gt; [&nbsp;&nbsp; 41.064274] Code: fe 06 48 89 f8 48 89 e5 53 74 57 83 fe =
07 74 4b 83 fe 05 74 1c 89 f2 48 c7 c7 7f 64 56 c0 48 c7 c6 d8 65 56 c0 e8 =
5f 3e bc c0 &lt;0f&gt; 0b 31 c0 5b 5d c3 bb 00 00 20 00 48 8d b8 b8 07 00 0=
0 ba 01 00<br>
&gt; [&nbsp;&nbsp; 41.066161] RSP: 0018:ffffc9000019fac8 EFLAGS: 00010286<b=
r>
&gt; [&nbsp;&nbsp; 41.066716] RAX: 0000000000000000 RBX: ffff888116266000 R=
CX: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 41.067429] RDX: 0000000000000001 RSI: ffff888133c19808 R=
DI: ffff888133c19808<br>
&gt; [&nbsp;&nbsp; 41.068196] RBP: ffffc9000019fad0 R08: 000000000000042a R=
09: ffff888138017378<br>
&gt; [&nbsp;&nbsp; 41.068907] R10: ffff888116266000 R11: ffffc9000019f918 R=
12: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 41.069619] R13: ffff88811ea00000 R14: ffff88811ea00000 R=
15: ffff888116266000<br>
&gt; [&nbsp;&nbsp; 41.070334] FS:&nbsp; 0000000000000000(0000) GS:ffff88813=
3c00000(0000) knlGS:0000000000000000<br>
&gt; [&nbsp;&nbsp; 41.071136] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033<br>
&gt; [&nbsp;&nbsp; 41.071712] CR2: 00007f08b0ca6320 CR3: 0000000131f3a006 C=
R4: 0000000000360ef0<br>
&gt; [&nbsp;&nbsp; 41.072427] DR0: 0000000000000000 DR1: 0000000000000000 D=
R2: 0000000000000000<br>
&gt; [&nbsp;&nbsp; 41.073142] DR3: 0000000000000000 DR6: 00000000fffe0ff0 D=
R7: 0000000000000400<br>
&gt; [&nbsp;&nbsp; 41.073862] Call Trace:<br>
&gt; [&nbsp;&nbsp; 41.074187]&nbsp; intel_digital_port_connected&#43;0x345/=
0x470 [i915]<br>
&gt; [&nbsp;&nbsp; 41.074792]&nbsp; intel_dp_detect&#43;0x279/0x540 [i915]<=
br>
&gt; [&nbsp;&nbsp; 41.075371]&nbsp; ? ww_mutex_lock&#43;0x64/0x70<br>
&gt; [&nbsp;&nbsp; 41.075760]&nbsp; drm_helper_probe_detect&#43;0x50/0x90 [=
drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 41.076360]&nbsp; drm_helper_probe_single_connector_modes=
&#43;0xe5/0x710 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 41.077113]&nbsp; drm_client_modeset_probe&#43;0x211/0x14=
b0 [drm]<br>
&gt; [&nbsp;&nbsp; 41.077646]&nbsp; ? __schedule&#43;0x294/0x710<br>
&gt; [&nbsp;&nbsp; 41.078025]&nbsp; ? wq_worker_running&#43;0xe/0x40<br>
&gt; [&nbsp;&nbsp; 41.078431]&nbsp; ? schedule&#43;0x72/0xb0<br>
&gt; [&nbsp;&nbsp; 41.078770]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.079169]&nbsp; ? __switch_to_asm&#43;0x34/0x70<br>
&gt; [&nbsp;&nbsp; 41.079564]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.079963]&nbsp; ? __switch_to_asm&#43;0x34/0x70<br>
&gt; [&nbsp;&nbsp; 41.080361]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.080758]&nbsp; ? __switch_to_asm&#43;0x34/0x70<br>
&gt; [&nbsp;&nbsp; 41.081152]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.081554]&nbsp; __drm_fb_helper_initial_config_and_unlo=
ck&#43;0x46/0x520 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 41.082320]&nbsp; ? __switch_to_asm&#43;0x34/0x70<br>
&gt; [&nbsp;&nbsp; 41.082716]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.083119]&nbsp; ? __switch_to_xtra&#43;0x130/0x4b0<br>
&gt; [&nbsp;&nbsp; 41.083546]&nbsp; ? __switch_to_asm&#43;0x34/0x70<br>
&gt; [&nbsp;&nbsp; 41.083948]&nbsp; ? __switch_to_asm&#43;0x40/0x70<br>
&gt; [&nbsp;&nbsp; 41.084345]&nbsp; drm_fb_helper_initial_config&#43;0x35/0=
x40 [drm_kms_helper]<br>
&gt; [&nbsp;&nbsp; 41.085014]&nbsp; intel_fbdev_initial_config&#43;0x18/0x3=
0 [i915]<br>
&gt; [&nbsp;&nbsp; 41.085553]&nbsp; async_run_entry_fn&#43;0x3c/0x150<br>
&gt; [&nbsp;&nbsp; 41.085972]&nbsp; process_one_work&#43;0x1fa/0x3f0<br>
&gt; [&nbsp;&nbsp; 41.086368]&nbsp; worker_thread&#43;0x34/0x410<br>
&gt; [&nbsp;&nbsp; 41.086742]&nbsp; kthread&#43;0x121/0x140<br>
&gt; [&nbsp;&nbsp; 41.087073]&nbsp; ? process_one_work&#43;0x3f0/0x3f0<br>
&gt; [&nbsp;&nbsp; 41.087499]&nbsp; ? kthread_park&#43;0x90/0x90<br>
&gt; [&nbsp;&nbsp; 41.087869]&nbsp; ret_from_fork&#43;0x35/0x40<br>
&gt; [&nbsp;&nbsp; 41.088235] ---[ end trace 18d9147ae17b62df ]---<br>
&gt; <br>
&gt; Signed-off-by: Tina Zhang &lt;tina.zhang@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/i915/gvt/opregion.c | 5 &#43;&#43;---<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i91=
5/gvt/opregion.c<br>
&gt; index 867e7629025b..33569b910ed5 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/opregion.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/i915/gvt/opregion.c<br>
&gt; @@ -147,15 &#43;147,14 @@ static void virt_vbt_generation(struct vbt *=
v)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* there's features dependin=
g on version! */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;header.version =3D 155=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;header.header_size =3D=
 sizeof(v-&gt;header);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;header.vbt_size =3D sizeof(struct vbt)=
 - sizeof(v-&gt;header);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;header.vbt_size =3D sizeof(struct =
vbt);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;header.bdb_offset =3D =
offsetof(struct vbt, bdb_header);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(&amp;v-&gt;bdb_header=
.signature[0], &quot;BIOS_DATA_BLOCK&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;bdb_header.version =3D=
 186; /* child_dev_size =3D 33 */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;bdb_header.header_size=
 =3D sizeof(v-&gt;bdb_header);<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;bdb_header.bdb_size =3D sizeof(struct =
vbt) - sizeof(struct vbt_header)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - sizeof(struct bdb_header);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;bdb_header.bdb_size =3D sizeof(str=
uct vbt) - sizeof(struct vbt_header);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* general features */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v-&gt;general_features_heade=
r.id =3D BDB_GENERAL_FEATURES;<br>
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

--_000_BN6PR11MB1666BA10DD924835EAB80D1B89E20BN6PR11MB1666namp_--

--===============2062167964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2062167964==--
