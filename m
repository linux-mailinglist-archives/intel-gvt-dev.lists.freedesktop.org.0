Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147F2612D7
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Sep 2020 16:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA98B6E849;
	Tue,  8 Sep 2020 14:41:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98086E849
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Sep 2020 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599576106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgdTHd8NGowSZwDg6eCJYPhbgoyY002d0TclHThacBE=;
 b=JFqDt0YKfR9EF87fiJX+Siw6eGZZ3DF2y/p3Adjwj4PrLu1Inq++Qs4rqF6rTzr0y9/xvr
 VjvuCsVL8Lx3US9IDvPBfNCyFdlbjJxY5+pWdw64FwCtG2OVql3vksjfonAtXhCBacURvJ
 +6OfdJwuVA6sgElGZOB8gex+NGG6heI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-cdmyatQrMKiTRJWLAAMpJg-1; Tue, 08 Sep 2020 10:41:43 -0400
X-MC-Unique: cdmyatQrMKiTRJWLAAMpJg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5EFB800050;
 Tue,  8 Sep 2020 14:41:40 +0000 (UTC)
Received: from gondolin (ovpn-112-243.ams2.redhat.com [10.36.112.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF813A40;
 Tue,  8 Sep 2020 14:41:32 +0000 (UTC)
Date: Tue, 8 Sep 2020 16:41:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200908164130.2fe0d106.cohuck@redhat.com>
In-Reply-To: <20200831044344.GB13784@joy-OptiPlex-7040>
References: <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
 <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
 <20200831044344.GB13784@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Alex Williamson <alex.williamson@redhat.com>, Sean Mooney <smooney@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?UTF-8?B?UC5CZXJyYW5nw6k=?= <berrange@redhat.com>, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, 31 Aug 2020 12:43:44 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Fri, Aug 28, 2020 at 03:04:12PM +0100, Sean Mooney wrote:
> > On Fri, 2020-08-28 at 15:47 +0200, Cornelia Huck wrote:  
> > > On Wed, 26 Aug 2020 14:41:17 +0800
> > > Yan Zhao <yan.y.zhao@intel.com> wrote:
> > >   
> > > > previously, we want to regard the two mdevs created with dsa-1dwq x 30 and
> > > > dsa-2dwq x 15 as compatible, because the two mdevs consist equal resources.
> > > > 
> > > > But, as it's a burden to upper layer, we agree that if this condition
> > > > happens, we still treat the two as incompatible.
> > > > 
> > > > To fix it, either the driver should expose dsa-1dwq only, or the target
> > > > dsa-2dwq needs to be destroyed and reallocated via dsa-1dwq x 30.  
> > > 
> > > AFAIU, these are mdev types, aren't they? So, basically, any management
> > > software needs to take care to use the matching mdev type on the target
> > > system for device creation?  
> > 
> > or just do the simple thing of use the same mdev type on the source and dest.
> > matching mdevtypes is not nessiarly trivial. we could do that but we woudl have
> > to do that in python rather then sql so it would be slower to do at least today.
> > 
> > we dont currently have the ablity to say the resouce provider must have 1 of these
> > set of traits. just that we must have a specific trait. this is a feature we have
> > disucssed a couple of times and delayed untill we really really need it but its not out
> > of the question that we could add it for this usecase. i suspect however we would do exact
> > match first and explore this later after the inital mdev migration works.  
> 
> Yes, I think it's good.
> 
> still, I'd like to put it more explicitly to make ensure it's not missed:
> the reason we want to specify compatible_type as a trait and check
> whether target compatible_type is the superset of source
> compatible_type is for the consideration of backward compatibility.
> e.g.
> an old generation device may have a mdev type xxx-v4-yyy, while a newer
> generation  device may be of mdev type xxx-v5-yyy.
> with the compatible_type traits, the old generation device is still
> able to be regarded as compatible to newer generation device even their
> mdev types are not equal.

If you want to support migration from v4 to v5, can't the (presumably
newer) driver that supports v5 simply register the v4 type as well, so
that the mdev can be created as v4? (Just like QEMU versioned machine
types work.)

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
