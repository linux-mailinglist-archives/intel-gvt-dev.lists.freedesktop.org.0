Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DE264658
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 14:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903AD6E096;
	Thu, 10 Sep 2020 12:50:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E386E096
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599742215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXGj6k8riNs9Vj4UP7tEqOTrYQ5CAKfprkP6QZPSeR4=;
 b=c3mJVdEgnbMVsq7qaHoKPZ8fJGUJiqOTQ9renp8VAlCraP4vzN9NfUH4NHckUuRrpK0ML2
 p2GfZSOSvX8LjHZBtlkLvNjg3EeQRPNQEWSXvYQ/MxDwMc7d/vLwhnT8rnlwJP66hrpBN4
 Qxb7jhvuDmg9/a2JF5gZmI3tX/4nWO4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ljzdx7E7MXqRjdhSWPX_BA-1; Thu, 10 Sep 2020 08:50:14 -0400
X-MC-Unique: ljzdx7E7MXqRjdhSWPX_BA-1
Received: by mail-wm1-f70.google.com with SMTP id 189so2091277wme.5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Sep 2020 05:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXGj6k8riNs9Vj4UP7tEqOTrYQ5CAKfprkP6QZPSeR4=;
 b=oqzFmiewGfwUpCwUHltOQqik4AaPH2rrardpS5sj44pCKnng7nlbPCLRusuguC1MjD
 TyRN61aVt3JjVSWNgIWf20Vig9DPrzJa+vGlhmDqSajSY03WO/lY7X4TYjdlN8UMFmva
 35lUF+7AICVkwXSsLHwtyLaUxxFgM9K5UhvYrDL4ebprxizgKKbGLOiaTx1ILyIQxouq
 nsKExh3Zfc5r/MqXgIlkOFE5m1RY7iJVzkB+1dF5X5s89B/RWZ584MejpSKwxjihHJT/
 aGszWm+MntNI3rCpVm0BPHTQg6EWsXhnsoYJzcuetqdJjPMO2/gk/YamctW5v5PTRB9V
 j89Q==
X-Gm-Message-State: AOAM532pw7/pYe+CcS3HhK/O5fPip68HAvXg8M6X7/wawWz28t7/1a/d
 JucIEBW1hTrq6yTKElArSjoWiUCtznYESrRCkMEtnGu55bYaWzBscCyNCkUWRy2TkLs6YGftCri
 YBkkf6qBv/ZWov05HFjgLHEuQKG5ukRYvSA==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr8297052wmb.82.1599742213071; 
 Thu, 10 Sep 2020 05:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyXdpf4+Lc20wLIFYpjKwJB8sAx70dr7armMg6ykw8vcU9X+1byflhkDA11+n1XlghezjXOQ==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr8297020wmb.82.1599742212834; 
 Thu, 10 Sep 2020 05:50:12 -0700 (PDT)
Received: from pop-os ([109.79.57.111])
 by smtp.gmail.com with ESMTPSA id v7sm3484718wmj.28.2020.09.10.05.50.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Sep 2020 05:50:12 -0700 (PDT)
Message-ID: <7cebcb6c8d1a1452b43e8358ee6ee18a150a0238.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Date: Thu, 10 Sep 2020 13:50:11 +0100
In-Reply-To: <20200910143822.2071eca4.cohuck@redhat.com>
References: <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
 <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
 <20200831044344.GB13784@joy-OptiPlex-7040>
 <20200908164130.2fe0d106.cohuck@redhat.com>
 <20200909021308.GA1277@joy-OptiPlex-7040>
 <20200910143822.2071eca4.cohuck@redhat.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0.501
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
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?ISO-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 2020-09-10 at 14:38 +0200, Cornelia Huck wrote:
> On Wed, 9 Sep 2020 10:13:09 +0800
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > > > still, I'd like to put it more explicitly to make ensure it's not missed:
> > > > the reason we want to specify compatible_type as a trait and check
> > > > whether target compatible_type is the superset of source
> > > > compatible_type is for the consideration of backward compatibility.
> > > > e.g.
> > > > an old generation device may have a mdev type xxx-v4-yyy, while a newer
> > > > generation  device may be of mdev type xxx-v5-yyy.
> > > > with the compatible_type traits, the old generation device is still
> > > > able to be regarded as compatible to newer generation device even their
> > > > mdev types are not equal.  
> > > 
> > > If you want to support migration from v4 to v5, can't the (presumably
> > > newer) driver that supports v5 simply register the v4 type as well, so
> > > that the mdev can be created as v4? (Just like QEMU versioned machine
> > > types work.)  
> > 
> > yes, it should work in some conditions.
> > but it may not be that good in some cases when v5 and v4 in the name string
> > of mdev type identify hardware generation (e.g. v4 for gen8, and v5 for
> > gen9)
> > 
> > e.g.
> > (1). when src mdev type is v4 and target mdev type is v5 as
> > software does not support it initially, and v4 and v5 identify hardware
> > differences.
> 
> My first hunch here is: Don't introduce types that may be compatible
> later. Either make them compatible, or make them distinct by design,
> and possibly add a different, compatible type later.
> 
> > then after software upgrade, v5 is now compatible to v4, should the
> > software now downgrade mdev type from v5 to v4?
> > not sure if moving hardware generation info into a separate attribute
> > from mdev type name is better. e.g. remove v4, v5 in mdev type, while use
> > compatible_pci_ids to identify compatibility.
> 
> If the generations are compatible, don't mention it in the mdev type.
> If they aren't, use distinct types, so that management software doesn't
> have to guess. At least that would be my naive approach here.
yep that is what i would prefer to see too.
> 
> > 
> > (2) name string of mdev type is composed by "driver_name + type_name".
> > in some devices, e.g. qat, different generations of devices are binding to
> > drivers of different names, e.g. "qat-v4", "qat-v5".
> > then though type_name is equal, mdev type is not equal. e.g.
> > "qat-v4-type1", "qat-v5-type1".
> 
> I guess that shows a shortcoming of that "driver_name + type_name"
> approach? Or maybe I'm just confused.
yes i really dont like haveing the version in the mdev-type name 
i would stongly perfger just qat-type-1 wehere qat is just there as a way of namespacing.
although symmetric-cryto, asymmetric-cryto and compression woudl be a better name then type-1, type-2, type-3 if
that is what they would end up mapping too. e.g. qat-compression or qat-aes is a much better name then type-1
higher layers of software are unlikely to parse the mdev names but as a human looking at them its much eaiser to
understand if the names are meaningful. the qat prefix i think is important however to make sure that your mdev-types
dont colide with other vendeors mdev types. so i woudl encurage all vendors to prefix there mdev types with etiher the
device name or the vendor.
> 

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
