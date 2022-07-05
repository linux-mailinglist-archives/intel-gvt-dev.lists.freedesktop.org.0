Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381E56696C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jul 2022 13:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF4510E6B6;
	Tue,  5 Jul 2022 11:30:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7131D10E021
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Jul 2022 08:26:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0C80768AA6; Tue,  5 Jul 2022 10:26:00 +0200 (CEST)
Date: Tue, 5 Jul 2022 10:25:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 02/14] drm/i915/gvt: simplify vgpu configuration management
Message-ID: <20220705082559.GA18584@lst.de>
References: <20220704125144.157288-1-hch@lst.de>
 <20220704125144.157288-3-hch@lst.de>
 <20220705075938.GW1089@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705075938.GW1089@zhen-hp.sh.intel.com>
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
 Halil Pasic <pasic@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 03:59:38PM +0800, Zhenyu Wang wrote:
> On 2022.07.04 14:51:32 +0200, Christoph Hellwig wrote:
> > Instead of copying the information from the vgpu_types arrays into each
> > intel_vgpu_type structure, just reference this constant information
> > with a pointer to the already existing data structure, and pass it into
> > the low-level VGPU creation helpers intead of copying the data into yet
> > anothe params data structure.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> Looks fine to me. We still carry some legacy codes like vgpu create param
> originally used for other hypervisor. Thanks for cleaning this up!

Note that even there I think this structure makes more sense:

The generic config structure that has not vfio-related bits as the
lowest layer.  vfio/kvm specific structures then carry a pointer to
it can can pass it to lower layers.
