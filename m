Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FC53F27A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 01:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825EF11BBCE;
	Mon,  6 Jun 2022 23:21:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5B911BBCE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  6 Jun 2022 23:21:25 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id n197so4991488qke.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 06 Jun 2022 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v5vcjjBO5Hf7YQjGIjjL9G5k1C6N2WYoLNXXwX5nxBQ=;
 b=WBSJSZBieh+Cj1oFaheiZ15LpB3nTTuTiYVUhSHgCo9F/SI8JUFSktbhiOxMhmiZiJ
 pE4vzWpBbzJbHq4rm3An0RyNSSWcTLQivvbwhdDcFxpyp96ObudXGn27dCtWY5ABCPzh
 6ftMcfcswU1+p3ZmDVnFj5j94FDg/+MwixwnJ2TH/uRwux2ZDaCHa41ND8fsoLoETLof
 SrX1xpQ3j6bViqbX0vdWrjApj/OIAA4iscB0JUGHffSuETDo3gyqOKRB6qSbc5mbFpQY
 p4ZbXHr9l4gqYY3i/gWg/buCdVYtU9GocYXQhSeYhwqRCtQ/G8Tt9ZKYWWox4s0fszRL
 6vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v5vcjjBO5Hf7YQjGIjjL9G5k1C6N2WYoLNXXwX5nxBQ=;
 b=KmGylUzyVTpQ3w8qV+nBIB7jn7+HZ1YPfr/lUBCWtFZnOC2OWbkpJFXChCUlANSDDd
 UWM1Ma45uCR8XPyL/YYWKT46RDfnUeaT9wVYAlKko2NEXaprYqfRqkCX1XhzHS9JPI2G
 I6l7xZgwkV+z/FHAVKH6o/UCXRwaCo3Rh6Opv6tcduxmugLyuKY0dd+SStIk2z8sDMf3
 wLeMyzYFX09gB8VqVbreFZALjgebrLkXTSKo2+dGeg2NIDnv990oxeW2mOwuOVpGzAeC
 NqdFYU4TX0uWxtPuUUEpVuL97GH5kSwg7hHyyeNqVLpwFhi77yfKl1fDAsPpnva2TW+S
 QZgw==
X-Gm-Message-State: AOAM53002bpnn0y77FtcIcPdxwSUEwipSNMBor9gFEcS+jAyrRsE2m+F
 lZub9E1bhrvoK7g2++BGV260KQ==
X-Google-Smtp-Source: ABdhPJwa4cdiCcTjwM0PprUnLIbY2ss8Gs7aLyp/S9zRUiWanpo7k2O0otOSWKDRr/Dg++yAS4D4Jg==
X-Received: by 2002:ae9:f20d:0:b0:6a6:ab5e:33ca with SMTP id
 m13-20020ae9f20d000000b006a6ab5e33camr9918929qkg.176.1654557685060; 
 Mon, 06 Jun 2022 16:21:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac87f93000000b002f936bae288sm11751235qtj.87.2022.06.06.16.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:21:24 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nyM2F-002pag-P1; Mon, 06 Jun 2022 20:21:23 -0300
Date: Mon, 6 Jun 2022 20:21:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/8] vfio/mdev: make mdev.h standalone includable
Message-ID: <20220606232123.GC3932382@ziepe.ca>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603063328.3715-2-hch@lst.de>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 08:33:21AM +0200, Christoph Hellwig wrote:
> Include <linux/device.h> and <linux/uuid.h> so that users of this headers
> don't need to do that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/mdev.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
