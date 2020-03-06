Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5917C2E8
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 17:28:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA2C6E49B;
	Fri,  6 Mar 2020 16:27:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E8F6E49B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583512077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kqh0g+8DkB9jTIgFcJTQym/+RkRpyGwJz3Ff5AmMcU=;
 b=DX3Jf0w/gCzjqu0dfK7x8orrtKc/71HlcJ6sInrHffIVKHk9KADWwE8p0TctAqhLfPNV7K
 TRaW9MD57SG98O5vZjRAtmUbr9XTst7iDbtBCul3A67TGLQNsHaANDxet/uoJDZ80B6A/C
 5OuRAmJrJQdpBEYYs8/d6VQkKLDWGc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-re09S1kfOLaP6IBVkerikQ-1; Fri, 06 Mar 2020 11:27:54 -0500
X-MC-Unique: re09S1kfOLaP6IBVkerikQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9CB6800D6C;
 Fri,  6 Mar 2020 16:27:52 +0000 (UTC)
Received: from x1.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DBB519C69;
 Fri,  6 Mar 2020 16:27:47 +0000 (UTC)
Date: Fri, 6 Mar 2020 09:27:46 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 2/7] vfio: introduce vfio_dma_rw to read/write a
 range of IOVAs
Message-ID: <20200306092746.088a01a3@x1.home>
In-Reply-To: <20200306012148.GB1530@joy-OptiPlex-7040>
References: <20200224084350.31574-1-yan.y.zhao@intel.com>
 <20200224084715.31753-1-yan.y.zhao@intel.com>
 <20200306012148.GB1530@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 5 Mar 2020 20:21:48 -0500
Yan Zhao <yan.y.zhao@intel.com> wrote:

> On Mon, Feb 24, 2020 at 04:47:15PM +0800, Zhao, Yan Y wrote:
> > vfio_dma_rw will read/write a range of user space memory pointed to by
> > IOVA into/from a kernel buffer without enforcing pinning the user space
> > memory.
> > 
> > TODO: mark the IOVAs to user space memory dirty if they are written in
> > vfio_dma_rw().
> > 
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/vfio/vfio.c             | 49 +++++++++++++++++++++
> >  drivers/vfio/vfio_iommu_type1.c | 77 +++++++++++++++++++++++++++++++++
> >  include/linux/vfio.h            |  5 +++
> >  3 files changed, 131 insertions(+)
> > 
> > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > index 914bdf4b9d73..902867627cbf 100644
> > --- a/drivers/vfio/vfio.c
> > +++ b/drivers/vfio/vfio.c
> > @@ -1998,6 +1998,55 @@ int vfio_unpin_pages(struct device *dev, unsigned long *user_pfn, int npage)
> >  }
> >  EXPORT_SYMBOL(vfio_unpin_pages);
> >  
> > +
> > +/*
> > + * This interface allows the CPUs to perform some sort of virtual DMA on
> > + * behalf of the device.
> > + *
> > + * CPUs read/write a range of IOVAs pointing to user space memory into/from
> > + * a kernel buffer.
> > + *
> > + * As the read/write of user space memory is conducted via the CPUs and is
> > + * not a real device DMA, it is not necessary to pin the user space memory.
> > + *
> > + * The caller needs to call vfio_group_get_external_user() or
> > + * vfio_group_get_external_user_from_dev() prior to calling this interface,
> > + * so as to prevent the VFIO group from disposal in the middle of the call.
> > + * But it can keep the reference to the VFIO group for several calls into
> > + * this interface.
> > + * After finishing using of the VFIO group, the caller needs to release the
> > + * VFIO group by calling vfio_group_put_external_user().
> > + *
> > + * @group [in]: vfio group of a device
> > + * @iova [in] : base IOVA of a user space buffer
> > + * @data [in] : pointer to kernel buffer
> > + * @len [in]  : kernel buffer length
> > + * @write     : indicate read or write
> > + * Return error code on failure or 0 on success.
> > + */
> > +int vfio_dma_rw(struct vfio_group *group, dma_addr_t iova,
> > +		void *data, size_t len, bool write)  
> hi Alex
> May I rename this interface to vfio_dma_rw_from_group() that takes
> VFIO group as arg and add another interface vfio_dma_rw(struct device *dev...) ?
> That might be easier for a driver to use the second one if it does not care about
> performance much.

Perhaps vfio_group_dma_rw() and vfio_dev_dma_rw()?  I'd be reluctant to
add the latter, if a caller doesn't care about performance then they
won't mind making a couple calls to get and release the group reference.
Thanks,

Alex

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
