Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF41E248172
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10A89C1C;
	Tue, 18 Aug 2020 09:08:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Tue, 18 Aug 2020 09:08:23 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E50689C1C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597741702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Zbxve3YN9vAa8gBq30D/YFBLe8h/WC4m8ljp93Duak=;
 b=d5Ny9z7aL0xdLwrs/PzFP6gmGFzdWjYkISIS919bJYUAzlnxI82CNhW7rqRwcJf43RqDPe
 3UEftWBZJi1ItXTJN4fbU6ZJX07Kq400ojxPs3bj3XBCv0Xt2JClYuiD9KOoMncFNZpt1r
 KRNduOLpWWpGYlwkcMu3o2sswmr1m6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-73Qa7zQANHGfbs2StjZ6JA-1; Tue, 18 Aug 2020 05:02:14 -0400
X-MC-Unique: 73Qa7zQANHGfbs2StjZ6JA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F16DE18686C6;
 Tue, 18 Aug 2020 09:02:11 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9007E10013C4;
 Tue, 18 Aug 2020 09:01:52 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
Date: Tue, 18 Aug 2020 17:01:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818085527.GB20215@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: multipart/mixed; boundary="===============0206988449=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0206988449==
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020/8/18 下午4:55, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818085527.GB20215@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Aug 18, 2020 at 11:24:30AM +0800, Jason Wang wrote:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">On 2020/8/14 下午1:16, Yan Zhao wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">On Thu, Aug 13, 2020 at 12:24:50PM +0800, Jason Wang wrote:
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre class="moz-quote-pre" wrap="">On 2020/8/10 下午3:46, Yan Zhao wrote:
</pre>
            <blockquote type="cite" style="color: #000000;">
              <blockquote type="cite" style="color: #000000;">
                <pre class="moz-quote-pre" wrap="">driver is it handled by?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">It looks that the devlink is for network device specific, and in
devlink.h, it says
include/uapi/linux/devlink.h - Network physical device Netlink
interface,
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Actually not, I think there used to have some discussion last year and the
conclusion is to remove this comment.

It supports IB and probably vDPA in the future.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">hmm... sorry, I didn't find the referred discussion. only below discussion
regarding to why to add devlink.

<a class="moz-txt-link-freetext" href="https://www.mail-archive.com/netdev@vger.kernel.org/msg95801.html" moz-do-not-send="true">https://www.mail-archive.com/netdev@vger.kernel.org/msg95801.html</a>
	&gt;This doesn't seem to be too much related to networking? Why can't something
	&gt;like this be in sysfs?
	
	It is related to networking quite bit. There has been couple of
	iteration of this, including sysfs and configfs implementations. There
	has been a consensus reached that this should be done by netlink. I
	believe netlink is really the best for this purpose. Sysfs is not a good
	idea
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
See the discussion here:

<a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/netdev/patch/20191115223355.1277139-1-jeffrey.t.kirsher@intel.com/" moz-do-not-send="true">https://patchwork.ozlabs.org/project/netdev/patch/20191115223355.1277139-1-jeffrey.t.kirsher@intel.com/</a>


</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap=""><a class="moz-txt-link-freetext" href="https://www.mail-archive.com/netdev@vger.kernel.org/msg96102.html" moz-do-not-send="true">https://www.mail-archive.com/netdev@vger.kernel.org/msg96102.html</a>
	&gt;there is already a way to change eth/ib via
	&gt;echo 'eth' &gt; /sys/bus/pci/drivers/mlx4_core/0000:02:00.0/mlx4_port1
	&gt;
	&gt;sounds like this is another way to achieve the same?
	
	It is. However the current way is driver-specific, not correct.
	For mlx5, we need the same, it cannot be done in this way. Do devlink is
	the correct way to go.

<a class="moz-txt-link-freetext" href="https://lwn.net/Articles/674867/" moz-do-not-send="true">https://lwn.net/Articles/674867/</a>
	There a is need for some userspace API that would allow to expose things
	that are not directly related to any device class like net_device of
	ib_device, but rather chip-wide/switch-ASIC-wide stuff.

	Use cases:
	1) get/set of port type (Ethernet/InfiniBand)
	2) monitoring of hardware messages to and from chip
	3) setting up port splitters - split port into multiple ones and squash again,
	   enables usage of splitter cable
	4) setting up shared buffers - shared among multiple ports within one chip



we actually can also retrieve the same information through sysfs, .e.g

|- [path to device]
   |--- migration
   |     |--- self
   |     |   |---device_api
   |	|   |---mdev_type
   |	|   |---software_version
   |	|   |---device_id
   |	|   |---aggregator
   |     |--- compatible
   |     |   |---device_api
   |	|   |---mdev_type
   |	|   |---software_version
   |	|   |---device_id
   |	|   |---aggregator

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes but:

- You need one file per attribute (one syscall for one attribute)
- Attribute is coupled with kobject

All of above seems unnecessary.

Another point, as we discussed in another thread, it's really hard to make
sure the above API work for all types of devices and frameworks. So having a
vendor specific API looks much better.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">From the POV of userspace mgmt apps doing device compat checking / migration,
we certainly do NOT want to use different vendor specific APIs. We want to
have an API that can be used / controlled in a standard manner across vendors.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, but it could be hard. E.g vDPA will chose to use devlink
      (there's a long debate on sysfs vs devlink). So if we go with
      sysfs, at least two APIs needs to be supported ...</p>
    <p>Thanks<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20200818085527.GB20215@redhat.com">
      <pre class="moz-quote-pre" wrap="">



Regards,
Daniel</pre>
    </blockquote>
  </body>
</html>


--===============0206988449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0206988449==--
