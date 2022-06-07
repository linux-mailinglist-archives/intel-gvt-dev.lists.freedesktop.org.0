Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8353F5C0
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 07:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDA912A9C5;
	Tue,  7 Jun 2022 05:56:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E512A9C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 Jun 2022 05:56:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5C86E68AFE; Tue,  7 Jun 2022 07:56:53 +0200 (CEST)
Date: Tue, 7 Jun 2022 07:56:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/8] vfio/mdev: simplify mdev_type handling
Message-ID: <20220607055653.GA8848@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-4-hch@lst.de> <20220606233808.GD3932382@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606233808.GD3932382@ziepe.ca>
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 08:38:08PM -0300, Jason Gunthorpe wrote:
> Maybe we need a 'finish register' call to trigger the uevent? Or
> perhaps trigger the uevent when each add_type is done?

The finish version would keep the existing behavior as-is, so that
might be a good idea, I'll look into that.
