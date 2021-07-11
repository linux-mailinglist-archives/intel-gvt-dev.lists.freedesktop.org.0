Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50F3C3DEE
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 11 Jul 2021 18:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090B989C9D;
	Sun, 11 Jul 2021 16:26:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 532 seconds by postgrey-1.36 at gabe;
 Sun, 11 Jul 2021 16:26:19 UTC
Received: from smtprelay.hostedemail.com (smtprelay0127.hostedemail.com
 [216.40.44.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B25589C9D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 11 Jul 2021 16:26:18 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 57083180C3A9D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 11 Jul 2021 16:17:27 +0000 (UTC)
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 2410B20311;
 Sun, 11 Jul 2021 16:17:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id 04E321D42F6; 
 Sun, 11 Jul 2021 16:17:22 +0000 (UTC)
Message-ID: <e9f8186b3b96ba909f156fd750ba0aaf3d60a5fa.camel@perches.com>
Subject: Re: [RFC PATCH v2 1/4] drm_print.h: rewrap
 __DRM_DEFINE_DBG_RATELIMITED macro
From: Joe Perches <joe@perches.com>
To: Jim Cromie <jim.cromie@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi
 Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Sun, 11 Jul 2021 09:17:21 -0700
In-Reply-To: <20210711055003.528167-2-jim.cromie@gmail.com>
References: <20210711055003.528167-1-jim.cromie@gmail.com>
 <20210711055003.528167-2-jim.cromie@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 04E321D42F6
X-Spam-Status: No, score=1.57
X-Stat-Signature: 5sc5j7osyk4uzjqrwctk5jkkaxhwfr41
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18KeCdceO2yu0931OqGiBOrYctRL24z4Ps=
X-HE-Tag: 1626020242-383074
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
Cc: jbaron@akamai.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Sat, 2021-07-10 at 23:49 -0600, Jim Cromie wrote:
> whitespace only, to diff-minimize a later commit.
> no functional changes
[]
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
[]
> @@ -524,19 +524,24 @@ void __drm_err(const char *format, ...);
> =A0#define DRM_DEBUG_DP(fmt, ...)						\
> =A0	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> =A0
> =

> -#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
> -({												\
> -	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_=
RATELIMIT_BURST);\
> -	const struct drm_device *drm_ =3D (drm);							\
> -												\
> -	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS_=
_);	\
> +#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
> +({									\
> +	static DEFINE_RATELIMIT_STATE(rs_,				\
> +				      DEFAULT_RATELIMIT_INTERVAL,	\
> +				      DEFAULT_RATELIMIT_BURST);		\
> +	const struct drm_device *drm_ =3D (drm);				\
> +									\
> +	if (drm_debug_enabled(DRM_UT_ ## category)			\
> +	    && __ratelimit(&rs_))					\

Though I don't really see the need for the change, the typical style
has the logical continuation at the end of the test.

	if (drm_debug_enabled(DRM_UT_ ## category) &&			\
	    __ratelimit(&rs_))						\


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
