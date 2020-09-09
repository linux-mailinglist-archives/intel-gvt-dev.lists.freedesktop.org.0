Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B28262507
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Sep 2020 04:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C5E6E906;
	Wed,  9 Sep 2020 02:14:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F286E906
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Sep 2020 02:14:15 +0000 (UTC)
IronPort-SDR: AlEvRu6bBU1YVsyU85yGadol2qoeiwLKlGov4ccnd3U8FFo5E/EbQBCi4MdrWEb4Q5HvfEF0SN
 b6BxFmMHangA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="159222402"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="159222402"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:14:15 -0700
IronPort-SDR: oo/ud125TYByVRHHJ5qg2GWa+ZHCBXGAPNIQz7XvqtmJUH6vWTuCkGOrmYvKqirKrVeZj+g829
 JFl8hWPU2hyg==
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; d="scan'208";a="480286722"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:14:09 -0700
Date: Wed, 9 Sep 2020 10:13:09 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200909021308.GA1277@joy-OptiPlex-7040>
References: <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
 <20200819212234.223667b3@x1.home>
 <20200820031621.GA24997@joy-OptiPlex-7040>
 <20200825163925.1c19b0f0.cohuck@redhat.com>
 <20200826064117.GA22243@joy-OptiPlex-7040>
 <20200828154741.30cfc1a3.cohuck@redhat.com>
 <8f5345be73ebf4f8f7f51d6cdc9c2a0d8e0aa45e.camel@redhat.com>
 <20200831044344.GB13784@joy-OptiPlex-7040>
 <20200908164130.2fe0d106.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908164130.2fe0d106.cohuck@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, Sean Mooney <smooney@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 Daniel =?iso-8859-1?Q?P=2EBerrang=E9?= <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> > still, I'd like to put it more explicitly to make ensure it's not missed:
> > the reason we want to specify compatible_type as a trait and check
> > whether target compatible_type is the superset of source
> > compatible_type is for the consideration of backward compatibility.
> > e.g.
> > an old generation device may have a mdev type xxx-v4-yyy, while a newer
> > generation  device may be of mdev type xxx-v5-yyy.
> > with the compatible_type traits, the old generation device is still
> > able to be regarded as compatible to newer generation device even their
> > mdev types are not equal.
> 
> If you want to support migration from v4 to v5, can't the (presumably
> newer) driver that supports v5 simply register the v4 type as well, so
> that the mdev can be created as v4? (Just like QEMU versioned machine
> types work.)
yes, it should work in some conditions.
but it may not be that good in some cases when v5 and v4 in the name string
of mdev type identify hardware generation (e.g. v4 for gen8, and v5 for
gen9)

e.g.
(1). when src mdev type is v4 and target mdev type is v5 as
software does not support it initially, and v4 and v5 identify hardware
differences.
then after software upgrade, v5 is now compatible to v4, should the
software now downgrade mdev type from v5 to v4?
not sure if moving hardware generation info into a separate attribute
from mdev type name is better. e.g. remove v4, v5 in mdev type, while use
compatible_pci_ids to identify compatibility.

(2) name string of mdev type is composed by "driver_name + type_name".
in some devices, e.g. qat, different generations of devices are binding to
drivers of different names, e.g. "qat-v4", "qat-v5".
then though type_name is equal, mdev type is not equal. e.g.
"qat-v4-type1", "qat-v5-type1".

Thanks
Yan

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
