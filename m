Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE013326BE
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 04:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898F2892C8;
	Mon,  3 Jun 2019 02:46:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7460892C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 02:46:32 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 19:46:32 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2019 19:46:31 -0700
Date: Mon, 3 Jun 2019 10:45:02 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v5] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190603024502.GE9684@zhen-hp.sh.intel.com>
References: <1559279889-5741-1-git-send-email-xiaolin.zhang@intel.com>
 <20190531054223.GL3211@zhen-hp.sh.intel.com>
 <9BD218709B5F2A4F96F08B4A3B98A8977342BA62@SHSMSX101.ccr.corp.intel.com>
 <20190531085834.GC9684@zhen-hp.sh.intel.com>
 <073732E20AE4C540AE91DBC3F07D446087673B60@SHSMSX107.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <073732E20AE4C540AE91DBC3F07D446087673B60@SHSMSX107.ccr.corp.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Li, Weinan Z" <weinan.z.li@intel.com>
Content-Type: multipart/mixed; boundary="===============0769028066=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0769028066==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.03 02:18:38 +0000, Zhang, Xiaolin wrote:
> >>>
> >>>
> >> Just update the vreg during "update_guest_context()" is not enough, th=
inking there is one workload was preempted out by host many times.
> >>
> > For preemption case which need extra track of host vs. guest ring
> > to reflect guest state, this one is always needed for normal finish.
> > Yeah, need further change to update guest state in time.
> per talk with Weinan, it looks like if we put these code change to
> switch_mmio, it can handle preempt case very well.

If you wanna always put ring state tracking there, which would always
try to calculate guest ring update according with host ring state, then
that'll also work. But that will need more careful tracking. I'm ok to
first go with this one for current regression, then with more refined one
to calculate interval updates for preemption.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPSJrgAKCRCxBBozTXgY
J46/AJ979VQDx3snQvsoNfuE2G2O4kh8XgCfR0boreDH4301/y2cvj+Z0aV2Tpo=
=2ywF
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--

--===============0769028066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0769028066==--
