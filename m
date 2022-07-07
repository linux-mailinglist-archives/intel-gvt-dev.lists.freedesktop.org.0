Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A079156A3DF
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 Jul 2022 15:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7A10F63F;
	Thu,  7 Jul 2022 13:40:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CF411200F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Jul 2022 13:40:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2855068AA6; Thu,  7 Jul 2022 15:40:18 +0200 (CEST)
Date: Thu, 7 Jul 2022 15:40:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vineeth Vijayan <vneethv@linux.ibm.com>
Subject: Re: [PATCH 04/15] vfio/mdev: embedd struct mdev_parent in the
 parent data structure
Message-ID: <20220707134017.GB19060@lst.de>
References: <20220706074219.3614-1-hch@lst.de>
 <20220706074219.3614-5-hch@lst.de>
 <27e9ef873a00dde07373155e76615437136106c4.camel@linux.ibm.com>
 <YsaJrX4kpCCz5AZI@tuxmaker.boeblingen.de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsaJrX4kpCCz5AZI@tuxmaker.boeblingen.de.ibm.com>
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
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jul 07, 2022 at 09:22:21AM +0200, Vineeth Vijayan wrote:
> Thank you Eric for pointing it out. You are right. I think the struct
> subchannel is obviously the wrong place. 
> Also, in this case, the mdev_parent should be in one of the vfio-ccw
> io-subchannel structure, which as you mentioned should be in vfio-ccw*.

It is where the parent dev is embedded into, so it sticks to the
spirit of the old code.  I'm totally fine with you guys moving it
to another structure of your choice, but for making progress on this
series it should be good enough.

