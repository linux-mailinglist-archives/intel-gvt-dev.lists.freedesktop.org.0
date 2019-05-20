Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D722B03
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 06:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935FE89160;
	Mon, 20 May 2019 04:56:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6365989160
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 04:56:46 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 21:56:45 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga007.fm.intel.com with ESMTP; 19 May 2019 21:56:44 -0700
Date: Mon, 20 May 2019 12:55:46 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Message-ID: <20190520045546.GD12913@zhen-hp.sh.intel.com>
References: <20190515081921.4394-1-xiaolin.zhang@intel.com>
 <20190515090123.GU12913@zhen-hp.sh.intel.com>
 <073732E20AE4C540AE91DBC3F07D44608765E9A8@SHSMSX107.ccr.corp.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC275DC3A9@SHSMSX104.ccr.corp.intel.com>
 <073732E20AE4C540AE91DBC3F07D44608765EAA9@SHSMSX107.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <073732E20AE4C540AE91DBC3F07D44608765EAA9@SHSMSX107.ccr.corp.intel.com>
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1597798541=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1597798541==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DBwjNljafULFACtk"
Content-Disposition: inline


--DBwjNljafULFACtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.16 02:52:29 +0000, Zhang, Xiaolin wrote:
> On 05/16/2019 10:30 AM, Zhang, Xiong Y wrote:
> >
> >> -----Original Message-----
> >> From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.or=
g] On
> >> Behalf Of Zhang, Xiaolin
> >> Sent: Thursday, May 16, 2019 8:21 AM
> >> To: Zhenyu Wang <zhenyuw@linux.intel.com>
> >> Cc: intel-gvt-dev@lists.freedesktop.org
> >> Subject: Re: [PATCH v2] drm/i915/gvt: cancel dma map only for not pres=
ent
> >> ggtt entry
> >>
> >> On 05/15/2019 05:02 PM, Zhenyu Wang wrote:
> >>> On 2019.05.15 16:19:21 +0800, Xiaolin Zhang wrote:
> >>>> only cancel ggtt entry dma map for invalid ggtt entry, don't do it
> >>>> for paritial update or old ggtt entry.
> > [Zhang, Xiong Y] if guest just modify ggtt, not clear then write, where=
 will the old ggtt entry be unmapped ?
> > With this fix, it seems the old ggtt entry will never be unmapped.
> >
> > Still don't clear why graphic access it after ggtt has dropped it. How =
about this change ?
> this doesn't work either after a test.

I have the same concern as Xiong. In your change, we will only do unmap
when guest explicitly clear entry which set !present bit, but we can't
rely on guest driver behavior for this.

Current code just trys to do unmap whenever guest changed target entry.
So could you elaborate what's the real reason for this issue?


> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -2275,10 +2275,11 @@ static int emulate_ggtt_mmio_write(struct intel=
_vgpu *vgpu, unsigned int off,
> >         ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
> >
> >         ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> > -       ggtt_invalidate_pte(vgpu, &e);
> >
> >         ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
> >         ggtt_invalidate(gvt->dev_priv);
> > +
> > +       ggtt_invalidate_pte(vgpu, &e);
> >         return 0;
> >  }
> >
> > thanks
> >>>> this change can address DMA "fault reason 23" issue for win guest
> >>>> with intel iommu on.
> >>>>
> >>>> v2: update handling of ggtt partial update (Zhenyu, Yan, Henry)
> >>>>
> >>>> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/gvt/gtt.c | 21 ++++++++++++---------
> >>>>  1 file changed, 12 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
> >>>> b/drivers/gpu/drm/i915/gvt/gtt.c index c2f7d20f6346..4856b9fec411
> >>>> 100644
> >>>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> >>>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> >>>> @@ -2243,10 +2243,21 @@ static int emulate_ggtt_mmio_write(struct
> >> intel_vgpu *vgpu, unsigned int off,
> >>>>  		}
> >>>>  	}
> >>>>
> >>>> -	if (!partial_update && (ops->test_present(&e))) {
> >>>> +	if (!ops->test_present(&e)) {
> >>>> +		ggtt_get_host_entry(ggtt_mm, &m, g_gtt_index);
> >>>> +		ggtt_invalidate_pte(vgpu, &m);
> >>>> +		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>>> +		ops->clear_present(&m);
> >>>> +	} else {
> >>>>  		gfn =3D ops->get_pfn(&e);
> >>>>  		m =3D e;
> >>>>
> >>>> +		if (partial_update) {
> >>>> +			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>>> +			ops->clear_present(&m);
> >>>> +			goto out;
> >>>> +		}
> >>>> +
> >>>>  		/* one PTE update may be issued in multiple writes and the
> >>>>  		 * first write may not construct a valid gfn
> >>>>  		 */
> >>>> @@ -2266,17 +2277,9 @@ static int emulate_ggtt_mmio_write(struct
> >> intel_vgpu *vgpu, unsigned int off,
> >>>>  			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>>>  		} else
> >>>>  			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
> >>>> -	} else {
> >>>> -		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>>> -		ops->clear_present(&m);
> >>>>  	}
> >>>> -
> >>>>  out:
> >>>>  	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
> >>>> -
> >>>> -	ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> >>>> -	ggtt_invalidate_pte(vgpu, &e);
> >>>> -
> >>>>  	ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
> >>>>  	ggtt_invalidate(gvt->dev_priv);
> >>>>  	return 0;
> >>>> --
> >>> How about below simpler change?
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c
> >>> b/drivers/gpu/drm/i915/gvt/gtt.c index 08c74e65836b..8f27db9d7a1e
> >>> 100644
> >>> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> >>> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> >>> @@ -2269,16 +2269,16 @@ static int emulate_ggtt_mmio_write(struct
> >> intel_vgpu *vgpu, unsigned int off,
> >>>  			ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>>  		} else
> >>>  			ops->set_pfn(&m, dma_addr >> PAGE_SHIFT);
> >>> -	} else {
> >>> +	} else
> >>>  		ops->set_pfn(&m, gvt->gtt.scratch_mfn);
> >>> -		ops->clear_present(&m);
> >>> -	}
> >>>
> >>>  out:
> >>>  	ggtt_set_guest_entry(ggtt_mm, &e, g_gtt_index);
> >>>
> >>> -	ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> >>> -	ggtt_invalidate_pte(vgpu, &e);
> >>> +	if (!partial_update) {
> >>> +		ggtt_get_host_entry(ggtt_mm, &e, g_gtt_index);
> >>> +		ggtt_invalidate_pte(vgpu, &e);
> >>> +	}
> >> this change does not work after a test and this change was  pointed ou=
t by
> >> Henry before except your clear present. Another test is that if we cha=
nge "if
> >> (!partial_update)" to "if (!ops->test_present(&e))" after label out, i=
t will work.
> >> but this change is essential to the same my patch set and is not good
> >> readable than my patch set per my opinion.
> >>>  	ggtt_set_host_entry(ggtt_mm, &m, g_gtt_index);
> >>>  	ggtt_invalidate(gvt->dev_priv);
> >>>
> >>>
> >> _______________________________________________
> >> intel-gvt-dev mailing list
> >> intel-gvt-dev@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>=20
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DBwjNljafULFACtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOIzUgAKCRCxBBozTXgY
J+N8AJ9aYgdBOJxv5BhDCBmSH+5CuNZHcwCgiUJj2/U85C3TYlmrf/DEms2G4EA=
=PVrk
-----END PGP SIGNATURE-----

--DBwjNljafULFACtk--

--===============1597798541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1597798541==--
