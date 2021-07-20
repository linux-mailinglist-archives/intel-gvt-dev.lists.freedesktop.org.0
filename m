Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E653CFA86
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Jul 2021 15:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF5289A75;
	Tue, 20 Jul 2021 13:29:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F8A89996
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 13:29:38 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so1489403wmf.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Jul 2021 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=66CFWVAR0bH/92NRruTWJ395QztbGsSKzbDBzutoExo=;
 b=XS0CpU1DPqdO/ojwyD8+Nz8ML2fsIMmu/kN+8zzzUrdbaIyPue16Jd7mtCDXl2F+wi
 oO3kg6zuv7lDQxKLoAtoGeICH3yTXB7hSnM6g5NykvEnrtlTumVNvwBVNhVPeoruwK+p
 pSovA9DVQpickTpgUfNdLR7PvfhNp8Rg4n3+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=66CFWVAR0bH/92NRruTWJ395QztbGsSKzbDBzutoExo=;
 b=XREBOvls+fMNths8KOk8zxrMMijPJbGuKf/yMRdftNCxkpxl8gJBvbM4hi/BWipIvs
 bSg1OHvWweJdWV/gcerdsl9VT1DiUoMULAQ4UrtSe5z81MetXHv+AgHE3HV07EkC6uwU
 sMAlRRBCgF1NM9pQeEW3b6HJ4EkWXwcqYw7p5iiI6tAdBx6IVZwwfCuwDErr2/BxIp/F
 2ZDn5t9dR2g1EQu+zRNf2Uy0H5VQN+3cFgNidFmKxw5seSAuajZpjIbi7J5d0Qt5x+TK
 nujphuHN4XSkuyaGhQnc4Tgu47+rpErqZyMDNXUPg+Gnkpyk9epYQ+LIEch3gMrdJ1AU
 qunQ==
X-Gm-Message-State: AOAM5322kMbqh2skrs8ySkZH0ifFw9oBkE+T95+ZTSOxyYyzdSmrAUkm
 LYwZOanc0xMrM9AkO+TETX9cow==
X-Google-Smtp-Source: ABdhPJxp3Xx0I/f6/83p6a0+ZLso+YhABwTdApPdIKbEoqgI/hmHml6/H5lLC1ojyyOXNi/cs1PEbA==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr37271567wmj.99.1626787776660; 
 Tue, 20 Jul 2021 06:29:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o6sm23245103wry.91.2021.07.20.06.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:29:36 -0700 (PDT)
Date: Tue, 20 Jul 2021 15:29:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v3 3/5] drm/print: RFC add choice to use dynamic debug in
 drm-debug
Message-ID: <YPbPvm/xcBlTK1wq@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jbaron@akamai.com
References: <20210714175138.319514-1-jim.cromie@gmail.com>
 <20210714175138.319514-4-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714175138.319514-4-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 jbaron@akamai.com, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 11:51:36AM -0600, Jim Cromie wrote:
> drm's debug system uses distinct categories of debug messages, encoded
> in an enum (DRM_UT_<CATEGORY>), which are mapped to bits in drm.debug.
> drm_debug_enabled() does a lot of unlikely bit-mask checks on
> drm.debug; we can use dynamic debug instead, and get all that
> static_key/jump_label goodness.
> 
> Dynamic debug has no concept of category, but we can map the DRM_UT_*
> to a set of distinct prefixes; "drm:core:", "drm:kms:" etc, and
> prepend them to the given formats.
> 
> Then we can use:
>   `echo module drm format ^drm:core: +p > control`
> 
> to enable every such "prefixed" pr_debug with one query.  This new
> prefix changes pr_debug's output, so is user visible, but it seems
> unlikely to cause trouble for log watchers; they're not relying on the
> absence of class prefix strings.
> 
> This conversion yields ~2100 new callsites on my i7/i915 laptop:
> 
>   dyndbg: 195 debug prints in module drm_kms_helper
>   dyndbg: 298 debug prints in module drm
>   dyndbg: 1630 debug prints in module i915
> 
> CONFIG_DRM_USE_DYNAMIC_DEBUG enables this, and is available if
> CONFIG_DYNAMIC_DEBUG or CONFIG_DYNAMIC_DEBUG_CORE is chosen, and if
> CONFIG_JUMP_LABEL is enabled; this because its required to get the
> promised optimizations.
> 
> The indirection/switchover is layered into the macro scheme:
> 
> 0. A new callback on drm.debug which calls dynamic_debug_exec_queries
>    to map those bits to specific query/commands
>    dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
>    here for POC, this should be in dynamic_debug.c
>    with a MODULE_PARAM_DEBUG_BITMAP(__drm_debug, { "prefix-1", "desc-1" }+)

