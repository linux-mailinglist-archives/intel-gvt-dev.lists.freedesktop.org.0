Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E074101184
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 04:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6676E06E;
	Tue, 19 Nov 2019 03:04:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AB289736
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Nov 2019 03:04:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-LlTJOq6nOt2ciNwHvotXvw-1; Mon, 18 Nov 2019 22:04:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EF1C593A2;
 Tue, 19 Nov 2019 03:04:08 +0000 (UTC)
Received: from [10.72.12.132] (ovpn-12-132.pek2.redhat.com [10.72.12.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51BFBA7F0;
 Tue, 19 Nov 2019 03:03:40 +0000 (UTC)
Subject: Re: [PATCH V13 6/6] docs: sample driver to demonstrate how to
 implement virtio-mdev framework
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191118105923.7991-1-jasowang@redhat.com>
 <20191118105923.7991-7-jasowang@redhat.com>
 <20191118151706.GA371978@kroah.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4fed1e7e-9d27-d441-f0a1-0eb6f15e90b1@redhat.com>
Date: Tue, 19 Nov 2019 11:03:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191118151706.GA371978@kroah.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: LlTJOq6nOt2ciNwHvotXvw-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574132655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tw7bahIrBk8OAceM0I9m2c95R3hrLEe1uz2ktfeXfwY=;
 b=Cbaw02DWHNQqXwRceHRFNI+ssBZfcSPRELXaij/a5VSsN9y1bXu4CPCIZiWVs1cR7XO0yD
 mqr8AYBGN0ks3I79ubKj8IYDUY8MLvD7sToGTMlsWH4xlS8eVUWGcza0gZbufwWFbKmxny
 2DlYyUrsVwgC0aDbVibzyhQ6DJ5AxGU=
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
Cc: rdunlap@infradead.org, jakub.kicinski@netronome.com,
 christophe.de.dinechin@gmail.com, kvm@vger.kernel.org, mst@redhat.com,
 airlied@linux.ie, joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
 haotian.wang@sifive.com, dri-devel@lists.freedesktop.org,
 oberpar@linux.ibm.com, kwankhede@nvidia.com, rob.miller@broadcom.com,
 linux-s390@vger.kernel.org, sebott@linux.ibm.com, lulu@redhat.com,
 eperezma@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 jgg@mellanox.com, jeffrey.t.kirsher@intel.com, cunming.liang@intel.com,
 zhi.a.wang@intel.com, farman@linux.ibm.com, parav@mellanox.com,
 gor@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kevin.tian@intel.com, alex.williamson@redhat.com,
 xiao.w.wang@intel.com, freude@linux.ibm.com, zhenyuw@linux.intel.com,
 stefanha@redhat.com, zhihong.wang@intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, hch@infradead.org, akrowiak@linux.ibm.com,
 jiri@mellanox.com, tiwei.bie@intel.com, netdev@vger.kernel.org,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 daniel@ffwll.ch, aadam@redhat.com, lingshan.zhu@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTkvMTEvMTgg5LiL5Y2IMTE6MTcsIEdyZWcgS0ggd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
MTgsIDIwMTkgYXQgMDY6NTk6MjNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4gK3N0YXRp
YyB2b2lkIG12bmV0X2RldmljZV9yZWxlYXNlKHN0cnVjdCBkZXZpY2UgKmRldikKPj4gK3sKPj4g
KwlkZXZfZGJnKGRldiwgIm12bmV0OiByZWxlYXNlZFxuIik7Cj4+ICt9Cj4gV2UgdXNlZCB0byBo
YXZlIGRvY3VtZW50YXRpb24gaW4gdGhlIGtlcm5lbCBzb3VyY2UgdHJlZSB0aGF0IHNhaWQgdGhh
dAo+IHdoZW5ldmVyIGFueW9uZSBkaWQgdGhpcywgSSBnb3QgdG8gbWFrZSBmdW4gb2YgdGhlbS4g
IFVuZm9ydHVuYXRlbHkgdGhhdAo+IGhhcyBiZWVuIHJlbW92ZWQuCj4KPiBUaGluayBhYm91dCB3
aGF0IHlvdSBkaWQgcmlnaHQgaGVyZS4gIFlvdSBzaWxlbmNlZCBhIGtlcm5lbCBydW50aW1lCj4g
d2FybmluZyB0aGF0IHNhaWQgc29tZXRoaW5nIGxpa2UgIkVSUk9SISBOTyBSRUxFQVNFIEZVTkNU
SU9OIEZPVU5EISIgYnkKPiBkb2luZyB0aGUgYWJvdmUgYmVjYXVzZSAiSSBhbSBzbWFydGVyIHRo
YW4gdGhlIGtlcm5lbCwgSSB3aWxsIHNpbGVuY2UgaXQKPiBieSBwdXR0aW5nIGFuIGVtcHR5IHJl
bGVhc2UgZnVuY3Rpb24gaW4gdGhlcmUuIgo+Cj4ge3NpZ2h9Cj4KPiBEaWQgeW91IGV2ZXIgdGhp
bmsgX3doeV8gd2UgdG9vayB0aGUgdGltZSBhbmQgZWZmb3J0IHRvIGFkZCB0aGF0IHdhcm5pbmcK
PiB0aGVyZT8gIEl0IHdhc24ndCBqdXN0IHNvIHRoYXQgcGVvcGxlIGNhbiBjaXJjdW12ZW50IGl0
LCBpdCBpcyB0bwo+IFBSRVZFTlQgQSBNQUpPUiBCVUcgSU4gWU9VUiBERVNJR04hICBXZSBhcmUg
dHJ5aW5nIHRvIGJlIG5pY2UgaGVyZSBhbmQKPiBnaXZlIHBlb3BsZSBhIF9jaGFuY2VfIHRvIGdl
dCB0aGluZ3MgcmlnaHQgaW5zdGVhZCBvZiBoYXZpbmcgeW91IGp1c3QKPiBsaXZlIHdpdGggYSBz
aWxlbnQgbWVtb3J5IGxlYWsuCj4KPiBBZnRlciAxMyB2ZXJzaW9ucyBvZiB0aGlzIHNlcmllcywg
YmFzaWMgdGhpbmdzIGxpa2UgdGhpcyBhcmUgc3RpbGwgaGVyZT8KPiBXaG8gaXMgcmV2aWV3aW5n
IHRoaXMgdGhpbmc/CgoKQXBvbG9naXplIHRoYXQgc3RhdGljIHN0cnVjdHVyZSBpcyB1c2VkIGhl
cmUsIHdpbGwgZml4IHRoZW0gd2l0aCBkeW5hbWljIApvbmUuIEkganVzdCBib3Jyb3cgdGhlIGNv
ZGVzIGZyb20gb3RoZXIgdmZpby1tZGV2IHNhbXBsZXMgd2l0aG91dCB0b28gCm11Y2ggdGhvdWdo
dCBoZXJlIC4uLgoKCj4KPiB7dWdofQo+Cj4gQWxzbywgc2VlIHRoZSBvdGhlciBjb252ZXJzYXRp
b25zIHdlIGFyZSBoYXZpbmcgYWJvdXQgYSAidmlydHVhbCIgYnVzCj4gYW5kIGRldmljZXMuICBJ
IGRvIG5vdCB3YW50IHRvIGhhdmUgdHdvIGRpZmZlcmVudCB3YXlzIG9mIGRvaW5nIHRoZSBzYW1l
Cj4gdGhpbmcgaW4gdGhlIGtlcm5lbCBhdCB0aGUgc2FtZSB0aW1lIHBsZWFzZS4gIFBsZWFzZSB3
b3JrIHRvZ2V0aGVyIHdpdGgKPiB0aGUgSW50ZWwgZGV2ZWxvcGVycyB0byBzb2x2ZSB0aGlzIGlu
IGEgdW5pZmllZCB3YXksIGFzIHlvdSBib3RoCj4gbmVlZC93YW50IHRoZSBzYW1lIHRoaW5nIGhl
cmUuCgoKU3VyZSwgc29tZSBmdW5jdGlvbnMgbG9va3Mgc2ltaWxhciwgYnV0IHRoZSAidmlydHVh
bCIgYnVzIGRvZXMgbm90IApjb250YWluIGEgbWFuYWdlbWVudCBpbnRlcmZhY2UgYW5kIGl0J3Mg
bm90IGNsZWFyIHRoYXQgaG93IGl0IGNhbiBiZSAKdXNlZCBieSB1c2Vyc3BhY2UgZHJpdmVyLiBG
b3IgdGhpcyBzZXJpZXMsIHN5c2ZzL0dVSUQgYmFzZWQgbWFuYWdlbWVudCAKaW50ZXJmYWNlIGlz
IHJldXNlZCBhbmQgd2UgaGFkIGEgY29uY3JldGUgZXhhbXBsZSBvZiBob3cgaXQgd291bGQgYmUg
CnVzZWQgYnkgdXNlcnNwYWNlIGRyaXZlclsxXSBhbmQgYSByZWFsIGhhcmR3YXJlIGRyaXZlciBp
bXBsZW1lbnRhdGlvblsyXS4KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMS83LzYy
ClsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMS8xMi8yMTUKCgo+Cj4gTmVpdGhlciB0
aGlzLCBub3IgdGhlIG90aGVyIHByb3Bvc2FsIGNhbiBiZSBhY2NlcHRlZCB1bnRpbCB5b3UgYWxs
IGFncmVlCj4gb24gdGhlIGRlc2lnbiBhbmQgaW1wbGVtZW50YXRpb24uCgoKWWVzLgoKVGhhbmtz
CgoKPgo+IC9tZSBnb2VzIG9mZiB0byBmaW5kIGEgbmljZSBmcnVpdHkgZHJpbmsgd2l0aCBhbiB1
bWJyZWxsYS4KPgo+IGdyZWcgay1oCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
