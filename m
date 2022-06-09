Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D882154448F
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jun 2022 09:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879E7113F5C;
	Thu,  9 Jun 2022 07:16:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694AA113F5C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jun 2022 07:16:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B883C6732D; Thu,  9 Jun 2022 09:16:00 +0200 (CEST)
Date: Thu, 9 Jun 2022 09:16:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 3/8] vfio/mdev: simplify mdev_type handling
Message-ID: <20220609071600.GA4173@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-4-hch@lst.de>
 <86df429e-9f01-7a91-c420-bb1130b4d343@nvidia.com>
 <20220607055050.GB8680@lst.de>
 <a542c244-a793-7889-db9f-610cf525e3b6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a542c244-a793-7889-db9f-610cf525e3b6@nvidia.com>
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
 Eric Farman <farman@linux.ibm.com>, Neo Jia <cjia@nvidia.com>,
 kvm@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-s390@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Dheeraj Nigam <dnigam@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>,
 Tarun Gupta <targupta@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 11:27:02PM +0530, Kirti Wankhede wrote:
>> the code correctness perspective.  It just isn't very useful.  Just
>> like say creating a kobject without attributes in the device model.
>
> Creating kobject without kobj_type is not allowed in the kernel, similarly 
> mdev registration should not be allowed without its type.

But the kobj_type doesn't need to have any attributes.

> Instead of exporting mdev_type_add/mdev_type_remove, these functions might 
> be called internally from registration function.

I very fundamentally disagree.  That is exactly what makes the current
interface so messy and complicated and I want to get rid of that.
