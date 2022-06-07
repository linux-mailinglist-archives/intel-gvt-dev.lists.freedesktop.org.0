Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88C53F5A5
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 07:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DCB1123A8;
	Tue,  7 Jun 2022 05:50:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D61D1123A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 Jun 2022 05:50:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B4A7F68AFE; Tue,  7 Jun 2022 07:50:50 +0200 (CEST)
Date: Tue, 7 Jun 2022 07:50:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 3/8] vfio/mdev: simplify mdev_type handling
Message-ID: <20220607055050.GB8680@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-4-hch@lst.de>
 <86df429e-9f01-7a91-c420-bb1130b4d343@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86df429e-9f01-7a91-c420-bb1130b4d343@nvidia.com>
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

On Tue, Jun 07, 2022 at 12:52:49AM +0530, Kirti Wankhede wrote:
>>   	void (*remove)(struct mdev_device *dev);
>> -	struct attribute_group **supported_type_groups;
>>   	struct device_driver driver;
>>   };
>
> mdev_type should be part of mdev_parent, separating it from mdev_parent 
> could result in more errors while using mdev framework.

Why?

> Similarly it should 
> be added as part of mdev_register_device. Below adding types is separated 
> from mdev_register_device which is more error prone.

How so?

> What if driver 
> registering to mdev doesn't add mdev_types? - mdev framework is un-usable 
> in that case.

Yes, so it is if you don't add it to the supported_type_groups field
in the current kernel.  Basic programmer error, and trivially caught.

> We had kept it together with mdev registration so that 
> mdev_types should be mandatory to be defined by driver during registration. 
> How would you mandate mdev_type by such separation?

I would not.  Registering a parent without types is perfectly valid from
the code correctness perspective.  It just isn't very useful.  Just
like say creating a kobject without attributes in the device model.
