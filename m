Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C9711D61
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 26 May 2023 04:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AFD10E1A6;
	Fri, 26 May 2023 02:05:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA7310E10A;
 Fri, 26 May 2023 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685066722; x=1716602722;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3FRtV+V0lyCeW1Ovj8JS9xrSCJC7ltM313nVTl9jV+0=;
 b=T6vWzkRxIa/rxvESacLO5UTf5JFPMxGuzMsW1uqkDTfpyuJ/Zb8rH+xz
 vWv3v1aIwBHa4hZ4S/UV/3PHunfpd1/+79N2ZgCer3zr0epzWOePOTXsn
 3Ylg40/9E9aJxMGu69KZ2hUACCixK2SZF2Xf6XcWiln2h8ym+Sv8ucb4F
 3M8KFBXMZmbAafwlFxvV5BlOWebtSbYfja9graUP2aEIWndgTup3ZlH6j
 /9Cnyg8OtZ7N5nXb8IOQbaP+K4/uDWO/Ecnzf0AftivoOCcB1ujKLZax2
 ZluKoDcv+MO6RCaUwsTe8qKlQqWRqno/l5OrvUMA3O5LO/QhxbKpz9LGM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440442238"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="440442238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 19:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="735804563"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="735804563"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127])
 ([10.239.159.127])
 by orsmga008.jf.intel.com with ESMTP; 25 May 2023 19:05:14 -0700
Message-ID: <355a9f1e-64e6-d785-5a22-027b708b4935@linux.intel.com>
Date: Fri, 26 May 2023 10:04:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 09/10] vfio/pci: Extend
 VFIO_DEVICE_GET_PCI_HOT_RESET_INFO for vfio device cdev
Content-Language: en-US
To: "Liu, Yi L" <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20230522115751.326947-1-yi.l.liu@intel.com>
 <20230522115751.326947-10-yi.l.liu@intel.com>
 <20230524135603.33ee3d91.alex.williamson@redhat.com>
 <DS0PR11MB752935203F87D69D4468B890C3469@DS0PR11MB7529.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <DS0PR11MB752935203F87D69D4468B890C3469@DS0PR11MB7529.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "clegoate@redhat.com" <clegoate@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, baolu.lu@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 5/25/23 9:02 PM, Liu, Yi L wrote:
>>   It's possible that requirement
>> might be relaxed in the new DMA ownership model, but as it is right
>> now, the code enforces that requirement and any new discussion about
>> what makes hot-reset available should note both the ownership and
>> dev_set requirement.  Thanks,
> I think your point is that if an iommufd_ctx has acquired DMA ownerhisp
> of an iommu_group, it means the device is owned. And it should not
> matter whether all the devices in the iommu_group is present in the
> dev_set. It is allowed that some devices are bound to pci-stub or
> pcieport driver. Is it?
> 
> Actually I have a doubt on it. IIUC, the above requirement on dev_set
> is to ensure the reset to the devices are protected by the dev_set->lock.
> So that either the reset issued by driver itself or a hot reset request
> from user, there is no race. But if a device is not in the dev_set, then
> hot reset request from user might race with the bound driver. DMA ownership
> only guarantees the drivers won't handle DMA via DMA API which would have
> conflict with DMA mappings from user. I'm not sure if it is able to
> guarantee reset is exclusive as well. I see pci-stub and pcieport driver
> are the only two drivers that set the driver_managed_dma flag besides the
> vfio drivers. pci-stub may be fine. not sure about pcieport driver.

commit c7d469849747 ("PCI: portdrv: Set driver_managed_dma") described
the criteria of adding driver_managed_dma to the pcieport driver.

"
We achieve this by setting ".driver_managed_dma = true" in pci_driver
structure. It is safe because the portdrv driver meets below criteria:

- This driver doesn't use DMA, as you can't find any related calls like
   pci_set_master() or any kernel DMA API (dma_map_*() and etc.).
- It doesn't use MMIO as you can't find ioremap() or similar calls. It's
   tolerant to userspace possibly also touching the same MMIO registers
   via P2P DMA access.
"

pci_rest_device() definitely shouldn't be done by the kernel drivers
that have driver_managed_dma set.

> 
>     #   line  filename / context / line
>     1     39  drivers/pci/pci-stub.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     2    796  drivers/pci/pcie/portdrv.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     3    607  drivers/vfio/fsl-mc/vfio_fsl_mc.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     4   1459  drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     5   1374  drivers/vfio/pci/mlx5/main.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     6    203  drivers/vfio/pci/vfio_pci.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     7    139  drivers/vfio/platform/vfio_amba.c <<GLOBAL>>
>               .driver_managed_dma = true,
>     8    120  drivers/vfio/platform/vfio_platform.c <<GLOBAL>>
>               .driver_managed_dma = true,
> 
> Anyhow, I think this is not a must so far. is it? Even doable, it shall
> be done in the future. 😄

Perhaps we can take it in this way: it's a bug if any driver sets its
driver_managed_dma but still resets the hardware during it's life cycle?

Best regards,
baolu
