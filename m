Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3E33C80
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 02:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1284589359;
	Tue,  4 Jun 2019 00:40:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCD989359
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 00:40:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 17:40:13 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga007.fm.intel.com with ESMTP; 03 Jun 2019 17:40:09 -0700
Date: Mon, 3 Jun 2019 20:34:22 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 0/2] introduction of migration_version attribute for
 VFIO live migration
Message-ID: <20190604003422.GA30229@joy-OptiPlex-7040>
References: <20190531004438.24528-1-yan.y.zhao@intel.com>
 <20190603132932.1b5dc7fe@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603132932.1b5dc7fe@x1.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDM6Mjk6MzJBTSArMDgwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFRodSwgMzAgTWF5IDIwMTkgMjA6NDQ6MzggLTA0MDAKPiBZYW4gWmhhbyA8
eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gVGhpcyBwYXRjaHNldCBpbnRyb2R1
Y2VzIGEgbWlncmF0aW9uX3ZlcnNpb24gYXR0cmlidXRlIHVuZGVyIHN5c2ZzIG9mIFZGSU8KPiA+
IE1lZGlhdGVkIGRldmljZXMuCj4gPiAKPiA+IFRoaXMgbWlncmF0aW9uX3ZlcnNpb24gYXR0cmli
dXRlIGlzIHVzZWQgdG8gY2hlY2sgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkKPiA+IGJldHdlZW4g
dHdvIG1kZXYgZGV2aWNlcyBvZiB0aGUgc2FtZSBtZGV2IHR5cGUuCj4gPiAKPiA+IFBhdGNoIDEg
ZGVmaW5lcyBtaWdyYXRpb25fdmVyc2lvbiBhdHRyaWJ1dGUgaW4KPiA+IERvY3VtZW50YXRpb24v
dmZpby1tZWRpYXRlZC1kZXZpY2UudHh0Cj4gPiAKPiA+IFBhdGNoIDIgdXNlcyBHVlQgYXMgYW4g
ZXhhbXBsZSB0byBzaG93IGhvdyB0byBleHBvc2UgbWlncmF0aW9uX3ZlcnNpb24KPiA+IGF0dHJp
YnV0ZSBhbmQgY2hlY2sgbWlncmF0aW9uIGNvbXBhdGliaWxpdHkgaW4gdmVuZG9yIGRyaXZlci4K
PiAKPiBUaGFua3MgZm9yIGl0ZXJhdGluZyB0aHJvdWdoIHRoaXMsIGl0IGxvb2tzIGxpa2Ugd2Un
dmUgc2V0dGxlZCBvbgo+IHNvbWV0aGluZyByZWFzb25hYmxlLCBidXQgbm93IHdoYXQ/ICBUaGlz
IGlzIG9uZSBwaWVjZSBvZiB0aGUgcHV6emxlIHRvCj4gc3VwcG9ydGluZyBtZGV2IG1pZ3JhdGlv
biwgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gY29tbWl0Cj4gdGhpcyB1cHN0
cmVhbSBvbiBpdHMgb3duIHdpdGhvdXQgYWxzbyBkZWZpbmluZyB0aGUgcmVtYWluZGVyIG9mIGhv
dyB3ZQo+IGFjdHVhbGx5IGRvIG1pZ3JhdGlvbiwgcHJlZmVyYWJseSB3aXRoIG1vcmUgdGhhbiBv
bmUgd29ya2luZwo+IGltcGxlbWVudGF0aW9uIGFuZCBhdCBsZWFzdCBwcm90b3R5cGVkLCBpZiBu
b3QgZmluYWwsIFFFTVUgc3VwcG9ydC4gIEkKPiBob3BlIHRoYXQgd2FzIHRoZSBpbnRlbnQsIGFu
ZCBtYXliZSBpdCdzIG5vdyB0aW1lIHRvIGxvb2sgYXQgdGhlIG5leHQKPiBwaWVjZSBvZiB0aGUg
cHV6emxlLiAgVGhhbmtzLAo+IAo+IEFsZXgKCkdvdCBpdC4gCkFsc28gdGhhbmsgeW91IGFuZCBh
bGwgZm9yIGRpc2N1c3NpbmcgYW5kIGd1aWRpbmcgYWxsIGFsb25nOikKV2UnbGwgbW92ZSB0byB0
aGUgbmV4dCBlcGlzb2RlIG5vdy4KClRoYW5rcwpZYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
