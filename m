Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4C245C98
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 17 Aug 2020 08:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5F89CB3;
	Mon, 17 Aug 2020 06:38:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7168F89CB3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 Aug 2020 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597646333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p27bQOF4p6q5oYpRrHd1HKqo5O+sKCNmptEH4q2zCDY=;
 b=gwb7hxo2gOAhyucqqXlDMRFQA+EeP7iECTPU7T0XW+/fKoULiVN7m6yqb7iUBIO0YSTwBB
 tmdtBfRNAJMwBv0zberDD/mKh35+DXzMkVQtj/FO4AWwPW2heT1hFqE2WLAsWsRm26werN
 S3lvG7VcXwJEYpuNrPIBT+jEGOoZTmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-LJkz_mXvMI2EhpfIOLxf7g-1; Mon, 17 Aug 2020 02:38:48 -0400
X-MC-Unique: LJkz_mXvMI2EhpfIOLxf7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E053D801AAC;
 Mon, 17 Aug 2020 06:38:45 +0000 (UTC)
Received: from gondolin (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 896B65C1DC;
 Mon, 17 Aug 2020 06:38:30 +0000 (UTC)
Date: Mon, 17 Aug 2020 08:38:28 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200817083828.187315ef.cohuck@redhat.com>
In-Reply-To: <315669b0-5c75-d359-a912-62ebab496abf@linux.ibm.com>
References: <20200727072440.GA28676@joy-OptiPlex-7040>
 <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <4cf2824c803c96496e846c5b06767db305e9fb5a.camel@redhat.com>
 <20200807135942.5d56a202.cohuck@redhat.com>
 <20200813173347.239801fa.cohuck@redhat.com>
 <315669b0-5c75-d359-a912-62ebab496abf@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Jiri Pirko <jiri@mellanox.com>,
 Sean Mooney <smooney@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, eskultet@redhat.com,
 Alex Williamson <alex.williamson@redhat.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 13 Aug 2020 15:02:53 -0400
Eric Farman <farman@linux.ibm.com> wrote:

> On 8/13/20 11:33 AM, Cornelia Huck wrote:
> > On Fri, 7 Aug 2020 13:59:42 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> >> On Wed, 05 Aug 2020 12:35:01 +0100
> >> Sean Mooney <smooney@redhat.com> wrote:
> >>  
> >>> On Wed, 2020-08-05 at 12:53 +0200, Jiri Pirko wrote:    
> >>>> Wed, Aug 05, 2020 at 11:33:38AM CEST, yan.y.zhao@intel.com wrote:      
> >>
> >> (...)
> >>  
> >>>>>    software_version: device driver's version.
> >>>>>               in <major>.<minor>[.bugfix] scheme, where there is no
> >>>>> 	       compatibility across major versions, minor versions have
> >>>>> 	       forward compatibility (ex. 1-> 2 is ok, 2 -> 1 is not) and
> >>>>> 	       bugfix version number indicates some degree of internal
> >>>>> 	       improvement that is not visible to the user in terms of
> >>>>> 	       features or compatibility,
> >>>>>
> >>>>> vendor specific attributes: each vendor may define different attributes
> >>>>>   device id : device id of a physical devices or mdev's parent pci device.
> >>>>>               it could be equal to pci id for pci devices
> >>>>>   aggregator: used together with mdev_type. e.g. aggregator=2 together
> >>>>>               with i915-GVTg_V5_4 means 2*1/4=1/2 of a gen9 Intel
> >>>>> 	       graphics device.
> >>>>>   remote_url: for a local NVMe VF, it may be configured with a remote
> >>>>>               url of a remote storage and all data is stored in the
> >>>>> 	       remote side specified by the remote url.
> >>>>>   ...      
> >>> just a minor not that i find ^ much more simmple to understand then
> >>> the current proposal with self and compatiable.
> >>> if i have well defiend attibute that i can parse and understand that allow
> >>> me to calulate the what is and is not compatible that is likely going to
> >>> more useful as you wont have to keep maintianing a list of other compatible
> >>> devices every time a new sku is released.
> >>>
> >>> in anycase thank for actully shareing ^ as it make it simpler to reson about what
> >>> you have previously proposed.    
> >>
> >> So, what would be the most helpful format? A 'software_version' field
> >> that follows the conventions outlined above, and other (possibly
> >> optional) fields that have to match?  
> > 
> > Just to get a different perspective, I've been trying to come up with
> > what would be useful for a very different kind of device, namely
> > vfio-ccw. (Adding Eric to cc: for that.)
> > 
> > software_version makes sense for everybody, so it should be a standard
> > attribute.
> > 
> > For the vfio-ccw type, we have only one vendor driver (vfio-ccw_IO).
> > 
> > Given a subchannel A, we want to make sure that subchannel B has a
> > reasonable chance of being compatible. I guess that means:
> > 
> > - same subchannel type (I/O)
> > - same chpid type (e.g. all FICON; I assume there are no 'mixed' setups
> >   -- Eric?)  
> 
> Correct.
> 
> > - same number of chpids? Maybe we can live without that and just inject
> >   some machine checks, I don't know. Same chpid numbers is something we
> >   cannot guarantee, especially if we want to migrate cross-CEC (to
> >   another machine.)  
> 
> I think we'd live without it, because I wouldn't expect it to be
> consistent between systems.

Yes, and the guest needs to be able to deal with changing path
configurations anyway.

> 
> > 
> > Other possibly interesting information is not available at the
> > subchannel level (vfio-ccw is a subchannel driver.)  
> 
> I presume you're alluding to the DASD uid (dasdinfo -x) here?

Yes, or the even more basic Sense ID information.

> 
> > 
> > So, looking at a concrete subchannel on one of my machines, it would
> > look something like the following:
> > 
> > <common>
> > software_version=1.0.0
> > type=vfio-ccw          <-- would be vfio-pci on the example above
> > <vfio-ccw specific>
> > subchannel_type=0
> > <vfio-ccw_IO specific>
> > chpid_type=0x1a
> > chpid_mask=0xf0        <-- not sure if needed/wanted

Let's just drop the chpid_mask here.

> > 
> > Does that make sense?

Would be interesting if someone could come up with some possible
information for a third type of device.

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
