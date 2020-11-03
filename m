Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DE32A3B27
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Nov 2020 04:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AC66E41A;
	Tue,  3 Nov 2020 03:54:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3DB6E41A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Nov 2020 03:54:57 +0000 (UTC)
IronPort-SDR: L12RUqT1vobimVJQam/8hZwxwpCxSgmznNXyoKDcuGbj7j13dq6eCY6BR0nBO7R9X4E09b36d3
 I2S4JvufmBmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="230624299"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
 d="asc'?scan'208";a="230624299"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 19:54:56 -0800
IronPort-SDR: sD2s2gKya0Sx7uuR19mncBGk7TXKOq6nWqsctBDcxNG2Gio0nAvgBRD3RtJpgFIN4bHGKIJQpe
 W2kJJ9r2PJ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; 
 d="asc'?scan'208";a="352208931"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2020 19:54:54 -0800
Date: Tue, 3 Nov 2020 11:33:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: GVT Scheduler
Message-ID: <20201103033336.GA27141@zhen-hp.sh.intel.com>
References: <81492552a35a8e0556841873c17834f4d182bcad.camel@cyberus-technology.de>
 <8ffc19621b9873c4a280b1556a8f381c55b0affb.camel@cyberus-technology.de>
 <e2d543701d3442f78aae7bc10b54487d@intel.com>
 <f0e716100ad598bba1de032346994226550a8b10.camel@cyberus-technology.de>
 <5a74d2abdd034a61a336944148b9d40c@intel.com>
 <9286d367b5f95b4b819f5f41b7654e5a79e40328.camel@cyberus-technology.de>
 <1de9f44bf6c7766a2afc089395984192995be2ec.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <1de9f44bf6c7766a2afc089395984192995be2ec.camel@cyberus-technology.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1576572536=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1576572536==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4XBiSqiiHCIj6zoM"
Content-Disposition: inline


--4XBiSqiiHCIj6zoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.28 17:46:21 +0200, Julian Stecklina wrote:
> Hi!
>=20
> On Wed, 2020-10-28 at 10:40 +0200, Julian Stecklina wrote:
> > >   According to our assumption, there might be extra execlist schedule=
-out
> > > status notification. Is it possible that you can open the tracepoint =
in
> > > execlist_context_schedule_in and execlist_context_schedule_out in
> > > intel_lrc.c?
> >=20
> >=20
> > We'll try turning trace_i915_request_in / trace_i915_request_out into p=
rintks
> > and see whether this helps in debugging. Alternatively, is there a way =
to get
> > trace events out of a crashed kernel?
> >=20
> > Btw, would it make sense to count the schedule_in and schedule_out even=
ts for
> > each requests and dump a stacktrace when we see an unpaired schedule_ou=
t?
>=20
> So we tried this out with a tiny patch that checks for matched schedule i=
n/out
> events:
>=20
> https://github.com/blitz/linux/commit/441663fab60df4a4692d5cc031dcfdeffe2=
43008
>=20
> It would be good if you can check whether this is a useful invariant to w=
arn on.
> :)
>=20
> On one system, we see this triggering right after boot with no VMs runnin=
g at
> all (see below). I haven't seen this with our production VM workload yet,=
 but
> that usually takes hours to manifest. So we might have something there to=
morrow.
>

