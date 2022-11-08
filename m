Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D7E620A1B
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 08:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112E710E223;
	Tue,  8 Nov 2022 07:24:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832810E223;
 Tue,  8 Nov 2022 07:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667892253; x=1699428253;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=dVWfgOgQknrhxoQkUpMLA4sc4elvsHwUopKnVigkgio=;
 b=CY4E3RiDHF19PbMlK4bqQjmQTe+rOXfwMIJI0ImHdl/Be6WfV+hgBA7L
 k+z6+qb/z+JHd5k1H9iBSuwvUnLm78XVcImAV1bRgMHFw+OO8DUm3gsgr
 4I2L0ABJgEu1yJ73eNR2DJvwvIu4Z1UsL3Acb6+LpEvxHqSpTDHMOPFTF
 JcRo3caCG4k3ObQDKBsWzLlXlqpYSdW4JLJyg8JNzmv8GYRru3gzGmehx
 vHJeO9b1rxBOu1wUBmqUWtIuOirGLgus+uGmrOptWR+BBW/tLVuoPqRGo
 jViRWeSjog+htLJJBpXyms/9aWFTtUIb+Wgy4A2VeMFdi4YmCQDIl1bdT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="291014654"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="291014654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 23:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="778820126"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="778820126"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2022 23:24:10 -0800
Date: Tue, 8 Nov 2022 15:23:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Remove the unused function get_pt_type()
Message-ID: <20221108072345.GM30028@zhen-hp.sh.intel.com>
References: <20220926064044.53016-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="lQSB8Tqijvu1+4Ba"
Content-Disposition: inline
In-Reply-To: <20220926064044.53016-1-jiapeng.chong@linux.alibaba.com>
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--lQSB8Tqijvu1+4Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.09.26 14:40:43 +0800, Jiapeng Chong wrote:
> The function get_pt_type is defined in the gtt.c file, but not
> called elsewhere, so delete this unused function.
>=20
> drivers/gpu/drm/i915/gvt/gtt.c:285:19: warning: unused function 'get_pt_t=
ype'.
>=20
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D2277
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index ce0eb03709c3..6cd4c1d386a5 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -282,11 +282,6 @@ static inline int get_next_pt_type(int type)
>  	return gtt_type_table[type].next_pt_type;
>  }
> =20
> -static inline int get_pt_type(int type)
> -{
> -	return gtt_type_table[type].pt_type;
> -}
> -
>  static inline int get_entry_type(int type)
>  {
>  	return gtt_type_table[type].entry_type;
> --=20
> 2.20.1.7.g153144c
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

--lQSB8Tqijvu1+4Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2oEAAAKCRCxBBozTXgY
JxYTAJ0WhjuzNcZJ3UuUlVc/b1m/CDPOrwCeO+fauEWS2A4hrpkPCsbzIiubZog=
=3rZe
-----END PGP SIGNATURE-----

--lQSB8Tqijvu1+4Ba--
