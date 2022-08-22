Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967659B7F6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Aug 2022 05:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2BF979C0;
	Mon, 22 Aug 2022 03:25:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AD1979BE;
 Mon, 22 Aug 2022 03:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661138720; x=1692674720;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Y3ovRiS85wDRnSLOM39XlOUg9tP6xmiL2hckOaC0WmA=;
 b=OcFuUsvKD07kEcoADjvzPxTqTdgJcG1LJ0Q2WY5uMbsXq90P96y9MHdB
 HIIJZj2Jx9qWqwiy51sgPlPKD5XjLUin5RLqMH5/LS7SzhiXENPJcMTD9
 GL8M5QHI9fqlicIyz6ODZpQFXdVTmM+mcZewVZSF71mpHUB2YIgEY2vAU
 ewzyuPMcfNdC3YwvMU/1CMMiDD3RzVs3TbCfAYUVxYauEvu3poUzHnvG4
 V7jCSt1RNfO8u7eEzDSnEWaTnFH58rzdGP+gW1Im6WD2ajJDvBjoD+VDK
 6WIwePvbqWwdey9t1wUnF0kb2WyELRboiQ9sKQ5v94eStPI1ML3gHzMJa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="357293022"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
 d="asc'?scan'208";a="357293022"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2022 20:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
 d="asc'?scan'208";a="611884732"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 21 Aug 2022 20:25:17 -0700
Date: Mon, 22 Aug 2022 11:00:16 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20220822030016.GI1089@zhen-hp.sh.intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com>
 <20220816040508.GG1089@zhen-hp.sh.intel.com>
 <20220816044303.GH1089@zhen-hp.sh.intel.com>
 <116bdd80d399da39a6ba3f3d2f71a1f78e2b026f.camel@intel.com>
 <9f6e3433-5748-b7e4-bbc6-b0e47cb9d1c5@gmail.com>
 <875yipq2m2.fsf@intel.com> <87wnb5ocdl.fsf@intel.com>
 <bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="EecmvZxDifkbrwfl"
Content-Disposition: inline
In-Reply-To: <bc33d83b5dd01bddd96ec787fa2b948a04cdd3b5.camel@intel.com>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "colin.i.king@gmail.com" <colin.i.king@gmail.com>, "King,
 Colin" <colin.king@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--EecmvZxDifkbrwfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.08.18 15:43:32 +0000, Vivi, Rodrigo wrote:
> On Thu, 2022-08-18 at 17:27 +0300, Jani Nikula wrote:
>=20
>     On Thu, 18 Aug 2022, Jani Nikula <jani.nikula@intel.com> wrote:
>=20
>         On Wed, 17 Aug 2022, "Colin King (gmail)" <colin.i.king@gmail.com>
>         wrote:
>=20
>             On 17/08/2022 21:07, Vivi, Rodrigo wrote:
>=20
>                 On Tue, 2022-08-16 at 12:43 +0800, Zhenyu Wang wrote:
>=20
>                     On 2022.08.16 12:05:08 +0800, Zhenyu Wang wrote:
>=20
>                         On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
>=20
>                             On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhe=
nyu
>                             Wang wrote:
>=20
>                     oh, surprise! I just found Colin's email is actually
>                     defined in
>                     .mailmap,
>                     so all his commits in kernel are changed for @intel.c=
om
>                     address as in
>                     mailmap...
>=20
>=20
>                 Colin, would you mind to get the Sign-off-by in the patch=
es the
>                 same
>                 as your authorship so the tools don't get confused?
>                 (starting with modifying in tree this already merged patc=
h)
>=20
>=20
>             Since my patches are generally trivial janitorial fixed done =
in my
>             spare
>             time I'm going to get the .mailmap changed to use my gmail em=
ail
>             address
>             rather than my Intel one (since I don't do kernel work in my
>             current role).
>=20
>             This should clean up the confusion. Apologies.
>=20
>=20
>         Everyone hold your horses.
>=20
>         I think our tooling should handle the mailmap stuff. The commit *=
is*
>         fine, it's just that the when we check it, we let mailmap alter i=
t. We
>         should check the commit without mailmap modifications.
>=20
>=20
>     In this case, it's actually not about Colin's Signed-off-by or mailmap
>     at all! Like the error message from dim says, "committer Signed-off-by
>     missing". Committer, not author!
>=20
>     $ git show -s tags/gvt-fixes-2022-08-15^ --pretty=3Dfuller
>     commit d6632370536d0b80be3bfc90dd67e1f693335a75
>     Author:     Colin Ian King <colin.king@intel.com>
>     AuthorDate: Tue Mar 15 20:24:49 2022 +0000
>     Commit:     Zhenyu Wang <zhenyuw@linux.intel.com>
>     CommitDate: Mon Aug 15 10:51:15 2022 +0800
>=20
>         drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
>       =20
>         There is a spelling mistake in a gvt_vgpu_err error message. Fix =
it.
>       =20
>         Fixes: 695fbc08d80f ("drm/i915/gvt: replace the gvt_err with
>     gvt_vgpu_err")
>         Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>         Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
>         Link: http://patchwork.freedesktop.org/patch/msgid/
>     20220315202449.2952845-1-colin.i.king@gmail.com
>         Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
>=20
>     Committed by Zhenyu, Signed-off-by Zhi. Maybe caused by rebase by Zhe=
nyu
>     after being committed by Zhi?
>=20
>=20
> Probably easier if you could rebase it again signing it then?
>

Oops, sorry about that, will re-send.

--EecmvZxDifkbrwfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYwLxNQAKCRCxBBozTXgY
J1pCAJ0dr1WihxRZVV1JCbzpo60XwfenPwCfWwFfRNnDHXX1Rs5W4Vrezv4YGnI=
=f+mi
-----END PGP SIGNATURE-----

--EecmvZxDifkbrwfl--
