Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B33FFEA6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Sep 2021 13:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC846E86E;
	Fri,  3 Sep 2021 11:07:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EB86E86C;
 Fri,  3 Sep 2021 11:07:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="219452646"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="219452646"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:07:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="500314109"
Received: from ojcasey-mobl.ger.corp.intel.com (HELO [10.213.195.251])
 ([10.213.195.251])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 04:07:12 -0700
Subject: Re: [Intel-gfx] [PATCH v7 3/8] i915/gvt: use
 DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:" etc categories
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-4-jim.cromie@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
Date: Fri, 3 Sep 2021 12:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831202133.2165222-4-jim.cromie@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


On 31/08/2021 21:21, Jim Cromie wrote:
> The gvt component of this driver has ~120 pr_debugs, in 9 categories
> quite similar to those in DRM.  Following the interface model of
> drm.debug, add a parameter to map bits to these categorizations.
> 
> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> 	"dyndbg bitmap desc",
> 	{ "gvt:cmd: ",  "command processing" },
> 	{ "gvt:core: ", "core help" },
> 	{ "gvt:dpy: ",  "display help" },
> 	{ "gvt:el: ",   "help" },
> 	{ "gvt:irq: ",  "help" },
> 	{ "gvt:mm: ",   "help" },
> 	{ "gvt:mmio: ", "help" },
> 	{ "gvt:render: ", "help" },
> 	{ "gvt:sched: " "help" });
> 
> The actual patch has a few details different, cmd_help() macro emits
> the initialization construct.
> 
> if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE is added
> cflags, by gvt/Makefile.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v5:
> . static decl of vector of bit->class descriptors - Emil.V
> . relocate gvt-makefile chunk from elsewhere
> v7:
> . move ccflags addition up to i915/Makefile from i915/gvt
> ---
>   drivers/gpu/drm/i915/Makefile      |  4 ++++
>   drivers/gpu/drm/i915/i915_params.c | 35 ++++++++++++++++++++++++++++++

Can this work if put under gvt/ or at least intel_gvt.h|c?

>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 4f22cac1c49b..5a4e371a3ec2 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>   
>   subdir-ccflags-y += -I$(srctree)/$(src)
>   
> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> +ccflags-y += -DDYNAMIC_DEBUG_MODULE
> +#endif

Ignores whether CONFIG_DRM_I915_GVT is enabled or not?

> +
>   # Please keep these build lists sorted!
>   
>   # core driver code
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index e07f4cfea63a..e645e149485e 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
>   	I915_PARAMS_FOR_EACH(FREE);
>   #undef FREE
>   }
> +
> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
> +/* todo: needs DYNAMIC_DEBUG_MODULE in some cases */
> +
> +unsigned long __gvt_debug;
> +EXPORT_SYMBOL(__gvt_debug);
> +
> +#define _help(key)	"\t    \"" key "\"\t: help for " key "\n"
> +
> +#define I915_GVT_CATEGORIES(name) \
> +	" Enable debug output via /sys/module/i915/parameters/" #name	\
> +	", where each bit enables a debug category.\n"			\
> +	_help("gvt:cmd:")						\
> +	_help("gvt:core:")						\
> +	_help("gvt:dpy:")						\
> +	_help("gvt:el:")						\
> +	_help("gvt:irq:")						\
> +	_help("gvt:mm:")						\
> +	_help("gvt:mmio:")						\
> +	_help("gvt:render:")						\
> +	_help("gvt:sched:")
> +
> +DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
> +				I915_GVT_CATEGORIES(debug_gvt),
> +				_DD_cat_("gvt:cmd:"),
> +				_DD_cat_("gvt:core:"),
> +				_DD_cat_("gvt:dpy:"),
> +				_DD_cat_("gvt:el:"),
> +				_DD_cat_("gvt:irq:"),
> +				_DD_cat_("gvt:mm:"),
> +				_DD_cat_("gvt:mmio:"),
> +				_DD_cat_("gvt:render:"),
> +				_DD_cat_("gvt:sched:"));
> +
> +#endif

So just the foundation - no actual use sites I mean? How would these be 
used from the code?

Regards,

Tvrtko
