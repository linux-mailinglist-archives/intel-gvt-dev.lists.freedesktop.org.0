Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628571BE063
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 Apr 2020 16:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D836EE6A;
	Wed, 29 Apr 2020 14:13:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096846EE6A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 29 Apr 2020 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588169609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5KJj0/IEeIDfSeMUgMfCAULVkkEU1Ysj/D3ASB/G5k=;
 b=ckfAqv2H5L9BfiqxoJBruR7bB82P6wu+ygQR8v4CclB9+PwWfE7Rt5gFr0q8/nGlnqwaCy
 txXd/TJQ+l9AOpuBWKer4lm8SSORlDu/sar1W4wkom0dwJQ8h19lJJoLJw8ux2dQXeaJ4b
 jfT3T4G15bjOfZYe5dvKvbAjapX6iSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-eJjW36AfMLWIeaVqCQ_XUQ-1; Wed, 29 Apr 2020 10:13:23 -0400
X-MC-Unique: eJjW36AfMLWIeaVqCQ_XUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31EF108BD0F;
 Wed, 29 Apr 2020 14:13:19 +0000 (UTC)
Received: from [10.10.116.80] (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 998945D9E5;
 Wed, 29 Apr 2020 14:13:02 +0000 (UTC)
Subject: Re: [PATCH v5 0/4] introduction of migration_version attribute for
 VFIO live migration
To: Yan Zhao <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200421023718.GA12111@joy-OptiPlex-7040>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D86DF06@SHSMSX104.ccr.corp.intel.com>
 <20200422073628.GA12879@joy-OptiPlex-7040> <20200424191049.GU3106@work-vm>
 <20200426013628.GC12879@joy-OptiPlex-7040> <20200427153743.GK2923@work-vm>
 <20200428005429.GJ12879@joy-OptiPlex-7040> <20200428141437.GG2794@work-vm>
 <20200429072616.GL12879@joy-OptiPlex-7040> <20200429082201.GA2834@work-vm>
 <20200429093555.GM12879@joy-OptiPlex-7040>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <94cd58d2-0580-53cd-6ca2-2c33146e0f2c@redhat.com>
Date: Wed, 29 Apr 2020 09:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429093555.GM12879@joy-OptiPlex-7040>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

[meta-comment]

On 4/29/20 4:35 AM, Yan Zhao wrote:
> On Wed, Apr 29, 2020 at 04:22:01PM +0800, Dr. David Alan Gilbert wrote:
[...]
>>>>>>>>>>>>>>>>> This patchset introduces a migration_version attribute under sysfs
>>>>>>>>>>> of VFIO
>>>>>>>>>>>>>>>>> Mediated devices.

Hmm, several pages with up to 16 levels of quoting, with editors making 
the lines ragged, all before I get to the real meat of the email. 
Remember, it's okay to trim content,...

>> So why don't we split the difference; lets say that it should start with
>> the hex PCI Vendor ID.
>>
> The problem is for mdev devices, if the parent devices are not PCI devices,
> they don't have PCI vendor IDs.

...to just what you are replying to.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
