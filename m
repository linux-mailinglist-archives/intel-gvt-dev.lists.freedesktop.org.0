Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8654C1DA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jun 2022 08:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A1A10F2B9;
	Wed, 15 Jun 2022 06:29:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D560510F2B9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jun 2022 06:29:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F0D3D67373; Wed, 15 Jun 2022 08:29:52 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:29:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 13/13] vfio/mdev: add mdev available instance checking
 to the core
Message-ID: <20220615062952.GC22728@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-14-hch@lst.de>
 <BN9PR11MB5276BB7AA39243BA5A21CFEC8CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BB7AA39243BA5A21CFEC8CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
 Eric Farman <farman@linux.ibm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 10:32:11AM +0000, Tian, Kevin wrote:
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > [count instances per-parent instead of per-type]
> 
> per-parent counting works only if the parent doesn't have overlapping
> instances between types. This is probably worth a clarification in doc.

Yes.  Two cases right now just have a single type, and the third wants
this per-parent counting.  The original patch from Jason actually got
this wrong.
