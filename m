Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA291241CF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 09:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F316E25E;
	Wed, 18 Dec 2019 08:34:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975496E25E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Dec 2019 08:34:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 00:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; 
 d="asc'?scan'208";a="210009511"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 18 Dec 2019 00:34:03 -0800
Date: Wed, 18 Dec 2019 16:32:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>
Subject: Re: [RFC PATCH] drm/i915/gvt: split sched_policy for adding more
 policies
Message-ID: <20191218083213.GA25522@zhen-hp.sh.intel.com>
References: <1576578763-12616-1-git-send-email-hang.yuan@linux.intel.com>
 <20191218024909.GX21662@zhen-hp.sh.intel.com>
 <0aac3d93-edf7-9cef-9c5c-7e45be3fb75d@linux.intel.com>
 <20191218054348.GB21662@zhen-hp.sh.intel.com>
 <a3e0358b-20e7-ee61-37ca-f4cc6a65c4cc@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a3e0358b-20e7-ee61-37ca-f4cc6a65c4cc@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0093713734=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0093713734==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.18 15:07:40 +0800, Hang Yuan wrote:
> On 12/18/19 1:43 PM, Zhenyu Wang wrote:
> > On 2019.12.18 13:07:34 +0800, Hang Yuan wrote:
> > > On 12/18/19 10:49 AM, Zhenyu Wang wrote:
> > > > On 2019.12.17 18:32:43 +0800, hang.yuan@linux.intel.com wrote:
> > > > > From: Hang Yuan <hang.yuan@linux.intel.com>
> > > > >=20
> > > > > Leave common policy codes in sched_policy.c and move time based
> > > > > scheduling to new file sched_policy_weight.c. Add module parameter
> > > > > "gvt_scheduler_policy" to choose one policy.
> > > > >=20
> > > >=20
> > > > Before any plan to split scheduler, what's the requirement for new
> > > > policy? What's the design? Would that be integrated with default
> > > > weight for different type? Need to understand that first to decide
> > > > whether or not we have to have seperate schedulers which I'm not fa=
vor
> > > > of if can't be done by default..
> > > >=20
> > > The new policy is not mature yet. Just see one user scenario where th=
ere are
> > > two vgpus, one is in foreground VM and another is in background VM. F=
or some
> > > reason, the background VM can't be paused but end user is not using i=
t. So
> > > its vgpu looks like not necessary to have fixed capacity as the sched=
uling
> > > policy right now.
> >=20
> > True.
> >=20
> > > Instead, want to try best to serve foreground vgpu and
> > > just avoid time out for gfx driver in background VM. Here are some ro=
ugh
> > > codes based on the previous patch to schedule vgpu on priority and us=
e a
> > > timer to increase vgpu's priority if it waits too long.
> >=20
> > yeah, current method for balance is still based on fixed weight for
> > target vGPU type. I think you want fine-grained control of run
> > timeslice over vGPU's activity? or you want fixed priority? I think
> > the foreground or background could be switched, right?
> >=20
> > Could we apply vGPU activity statistics in current scheduler? vGPU
> > type's weight is kind of static default allocation, we still use that
> > as base indicator for vgpu timeslice, but we'd also dynamically update
> > real execute timeslice based vgpu history. From that point of view, we
> > don't need another scheduler.
> >=20
> Yes, VM can be switched between foreground and background. I think
> fine-grained control may not fit this case because the "weight" is
> determined by the switch action, not historical data.
>

Or we can have a 'nice' value to set for each vGPU from sysfs which could
be handled in current scheduler for that purpose?

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfnkDQAKCRCxBBozTXgY
Jy6ZAKCDnpH4E9WByv3fDF1ztPG2cIQQTACgniI/o+n+NduQws4KdPkdmqXPtuI=
=8YwW
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--

--===============0093713734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0093713734==--
