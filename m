Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F51025E4
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 15:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D5E6E921;
	Tue, 19 Nov 2019 14:08:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FBB6E2F9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Nov 2019 14:07:58 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-XlKlkg7bP0-ypm9qQvQ5FA-1; Tue, 19 Nov 2019 09:07:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98ADF1034AE1;
 Tue, 19 Nov 2019 14:07:47 +0000 (UTC)
Received: from [10.72.12.74] (ovpn-12-74.pek2.redhat.com [10.72.12.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF49169193;
 Tue, 19 Nov 2019 14:07:20 +0000 (UTC)
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
 <20191118151706.GA371978@kroah.com>
 <4fed1e7e-9d27-d441-f0a1-0eb6f15e90b1@redhat.com>
 <20191119124000.GB26739@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9e786429-866d-e2ca-45f9-30c8e1ebece9@redhat.com>
Date: Tue, 19 Nov 2019 22:07:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191119124000.GB26739@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: XlKlkg7bP0-ypm9qQvQ5FA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574172477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+f3DKNL0FyxmoqoYXTVPxv6/OauXHiQdxUlEpP8kjk=;
 b=LolT2fB3fBcf+NHs7/IK8mmnKwzRumx+aXtjOVL1ljqxO1DR3rEok//aJFJbGEjlYfy6+p
 Ppa/A5a57us9ZPzxE6Vgo9Cl0LAI/R9WFCY5dHb8gKp3HIVhKgPBVZd8ammLYzA8KTyi5W
 j2MOOKFPze82nlIGqu1F1aa3yHE4tjE=
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sebott@linux.ibm.com" <sebott@linux.ibm.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
 "cunming.liang@intel.com" <cunming.liang@intel.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 Parav Pandit <parav@mellanox.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "aadam@redhat.com" <aadam@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 "tiwei.bie@intel.com" <tiwei.bie@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvMTkg5LiL5Y2IODo0MCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFR1
ZSwgTm92IDE5LCAyMDE5IGF0IDExOjAzOjM5QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+
PiBBbHNvLCBzZWUgdGhlIG90aGVyIGNvbnZlcnNhdGlvbnMgd2UgYXJlIGhhdmluZyBhYm91dCBh
ICJ2aXJ0dWFsIiBidXMKPj4+IGFuZCBkZXZpY2VzLiAgSSBkbyBub3Qgd2FudCB0byBoYXZlIHR3
byBkaWZmZXJlbnQgd2F5cyBvZiBkb2luZyB0aGUgc2FtZQo+Pj4gdGhpbmcgaW4gdGhlIGtlcm5l
bCBhdCB0aGUgc2FtZSB0aW1lIHBsZWFzZS4gIFBsZWFzZSB3b3JrIHRvZ2V0aGVyIHdpdGgKPj4+
IHRoZSBJbnRlbCBkZXZlbG9wZXJzIHRvIHNvbHZlIHRoaXMgaW4gYSB1bmlmaWVkIHdheSwgYXMg
eW91IGJvdGgKPj4+IG5lZWQvd2FudCB0aGUgc2FtZSB0aGluZyBoZXJlLgo+PiBTdXJlLCBzb21l
IGZ1bmN0aW9ucyBsb29rcyBzaW1pbGFyLCBidXQgdGhlICJ2aXJ0dWFsIiBidXMgZG9lcyBub3Qg
Y29udGFpbiBhCj4+IG1hbmFnZW1lbnQgaW50ZXJmYWNlIGFuZCBpdCdzIG5vdCBjbGVhciB0aGF0
IGhvdyBpdCBjYW4gYmUgdXNlZCBieSB1c2Vyc3BhY2UKPj4gZHJpdmVyLiBGb3IgdGhpcyBzZXJp
ZXMsIHN5c2ZzL0dVSUQgYmFzZWQgbWFuYWdlbWVudCBpbnRlcmZhY2UgaXMgcmV1c2VkIGFuZAo+
PiB3ZSBoYWQgYSBjb25jcmV0ZSBleGFtcGxlIG9mIGhvdyBpdCB3b3VsZCBiZSB1c2VkIGJ5IHVz
ZXJzcGFjZSBkcml2ZXJbMV0gYW5kCj4+IGEgcmVhbCBoYXJkd2FyZSBkcml2ZXIgaW1wbGVtZW50
YXRpb25bMl0uCj4gVGhlIGxpZmVjeWNsZSBzdHVmZiBzaG91bGQgYmUgcmUtdXNlZCB0aHJvdWdo
IGEgbGlicmFyeSBvZiB0aGlzIGd1aWQKPiBzdHVmZiwgbm90IGJ5ICdzdWJjbGFzc2luZycgbWRl
dl9kZXZpY2UKPgo+IEphc29uCgoKQnV0IG1kZXYgcHJvdmlkZXMgbW9yZSB0aGFuIGxpZmVjeWNs
ZSBtYW5hZ2VtZW50OiB0eXBlIG1hbmFnZW1lbnQsIElPTU1VIApzdXBwb3J0IGV0Yy4gQW5kIG1v
cmUgY291bGQgYmUgYWRkZWQgaW4gdGhlIGZ1dHVyZS4KCkhhdmluZyBhIGxpYnJhcnkgdGhhdCBz
ZXJ2ZXMgZXhhY3RseSBmb3IgdGhlIGNhc2Ugb2YgbWRldiBzZWVtcyBsZXNzIApjb252ZW5pZW50
IHRoYW4gbWFraW5nIG1kZXZfZGV2aWNlIGEgJ3BhcmVudCBjbGFzcycuCgpUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
