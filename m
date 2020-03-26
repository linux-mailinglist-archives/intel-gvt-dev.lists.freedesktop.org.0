Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C71193AAB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Mar 2020 09:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EEE6E2E6;
	Thu, 26 Mar 2020 08:17:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036AE6E2C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Mar 2020 08:17:23 +0000 (UTC)
IronPort-SDR: 6HV0dOQomK/lUrpgJHcO5/LKTXzfRaNwumeVFB3ki8X86iVowxh8WwXIU/lDlHtCd7Fc+HgYEk
 6AvWbV8NNSlw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 01:17:23 -0700
IronPort-SDR: LQ8gzi9lRpRZbSyEF+YxqZz3XfqhVzfPUEVcbmUnNbWj8QSvQ4RbAl7sEFmPV6r0Pu4gfKwGqN
 cZXhCBb0hgZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; d="scan'208";a="271088529"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 26 Mar 2020 01:17:23 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 01:17:23 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 01:17:22 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 16:17:20 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v2 1/2]
 Documentation/driver-api/vfio-mediated-device.rst: update for aggregation
 support
Thread-Topic: [PATCH v2 1/2]
 Documentation/driver-api/vfio-mediated-device.rst: update for aggregation
 support
Thread-Index: AQHWAzE7mTmt3EWoYkGUa0oLcK4XDahahH9g
Date: Thu, 26 Mar 2020 08:17:20 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EAB69@SHSMSX104.ccr.corp.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200326054136.2543-2-zhenyuw@linux.intel.com>
In-Reply-To: <20200326054136.2543-2-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "Jiang, Dave" <dave.jiang@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

> From: Zhenyu Wang <zhenyuw@linux.intel.com>
> Sent: Thursday, March 26, 2020 1:42 PM
> 
> Update doc for mdev aggregation support. Describe mdev generic
> parameter directory under mdev device directory.
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: "Jiang, Dave" <dave.jiang@intel.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  .../driver-api/vfio-mediated-device.rst       | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst
> b/Documentation/driver-api/vfio-mediated-device.rst
> index 25eb7d5b834b..29c29432a847 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -269,6 +269,9 @@ Directories and Files Under the sysfs for Each mdev
> Device
>    |--- [$MDEV_UUID]
>           |--- remove
>           |--- mdev_type {link to its type}
> +         |--- mdev [optional]
> +	     |--- aggregated_instances [optional]
> +	     |--- max_aggregation [optional]
>           |--- vendor-specific-attributes [optional]
> 
>  * remove (write only)
> @@ -281,6 +284,22 @@ Example::
> 
>  	# echo 1 > /sys/bus/mdev/devices/$mdev_UUID/remove
> 
> +* mdev directory (optional)

It sounds confusing to me when seeing a 'mdev' directory under a
mdev instance. How could one tell which attribute should put inside
or outside of 'mdev'?

> +
> +Vendor driver could create mdev directory to specify extra generic
> parameters
> +on mdev device by its type. Currently aggregation parameters are defined.
> +Vendor driver should provide both items to support.
> +
> +1) aggregated_instances (read/write)
> +
> +Set target aggregated instances for device. Reading will show current
> +count of aggregated instances. Writing value larger than max_aggregation
> +would fail and return error.

Can one write a value multiple-times and at any time? 

> +
> +2) max_aggregation (read only)
> +
> +Show maxium instances for aggregation.
> +

"show maximum-allowed instances which can be aggregated for this device". is
this value static or dynamic? if dynamic then the user is expected to read this
field before every write. worthy of some clarification here.

>  Mediated device Hot plug
>  ------------------------
> 
> --
> 2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
