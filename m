Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED81E551A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 May 2020 06:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84BB6E09F;
	Thu, 28 May 2020 04:28:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7456E09F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 May 2020 04:28:32 +0000 (UTC)
IronPort-SDR: XAs5E/Iz63iFhXzmoZ9J34gxgJ3NyEcpWRNHZVwDssZxP/VQbhLdIpdTSJwGAibz7/slxRPfJi
 aSCEDJR+7twA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 21:28:31 -0700
IronPort-SDR: lessUttt9A4owsKe9sHfadLAWhJ4Qlz468JkbrIG/qbV5QOnVJSoFLU++vPBoXwD9h0/bQuo6k
 r8ZmKbby9QPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
 d="asc'?scan'208";a="345780313"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga001.jf.intel.com with ESMTP; 27 May 2020 21:28:30 -0700
Date: Thu, 28 May 2020 12:13:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: Semantics of dma_{map,pin,unmap}_guest_page
Message-ID: <20200528041311.GH23961@zhen-hp.sh.intel.com>
References: <98f001ecef5644f945e36585ac04ba31093e6a2e.camel@cyberus-technology.de>
 <20200526060229.GA19560@joy-OptiPlex-7040>
 <3fef2ebc2506dd2bd71f5411033c2cfb1b1a00bd.camel@cyberus-technology.de>
 <20200526081244.GB19560@joy-OptiPlex-7040>
 <3bdc659d41ad00d7ab1bf981dd97c2bb34163d0f.camel@cyberus-technology.de>
 <20200526083747.GC19560@joy-OptiPlex-7040>
MIME-Version: 1.0
In-Reply-To: <20200526083747.GC19560@joy-OptiPlex-7040>
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1845336470=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1845336470==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.26 04:37:47 -0400, Yan Zhao wrote:
> On Tue, May 26, 2020 at 10:30:36AM +0200, Julian Stecklina wrote:
> > On Tue, 2020-05-26 at 04:12 -0400, Yan Zhao wrote:
> > > On Tue, May 26, 2020 at 10:11:12AM +0200, Julian Stecklina wrote:
> > > > On Tue, 2020-05-26 at 02:02 -0400, Yan Zhao wrote:
> > > > > as the Unmap calls are triggered from guest page table modificati=
on, its
> > > > > count does not necessarily match to that of Map calls.
> > > > > But unpon vGPU is destroyed, gvt_cache_destroy() would be called =
by
> > > > > kvmgt_guest_exit() and would remove all DMA mappings which might =
be still
> > > > > alive regardless of its ref count.
> > > >=20
> > > > If page tables stay pinned across a call to vgpu_destroy, that woul=
d explain
> > > > what I'm seeing. This is then also harmless. I was worried that we
> > > > accumulate
> > > > these pins over time.
> > > >=20
> > > > That being said, I've opened an issue in our internal bug tracker t=
o re-
> > > > visit
> > > > this issue and confirm the theories.
> > > >=20
> > > guest page tables are not necessarily cleared before vgpu_destroy,
> > > especially when guest is killed or crashed.
> > > so Unmap count is always less than Map count. I don't think it's a bu=
g,
> > > and it's safe to clear all dma mappings generated for guest and unpin=
 all
> > > previously pinned guest pages as now guest is destroyed. isn't it?
> >=20
> > It's fine. It was just a bit surprising to me.
> >=20
> > As I said before, it would be easier to spot bugs if vgpu_destroy would=
 clean
> > DMA mappings up that it knows about, but it's mostly cosmetic.
> >
> yes, if vgpu could maintain a list of its pinned pages and unpin them in
> vgpu_destroy, it's fine.
> But hypervisor adapter layer still needs to maintain a list in order to c=
atch up
> the missed ones to make itself complete.
> so putting DMA mappings cleanup in hypervisor adapter layer makes our
> life easier now:)
>=20

yeah, we take big hammer now. That pin_guest_page interface is still not cl=
ean
to me along with our display dmabuf handling which is that for, should doub=
le
check on proper life cycle handling.

btw, Julian, for hypervisor adapter interface you proposed before, is
there any update on that? I think we'll also look into ACRN hypervisor
support, so better can align.

Thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXs86VwAKCRCxBBozTXgY
J+g8AKCU/qujtl/3HNE66kEMz+svqQcw6ACfXP5gtxuJvAie1UAKUTg7e1XHqtk=
=lGYk
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--

--===============1845336470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1845336470==--
