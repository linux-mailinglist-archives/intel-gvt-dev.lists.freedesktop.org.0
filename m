Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB92332E9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Jul 2020 15:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A346E8DF;
	Thu, 30 Jul 2020 13:24:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3606E8DF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Jul 2020 13:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596115478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=trBMDum5jaV2PmP6FGjCemPgC956VMcTP3eowoAov1g=;
 b=LMlgrbXFv39/qXeAnmfaWlp5z/9rUMZLgJMw/EgAUXV5fMtPnJWOLBDqiI1tLwYpDRVrfp
 QOa5Tg/BBs163cjUeG2HPHGtjP6MAfyfR5tpXzZccygKl8QqS7p/jJzFJHwgvJJekck2Fu
 IN74fnY8cUBHYkJPBcNXmv7o0dF+WDE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-D4qNI3OOMXyeD0VvU3n-mg-1; Thu, 30 Jul 2020 09:24:35 -0400
X-MC-Unique: D4qNI3OOMXyeD0VvU3n-mg-1
Received: by mail-wm1-f70.google.com with SMTP id q15so2228326wmj.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Jul 2020 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=trBMDum5jaV2PmP6FGjCemPgC956VMcTP3eowoAov1g=;
 b=mF/GvwXACyYEv2/yNsaXXELOrzrbeCHZxbJBx3idjA/777ZPYYvVARw/aD4PAh3e5U
 PCT7QEe6OylFlfW3PMA6A9S43KmfksRrqt0An++9LOpxUkCk67mYD+o3uHK0jUTFsgXv
 tazus6Wptd7Yx2up8VLsG2D+WbuR/wbV+JIT0KtUV/4xmBog3SnuZ1d/vIeXcJpPbAtU
 /w0QI/GsTu5KX/sfHhmVKNPqow+L7TkWHySEEFPCtE3IZ+rXJ6gcvHWc5dXUxsYeGKHO
 T7W8fTOenIfFclpPJ1Nigaw8LOFz8/Z/YyRxkBQKub96b0F+a8wMRFLWNXai/6rnUWUf
 GKgg==
X-Gm-Message-State: AOAM533iM4/I2cj+DgF7k7CEtEJxqmuO7ZCtcaqohQoyMfYbobzNQvqd
 GHhdGS34cTOwRihUICay+dez8wPGIVaeLemI9Ne5kIChxeoAivZ0WYJ4EVELnFSpb5gJ3/J36SR
 zAVClJwUAYw7dg7FhFYWvBRGRG01q/xiBVg==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr12750868wmo.62.1596115474298; 
 Thu, 30 Jul 2020 06:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbK20wdWHvC4AuD4fC98U/RMEiNOX+IYs63dLbAh2/L5ig+EHrNSXl9Gtwq/lrg+jGKUC+8g==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr12750834wmo.62.1596115474070; 
 Thu, 30 Jul 2020 06:24:34 -0700 (PDT)
Received: from pop-os ([2001:470:1f1d:1ea:4fde:6f63:1f5a:12b1])
 by smtp.gmail.com with ESMTPSA id l11sm8654553wme.11.2020.07.30.06.24.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 30 Jul 2020 06:24:33 -0700 (PDT)
Message-ID: <c56990fe775268793b06d94c679bec2c458b7ecf.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>
Date: Thu, 30 Jul 2020 14:24:31 +0100
In-Reply-To: <20200730034104.GB32327@joy-OptiPlex-7040>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040>
 <20200717101258.65555978@x1.home>
 <20200721005113.GA10502@joy-OptiPlex-7040>
 <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <e8a973ea0bb2bc3eb15649fb1c44599ae3509e84.camel@redhat.com>
 <20200729131255.68730f68@x1.home>
 <20200730034104.GB32327@joy-OptiPlex-7040>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net, devel@ovirt.org,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 2020-07-30 at 11:41 +0800, Yan Zhao wrote:
> > > >    interface_version=3
> > 
> > Not much granularity here, I prefer Sean's previous
> > <major>.<minor>[.bugfix] scheme.
> > 
> 
> yes, <major>.<minor>[.bugfix] scheme may be better, but I'm not sure if
> it works for a complicated scenario.
> e.g for pv_mode,
> (1) initially,  pv_mode is not supported, so it's pv_mode=none, it's 0.0.0,
> (2) then, pv_mode=ppgtt is supported, pv_mode="none+ppgtt", it's 0.1.0,
> indicating pv_mode=none can migrate to pv_mode="none+ppgtt", but not vice versa.
> (3) later, pv_mode=context is also supported,
> pv_mode="none+ppgtt+context", so it's 0.2.0.
> 
> But if later, pv_mode=ppgtt is removed. pv_mode="none+context", how to
> name its version?
it would become 1.0.0
addtion of a feature is a minor version bump as its backwards compatiable.
if you dont request the new feature you dont need to use it and it can continue to behave like
a 0.0.0 device evne if its capably of acting as a 0.1.0 device.
when you remove a feature that is backward incompatable as any isnstance that was prevously not
using it would nolonger work so you have to bump the major version.
>  "none+ppgtt" (0.1.0) is not compatible to
> "none+context", but "none+ppgtt+context" (0.2.0) is compatible to
> "none+context".
> 
> Maintain such scheme is painful to vendor driver.
not really its how most software libs are version today. some use other schemes
but semantic versioning is don right is a concies and easy to consume set of rules
https://semver.org/ however you are right that it forcnes vendor to think about backwards
and forwards compatiablty with each change which for the most part is a good thing.
it goes hand in hand with have stable abi and api definitons to ensuring firmware updates and driver chagnes
dont break userspace that depend on the kernel interfaces they expose.


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
