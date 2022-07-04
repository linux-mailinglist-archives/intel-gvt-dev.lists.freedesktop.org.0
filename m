Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15AD565B62
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  4 Jul 2022 18:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52210ED99;
	Mon,  4 Jul 2022 16:15:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEB710E00A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Jul 2022 06:18:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A857C68AA6; Mon,  4 Jul 2022 08:18:43 +0200 (CEST)
Date: Mon, 4 Jul 2022 08:18:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 04/13] vfio/mdev: simplify mdev_type handling
Message-ID: <20220704061843.GA29047@lst.de>
References: <20220628051435.695540-1-hch@lst.de>
 <20220628051435.695540-5-hch@lst.de>
 <20220628155915.060ba2d9.alex.williamson@redhat.com>
 <20220629121709.GI693670@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629121709.GI693670@nvidia.com>
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
 Kirti Wankhede <kwankhede@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 09:17:09AM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 28, 2022 at 03:59:15PM -0600, Alex Williamson wrote:
> > > +	strcpy(matrix_dev->mdev_type.sysfs_name, VFIO_AP_MDEV_TYPE_HWVIRT);
> > 
> > And then this might as well be an snprintf() as well too.
> 
> Kees has setup FORTIFY so the above will actually throw a compile
> warning in build bots if the array size is too small. Changing it to
> snprintf would loose this and cause undetected string truncation.

I think I have an idea how to do away with these arrays entirely,
and just use pointers to sting literals.
