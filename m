Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F7247CB6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 05:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927189CE3;
	Tue, 18 Aug 2020 03:25:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA39789CE3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597721107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NN8cpkmmzd+gIshGfVJZRN/csbLtvOwEsIlzPP5rJmg=;
 b=LfiRjYxDyIYSeg2kgzg27ZBuiXG/Q3RbNWhIK1hbbo9PS6xE5ndynTRrvbPUF7iCqcTyfU
 W9fRsPzf2ZgmTJ6G2FN55qNzMF5NwNfJILmdh4Rlj+IrqMLk7pxktjJA5Ml+rcdS91AR4Y
 4UuTruwm33NeWBVPhuA7lTgUFY6GNQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Kx5BTRbaMhu7ueNFw8QxKA-1; Mon, 17 Aug 2020 23:24:52 -0400
X-MC-Unique: Kx5BTRbaMhu7ueNFw8QxKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474AB18686C6;
 Tue, 18 Aug 2020 03:24:50 +0000 (UTC)
Received: from [10.72.13.202] (ovpn-13-202.pek2.redhat.com [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4EA65D9D2;
 Tue, 18 Aug 2020 03:24:31 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Yan Zhao <yan.y.zhao@intel.com>
References: <20200804183503.39f56516.cohuck@redhat.com>
 <c178a0d3-269d-1620-22b1-9010f602d8ff@redhat.com>
 <20200805021654.GB30485@joy-OptiPlex-7040>
 <2624b12f-3788-7e2b-2cb7-93534960bcb7@redhat.com>
 <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040> <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
Date: Tue, 18 Aug 2020 11:24:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814051601.GD15344@joy-OptiPlex-7040>
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, eskultet@redhat.com,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, berrange@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvOC8xNCDkuIvljYgxOjE2LCBZYW4gWmhhbyB3cm90ZToKPiBPbiBUaHUsIEF1ZyAx
MywgMjAyMCBhdCAxMjoyNDo1MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDIw
LzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6Cj4+Pj4gZHJpdmVyIGlzIGl0IGhhbmRs
ZWQgYnk/Cj4+PiBJdCBsb29rcyB0aGF0IHRoZSBkZXZsaW5rIGlzIGZvciBuZXR3b3JrIGRldmlj
ZSBzcGVjaWZpYywgYW5kIGluCj4+PiBkZXZsaW5rLmgsIGl0IHNheXMKPj4+IGluY2x1ZGUvdWFw
aS9saW51eC9kZXZsaW5rLmggLSBOZXR3b3JrIHBoeXNpY2FsIGRldmljZSBOZXRsaW5rCj4+PiBp
bnRlcmZhY2UsCj4+Cj4+IEFjdHVhbGx5IG5vdCwgSSB0aGluayB0aGVyZSB1c2VkIHRvIGhhdmUg
c29tZSBkaXNjdXNzaW9uIGxhc3QgeWVhciBhbmQgdGhlCj4+IGNvbmNsdXNpb24gaXMgdG8gcmVt
b3ZlIHRoaXMgY29tbWVudC4KPj4KPj4gSXQgc3VwcG9ydHMgSUIgYW5kIHByb2JhYmx5IHZEUEEg
aW4gdGhlIGZ1dHVyZS4KPj4KPiBobW0uLi4gc29ycnksIEkgZGlkbid0IGZpbmQgdGhlIHJlZmVy
cmVkIGRpc2N1c3Npb24uIG9ubHkgYmVsb3cgZGlzY3Vzc2lvbgo+IHJlZ2FyZGluZyB0byB3aHkg
dG8gYWRkIGRldmxpbmsuCj4KPiBodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL25ldGRldkB2
Z2VyLmtlcm5lbC5vcmcvbXNnOTU4MDEuaHRtbAo+IAk+VGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUg
dG9vIG11Y2ggcmVsYXRlZCB0byBuZXR3b3JraW5nPyBXaHkgY2FuJ3Qgc29tZXRoaW5nCj4gCT5s
aWtlIHRoaXMgYmUgaW4gc3lzZnM/Cj4gCQo+IAlJdCBpcyByZWxhdGVkIHRvIG5ldHdvcmtpbmcg
cXVpdGUgYml0LiBUaGVyZSBoYXMgYmVlbiBjb3VwbGUgb2YKPiAJaXRlcmF0aW9uIG9mIHRoaXMs
IGluY2x1ZGluZyBzeXNmcyBhbmQgY29uZmlnZnMgaW1wbGVtZW50YXRpb25zLiBUaGVyZQo+IAlo
YXMgYmVlbiBhIGNvbnNlbnN1cyByZWFjaGVkIHRoYXQgdGhpcyBzaG91bGQgYmUgZG9uZSBieSBu
ZXRsaW5rLiBJCj4gCWJlbGlldmUgbmV0bGluayBpcyByZWFsbHkgdGhlIGJlc3QgZm9yIHRoaXMg
cHVycG9zZS4gU3lzZnMgaXMgbm90IGEgZ29vZAo+IAlpZGVhCgoKU2VlIHRoZSBkaXNjdXNzaW9u
IGhlcmU6CgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbmV0ZGV2L3BhdGNo
LzIwMTkxMTE1MjIzMzU1LjEyNzcxMzktMS1qZWZmcmV5LnQua2lyc2hlckBpbnRlbC5jb20vCgoK
Pgo+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vbmV0ZGV2QHZnZXIua2VybmVsLm9yZy9t
c2c5NjEwMi5odG1sCj4gCT50aGVyZSBpcyBhbHJlYWR5IGEgd2F5IHRvIGNoYW5nZSBldGgvaWIg
dmlhCj4gCT5lY2hvICdldGgnID4gL3N5cy9idXMvcGNpL2RyaXZlcnMvbWx4NF9jb3JlLzAwMDA6
MDI6MDAuMC9tbHg0X3BvcnQxCj4gCT4KPiAJPnNvdW5kcyBsaWtlIHRoaXMgaXMgYW5vdGhlciB3
YXkgdG8gYWNoaWV2ZSB0aGUgc2FtZT8KPiAJCj4gCUl0IGlzLiBIb3dldmVyIHRoZSBjdXJyZW50
IHdheSBpcyBkcml2ZXItc3BlY2lmaWMsIG5vdCBjb3JyZWN0Lgo+IAlGb3IgbWx4NSwgd2UgbmVl
ZCB0aGUgc2FtZSwgaXQgY2Fubm90IGJlIGRvbmUgaW4gdGhpcyB3YXkuIERvIGRldmxpbmsgaXMK
PiAJdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLgo+Cj4gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzY3
NDg2Ny8KPiAJVGhlcmUgYSBpcyBuZWVkIGZvciBzb21lIHVzZXJzcGFjZSBBUEkgdGhhdCB3b3Vs
ZCBhbGxvdyB0byBleHBvc2UgdGhpbmdzCj4gCXRoYXQgYXJlIG5vdCBkaXJlY3RseSByZWxhdGVk
IHRvIGFueSBkZXZpY2UgY2xhc3MgbGlrZSBuZXRfZGV2aWNlIG9mCj4gCWliX2RldmljZSwgYnV0
IHJhdGhlciBjaGlwLXdpZGUvc3dpdGNoLUFTSUMtd2lkZSBzdHVmZi4KPgo+IAlVc2UgY2FzZXM6
Cj4gCTEpIGdldC9zZXQgb2YgcG9ydCB0eXBlIChFdGhlcm5ldC9JbmZpbmlCYW5kKQo+IAkyKSBt
b25pdG9yaW5nIG9mIGhhcmR3YXJlIG1lc3NhZ2VzIHRvIGFuZCBmcm9tIGNoaXAKPiAJMykgc2V0
dGluZyB1cCBwb3J0IHNwbGl0dGVycyAtIHNwbGl0IHBvcnQgaW50byBtdWx0aXBsZSBvbmVzIGFu
ZCBzcXVhc2ggYWdhaW4sCj4gCSAgIGVuYWJsZXMgdXNhZ2Ugb2Ygc3BsaXR0ZXIgY2FibGUKPiAJ
NCkgc2V0dGluZyB1cCBzaGFyZWQgYnVmZmVycyAtIHNoYXJlZCBhbW9uZyBtdWx0aXBsZSBwb3J0
cyB3aXRoaW4gb25lIGNoaXAKPgo+Cj4KPiB3ZSBhY3R1YWxseSBjYW4gYWxzbyByZXRyaWV2ZSB0
aGUgc2FtZSBpbmZvcm1hdGlvbiB0aHJvdWdoIHN5c2ZzLCAuZS5nCj4KPiB8LSBbcGF0aCB0byBk
ZXZpY2VdCj4gICAgfC0tLSBtaWdyYXRpb24KPiAgICB8ICAgICB8LS0tIHNlbGYKPiAgICB8ICAg
ICB8ICAgfC0tLWRldmljZV9hcGkKPiAgICB8CXwgICB8LS0tbWRldl90eXBlCj4gICAgfAl8ICAg
fC0tLXNvZnR3YXJlX3ZlcnNpb24KPiAgICB8CXwgICB8LS0tZGV2aWNlX2lkCj4gICAgfAl8ICAg
fC0tLWFnZ3JlZ2F0b3IKPiAgICB8ICAgICB8LS0tIGNvbXBhdGlibGUKPiAgICB8ICAgICB8ICAg
fC0tLWRldmljZV9hcGkKPiAgICB8CXwgICB8LS0tbWRldl90eXBlCj4gICAgfAl8ICAgfC0tLXNv
ZnR3YXJlX3ZlcnNpb24KPiAgICB8CXwgICB8LS0tZGV2aWNlX2lkCj4gICAgfAl8ICAgfC0tLWFn
Z3JlZ2F0b3IKPgoKWWVzIGJ1dDoKCi0gWW91IG5lZWQgb25lIGZpbGUgcGVyIGF0dHJpYnV0ZSAo
b25lIHN5c2NhbGwgZm9yIG9uZSBhdHRyaWJ1dGUpCi0gQXR0cmlidXRlIGlzIGNvdXBsZWQgd2l0
aCBrb2JqZWN0CgpBbGwgb2YgYWJvdmUgc2VlbXMgdW5uZWNlc3NhcnkuCgpBbm90aGVyIHBvaW50
LCBhcyB3ZSBkaXNjdXNzZWQgaW4gYW5vdGhlciB0aHJlYWQsIGl0J3MgcmVhbGx5IGhhcmQgdG8g
Cm1ha2Ugc3VyZSB0aGUgYWJvdmUgQVBJIHdvcmsgZm9yIGFsbCB0eXBlcyBvZiBkZXZpY2VzIGFu
ZCBmcmFtZXdvcmtzLiBTbyAKaGF2aW5nIGEgdmVuZG9yIHNwZWNpZmljIEFQSSBsb29rcyBtdWNo
IGJldHRlci4KCgo+Cj4+PiAgICBJIGZlZWwgbGlrZSBpdCdzIG5vdCB2ZXJ5IGFwcHJvcHJpYXRl
IGZvciBhIEdQVSBkcml2ZXIgdG8gdXNlCj4+PiB0aGlzIGludGVyZmFjZS4gSXMgdGhhdCByaWdo
dD8KPj4KPj4gSSB0aGluayBub3QgdGhvdWdoIG1vc3Qgb2YgdGhlIHVzZXJzIGFyZSBzd2l0Y2gg
b3IgZXRoZXJuZXQgZGV2aWNlcy4gSXQKPj4gZG9lc24ndCBwcmV2ZW50IHlvdSBmcm9tIGludmVu
dGluZyBuZXcgYWJzdHJhY3Rpb25zLgo+IHNvIG5lZWQgdG8gcGF0Y2ggZGV2bGluayBjb3JlIGFu
ZCB0aGUgdXNlcnNwYWNlIGRldmxpbmsgdG9vbD8KPiBlLmcuIGRldmxpbmsgbWlncmF0aW9uCgoK
SXQgcXVpdGUgZmxleGlibGUsIHlvdSBjYW4gZXh0ZW5kIGRldmxpbmssIGludmVudCB5b3VyIG93
biBvciBsZXQgbWdtdCAKdG8gZXN0YWJsaXNoIGRldmxpbmsgZGlyZWN0bHkuCgoKPgo+PiBOb3Rl
IHRoYXQgZGV2bGluayBpcyBiYXNlZCBvbiBuZXRsaW5rLCBuZXRsaW5rIGhhcyBiZWVuIHdpZGVs
eSB1c2VkIGJ5Cj4+IHZhcmlvdXMgc3Vic3lzdGVtcyBvdGhlciB0aGFuIG5ldHdvcmtpbmcuCj4g
dGhlIGFkdmFudGFnZSBvZiBuZXRsaW5rIEkgc2VlIGlzIHRoYXQgaXQgY2FuIG1vbml0b3IgZGV2
aWNlIHN0YXR1cyBhbmQKPiBub3RpZnkgdXBwZXIgbGF5ZXIgdGhhdCBtaWdyYXRpb24gZGF0YWJh
c2UgbmVlZHMgdG8gZ2V0IHVwZGF0ZWQuCgoKSSBtYXkgbWlzcyBzb21ldGhpbmcsIGJ1dCB3aHkg
dGhpcyBpcyBuZWVkZWQ/CgogRnJvbSBkZXZpY2UgcG9pbnQgb2YgdmlldywgdGhlIGZvbGxvd2lu
ZyBjYXBhYmlsaXR5IHNob3VsZCBiZSAKc3VmZmljaWVudCB0byBzdXBwb3J0IGxpdmUgbWlncmF0
aW9uOgoKLSBzZXQvZ2V0IGRldmljZSBzdGF0ZQotIHJlcG9ydCBkaXJ0eSBwYWdlIHRyYWNraW5n
Ci0gc2V0L2dldCBjYXBhYmlsaXR5CgoKPiBCdXQgbm90IHN1cmUgd2hldGhlciBvcGVuc3RhY2sg
d291bGQgbGlrZSB0byB1c2UgdGhpcyBjYXBhYmlsaXR5Lgo+IEFzIFNlYW4gc2FpZCwgaXQncyBo
ZWF2eSBmb3Igb3BlbnN0YWNrLiBpdCdzIGhlYXZ5IGZvciB2ZW5kb3IgZHJpdmVyCj4gYXMgd2Vs
bCA6KQoKCldlbGwsIGl0IGRlcGVuZHMgc2V2ZXJhbCBmYWN0b3JzLiBKdXN0IGNvdW50aW5nIExP
Q3MsIHN5c2ZzIGJhc2VkIAphdHRyaWJ1dGVzIGlzIG5vdCBsaWdodHdlaWdodC4KClRoYW5rcwoK
Cj4KPiBBbmQgZGV2bGluayBtb25pdG9yIG5vdyBsaXN0ZW5zIHRoZSBub3RpZmljYXRpb24gYW5k
IGR1bXBzIHRoZSBzdGF0ZQo+IGNoYW5nZXMuIElmIHdlIHdhbnQgdG8gdXNlIGl0LCBuZWVkIHRv
IGxldCBpdCBmb3J3YXJkIHRoZSBub3RpZmljYXRpb24KPiBhbmQgZHVtcGVkIGluZm8gdG8gb3Bl
bnN0YWNrLCByaWdodD8KPgo+IFRoYW5rcwo+IFlhbgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
