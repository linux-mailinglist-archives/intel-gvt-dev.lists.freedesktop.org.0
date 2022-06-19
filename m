Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A142550931
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 19 Jun 2022 09:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0791410E71D;
	Sun, 19 Jun 2022 07:43:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86C10E71D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 19 Jun 2022 07:43:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C513967373; Sun, 19 Jun 2022 09:42:57 +0200 (CEST)
Date: Sun, 19 Jun 2022 09:42:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 03/13] vfio/mdev: simplify mdev_type handling
Message-ID: <20220619074257.GA27867@lst.de>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-4-hch@lst.de>
 <6900fbd9-5f12-e53d-1a57-d9671491372b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6900fbd9-5f12-e53d-1a57-d9671491372b@nvidia.com>
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
 Tarun Gupta <targupta@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>,
 Dheeraj Nigam <dnigam@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 01:25:25AM +0530, Kirti Wankhede wrote:
>> +	parent->mdev_types_kset = kset_create_and_add("mdev_supported_types",
>> +					       NULL, &parent->dev->kobj);
>> +	if (!parent->mdev_types_kset)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < nr_types; i++) {
>> +		ret = mdev_type_add(parent, types[i]);
>> +		if (ret)
>> +			break;
>> +	}
>
> Above code should be in parent_create_sysfs_files(), all sysfs related 
> stuff should be placed in mdev_sysfs.c

Yes, it could. But why?  This is core logic of the interface and has
nothing to do with sysfs.
