Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3661863B9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Mar 2020 04:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50876E329;
	Mon, 16 Mar 2020 03:36:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2C26E329
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 16 Mar 2020 03:36:49 +0000 (UTC)
IronPort-SDR: jm3fUafxrHCY8+OUO7H8zmd8y4JX6nKzCuDFjG9uzwBv82pUi4D9QgKbt4n80GLDlX5FXKXgQE
 sXFMQTZB6hZQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 20:36:48 -0700
IronPort-SDR: +glQMpT4DgqNnPXYxw9Ty0qU3ZUW6dvzdsNz//wkANIMId9hPHBOSf2RCaA1hfzj+LnuGZWqPu
 jQh2LpXlnRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,558,1574150400"; 
 d="asc'?scan'208";a="235906544"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2020 20:36:46 -0700
Date: Mon, 16 Mar 2020 11:24:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 0/7] use vfio_dma_rw to read/write IOVAs from CPU side
Message-ID: <20200316032408.GF8880@zhen-hp.sh.intel.com>
References: <20200313030548.7705-1-yan.y.zhao@intel.com>
 <20200313162958.5bfb5b82@x1.home>
MIME-Version: 1.0
In-Reply-To: <20200313162958.5bfb5b82@x1.home>
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
Cc: kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, kvm@vger.kernel.org,
 "Neo Jia \(cjia@nvidia.com\)" <cjia@nvidia.com>, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, Kirti Wankhede <kwankhede@nvidia.com>,
 peterx@redhat.com, pbonzini@redhat.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1336122245=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1336122245==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.13 16:29:58 -0600, Alex Williamson wrote:
> [Cc +NVIDIA]
>=20
> On Thu, 12 Mar 2020 23:05:48 -0400
> Yan Zhao <yan.y.zhao@intel.com> wrote:
>=20
> > It is better for a device model to use IOVAs to read/write memory to
> > perform some sort of virtual DMA on behalf of the device.
> >=20
> > patch 1 exports VFIO group to external user so that it can hold the gro=
up
> > reference until finishing using of it. It saves ~500 cycles that are sp=
ent
> > on VFIO group looking up, referencing and dereferencing. (this data is
> > measured with 1 VFIO user).
> >=20
> > patch 2 introduces interface vfio_dma_rw().
> >=20
> > patch 3 introduces interfaces vfio_group_pin_pages() and
> > vfio_group_unpin_pages() to get rid of VFIO group looking-up in
> > vfio_pin_pages() and vfio_unpin_pages().
> >=20
> > patch 4-5 let kvmgt switch from calling kvm_read/write_guest() to calli=
ng
> > vfio_dma_rw to rw IOVAs.
> >=20
> > patch 6 let kvmgt switch to use lighter version of vfio_pin/unpin_pages=
(),
> > i.e. vfio_group_pin/unpin_pages()
> >=20
> > patch 7 enables kvmgt to read/write IOVAs of size larger than PAGE_SIZE.
>=20
> This looks pretty good to me, hopefully Kirti and Neo can find some
> advantage with this series as well.  Given that we're also trying to
> get the migration interface and dirty page tracking integrated for
> v5.7, would it make sense to merge the first 3 patches via my next
> branch?  This is probably the easiest way to update the dirty tracking.

I think that should be ok, other kvmgt change for 5.7 has already been in q=
ueue,
once merge window is open, can send left kvmgt patches.

