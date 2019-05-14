Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1F1C753
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 May 2019 12:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09E8926F;
	Tue, 14 May 2019 10:57:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082C08926F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 May 2019 10:57:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EBF7FC045770;
 Tue, 14 May 2019 10:57:19 +0000 (UTC)
Received: from beluga.usersys.redhat.com (unknown [10.43.2.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39A211001DE1;
 Tue, 14 May 2019 10:57:07 +0000 (UTC)
Date: Tue, 14 May 2019 12:57:04 +0200
From: Erik Skultety <eskultet@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 1/2] vfio/mdev: add version attribute for mdev device
Message-ID: <20190514105704.GA10926@beluga.usersys.redhat.com>
References: <20190510110838.2df4c4d0.cohuck@redhat.com>
 <20190510093608.GD2854@work-vm>
 <20190510114838.7e16c3d6.cohuck@redhat.com>
 <20190513132804.GD11139@beluga.usersys.redhat.com>
 <20190514061235.GC20407@joy-OptiPlex-7040>
 <20190514072039.GA2089@beluga.usersys.redhat.com>
 <20190514073219.GD20407@joy-OptiPlex-7040>
 <20190514074344.GB2089@beluga.usersys.redhat.com>
 <20190514074736.GE20407@joy-OptiPlex-7040>
 <20190514115135.078bbaf7.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514115135.078bbaf7.cohuck@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 14 May 2019 10:57:20 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Yang, Ziye" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "dinechin@redhat.com" <dinechin@redhat.com>,
 "He, Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6NTE6MzVBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5IDAzOjQ3OjM2IC0wNDAwCj4gWWFuIFpoYW8gPHlh
bi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPgo+ID4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQg
MDM6NDM6NDRQTSArMDgwMCwgRXJpayBTa3VsdGV0eSB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkg
MTQsIDIwMTkgYXQgMDM6MzI6MTlBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6Cj4gPiA+ID4gT24g
VHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6MjA6NDBQTSArMDgwMCwgRXJpayBTa3VsdGV0eSB3cm90
ZToKPgo+ID4gPiA+ID4gVGhhdCBzYWlkLCBmcm9tIGxpYnZpcnQgUE9WIGFzIGEgY29uc3VtZXIs
IEknZCBleHBlY3QgdGhlcmUgdG8gYmUgdHJ1bHkgb25seSAyCj4gPiA+ID4gPiBlcnJvcnMgKEkg
YmVsaWV2ZSBBbGV4IGhhcyBtZW50aW9uZWQgc29tZXRoaW5nIHNpbWlsYXIgaW4gb25lIG9mIGhp
cyByZXNwb25zZXMKPiA+ID4gPiA+IGluIG9uZSBvZiB0aGUgdGhyZWFkcyk6Cj4gPiA+ID4gPiAg
ICAgYSkgcmVhZCBlcnJvciBpbmRpY2F0aW5nIHRoYXQgYW4gbWRldiB0eXBlIGRvZXNuJ3Qgc3Vw
cG9ydCBtaWdyYXRpb24KPiA+ID4gPiA+ICAgICAgICAgLSBJIGFzc3VtZSBpZiBvbmUgdHlwZSBk
b2Vzbid0IHN1cHBvcnQgbWlncmF0aW9uLCBub25lIG9mIHRoZSBvdGhlcgo+ID4gPiA+ID4gICAg
ICAgICAgIHR5cGVzIGV4cG9zZWQgb24gdGhlIHBhcmVudCBkZXZpY2UgZG8sIGlzIHRoYXQgYSBm
YWlyIGFzc3VtcHRpb24/Cj4KPiBQcm9iYWJseTsgYnV0IHRoZXJlIG1pZ2h0IGJlIGNhc2VzIHdo
ZXJlIHRoZSBtaWdyYXRhYmlsaXR5IGRlcGVuZHMgbm90Cj4gb24gdGhlIGRldmljZSB0eXBlLCBi
dXQgaG93IHRoZSBwYXJ0aXRpb25pbmcgaGFzIGJlZW4gZG9uZS4uLiBvciBpcwo+IHRoYXQgdG9v
IGNvbnRyaXZlZD8KCk5vLCB5b3UgaGF2ZSBhIHBvaW50IC0gb25jZSBhZ2FpbiBJIGxldCBteSB0
aG91Z2h0cyBiZSBjYXJyaWVkIGF3YXkgYnkgdGhlIGlkZWEKb2YgaGV0ZXJvZ2VuZW91cyBzZXR1
cHMsIHdoaWNoIGlzIGEgZGlzY3Vzc2lvbiBmb3IgYW5vdGhlciB0aW1lIGFueXdheSwgSSB3YXMK
anVzdCB0aGlua2luZyBvdXQgbG91ZC4KCj4KPiA+ID4gPiA+ICAgICBiKSB3cml0ZSBlcnJvciBp
bmRpY2F0aW5nIHRoYXQgdGhlIG1kZXYgdHlwZXMgYXJlIGluY29tcGF0aWJsZSBmb3IKPiA+ID4g
PiA+ICAgICBtaWdyYXRpb24KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+ID4g
RXJpawo+ID4gPiA+IFRoYW5rcyBmb3IgdGhpcyBleHBsYW5hdGlvbi4KPiA+ID4gPiBzbywgY2Fu
IHdlIGFycml2ZSBhdCBiZWxvdyBhZ3JlZW1lbnRzPwo+ID4gPiA+Cj4gPiA+ID4gMS4gIm5vdCB0
byBkZWZpbmUgdGhlIHNwZWNpZmljIGVycm5vIHJldHVybmVkIGZvciBhIHNwZWNpZmljIHNpdHVh
dGlvbiwKPiA+ID4gPiBsZXQgdGhlIHZlbmRvciBkcml2ZXIgZGVjaWRlLCB1c2Vyc3BhY2Ugc2lt
cGx5IG5lZWRzIHRvIGtub3cgdGhhdCBhbiBlcnJubyBvbgo+ID4gPiA+IHJlYWQgaW5kaWNhdGVz
IHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBtaWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29u
IGFuZAo+ID4gPiA+IHRoYXQgYW4gZXJybm8gb24gd3JpdGUgaW5kaWNhdGVzIHRoZSBkZXZpY2Vz
IGFyZSBpbmNvbXBhdGlibGUgb3IgdGhlIHRhcmdldAo+ID4gPiA+IGRvZXNuJ3Qgc3VwcG9ydCBt
aWdyYXRpb24gdmVyc2lvbnMuICIKPiA+ID4gPiAyLiB2ZW5kb3IgZHJpdmVyIHNob3VsZCBsb2cg
ZGV0YWlsZWQgZXJyb3IgcmVhc29ucyBpbiBrZXJuZWwgbG9nLgo+ID4gPgo+ID4gPiBUaGF0IHdv
dWxkIGJlIG15IHRha2Ugb24gdGhpcywgeWVzLCBidXQgSSBvcGVuIHRvIGhlYXIgYW55IG90aGVy
IHN1Z2dlc3Rpb25zIGFuZAo+ID4gPiBpZGVhcyBJIGNvdWxkbid0IHRoaW5rIG9mIGFzIHdlbGwu
Cj4KPiBTbywgcmVhZCB0byBmaW5kIG91dCB3aGV0aGVyIG1pZ3JhdGlvbiBpcyBzdXBwb3J0ZWQg
YXQgYWxsLCB3cml0ZSB0bwo+IGZpbmQgb3V0IHdoZXRoZXIgaXQgaXMgc3VwcG9ydGVkIGZvciB0
aGF0IGNvbmNyZXRlIHBhaXJpbmcgaXMKPiByZWFzb25hYmxlIGZvciBsaWJ2aXJ0PwoKWWVzLCBt
b3JlIHNwZWNpZmljYWxseSwgaW4gdGhlIHByZXBhcmUgcGhhc2Ugb2YgbWlncmF0aW9uLCB3ZSdk
IHJldHJpZXZlIHRoZQpzdHJpbmcgKHBvdGVudGlhbGx5IHJlcG9ydGluZyBhbiBlcnJvciBsaWtl
OiAiRmFpbGVkIHRvIHF1ZXJ5IG1pZ3JhdGlvbgpzdXBwb3J0OiA8ZXJybm8gdHJhbnNsYXRpb24+
IiksIHB1dCB0aGUgc3RyaW5nIGludG8gdGhlIG1pZ3JhdGlvbiBjb29raWUgYW5kCmRvIHRoZSBj
aGVjayB3aXRoIHdyaXRlIG9uIGRlc3RpbmF0aW9uLiBUaGUgb25seSB0aGluZyBpcyB0aGF0IGlm
IHRoZSBlcnJvciBpcwpvbiB0aGUgZGVzdGluYXRpb24sIHRoZSBlcnJvciBtZXNzYWdlIGluIGtl
cm5lbCBsb2cgbGl2ZXMgb25seSBvbiB0aGUKZGVzdGluYXRpb24sIHdoaWNoIGRvZXNuJ3QgaGVs
cCBsaWJ2aXJ0IHVzZXJzLCBzbyBpdCB3b3VsZCByZXF1aXJlIHNldHRpbmcgdXAKcmVtb3RlIGxv
Z2dpbmcsIGJ1dCBmb3IgbGF5ZXJlZCBwcm9kdWN0cywgdGhpcyBpcyBub3QgYSBwcm9ibGVtIHNp
bmNlIHRob3NlCmFscmVhZHkgdXRpbGl6ZSBjZW50cmFsIGxvZ2dpbmcgbm9kZXMuCgpUaGVuIHRo
ZXJlIGFyZSB0aGUgbGlidmlydC1zcGVjaWZpYyBiaXRzIG91dCBvZiBzY29wZSBvZiB0aGlzIGRp
c2N1c3Npb24sCndoZXRoZXIgd2Ugc2hvdWxkIG9ubHkgYXNzdW1lIGlkZW50aWNhbCBtZGV2IHR5
cGUgcGFpcnMsIG9yIHdoZXRoZXIgd2Ugc2hvdWxkCmVtcGxveSBiZXN0IGVmZm9ydCBhcHByb2Fj
aCBhbmQgaXRlcmF0ZSBvdmVyIGFsbCB0aGUgYXZhaWxhYmxlIHR5cGVzIGV4cG9zZWQgYnkKdGhl
IHZlbmRvciBhbmQgY2hlY2sgd2hldGhlciBhbnkgb2YgdGhlIHR5cGVzIHdvdWxkIHN1cHBvcnQg
dGhpcyBtaWdyYXRpb24KKGJhY2sgdG8geW91ciBub3RlIENvbm5pZSwgcGFydGl0aW9uaW5nIHdv
dWxkIGNvbWUgaW50byB0aGUgcGljdHVyZSBoZXJlKS4KCgo+Cj4gPiA+Cj4gPiA+IEVyaWsKPiA+
IGdvdCBpdC4gdGhhbmtzIGEgbG90IQo+ID4KPiA+IGhpIENvcm5lbGlhIGFuZCBEYXZlLAo+ID4g
ZG8geW91IGFsc28gYWdyZWUgb246Cj4gPiAxLiAibm90IHRvIGRlZmluZSB0aGUgc3BlY2lmaWMg
ZXJybm8gcmV0dXJuZWQgZm9yIGEgc3BlY2lmaWMgc2l0dWF0aW9uLAo+ID4gbGV0IHRoZSB2ZW5k
b3IgZHJpdmVyIGRlY2lkZSwgdXNlcnNwYWNlIHNpbXBseSBuZWVkcyB0byBrbm93IHRoYXQgYW4g
ZXJybm8gb24KPiA+IHJlYWQgaW5kaWNhdGVzIHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBt
aWdyYXRpb24gdmVyc2lvbiBjb21wYXJpc29uIGFuZAo+ID4gdGhhdCBhbiBlcnJubyBvbiB3cml0
ZSBpbmRpY2F0ZXMgdGhlIGRldmljZXMgYXJlIGluY29tcGF0aWJsZSBvciB0aGUgdGFyZ2V0Cj4g
PiBkb2Vzbid0IHN1cHBvcnQgbWlncmF0aW9uIHZlcnNpb25zLiAiCj4gPiAyLiB2ZW5kb3IgZHJp
dmVyIHNob3VsZCBsb2cgZGV0YWlsZWQgZXJyb3IgcmVhc29ucyBpbiBrZXJuZWwgbG9nLgo+Cj4g
VHdvIHF1ZXN0aW9uczoKPiAtIEhvdyByZWFzb25hYmxlIGlzIGl0IHRvIHJlZmVyIHRvIHRoZSBz
eXN0ZW0gbG9nIGluIG9yZGVyIHRvIGZpbmQgb3V0Cj4gICB3aGF0IGV4YWN0bHkgd2VudCB3cm9u
Zz8KPiAtIElmIGRldGFpbGVkIGVycm9yIHJlcG9ydGluZyBpcyBiYXNpY2FsbHkgZG9uZSB0byB0
aGUgc3lzbG9nLCBkbwo+ICAgZGlmZmVyZW50IGVycm9yIGNvZGVzIHN0aWxsIHByb3ZpZGUgdXNl
ZnVsIGluZm9ybWF0aW9uPyBPciBzaG91bGQgdGhlCj4gICB2ZW5kb3IgZHJpdmVyIGRlY2lkZSB3
aGF0IGl0IHdhbnRzIHRvIGRvPwoKSSdkIGxlYXZlIGFueXRoaW5nIGJleW9uZCByZXR1cm5pbmcg
LTEgb24gcmVhZC93cml0ZSBmcm9tL3RvIHRoZSBzeXNmcyB0byB0aGUKdmVuZG9yIGRyaXZlciwg
YXMgdXNlciBzcGFjZSBoYXMgbm8gY29udHJvbCBvdmVyIGl0LCBldmVuIGlmIHRoZXJlIHdhcyBh
CmZhY2lsaXR5IHRvIGludGVycHJldCBkaWZmZXJlbnQgcmV0dXJuIGNvZGVzIGZvciB1cywgSSdt
IG5vdCBzdXJlIChpbiB0aGlzCm1pZ3JhdGlvbi1yZWxhdGVkIGNhc2UpIGhvdyBtdWNoIHdvdWxk
IHVzZXJzcGFjZSBiZSBhYmxlIHRvIHJlY292ZXIgb3IKZmFsbGJhY2sgYW55d2F5LCB5b3UgZWl0
aGVyIGNhbiBvciBjYW5ub3QgbWlncmF0ZSBzbW9vdGhlbHkuCgpSZWdhcmRzLApFcmlrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
