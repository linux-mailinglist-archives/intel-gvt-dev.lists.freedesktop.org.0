Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B588E2C1C9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 10:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F93789D79;
	Tue, 28 May 2019 08:53:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB64789D79
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 08:53:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8118381E03;
 Tue, 28 May 2019 08:53:48 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAD97D580;
 Tue, 28 May 2019 08:53:34 +0000 (UTC)
Date: Tue, 28 May 2019 10:53:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 1/2] vfio/mdev: add migration_version attribute for
 mdev device
Message-ID: <20190528105332.7c5a2f82.cohuck@redhat.com>
In-Reply-To: <20190527034342.31523-1-yan.y.zhao@intel.com>
References: <20190527034155.31473-1-yan.y.zhao@intel.com>
 <20190527034342.31523-1-yan.y.zhao@intel.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 28 May 2019 08:53:49 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, dinechin@redhat.com, alex.williamson@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, changpeng.liu@intel.com,
 berrange@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBNYXkgMjAxOSAyMzo0Mzo0MiAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBtaWdyYXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUgaXMgdXNlZCB0
byBjaGVjayBtaWdyYXRpb24gY29tcGF0aWJpbGl0eQo+IGJldHdlZW4gdHdvIG1kZXYgZGV2aWNl
IG9mIHRoZSBzYW1lIG1kZXYgdHlwZS4KCnMvZGV2aWNlL2RldmljZXMvCgo+IFRoZSBrZXkgaXMg
dGhhdCBpdCdzIHJ3IGFuZCBpdHMgZGF0YSBpcyBvcGFxdWUgdG8gdXNlcnNwYWNlLgo+IAo+IFVz
ZXJzcGFjZSByZWFkcyBtaWdyYXRpb25fdmVyc2lvbiBvZiBtZGV2IGRldmljZSBhdCBzb3VyY2Ug
c2lkZSBhbmQKPiB3cml0ZXMgdGhlIHZhbHVlIHRvIG1pZ3JhdGlvbl92ZXJzaW9uIGF0dHJpYnV0
ZSBvZiBtZGV2IGRldmljZSBhdCB0YXJnZXQKPiBzaWRlLiBJdCBqdWRnZXMgbWlncmF0aW9uIGNv
bXBhdGliaWxpdHkgYWNjb3JkaW5nIHRvIHdoZXRoZXIgdGhlIHJlYWQKPiBhbmQgd3JpdGUgb3Bl
cmF0aW9ucyBzdWNjZWVkIG9yIGZhaWwuCj4gCj4gQXMgdGhpcyBhdHRyaWJ1dGUgaXMgdW5kZXIg
bWRldl90eXBlIG5vZGUsIHVzZXJzcGFjZSBpcyBhYmxlIHRvIGtub3cKPiB3aGV0aGVyIHR3byBt
ZGV2IGRldmljZXMgYXJlIGNvbXBhdGlibGUgYmVmb3JlIGEgbWRldiBkZXZpY2UgaXMgY3JlYXRl
ZC4KPiAKPiB1c2Vyc3BhY2UgbmVlZHMgdG8gY2hlY2sgd2hldGhlciB0aGUgdHdvIG1kZXYgZGV2
aWNlcyBhcmUgb2YgdGhlIHNhbWUKPiBtZGV2IHR5cGUgYmVmb3JlIGNoZWNraW5nIHRoZSBtaWdy
YXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUuIEl0IGFsc28gbmVlZHMKPiB0byBjaGVjayBkZXZpY2Ug
Y3JlYXRpb24gcGFyYW1ldGVycyBpZiBhZ2dyZWdhdGlvbiBpcyBzdXBwb3J0ZWQgaW4KPiBmdXR1
cmUuCj4gCj4gICAgICAgICAgICAgIF9fICAgIHVzZXJzcGFjZQo+ICAgICAgICAgICAgICAgL1wg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgLyAgICAgICAgICAgICAgICAgXHdyaXRlCj4g
ICAgICAgICAgICAgLyByZWFkICAgICAgICAgICAgICBcCj4gICAgX19fX19fX18vX19fX19fX19f
XyAgICAgICBfX19cfC9fX19fX19fX19fX19fCj4gICB8IG1pZ3JhdGlvbl92ZXJzaW9uIHwgICAg
IHwgbWlncmF0aW9uX3ZlcnNpb24gfC0tPmNoZWNrIG1pZ3JhdGlvbgo+ICAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gICBjb21wYXRpYmlsaXR5Cj4gICAg
IG1kZXYgZGV2aWNlIEEgICAgICAgICAgICAgICBtZGV2IGRldmljZSBCCj4gCj4gQ2M6IEFsZXgg
V2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+Cj4gQ2M6IEVyaWsgU2t1bHRl
dHkgPGVza3VsdGV0QHJlZGhhdC5jb20+Cj4gQ2M6ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8
ZGdpbGJlcnRAcmVkaGF0LmNvbT4KPiBDYzogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5j
b20+Cj4gQ2M6ICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IENjOiBaaGVu
eXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6ICJXYW5nLCBaaGkgQSIgPHpo
aS5hLndhbmdAaW50ZWwuY29tPgo+IENjOiBOZW8gSmlhIDxjamlhQG52aWRpYS5jb20+Cj4gQ2M6
IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4KPiBDYzogRGFuaWVsIFAuIEJl
cnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4KPiBDYzogQ2hyaXN0b3BoZSBkZSBEaW5lY2hp
biA8ZGluZWNoaW5AcmVkaGF0LmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFu
Lnkuemhhb0BpbnRlbC5jb20+Cj4gCj4gLS0tCj4gdjM6Cj4gMS4gcmVuYW1lZCB2ZXJzaW9uIHRv
IG1pZ3JhdGlvbl92ZXJzaW9uCj4gKENocmlzdG9waGUgZGUgRGluZWNoaW4sIENvcm5lbGlhIEh1
Y2ssIEFsZXggV2lsbGlhbXNvbikKPiAyLiBsZXQgZXJybm8gdG8gYmUgZnJlZWx5IGRlZmluZWQg
YnkgdmVuZG9yIGRyaXZlcgo+IChBbGV4IFdpbGxpYW1zb24sIEVyaWsgU2t1bHRldHksIENvcm5l
bGlhIEh1Y2ssIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQpCj4gMy4gbGV0IGNoZWNraW5nIG1kZXZf
dHlwZSBiZSBwcmVyZXF1aXNpdGUgb2YgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkKPiBjaGVjay4g
KEFsZXggV2lsbGlhbXNvbikKPiA0LiByZXdvcmRlZCBleGFtcGxlIHVzYWdlIHNlY3Rpb24uCj4g
KG1vc3Qgb2YgdGhpcyBzZWN0aW9uIGNhbWUgZnJvbSBBbGV4IFdpbGxpYW1zb24pCj4gNS4gcmV3
b3JkZWQgYXR0cmlidXRlIGludGVudGlvbiBzZWN0aW9uIChDb3JuZWxpYSBIdWNrKQo+IAo+IHYy
Ogo+IDEuIGFkZGVkIGRldGFpbGVkIGludGVudCBhbmQgdXNhZ2UKPiAyLiBtYWRlIGRlZmluaXRp
b24gb2YgdmVyc2lvbiBzdHJpbmcgY29tcGxldGVseSBwcml2YXRlIHRvIHZlbmRvciBkcml2ZXIK
PiAgICAoQWxleCBXaWxsaWFtc29uKQo+IDMuIGFiYW5kb25lZCBjaGFuZ2VzIHRvIHNhbXBsZSBt
ZGV2IGRyaXZlcnMgKEFsZXggV2lsbGlhbXNvbikKPiA0LiBtYW5kYXRvcnkgLS0+IG9wdGlvbmFs
IChDb3JuZWxpYSBIdWNrKQo+IDUuIGFkZGVkIGRlc2NyaXB0aW9uIGZvciBlcnJubyAoQ29ybmVs
aWEgSHVjaykKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmljZS50eHQg
fCAxMTMgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTEzIGlu
c2VydGlvbnMoKykKPiAKCldoaWxlIEkgcHJvYmFibHkgd291bGQgaGF2ZSB3cml0dGVuIGEgbW9y
ZSBjb21wYWN0IGRlc2NyaXB0aW9uLCB5b3VyCnZlcnNpb24gaXMgZmluZSB3aXRoIG1lIGFzIHdl
bGwuCgpSZXZpZXdlZC1ieTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
