Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93124334B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Aug 2020 06:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8F96E1BE;
	Thu, 13 Aug 2020 04:25:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428DB6E1BE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Aug 2020 04:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597292716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PPbrW4CSztn1ObcO69vjUZRVg4SYJU7VAI203g9mjo=;
 b=CnmG0iWlEhyGVspT5zhi7xF49n0L6alFUanYnJpJSRm6vAZGdXVv2YXWox6iC3VDn3wPrT
 TQaR+cOMDG/U87JrRxwwZH8Ok3eyTld/Pdd6KvuaRPpdiXfJpEGt7yV8H/SefBZ2V2qN1z
 0pK5i62MSTTggtU7eyics5BF36uZvUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-vb4WYu46NBKDrN8lTjFs7w-1; Thu, 13 Aug 2020 00:25:12 -0400
X-MC-Unique: vb4WYu46NBKDrN8lTjFs7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8811C107ACCA;
 Thu, 13 Aug 2020 04:25:09 +0000 (UTC)
Received: from [10.72.13.44] (ovpn-13-44.pek2.redhat.com [10.72.13.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B8B919D7B;
 Thu, 13 Aug 2020 04:24:52 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Yan Zhao <yan.y.zhao@intel.com>, Jiri Pirko <jiri@mellanox.com>
References: <20200727162321.7097070e@x1.home>
 <20200729080503.GB28676@joy-OptiPlex-7040>
 <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
Date: Thu, 13 Aug 2020 12:24:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810074631.GA29059@joy-OptiPlex-7040>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Cornelia Huck <cohuck@redhat.com>, kvm@vger.kernel.org,
 libvir-list@redhat.com, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, smooney@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com, eskultet@redhat.com,
 dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xMCDkuIvljYgzOjQ2LCBZYW4gWmhhbyB3cm90ZToKPj4gZHJpdmVyIGlzIGl0
IGhhbmRsZWQgYnk/Cj4gSXQgbG9va3MgdGhhdCB0aGUgZGV2bGluayBpcyBmb3IgbmV0d29yayBk
ZXZpY2Ugc3BlY2lmaWMsIGFuZCBpbgo+IGRldmxpbmsuaCwgaXQgc2F5cwo+IGluY2x1ZGUvdWFw
aS9saW51eC9kZXZsaW5rLmggLSBOZXR3b3JrIHBoeXNpY2FsIGRldmljZSBOZXRsaW5rCj4gaW50
ZXJmYWNlLAoKCkFjdHVhbGx5IG5vdCwgSSB0aGluayB0aGVyZSB1c2VkIHRvIGhhdmUgc29tZSBk
aXNjdXNzaW9uIGxhc3QgeWVhciBhbmQgCnRoZSBjb25jbHVzaW9uIGlzIHRvIHJlbW92ZSB0aGlz
IGNvbW1lbnQuCgpJdCBzdXBwb3J0cyBJQiBhbmQgcHJvYmFibHkgdkRQQSBpbiB0aGUgZnV0dXJl
LgoKCj4gICBJIGZlZWwgbGlrZSBpdCdzIG5vdCB2ZXJ5IGFwcHJvcHJpYXRlIGZvciBhIEdQVSBk
cml2ZXIgdG8gdXNlCj4gdGhpcyBpbnRlcmZhY2UuIElzIHRoYXQgcmlnaHQ/CgoKSSB0aGluayBu
b3QgdGhvdWdoIG1vc3Qgb2YgdGhlIHVzZXJzIGFyZSBzd2l0Y2ggb3IgZXRoZXJuZXQgZGV2aWNl
cy4gSXQgCmRvZXNuJ3QgcHJldmVudCB5b3UgZnJvbSBpbnZlbnRpbmcgbmV3IGFic3RyYWN0aW9u
cy4KCk5vdGUgdGhhdCBkZXZsaW5rIGlzIGJhc2VkIG9uIG5ldGxpbmssIG5ldGxpbmsgaGFzIGJl
ZW4gd2lkZWx5IHVzZWQgYnkgCnZhcmlvdXMgc3Vic3lzdGVtcyBvdGhlciB0aGFuIG5ldHdvcmtp
bmcuCgpUaGFua3MKCgo+Cj4gVGhhbmtzCj4gWWFuCj4gICAKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
