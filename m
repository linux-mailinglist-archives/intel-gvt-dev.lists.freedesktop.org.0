Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D496D12C7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 Mar 2023 01:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6A610F092;
	Thu, 30 Mar 2023 23:05:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E911E10F084
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680217536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMatgO6BH6GC06VsPyDFmO7jcdjVEhbN0H0T7ElgUC8=;
 b=Cs9Nu+Eck1dwFkDhfVobMVTZF/iWlYBYRqFyrGFEBKbR/15bd5r/vehBPEezUmjUQuX4ZH
 BbayGDMDlE1jzeuHJp6WvNFktL7DGvNs6Fwqwk8H42NdUKbvx9zGlrPqc966l4J8GhbGvX
 V5Bmw1eK9YDWkf3P+9E9FHf+ojKDrsE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-F27zJZ4RPdma9qcsboJMug-1; Thu, 30 Mar 2023 19:05:34 -0400
X-MC-Unique: F27zJZ4RPdma9qcsboJMug-1
Received: by mail-io1-f69.google.com with SMTP id
 b26-20020a5d805a000000b0074cfe3a44aeso12451500ior.10
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Mar 2023 16:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680217534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMatgO6BH6GC06VsPyDFmO7jcdjVEhbN0H0T7ElgUC8=;
 b=7pkJ3gw1lr5GJOQDpHH57Nw+8TGtFzP/rGgiX18iSegHHzdkk0Qiq0C0shjo74CcRq
 q0Fu+EXsSZEFsONCXYPm82xlNy735BCm30if57X/cLMP+35ESkyTlpk9/roW+xRMR/Nc
 sgzrJzRvkBwoHrGZrOrnGAg8dI0jCWw6i3YFgFYsrNwFmJGvRNzWNpB8rObWXtf/tgMb
 yZrGOM2cREVYg7cxPmyU0wt66Ms9sFxf90lhb8p3gGo044F7xQuzPQUSKjxn+B4sGwM7
 cWhH1f6iFsh8h/46hnf/H2JxP4FHy4BrlmhWCXcRgw3vz0Q01Z2J7Zed4/2uclkToJny
 fjWg==
X-Gm-Message-State: AO0yUKUVqbGXt00U/6lwQsLRTFtUGWG87FyKJ+2uFwHh6lhqrzM7bxae
 pgB8o069TVYc7msLj2sCrGzAgNlMouy8rh6vGNLgJR8gnsjWreTm9a+/HunVwPXOiL5eROyLmbB
 n/s8oeOXt2ukJPi3wnDu3fHNV8LwL+g43Wg==
X-Received: by 2002:a5e:d606:0:b0:750:6c44:3454 with SMTP id
 w6-20020a5ed606000000b007506c443454mr18191695iom.12.1680217533762; 
 Thu, 30 Mar 2023 16:05:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8/aJ7IpuNBdq7qV6Sm6acZzS/OWNOFTVCSNmhDCnhCPHu0seHdmhZKi6cwPTOuCTVmWl7Umw==
X-Received: by 2002:a5e:d606:0:b0:750:6c44:3454 with SMTP id
 w6-20020a5ed606000000b007506c443454mr18191668iom.12.1680217533461; 
 Thu, 30 Mar 2023 16:05:33 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n2-20020a02a182000000b003b778515852sm213023jah.168.2023.03.30.16.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:05:32 -0700 (PDT)
Date: Thu, 30 Mar 2023 17:05:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 10/10] vfio/pci: Add
 VFIO_DEVICE_GET_PCI_HOT_RESET_GROUP_INFO
Message-ID: <20230330170531.3b66c05a.alex.williamson@redhat.com>
In-Reply-To: <ZCYQ5zhmjg/xQmTZ@nvidia.com>
References: <DS0PR11MB7529B6782565BE8489D922F9C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230328084616.3361a293.alex.williamson@redhat.com>
 <DS0PR11MB75290B84D334FC726A8BBA95C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230328091801.13de042a.alex.williamson@redhat.com>
 <DS0PR11MB752903CE3D5906FE21146364C3889@DS0PR11MB7529.namprd11.prod.outlook.com>
 <20230328100027.3b843b91.alex.williamson@redhat.com>
 <DS0PR11MB7529C12E086DAB619FF9AFF0C3899@DS0PR11MB7529.namprd11.prod.outlook.com>
 <BN9PR11MB52762E789B9C1D8021F54ECC8C899@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230329094944.50abde4e.alex.williamson@redhat.com>
 <DS0PR11MB75298AF9A9ACAEBDD5D445ECC38E9@DS0PR11MB7529.namprd11.prod.outlook.com>
 <ZCYQ5zhmjg/xQmTZ@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "Jiang,
 Yanting" <yanting.jiang@intel.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 19:44:55 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Mar 30, 2023 at 12:48:03PM +0000, Liu, Yi L wrote:
> > +	/*
> > +	 * If dev_id is needed, fill in the dev_id field, otherwise
> > +	 * fill in group_id.
> > +	 */
> > +	if (fill->require_devid) {
> > +		/*
> > +		 * Report the devices that are opened as cdev and have
> > +		 * the same iommufd with the fill->iommufd.  Otherwise,
> > +		 * just fill in an IOMMUFD_INVALID_ID.
> > +		 */
> > +		vdev = vfio_pci_find_device_in_devset(dev_set, pdev);
> > +		if (vdev && !vfio_device_cdev_opened(vdev) &&
> > +		    fill->iommufd == vfio_iommufd_physical_ictx(vdev))
> > +			vfio_iommufd_physical_devid(vdev, &fill->devices[fill->cur].dev_id);
> > +		fill->devices[fill->cur].dev_id = IOMMUFD_INVALID_ID;  
> 
> This needs an else?
> 
> I suggest to check for VFIO_PCI_HOT_RESET_FLAG_IOMMUFD_DEV_ID on input
> as well. I know the old kernels don't enforce this but at least we
> could start enforcing it going forward so that the group path would
> reject it to catch userspace bugs.
> 
> May as well fix it up to fully validate the flags

Is this under the guise of "if nobody complains it's ok, otherwise
revert" plan?  We report dev-id based on the nature of the device, not
the provided flags, so I'm not sure I follow how this protects the group
path, unless we've failed to clear the output flags on that path with
this change.  Thanks,

Alex