For kvmgt patch 4-6,

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> Alex
>=20
> > Performance:
> >=20
> > Comparison between vfio_dma_rw() and kvm_read/write_guest():
> >=20
> > 1. avergage CPU cycles of each interface measured with 1 running VM:
> >  --------------------------------------------------
> > |  rw       |          avg cycles of               |
> > |  size     | (vfio_dma_rw - kvm_read/write_guest) |
> > |---------- ---------------------------------------|
> > | <=3D 1 page |            +155 ~ +195               |       =20
> > |--------------------------------------------------|
> > | 5 pages   |                -530                  |
> > |--------------------------------------------------|
> > | 20 pages  |           -2005 ~ -2533              |
> >  --------------------------------------------------
> >=20
> > 2. average scores
> >=20
> > base: base code before applying code in this series. use
> > kvm_read/write_pages() to rw IOVAs
> >=20
> > base + this series: use vfio_dma_rw() to read IOVAs and use
> > vfio_group_pin/unpin_pages(), and kvmgt is able to rw several pages
> > at a time.
> >=20
> > Scores of benchmarks running in 1 VM each:
> >  -----------------------------------------------------------------
> > |                    | glmark2 | lightsmark | openarena | heavens |
> > |-----------------------------------------------------------------|
> > |       base         |  1248   |  219.70    |  114.9    |   560   |
> > |-----------------------------------------------------------------|
> > |base + this series  |  1248   |  225.8     |   115     |   559   |
> >  -----------------------------------------------------------------
> >=20
> > Sum of scores of two benchmark instances running in 2 VMs each:
> >  -------------------------------------------------------
> > |                    | glmark2 | lightsmark | openarena |
> > |-------------------------------------------------------|
> > |       base         |  812    |  211.46    |  115.3    |
> > |-------------------------------------------------------|
> > |base + this series  |  814    |  214.69    |  115.9    |
> >  -------------------------------------------------------
> >=20
> >=20
> > Changelogs:
> > v3 --> v4:
> > - rebased to 5.6.0-rc4+
> > - adjust wrap position for vfio_group_get_external_user_from_dev() in
> >   header file.(Alex)
> > - updated function description of vfio_group_get_external_user_from_dev=
()
> >   (Alex)
> > - fixed Error path group reference leaking in
> >   vfio_group_get_external_user_from_dev()  (Alex)
> > - reurn 0 for success or errno in vfio_dma_rw_chunk(). (Alex)
> > - renamed iova to user_iova in interface vfio_dam_rw().
> > - renamed vfio_pin_pages_from_group() and vfio_unpin_pages_from_group()=
 to
> >   vfio_group_pin_pages() and vfio_group_unpin_pages()
> > - renamed user_pfn to user_iova_pfn in vfio_group_pin_pages() and
> >   vfio_group_unpin_pages()
> >=20
> > v2 --> v3:
> > - add vfio_group_get_external_user_from_dev() to improve performance (A=
lex)
> > - add vfio_pin/unpin_pages_from_group() to avoid repeated looking up of
> >   VFIO group in vfio_pin/unpin_pages() (Alex)
> > - add a check for IOMMU_READ permission. (Alex)
> > - rename vfio_iommu_type1_rw_dma_nopin() to
> >   vfio_iommu_type1_dma_rw_chunk(). (Alex)
> > - in kvmgt, change "write ? vfio_dma_rw(...,true) :
> >   vfio_dma_rw(...,false)" to vfio_dma_rw(dev, gpa, buf, len, write)
> >   (Alex and Paolo)
> > - in kvmgt, instead of read/write context pages 1:1, combining the
> >   reads/writes of continuous IOVAs to take advantage of vfio_dma_rw() f=
or
> >   faster crossing page boundary accesses.
> >=20
> > v1 --> v2:
> > - rename vfio_iova_rw to vfio_dma_rw, vfio iommu driver ops .iova_rw
> > to .dma_rw. (Alex).
> > - change iova and len from unsigned long to dma_addr_t and size_t,
> > respectively. (Alex)
> > - fix possible overflow in dma->vaddr + iova - dma->iova + offset (Alex)
> > - split DMAs from on page boundary to on max available size to eliminate
> >   redundant searching of vfio_dma and switching mm. (Alex)
> > - add a check for IOMMU_WRITE permission.
> >=20
> >=20
> > Yan Zhao (7):
> >   vfio: allow external user to get vfio group from device
> >   vfio: introduce vfio_dma_rw to read/write a range of IOVAs
> >   vfio: avoid inefficient operations on VFIO group in
> >     vfio_pin/unpin_pages
> >   drm/i915/gvt: hold reference of VFIO group during opening of vgpu
> >   drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw
> >   drm/i915/gvt: switch to user vfio_group_pin/upin_pages
> >   drm/i915/gvt: rw more pages a time for shadow context
> >=20
> >  drivers/gpu/drm/i915/gvt/kvmgt.c     |  46 ++++---
> >  drivers/gpu/drm/i915/gvt/scheduler.c |  97 ++++++++++-----
> >  drivers/vfio/vfio.c                  | 180 +++++++++++++++++++++++++++
> >  drivers/vfio/vfio_iommu_type1.c      |  76 +++++++++++
> >  include/linux/vfio.h                 |  13 ++
> >  5 files changed, 360 insertions(+), 52 deletions(-)
> >=20
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXm7xWAAKCRCxBBozTXgY
JzsUAJ4ql9OdukYF5F1t5Q/sO6yJcEKojQCfS53RSxPXqeH0HitCOlTrsRBhYBk=
=Dorv
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--

--===============1336122245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1336122245==--
