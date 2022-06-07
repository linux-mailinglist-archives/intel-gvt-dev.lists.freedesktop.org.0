Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFF53F5A2
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 Jun 2022 07:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7EA1123A8;
	Tue,  7 Jun 2022 05:48:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA941123A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  7 Jun 2022 05:48:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 197A068BFE; Tue,  7 Jun 2022 07:48:53 +0200 (CEST)
Date: Tue, 7 Jun 2022 07:48:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 2/8] vfio/mdev: embedd struct mdev_parent in the parent
 data structure
Message-ID: <20220607054852.GA8680@lst.de>
References: <20220603063328.3715-1-hch@lst.de>
 <20220603063328.3715-3-hch@lst.de>
 <71e7d9a8-1005-0458-b8cd-147ccc6430d7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71e7d9a8-1005-0458-b8cd-147ccc6430d7@nvidia.com>
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

On Tue, Jun 07, 2022 at 12:52:30AM +0530, Kirti Wankhede wrote:
> By removing this list, there is no way to know if parent device is 
> registered repeatedly? What will happen if same parent device is registered 
> twice? will it fail somewhere else?

The driver core will warn if you double register a device.

>>   probe'd to then it should call::
>>   -	extern int  mdev_register_device(struct device *dev,
>> -	                                 struct mdev_driver *mdev_driver);
>> +	int mdev_register_parent(struct mdev_parent *parent, struct device *dev,
>> +			struct mdev_driver *mdev_driver);
>>
>
> No need to change API name as it still registers 'struct device *dev', it 
> could be 'mdev_register_device' but with new argument list.

I think the name name is a lot more clear, as device is really overused.
Especially as this is not a mdev_device, which are registered
elsewhere..

>>   -	mdev_unregister_device(i915->drm.dev);
>> +	mdev_unregister_parent(&i915->vgpu.parent);
>
> Ideally, parent should be member of gvt. There could be multiple vgpus 
> created on one physical device. Intel folks would be better reviewer 
> though.

i915->vgpu is not for a single VGPU, but all VGPU related core
support.

>> -	struct mdev_parent *parent;
>>   	char *env_string = "MDEV_STATE=registered";
>>   	char *envp[] = { env_string, NULL };
>> +	int ret;
>>     	/* check for mandatory ops */
>>   	if (!mdev_driver->supported_type_groups)
>>   		return -EINVAL;
>>   -	dev = get_device(dev);
>> -	if (!dev)
>> -		return -EINVAL;
>> -
>
> Why not held device here? What if some driver miss behave where it 
> registers device to mdev, but unloads without unregistering from mdev?

Then that driver is buggy.  We don't add extra reference to slightly
paper over buggy code elsewhere in the kernel either.
