Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13B217E01
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Jul 2020 06:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271A6E853;
	Wed,  8 Jul 2020 04:17:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598E66E853
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 Jul 2020 04:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594181829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKtNs60lqM2H6+ip9k2pEz4i2ApN1w4yNJ1zxU979l4=;
 b=i4MV3B85+83kPM7iUbm29uwkCD+98Sp3coYsfBmh40DoC2X/F3pSAhxmnhcNFxgRa7q4li
 QrRAIgTbsJUkAmYrn4GgxWjWjAbj6usmVDobGr95Q/tOWeF6zo3X9J8nrYAzFJsEcj/+h/
 VVrN1JQ03oSBeeeLy1rUcX2LR/wkqaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-NnR4RthQOdeLhc9y1T6KWA-1; Wed, 08 Jul 2020 00:17:05 -0400
X-MC-Unique: NnR4RthQOdeLhc9y1T6KWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9344D800688;
 Wed,  8 Jul 2020 04:17:04 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F4E5D9C9;
 Wed,  8 Jul 2020 04:17:03 +0000 (UTC)
Date: Tue, 7 Jul 2020 22:17:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200707221703.421499a3@x1.home>
In-Reply-To: <20200708034055.GC20022@joy-OptiPlex-7040>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <20200708015419.GM27035@zhen-hp.sh.intel.com>
 <20200708033845.GB20022@joy-OptiPlex-7040>
 <20200708034055.GC20022@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, 8 Jul 2020 11:40:55 +0800
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Wed, Jul 08, 2020 at 11:38:46AM +0800, Yan Zhao wrote:
> > On Wed, Jul 08, 2020 at 09:54:19AM +0800, Zhenyu Wang wrote:  
> > > On 2020.07.07 19:06:34 -0600, Alex Williamson wrote:  
> > > > On Tue, 7 Jul 2020 23:28:39 +0000
> > > > "Tian, Kevin" <kevin.tian@intel.com> wrote:
> > > >   
> > > > > Hi, Alex, 
> > > > > 
> > > > > Gentle ping... Please let us know whether this version looks good.  
> > > > 
> > > > I figured this is entangled with the versioning scheme.  There are
> > > > unanswered questions about how something that assumes a device of a
> > > > given type is software compatible to another device of the same type
> > > > handles aggregation and how the type class would indicate compatibility
> > > > with an aggregated instance.  Thanks,
> > > >   
> > > 
> > > +Yan
> > > 
> > > Alex, If no concern on aggregated resources info for instance that would
> > > be vendor's behavior to determine what type of resources would be aggregated,
> > > then I'll check with Yan to see how to fulfill this during migration.
> > > 
> > > Thanks
> > >  
> > 
> > hi zhenyu and Alex
> > currently in this series, it looks that aggregated instances are created
> > in this way:
> >     echo "<uuid>,aggregate=10" > create
> > 
> > Is that possible that we change it like that:
> > 1. provide a separate attribute named "aggregator" under mdev type.
> >   |- [parent physical device]
> >   |--- Vendor-specific-attributes [optional]
> >   |--- [mdev_supported_types]
> >   |     |--- [<type-id>]
> >   |     |   |--- create
> > + |     |   |--- aggregator
> >   |     |   |--- name
> >   |     |   |--- available_instances
> >   |     |   |--- device_api
> >   |     |   |--- description
> >   |     |   |--- [devices]
> > 
> > normally, the aggregator is read as 0.
> >  
> correction: normally, the aggregator is read as "1"
> 
> > 2. when we want to create an aggregated instance, we first echo the count
> > into the aggregator attribute. e.g.
> >    echo 10 > aggregator
> > It will switch the mdev type to 10 x original_type. And then,
> > available_instances and description would be updated accordingly.
> > 
> > 3. do the real mdev creation.
> >    echo <uuid> > create

Nak, this is inherently racy.  Just imagine two processes trying to
simultaneously create devices.

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