This is really awesome. For merging I think we need to discuss with dyn
debug folks whether they're all ok with this, but it's exported already
should should be fine.

> 
> 1. A "converted" or "classy" DRM_UT_* map
> 
>    based on:   DRM_UT_* ( symbol => bit-mask )
>    named it:  cDRM_UT_* ( symbol => format-class-prefix-string )
> 
>    So cDRM_UT_* is either:
>    legacy: cDRM_UT_* <-- DRM_UT_*   ( !CONFIG_DRM_USE_DYNAMIC_DEBUG )
>    enabled:
>     #define cDRM_UT_KMS    "drm:kms: "
>     #define cDRM_UT_PRIME  "drm:prime: "
>     #define cDRM_UT_ATOMIC "drm:atomic: "

the cDRM looks a bit funny, plus I don't eve have an idea what _UT_ means
(and git history isn't helpful either). What about just using
DRM_DBG_CLASS_ as the prefix here for these indirection macros, i.e.
DRM_DBG_CLASS_KMS.

Also would be really nice if we could make these a table or something, but
I guess with the macro magic that's not possible.

> 
>    DRM_UT_* are unchanged, since theyre used in drm_debug_enabled()
>    and elsewhere.

I think for the production version of these we need to retire/deprecate
them, at least for drm core. Otherwise you have an annoying mismatch
between drm.debug module option and dyn debug.

> 
> 2. drm_dev_dbg & drm_debug are renamed (prefixed with '_')
> 
>    old names are now macros, calling either:
>      legacy:  -> to renamed fn
>      enabled: -> dev_dbg & pr_debug, with cDRM-prefix # format.
> 
>    these names are used in a fat layer of macros (3) which supply the
>    category; those macros are used throughout drm code, yielding the
>    ~2100 new prdbgs reported above.
> 
> 3. names in (2) are invoked by DRM_DEBUG_<Category>, drm_dbg_<Category>.
> 
>    all these macros get "converted" to use cDRM_UT_*
>    to get right token type for both !/!! DRM_USE_DYNAMIC_DEBUG
> 
> 4. simplification of __DRM_DEFINE_DBG_RATELIMITED macro
> 
>    remove DRM_UT_ ## KMS as extra indirection
>    pass both DRM_UT & cDRM_UT, for drm_debug_enabled & drm_dev_dbg

For merging, can we pull out the renames and reorgs from this patch, and
then maybe also the reorder the next patch in your series here to be
before the dyn debug stuff?

> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig     |  13 +++++
>  drivers/gpu/drm/drm_print.c |  75 ++++++++++++++++++++++++--
>  include/drm/drm_print.h     | 102 ++++++++++++++++++++++++++----------
>  3 files changed, 158 insertions(+), 32 deletions(-)

I really like this, I think you can drop the RFC. A few more things that I
think we need:

- An overview kerneldoc section which explains the interfaces and how it
  all works together. Essentially your commit message with some light
  markup to make it look good.

- I think it would be really good to review the driver docs for all this
  and make sure it's complete. Some of the interface functions aren't
  documented yet (or maybe the ones that drivers shouldn't used need more
  __ prefixes to denote them as internal, dunno).

- I guess deprecation notice for drm_debug_enabled() and all that, so that
  we have a consistent interface. Doing the conversion will probably
  highlight the need for a bit more infrastructure and tooling, e.g. the
  bigger dump functions (like edid hex dump, or also the various decode
  helpers we have for dp, hdmi infoframes and all that) ideally have a
  single dyn_debug label to enable all of them instead of line-by-line.
  Tbh no idea how this should work, might need dyndbg work too.

- For the driver side of this we probably want a
  Documentation/gpu/TODO.rst entry if it's not all easy to convert
  directly.

> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7ff89690a976..e4524ccba040 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -57,6 +57,19 @@ config DRM_DEBUG_MM
>  
>  	  If in doubt, say "N".
>  
> +config DRM_USE_DYNAMIC_DEBUG
> +	bool "use dynamic debug to implement drm.debug"
> +	default n
> +	depends on DRM
> +	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> +	depends on JUMP_LABEL
> +	help
> +	  The drm debug category facility does a lot of unlikely bit-field
> +	  tests at runtime; while cheap individually, the cost accumulates.
> +	  This option uses dynamic debug facility (if configured and
> +	  using jump_label) to avoid those runtime checks, patching
> +	  the kernel when those debugs are desired.

Can't we just make this an internal option that's enabled automatically
when dyndbg is around? Plus a comment somewhere that we really recommend
enabling dyndbg for drm. Or would this mean that in certain dyndbg
configurations we'd loose all the debug lines, which would suck?

Anyway there's a pile of details, but the big picture I really like.
Especially that we can make dyndbg seamlessly support drm.debug is really
nice.

Cheers, Daniel

> +
>  config DRM_DEBUG_SELFTEST
>  	tristate "kselftests for DRM"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 111b932cf2a9..e2acdfc7088b 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -52,8 +52,75 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
>  "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
>  "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
>  "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> +
> +#ifndef CONFIG_DRM_USE_DYNAMIC_DEBUG
>  module_param_named(debug, __drm_debug, int, 0600);
>  
> +#else
> +static char *format_class_prefixes[] = {
> +	cDRM_UT_CORE,
> +	cDRM_UT_DRIVER,
> +	cDRM_UT_KMS,
> +	cDRM_UT_PRIME,
> +	cDRM_UT_ATOMIC,
> +	cDRM_UT_VBL,
> +	cDRM_UT_STATE,
> +	cDRM_UT_LEASE,
> +	cDRM_UT_DP,
> +	cDRM_UT_DRMRES
> +};
> +
> +#define OUR_QUERY_SIZE 64 /* > strlen "format '^%s' %cp" + longest prefix */
> +
> +static int param_set_dyndbg(const char *instr, const struct kernel_param *kp)
> +{
> +	unsigned int val;
> +	unsigned long changes, result;
> +	int rc, chgct = 0, totct = 0, bitpos;
> +	char query[OUR_QUERY_SIZE];
> +
> +	rc = kstrtouint(instr, 0, &val);
> +	if (rc) {
> +		pr_err("%s: failed\n", __func__);
> +		return -EINVAL;
> +	}
> +	result = val;
> +	changes = result ^ __drm_debug;
> +
> +	pr_debug("changes:0x%lx from result:0x%lx\n", changes, result);
> +
> +	for_each_set_bit(bitpos, &changes, ARRAY_SIZE(format_class_prefixes)) {
> +
> +		sprintf(query, "format '^%s' %cp", format_class_prefixes[bitpos],
> +			test_bit(bitpos, &result) ? '+' : '-');
> +
> +		chgct = dynamic_debug_exec_queries(query, "drm*");
> +		if (chgct < 0) {
> +			pr_err("%s: exec err:%d on: %s\n", __func__, chgct, query);
> +			continue;
> +		}
> +		pr_debug("change ct:%d on %s\n", chgct, query);
> +		totct += chgct;
> +	}
> +	pr_debug("total changes: %d\n", totct);
> +	__drm_debug = result;
> +	return 0;
> +}
> +
> +static int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
> +{
> +	pr_debug("debug-val:0x%x %u\n", __drm_debug, *((unsigned int *)kp->arg));
> +	return scnprintf(buffer, PAGE_SIZE, "%u\n",
> +			 *((unsigned int *)kp->arg));
> +}
> +static const struct kernel_param_ops param_ops_debug = {
> +	.set = param_set_dyndbg,
> +	.get = param_get_dyndbg,
> +};
> +module_param_cb(debug, &param_ops_debug, &__drm_debug, 0644);
> +
> +#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
>  	struct drm_print_iterator *iterator = p->arg;
> @@ -256,7 +323,7 @@ void drm_dev_printk(const struct device *dev, const char *level,
>  }
>  EXPORT_SYMBOL(drm_dev_printk);
>  
> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  		 const char *format, ...)
>  {
>  	struct va_format vaf;
> @@ -278,9 +345,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  
>  	va_end(args);
>  }
> -EXPORT_SYMBOL(drm_dev_dbg);
> +EXPORT_SYMBOL(_drm_dev_dbg);
>  
> -void __drm_dbg(enum drm_debug_category category, const char *format, ...)
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
>  {
>  	struct va_format vaf;
>  	va_list args;
> @@ -297,7 +364,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
>  
>  	va_end(args);
>  }
> -EXPORT_SYMBOL(__drm_dbg);
> +EXPORT_SYMBOL(___drm_dbg);
>  
>  void __drm_err(const char *format, ...)
>  {
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index ff5ac0e88321..499fa0b35200 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -319,6 +319,51 @@ enum drm_debug_category {
>  	DRM_UT_DRMRES		= 0x200,
>  };
>  
> +#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> +
> +/* Use legacy drm-debug functions, and drm_debug_enabled().
> + * For cDRM_UT_* (converted category), identity map to DRM_UT_*
> + */
> +#define __drm_dbg(cls, fmt, ...)			\
> +	___drm_dbg(cls, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)			\
> +	_drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
> +
> +#define cDRM_UT_CORE	DRM_UT_CORE
> +#define cDRM_UT_DRIVER	DRM_UT_DRIVER
> +#define cDRM_UT_KMS	DRM_UT_KMS
> +#define cDRM_UT_PRIME	DRM_UT_PRIME
> +#define cDRM_UT_ATOMIC	DRM_UT_ATOMIC
> +#define cDRM_UT_VBL	DRM_UT_VBL
> +#define cDRM_UT_STATE	DRM_UT_STATE
> +#define cDRM_UT_LEASE	DRM_UT_LEASE
> +#define cDRM_UT_DP	DRM_UT_DP
> +#define cDRM_UT_DRMRES	DRM_UT_DRMRES
> +
> +#else /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
> +/* use dynamic_debug to avoid drm_debug_enabled().
> + * dyndbg has no category, so we prefix the format with a "class"
> + * string; cDRM_UT_* maps to those class strings
> + */
> +#define __drm_dbg(cls, fmt, ...)		\
> +	pr_debug(cls # fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)		\
> +	dev_dbg(dev, cls # fmt, ##__VA_ARGS__)
> +
> +#define cDRM_UT_CORE	"drm:core: "
> +#define cDRM_UT_DRIVER	"drm:drvr: "
> +#define cDRM_UT_KMS	"drm:kms: "
> +#define cDRM_UT_PRIME	"drm:prime: "
> +#define cDRM_UT_ATOMIC	"drm:atomic: "
> +#define cDRM_UT_VBL	"drm:vbl: "
> +#define cDRM_UT_STATE	"drm:state: "
> +#define cDRM_UT_LEASE	"drm:lease: "
> +#define cDRM_UT_DP	"drm:dp: "
> +#define cDRM_UT_DRMRES	"drm:res "
> +
> +#endif /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
>  	return unlikely(__drm_debug & category);
> @@ -334,7 +379,7 @@ __printf(3, 4)
>  void drm_dev_printk(const struct device *dev, const char *level,
>  		    const char *format, ...);
>  __printf(3, 4)
> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  		 const char *format, ...);
>  
>  /**
> @@ -383,7 +428,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
> -	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  /**
>   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the driver
>   *
> @@ -391,7 +436,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  /**
>   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
>   *
> @@ -399,7 +444,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
>  
>  /*
>   * struct drm_device based logging
> @@ -443,25 +488,25 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  
>  
>  #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  #define drm_dbg(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
>  #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_VBL, fmt, ##__VA_ARGS__)
>  #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_STATE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DP, fmt, ##__VA_ARGS__)
>  #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>  
>  
>  /*
> @@ -471,7 +516,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>   */
>  
>  __printf(2, 3)
> -void __drm_dbg(enum drm_debug_category category, const char *format, ...);
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
>  __printf(1, 2)
>  void __drm_err(const char *format, ...);
>  
> @@ -500,44 +545,45 @@ void __drm_err(const char *format, ...);
>  #define DRM_ERROR_RATELIMITED(fmt, ...)					\
>  	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>  
> +
>  #define DRM_DEBUG(fmt, ...)						\
> -	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_DRIVER(fmt, ...)					\
> -	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_KMS(fmt, ...)						\
> -	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_KMS, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_PRIME(fmt, ...)					\
> -	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_ATOMIC(fmt, ...)					\
> -	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_VBL(fmt, ...)						\
> -	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_VBL, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_LEASE(fmt, ...)					\
> -	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  
>  #define DRM_DEBUG_DP(fmt, ...)						\
> -	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> +	__drm_dbg(cDRM_UT_DP, fmt, ## __VA_ARGS__)
>  
> -#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
> +#define __DRM_DEFINE_DBG_RATELIMITED(DRM_UT, cDRM_UT, drm, fmt, ...)	\
>  ({									\
>  	static DEFINE_RATELIMIT_STATE(rs_,				\
>  				      DEFAULT_RATELIMIT_INTERVAL,	\
>  				      DEFAULT_RATELIMIT_BURST);		\
>  	const struct drm_device *drm_ = (drm);				\
>  									\
> -	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL,			\
> -			       KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> +	if (drm_debug_enabled(DRM_UT) && __ratelimit(&rs_))		\
> +		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,		\
> +			    cDRM_UT, fmt, ##__VA_ARGS__);		\
>  })
>  
>  #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
> -	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
> +	__DRM_DEFINE_DBG_RATELIMITED(DRM_UT_KMS, cDRM_UT_KMS, drm, fmt, ## __VA_ARGS__)
>  
>  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) \
>  	drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
