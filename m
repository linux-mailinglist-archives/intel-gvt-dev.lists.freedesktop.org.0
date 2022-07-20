Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF657B031
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Jul 2022 07:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A2010E4E7;
	Wed, 20 Jul 2022 05:06:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73F910E755
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Jul 2022 05:06:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4294868BEB; Wed, 20 Jul 2022 07:06:30 +0200 (CEST)
Date: Wed, 20 Jul 2022 07:06:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: simplify the mdev interface v6
Message-ID: <20220720050629.GA6076@lst.de>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
 <20220718153331.18a52e31.alex.williamson@redhat.com>
 <1f945ef0eb6c02079700a6785ca3dd9864096b82.camel@linux.ibm.com>
 <20220719144928.GB21431@lst.de>
 <20220719092644.3db1ceee.alex.williamson@redhat.com>
 <20cba66846a011e2fe8885f15def6ec837d12d0b.camel@linux.ibm.com>
 <29248eb6e20ef5990d3189ba5468fe4d8bada61a.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29248eb6e20ef5990d3189ba5468fe4d8bada61a.camel@linux.ibm.com>
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
 kvm@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-s390@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 10:41:49PM -0400, Eric Farman wrote:
> I suspect the second item (or something similar) is needed anyway,
> because Alex' tree + this series crashes frequently in (usually)
> mdev_remove. I haven't found an explanation for how we get in this
> state, but admittedly didn't spent a lot of time on them since the
> proposed changes to struct subchannel are a non-starter. The other
> crashes were always in something that's almost certainly a victim of
> something else, like kmalloc-related stuff in net/skbuff.
> 
> With the above, the crashes out of the vfio-ccw stack disappear, and
> things work a bit better. But those random kmalloc-related crashes
> persist. I guess I'll pick those up tomorrow.

Ok, I think I'll just wait for this to fan out, no need to rush in
known broken code.
