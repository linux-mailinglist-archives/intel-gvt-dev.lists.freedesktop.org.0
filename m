Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D7251CF00
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 May 2022 04:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1510EC6A;
	Fri,  6 May 2022 02:28:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5848E10EC6A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 May 2022 02:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651804120; x=1683340120;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=UDSpZw0JpQPhw5qqb0kgGhU4hK0BYDUlNyd4OMVSG+4=;
 b=H+7x4C1c2k6uUpf9acjaPdIckp5cXj4Mh/arhphjWgrGSwvm13MCGt+U
 omwFAw+T8da8l7A9AY1S6cf485+FbqSyIuN5ZXqmHG1HN4PCUlkLpdg3y
 A2uKONzeapk91Y0mal2vUsQ9P7yEkbshY0KsgQNta0mpvdfQQ8MnJtUrQ
 ChxLnEkWQU6qJH7jJpilwKH/c7BipIfvMkklaS0mi724Ri0xa492LWs85
 N2DSld3x7KszjSV6s8uOY9o/fLoMgLEGXN2H6NS0V5MEyeX0oVgCmVVMI
 9V6Ersfm6hJJWv9VnIMxAo0FPuPbSxRTVP5XglX0nQ+jKpxTeDIu2IWJD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268219303"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
 d="asc'?scan'208";a="268219303"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 19:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
 d="asc'?scan'208";a="549645064"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2022 19:28:38 -0700
Date: Fri, 6 May 2022 10:07:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Or Yair <or.yair@safebreach.com>
Subject: Re: Intel GVT-g Live Migration
Message-ID: <20220506020742.GH1089@zhen-hp.sh.intel.com>
References: <CAJ2oP6zJV3rodxf+Z-14U6shXq-9nGKe87AkbD4=t=yVy23Y1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XLsjFikA86nwwlhe"
Content-Disposition: inline
In-Reply-To: <CAJ2oP6zJV3rodxf+Z-14U6shXq-9nGKe87AkbD4=t=yVy23Y1Q@mail.gmail.com>
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
Cc: intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--XLsjFikA86nwwlhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.05.02 10:56:06 +0300, Or Yair wrote:
> Hi,
> I have been trying to figure out how I can do a live migration of a VM wi=
th a
> vGPU of Intel GVT-g attached for a while now with no success. I need it t=
o be
> on kernel 5+, I saw you are one of the contributors to the gvt-linux repo=
 and I
> was wondering maybe you can help me since I have no luck with the issue I
> opened in the repo.
>=20

Hi, it's better to ask this question on mail list.

I think we have some old release on https://github.com/intel/gvt-linux/
branch gvt-stable-4.17 which contains GVT-g migration POC code. And you
need qemu part as well, which should be on https://github.com/intel/igvtg-q=
emu,
branch stable-2.12.0. But I don't think we have plan now to push for upstre=
am...

--XLsjFikA86nwwlhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYnSC4gAKCRCxBBozTXgY
J0tcAKCM+q7NkD/aBGZDht+lwWxe3Ikv3wCfaxWurYmeanct4x45yycgluz4H0s=
=WKET
-----END PGP SIGNATURE-----

--XLsjFikA86nwwlhe--