Hmm, looks one i915 change removed check of actual request preempted for st=
atus...
I'm not sure if that's relevant, but maybe you could try like:

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/=
intel_lrc.c
index d0be98b67138..f1a16d4b6e6a 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1439,7 +1439,9 @@ __execlists_schedule_out(struct i915_request *rq,
=20
 	intel_context_update_runtime(ce);
 	intel_engine_context_out(engine);
-	execlists_context_status_change(rq, INTEL_CONTEXT_SCHEDULE_OUT);
+	execlists_context_status_change(rq, i915_request_completed(rq) ?
+					INTEL_CONTEXT_SCHEDULE_OUT:
+					INTEL_CONTEXT_SCHEDULE_PREEMPTED);
 	if (engine->fw_domain && !atomic_dec_return(&engine->fw_active))
 		intel_uncore_forcewake_put(engine->uncore, engine->fw_domain);
 	intel_gt_pm_put_async(engine->gt);


> [   10.370703] ------------[ cut here ]------------
> [   10.370734] mismatched schedule in/out operations
> [   10.370807] WARNING: CPU: 1 PID: 0 at drivers/gpu/drm/i915/gt/intel_lr=
c.c:612
> process_csb+0x762/0x7a0 [i915]
> [   10.370842]  fb_sys_fops e1000e igb i2c_i801 drm dca ahci i2c_algo_bit
> libahci wmi video pinctrl_cannonlake pinctrl_intel
> [   10.370849] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.61 #1
> [   10.370849] Hardware name: Gigabyte Technology Co., Ltd. Q370M D3H GSM
> PLUS/Q370M D3H GSM PLUS, BIOS F14 06/05/2019
> [   10.370902] RIP: 0010:process_csb+0x762/0x7a0 [i915]
> [   10.370904] Code: 88 aa 15 00 00 0f 85 0f fd ff ff 48 c7 c7 10 e3 70 c=
0 4c 89
> 55 b0 48 89 4d b8 48 89 55 c0 c6 05 68 aa 15 00 01 e8 99 b7 2a eb <0f> 0b=
 4c 8b
> 55 b0 48 8b 4d b8 48 8b 55 c0 e9 dd fc ff ff 4c 89 55
> [   10.370905] RSP: 0018:ffffb1204014ce60 EFLAGS: 00010286
> [   10.370906] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
> [   10.370907] RDX: 0000000000000025 RSI: ffffffffad387405 RDI: 000000000=
0000246
> [   10.370907] RBP: ffffb1204014cec0 R08: ffffffffad3873e0 R09: 000000000=
0000025
> [   10.370907] R10: 0000000000000000 R11: 0000000000000001 R12: 000000000=
0000006
> [   10.370908] R13: ffff8ed12dcfe040 R14: 0000000000000001 R15: ffff8ed12=
f6fe000
> [   10.370909] FS:  0000000000000000(0000) GS:ffff8ed130440000(0000)
> knlGS:0000000000000000
> [   10.370909] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.370910] CR2: 000055da74158008 CR3: 000000017b40a004 CR4: 000000000=
03606e0
> [   10.370910] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   10.370910] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   10.370911] Call Trace:
> [   10.370912]  <IRQ>
> [   10.370928]  execlists_submission_tasklet+0x19/0x70 [i915]
> [   10.370948]  tasklet_action_common.isra.0+0x60/0x110
> [   10.370949]  tasklet_hi_action+0x1f/0x30
> [   10.370952]  __do_softirq+0xe1/0x2d6
> [   10.370955]  ? update_ts_time_stats+0x58/0x80
> [   10.370956]  irq_exit+0xae/0xb0
> [   10.370957]  scheduler_ipi+0xe4/0x130
> [   10.370958]  smp_reschedule_interrupt+0x39/0xe0
> [   10.370959]  reschedule_interrupt+0xf/0x20
> [   10.370960]  </IRQ>
> [   10.370964] RIP: 0010:cpuidle_enter_state+0xc5/0x450
> [   10.370965] Code: ff e8 0f 78 82 ff 80 7d c7 00 74 17 9c 58 0f 1f 44 0=
0 00 f6
> c4 02 0f 85 65 03 00 00 31 ff e8 62 dc 88 ff fb 66 0f 1f 44 00 00 <45> 85=
 ed 0f
> 88 8f 02 00 00 49 63 cd 4c 8b 7d d0 4c 2b 7d c8 48 8d
> [   10.370966] RSP: 0018:ffffb120400efe38 EFLAGS: 00000246 ORIG_RAX:
> ffffffffffffff02
> [   10.370966] RAX: ffff8ed13046a880 RBX: ffffffffacf58e80 RCX: 000000000=
000001f
> [   10.370967] RDX: 0000000000000000 RSI: 000000002aaaab99 RDI: 000000000=
0000000
> [   10.370967] RBP: ffffb120400efe78 R08: 000000026a23c65e R09: 000000028=
d99190d
> [   10.370967] R10: ffff8ed130469580 R11: ffff8ed130469560 R12: ffff8ed13=
0475928
> [   10.370968] R13: 0000000000000008 R14: 0000000000000008 R15: ffff8ed13=
0475928
> [   10.370970]  ? cpuidle_enter_state+0xa1/0x450
> [   10.370971]  cpuidle_enter+0x2e/0x40
> [   10.370988]  call_cpuidle+0x23/0x40
> [   10.370989]  do_idle+0x1dd/0x270
> [   10.370990]  cpu_startup_entry+0x20/0x30
> [   10.370992]  start_secondary+0x167/0x1c0
> [   10.370994]  secondary_startup_64+0xa4/0xb0
> [   10.370995] ---[ end trace 85cd1056f39ffa8d ]---
>=20
> Julian
>=20
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4XBiSqiiHCIj6zoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6DPkAAKCRCxBBozTXgY
JwwOAJ44gSKLRX2somzv5KLCD/NFms6yGACaAqK3mMCRuqfGD7JgL1kphUfGsi8=
=YIu0
-----END PGP SIGNATURE-----

--4XBiSqiiHCIj6zoM--

--===============1576572536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1576572536==--
