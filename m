Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63657A225
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 16:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F588AD1B;
	Tue, 19 Jul 2022 14:48:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3188AD0D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 14:48:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7060668AFE; Tue, 19 Jul 2022 16:48:08 +0200 (CEST)
Date: Tue, 19 Jul 2022 16:48:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH 14/14] vfio/mdev: add mdev available instance checking
 to the core
Message-ID: <20220719144808.GA21431@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
 <20220709045450.609884-15-hch@lst.de>
 <c4c14deebf82cd2497fd9ebd0c3f321e9089b7ce.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c14deebf82cd2497fd9ebd0c3f321e9089b7ce.camel@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 10:00:26PM -0400, Eric Farman wrote:
> > +	if (!drv->get_available) {
> > +		if (atomic_dec_and_test(&parent->available_instances))
> > {
> 
> Ah, subtle change between v5 and v6 to use atomics. As vfio-ccw only
> has 1 available instance per mdev, this breaks us. Did you mean
> atomic_dec_if_positive() ?

Yes, this should have been atomic_dec_if_positive.  Or just an open
coded atomic_dec + atomic_read a the only reason to use an atomic is
for the sysfs file that reads it outside the lock.
