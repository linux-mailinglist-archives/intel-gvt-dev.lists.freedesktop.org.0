Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE7560B0C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Jun 2022 22:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E7710E7C4;
	Wed, 29 Jun 2022 20:31:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A67510E8A3;
 Wed, 29 Jun 2022 20:31:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74941B81F16;
 Wed, 29 Jun 2022 20:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AC1C34114;
 Wed, 29 Jun 2022 20:30:53 +0000 (UTC)
Date: Wed, 29 Jun 2022 16:30:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v2 26/27] dyndbg: 4 new trace-events: pr_debug, dev_dbg,
 drm_{,dev}debug
Message-ID: <20220629163052.6656c0cb@gandalf.local.home>
In-Reply-To: <20220516225640.3102269-27-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
 <20220516225640.3102269-27-jim.cromie@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
 quic_saipraka@quicinc.com, catalin.marinas@arm.com, arnd@arndb.de,
 will@kernel.org, gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, maz@kernel.org,
 jbaron@akamai.com, mingo@redhat.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, quic_psodagud@quicinc.com,
 daniel.vetter@ffwll.ch, mathieu.desnoyers@efficios.com,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


Sorry for the late review. I finally got some time to look at this.

On Mon, 16 May 2022 16:56:39 -0600
Jim Cromie <jim.cromie@gmail.com> wrote:


> diff --git a/include/trace/events/drm.h b/include/trace/events/drm.h
> new file mode 100644
> index 000000000000..6de80dd68620
> --- /dev/null
> +++ b/include/trace/events/drm.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM drm
> +
> +#if !defined(_TRACE_DRM_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DRM_H
> +
> +#include <linux/tracepoint.h>
> +
> +/* drm_debug() was called, pass its args */
> +TRACE_EVENT(drm_debug,
> +	    TP_PROTO(int drm_debug_category, struct va_format *vaf),
> +
> +	    TP_ARGS(drm_debug_category, vaf),
> +
> +	    TP_STRUCT__entry(
> +		    __field(int, drm_debug_category)
> +		    __dynamic_array(char, msg, 256)
> +		    ),
> +
> +	    TP_fast_assign(
> +		    int len;
> +
> +		    __entry->drm_debug_category = drm_debug_category;
> +		    vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
> +
> +		    len = strlen(__get_str(msg));
> +		    if (len > 0 && (__get_str(msg)[len - 1] == '\n'))
> +			    len -= 1;
> +		    __get_str(msg)[len] = 0;
> +		    ),
> +
> +	    TP_printk("%s", __get_str(msg))
> +);
> +
> +/* drm_devdbg() was called, pass its args, preserving order */
> +TRACE_EVENT(drm_devdbg,
> +	    TP_PROTO(const struct device *dev, int drm_debug_category, struct va_format *vaf),
> +
> +	    TP_ARGS(dev, drm_debug_category, vaf),
> +
> +	    TP_STRUCT__entry(
> +		    __field(const struct device*, dev)
> +		    __field(int, drm_debug_category)
> +		    __dynamic_array(char, msg, 256)

You do not want to hardcode the 256 here. That will cause 256 bytes to be
reserved on the buffer, and you will not get that back. Might as well make
it a static array, as you also add 4 bytes to for the offset and size.

I think you want (haven't tested it)

		__dynamic_array(char, msg, get_msg_size(vaf))

Where you have:

static unsigned int get_msg_size(struct va_format *vaf)
{
	va_list aq;
	unsigned int ret;

	va_copy(aq, vaf->va);
	ret = vsnprintf(NULL, 0, vaf->fmt, aq);
	va_end(aq);

	return min(ret + 1, 256);
}

What is in the last parameter of __dynamic_array() is used to calculate the
size needed to store the dynamic array.

Hmm, looking at other users of __dynamic_array(), this appears to be a
constant problem. I need to document this better.

-- Steve


> +		    ),
> +
> +	    TP_fast_assign(
> +		    int len;
> +
> +		    __entry->drm_debug_category = drm_debug_category;
> +		    __entry->dev = dev;
> +		    vsnprintf(__get_str(msg), 256, vaf->fmt, *vaf->va);
> +
> +		    len = strlen(__get_str(msg));
> +		    if (len > 0 && (__get_str(msg)[len - 1] == '\n'))
> +			    len -= 1;
> +		    __get_str(msg)[len] = 0;
> +		    ),
> +
> +	    TP_printk("cat:%d, %s %s", __entry->drm_debug_category,
> +		      dev_name(__entry->dev), __get_str(msg))
> +);
> +
> +#endif /* _TRACE_DRM_H */
> +
