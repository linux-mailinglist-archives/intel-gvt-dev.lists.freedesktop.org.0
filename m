Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E84D24AC9D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Aug 2020 03:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B176E0EE;
	Thu, 20 Aug 2020 01:29:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161DE6E0EE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Aug 2020 01:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597886952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mv65M1+t+HPSl/WRfYZMesR9s3J7YwA43eBtlMjfynM=;
 b=dkGib0eY81Kw0+YUS4GeTHdbIwRg4eo9DNtv9g48yRXq9NPnfxTYe333BaXIVPvaHgiA6Z
 GL9p41+xkHne256gk5UGHFnFcSJ+UkMu2aoLcmyySPCZaPy+3YqCC1um2VcXE51fHc0plT
 YnJLuVpKqHccF6V9t6owaba5btFp59A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-LaTnnbhCNFqMxzZ9DpiXdA-1; Wed, 19 Aug 2020 21:29:10 -0400
X-MC-Unique: LaTnnbhCNFqMxzZ9DpiXdA-1
Received: by mail-ed1-f69.google.com with SMTP id c25so260229edx.11
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Aug 2020 18:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mv65M1+t+HPSl/WRfYZMesR9s3J7YwA43eBtlMjfynM=;
 b=tNKIDPfzxQtaXnQeVTUqbykg7BnsUzd5wm/nUCMEO9xcUXyqV9JIkSyL7xPeq8VYLF
 n2M1s2pw3dO/vOLpVewHHNz/GKFYc97Jk6jI0riweezsk2I8jNbC3qkA16n32aOp/3DC
 XDo2TnVb/JjjRRrzUht/uvcGs/tpckzN8RcowkgUTkmVT59zjzlccfqHvX529Cs2Fyq/
 3iI2/p3Igc5vMRCjXBNYc2zYLWnV46Hs5291W3d/Rcto7q3U4uSHhfrL7F1w4GTbgs3S
 vGJBEoOfuRPgtTClvW2kFhtxQRIHOOYWqJcUlMGFvro3p9/8GBfefDmv5Jz81p6tI7HF
 2SwQ==
X-Gm-Message-State: AOAM532dP2d4+36T36GCiYohsR1SOjDiGvp4aFs12S69PT0dJd7MNGlD
 4X45S5q5Y5E0e6GYU2S/2J1GcZRz8EkquHjYLWVZmyzUqXMD5sjcejo6AO1Amc3ggDjzUPh967u
 U4JkLK66VR308/ncBPxbqIqiaNrEpeuAY4A==
X-Received: by 2002:a17:906:4356:: with SMTP id
 z22mr1078923ejm.414.1597886949029; 
 Wed, 19 Aug 2020 18:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoyKfjf0D7MrJMX9479zeQtARXzClfhI3mERBVAU5/JYOmhYh4Jk1gt0aNrlay6m1myoOVsg==
X-Received: by 2002:a17:906:4356:: with SMTP id
 z22mr1078909ejm.414.1597886948787; 
 Wed, 19 Aug 2020 18:29:08 -0700 (PDT)
Received: from pop-os ([51.37.51.98])
 by smtp.gmail.com with ESMTPSA id m12sm287263edv.94.2020.08.19.18.29.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 18:29:08 -0700 (PDT)
Message-ID: <242591bb809b68c618f62fdc93d4f8ae7b146b6d.camel@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
From: Sean Mooney <smooney@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>, Cornelia Huck <cohuck@redhat.com>
Date: Thu, 20 Aug 2020 02:29:07 +0100
In-Reply-To: <20200820003922.GE21172@joy-OptiPlex-7040>
References: <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
 <20200818091628.GC20215@redhat.com>
 <20200818113652.5d81a392.cohuck@redhat.com>
 <20200820003922.GE21172@joy-OptiPlex-7040>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0.501
X-Mimecast-Originator: redhat.com
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Parav Pandit <parav@mellanox.com>,
 jian-feng.ding@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 hejie.xu@intel.com, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 eskultet@redhat.com, Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com,
 devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA4LTIwIGF0IDA4OjM5ICswODAwLCBZYW4gWmhhbyB3cm90ZToKPiBPbiBU
dWUsIEF1ZyAxOCwgMjAyMCBhdCAxMTozNjo1MkFNICswMjAwLCBDb3JuZWxpYSBIdWNrIHdyb3Rl
Ogo+ID4gT24gVHVlLCAxOCBBdWcgMjAyMCAxMDoxNjoyOCArMDEwMAo+ID4gRGFuaWVsIFAuIEJl
cnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gT24gVHVlLCBB
dWcgMTgsIDIwMjAgYXQgMDU6MDE6NTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4g
PiAgICBPbiAyMDIwLzgvMTgg5LiL5Y2INDo1NSwgRGFuaWVsIFAuIEJlcnJhbmfDqSB3cm90ZToK
PiA+ID4gPiAKPiA+ID4gPiAgT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MjQ6MzBBTSArMDgw
MCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiAgT24gMjAyMC84LzE0IOS4i+WN
iDE6MTYsIFlhbiBaaGFvIHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+ICBPbiBUaHUsIEF1ZyAxMywg
MjAyMCBhdCAxMjoyNDo1MFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+IAo+ID4g
PiA+ICBPbiAyMDIwLzgvMTAg5LiL5Y2IMzo0NiwgWWFuIFpoYW8gd3JvdGU6ICAKPiA+ID4gPiAg
d2UgYWN0dWFsbHkgY2FuIGFsc28gcmV0cmlldmUgdGhlIHNhbWUgaW5mb3JtYXRpb24gdGhyb3Vn
aCBzeXNmcywgLmUuZwo+ID4gPiA+IAo+ID4gPiA+ICB8LSBbcGF0aCB0byBkZXZpY2VdCj4gPiA+
ID4gICAgIHwtLS0gbWlncmF0aW9uCj4gPiA+ID4gICAgIHwgICAgIHwtLS0gc2VsZgo+ID4gPiA+
ICAgICB8ICAgICB8ICAgfC0tLWRldmljZV9hcGkKPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLW1k
ZXZfdHlwZQo+ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+
ICAgICB8ICAgIHwgICB8LS0tZGV2aWNlX2lkCj4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1hZ2dy
ZWdhdG9yCj4gPiA+ID4gICAgIHwgICAgIHwtLS0gY29tcGF0aWJsZQo+ID4gPiA+ICAgICB8ICAg
ICB8ICAgfC0tLWRldmljZV9hcGkKPiA+ID4gPiAgICAgfCAgICB8ICAgfC0tLW1kZXZfdHlwZQo+
ID4gPiA+ICAgICB8ICAgIHwgICB8LS0tc29mdHdhcmVfdmVyc2lvbgo+ID4gPiA+ICAgICB8ICAg
IHwgICB8LS0tZGV2aWNlX2lkCj4gPiA+ID4gICAgIHwgICAgfCAgIHwtLS1hZ2dyZWdhdG9yCj4g
PiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gIFllcyBidXQ6Cj4gPiA+ID4gCj4gPiA+ID4gIC0gWW91
IG5lZWQgb25lIGZpbGUgcGVyIGF0dHJpYnV0ZSAob25lIHN5c2NhbGwgZm9yIG9uZSBhdHRyaWJ1
dGUpCj4gPiA+ID4gIC0gQXR0cmlidXRlIGlzIGNvdXBsZWQgd2l0aCBrb2JqZWN0Cj4gPiAKPiA+
IElzIHRoYXQgcmVhbGx5IHRoYXQgYmFkPyBZb3UgaGF2ZSB0aGUgZGV2aWNlIHdpdGggYW4gZW1i
ZWRkZWQga29iamVjdAo+ID4gYW55d2F5LCBhbmQgeW91IGNhbiBqdXN0IHB1dCB0aGluZ3MgaW50
byBhbiBhdHRyaWJ1dGUgZ3JvdXA/Cj4gPiAKPiA+IFtBbHNvLCBJIHRoaW5rIHRoYXQgc2VsZi9j
b21wYXRpYmxlIHNwbGl0IGluIHRoZSBleGFtcGxlIG1ha2VzIHRoaW5ncwo+ID4gbmVlZGxlc3Ns
eSBjb21wbGV4LiBTaG91bGRuJ3Qgc2VtYW50aWMgdmVyc2lvbmluZyBhbmQgbWF0Y2hpbmcgYWxy
ZWFkeQo+ID4gY292ZXIgbmVhcmx5IGV2ZXJ5dGhpbmc/IEkgd291bGQgZXhwZWN0IHZlcnkgZmV3
IGNhc2VzIHRoYXQgYXJlIG1vcmUKPiA+IGNvbXBsZXggdGhhbiB0aGF0LiBNYXliZSB0aGUgYWdn
cmVnYXRpb24gc3R1ZmYsIGJ1dCBJIGRvbid0IHRoaW5rIHdlCj4gPiBuZWVkIHRoYXQgc2VsZi9j
b21wYXRpYmxlIHNwbGl0IGZvciB0aGF0LCBlaXRoZXIuXQo+IAo+IEhpIENvcm5lbGlhLAo+IAo+
IFRoZSByZWFzb24gSSB3YW50IHRvIGRlY2xhcmUgY29tcGF0aWJsZSBsaXN0IG9mIGF0dHJpYnV0
ZXMgaXMgdGhhdAo+IHNvbWV0aW1lcyBpdCdzIG5vdCBhIHNpbXBsZSAxOjEgbWF0Y2hpbmcgb2Yg
c291cmNlIGF0dHJpYnV0ZXMgYW5kIHRhcmdldCBhdHRyaWJ1dGVzCj4gYXMgSSBkZW1vbnN0cmF0
ZWQgYmVsb3csCj4gc291cmNlIG1kZXYgb2YgKG1kZXZfdHlwZSBpOTE1LUdWVGdfVjVfMiArIGFn
Z3JlZ2F0b3IgMSkgaXMgY29tcGF0aWJsZSB0bwo+IHRhcmdldCBtZGV2IG9mIChtZGV2X3R5cGUg
aTkxNS1HVlRnX1Y1XzQgKyBhZ2dyZWdhdG9yIDIpLAo+ICAgICAgICAgICAgICAgIChtZGV2X3R5
cGUgaTkxNS1HVlRnX1Y1XzggKyBhZ2dyZWdhdG9yIDQpCnRoZSB3YXkgeW91IGFyZSBkb2luZyB0
aGUgbmFtZWluZyBpcyB0aWxsIHJlYWxseSBjb25mdXNpbmcgYnkgdGhlIHdheQppZiB0aGlzIGhh
cyBub3QgYWxyZWFkeSBiZWVuIG1lcmdlZCBpbiB0aGUga2VybmVsIGNhbiB5b3UgY2hhZ25lIHRo
ZSBtZGV2CnNvIHRoYXQgbWRldl90eXBlIGk5MTUtR1ZUZ19WNV8yIGlzIDIgb2YgbWRldl90eXBl
IGk5MTUtR1ZUZ19WNV8xIGluc3RlYWQgb2YgaGFsZiB0aGUgZGV2aWNlCgpjdXJyZW50bHkgeW91
IG5lZWQgdG8gZGVpdmVkIHRoZSBhZ2dyYXRvZCBieSB0aGUgbnVtYmVyIGF0IHRoZSBlbmQgb2Yg
dGhlIG1kZXYgdHlwZSB0byBmaWd1cmUgb3V0CmhvdyBtdWNoIG9mIHRoZSBwaHNpY2lhbCBkZXZp
Y2UgaXMgYmVpbmcgdXNlZCB3aXRoIGlzIGEgdmVyeSB1bmZyaWRseSBhcGkgY29udmVudGlvbgoK
dGhlIHdheSBhZ2dyYXRvciBhcmUgYmVpbmcgcHJvcG9zZWQgaW4gZ2VuZXJhbCBpcyBub3QgcmVh
bGx5IHNvbWV0aW5nIGkgbGlrZSBidXQgaSB0aGluIHRoaXMgYXQgbGVhc3QKaXMgc29tZXRoaW5n
IHRoYXQgc2hvdWxkIGJlIGFibGUgdG8gY29ycmVjdC4KCndpdGggdGhlIGNvbXBsZXhpdHkgaW4g
dGhlIG1kZXYgdHlwZSBuYW1lICsgYWdncmF0b3IgaSBzdXNwZWN0IHRoYXQgdGhpcyB3aWxsIG5l
dmVyIGJlIHN1cHBvcnQKaW4gb3BlbnN0YWNrIG5vdmEgZGlyZWN0bHkgcmVxdWlyZWluZyBpbnRl
Z3JhdGlvbiB2aWEgY3lib3JnIHVubGVzcyB3ZSBjYW4gcHJlIHBhcnRpb24gdGhlCmRldmljZSBp
biB0byBtZGV2cyBzdGFpY2FseSBhbmQganVzdCBpZ25vcmUgdGhpcy4KCnRoaXMgaXMgd2F5IHRv
IHZlbmRvciBzZXBlY2lmIHRvIGludGVncmF0ZSBpbnRvIHNvbWV0aGluZyBsaWtlIG9wZW5zdGFj
ayBpbiBub3ZhIHVubGVzcyB3ZSBjYW4gZ3VhcmVudGVlCnRhaHQgaG93IGFnZ3JlYXRvciB3b3Jr
IHdpbGwgYmUgcG9ydGFibGUgYWNyb3NzIHZlbmRvcnMgZ2VuZXJpY2x5LgoKPiAKPiBhbmQgYWdn
cmFnYXRvciBtYXkgYmUganVzdCBvbmUgb2Ygc3VjaCBleGFtcGxlcyB0aGF0IDE6MSBtYXRjaGlu
ZyBkb2VzIG5vdAo+IGZpdC4KZm9yIG9wZW5zdGFjayBub3ZhIGkgZG9udCBzZWUgdXMgc3VwcG9y
dCBhbnl0aGluZyBiZXlvbmQgdGhlIDE6MSBjYXNlIHdoZXJlIHRoZSBtZGV2IHR5cGUgZG9lcyBu
b3QgY2hhbmdlLgoKaSB3b3VkbCByZWFsbHkgcHJlZmVyIGlmIHRoZXJlIHdhcyBqdXN0IG9uZSBt
ZGV2IHR5cGUgdGhhdCByZXBzZW50ZWQgdGhlIG1pbmltYWwgYWxsY2F0YWJsZSB1bml0IGFuZCB0
aGUKYWdncmFnYW90ciB3aGVyZSB1c2VkIHRvIGNyZWF0ZSBjb21wb3N0aW9ucyBvZiB0aGF0LiBp
LmUgaW5zdGFkIG9mIGk5MTUtR1ZUZ19WNV8yIGJlaWduIGhhbGYgdGhlIGRldmljZSwKaGF2ZSAx
IG1kZXYgdHlwZSBpOTE1LUdWVGcgYW5kIGlmIHRoZSBkZXZpY2Ugc3VwcG9ydCA4IG9mIHRoZW0g
dGhlbiB3ZSBjYW4gYWdncmF0ZSA0IG9mIGk5MTUtR1ZUZwoKaWYgeW91IHdhbnQgdG8gaGF2ZSBt
dXBsaWUgbWRldiB0eXBlIHRvIG1vZGVsIHRoZSBkaWZmZXJlbnQgYW1vdXRuIG9mIHRoZSByZXNv
dWNlIGUuZy4gaTkxNS1HVlRnX3NtYWxsIGk5MTUtR1ZUZ19sYXJnZQp0aGF0IGlzIHRvdGxhbHkg
ZmluZSB0b28gb3IgZXZlbiBpOTE1LUdWVGdfNCBpbmRjYXRpbmcgaXQgc2lzIDQgb2YgaTkxNS1H
VlRnCgpmYWlsaW5nIHRoYXQgaSB3b3VsZCBqdXN0IGV4cG9zZSBhbiBtZGV2IHR5cGUgcGVyIGNv
bXBvc2FibGUgcmVzb3VjZSBhbmQgYWxsb3cgdXMgdG8gY29tcG9zZSB0aGVtIGEgdGhlIHVzZXIg
bGV2ZWwgd2l0aApzb21lIG90aGVyIGNvbnN0cnVjdCBtdWRlbGluZyBhIGF0dGFtZW50IHRvIHRo
ZSBkZXZpY2UuIGUuZy4gY3JlYXRlIGNvbXBvc2VkIG1kZXYgb3Igc29tZXRoaWcgdGhhdCBpcyBh
biBhZ2dyZWF0ZWlvbiBvZgptdWx0aXBsZSBzdWIgcmVzb3VjZXMgZWFjaCBvZiB3aGljaCBpcyBh
biBtZGV2LiBzbyBraW5kIG9mIGxpa2UgaG93IGJvbmQgcG9ydCB3b3JrLiB3ZSB3b3VsZCBjcmVh
dGUgYW4gbWRldiBmb3IgZWFjaCBvZgp0aGUgc3ViIHJlc291Y2VzIGFuZCB0aGVuIGNyZWF0ZSBh
IGJvbmQgb3IgYWdncmF0ZWQgbWRldiBieSByZWZlcmVuY2UgdGhlIG90aGVyIG1kZXZzIGJ5IHV1
aWQgdGhlbiBhdHRhY2ggb25seSB0aGUKYWdncmVhdGVkIG1kZXYgdG8gdGhlIGluc3RhbmNlLgoK
dGhlIGN1cnJlbnQgYWdncmF0b3Igc3ludGF4IGFuZCBzZW1hdGljIGhvd2V2ZXIgbWFrZSBtZSBy
YXRoZXIgdW5jb2Zyb3RhYmxlIHdoZW4gaSB0aGluayBhYm91dCBvcmNoZXN0YXRpbmcgdm1zIG9u
IHRvcApvZiBpdCBldmVuIHRvIGJvb3QgdGhlbSBsZXQgYWxvbmUgbWlncmF0ZSB0aGVtLgo+IAo+
IFNvLCB3ZSBleHBsaWNpdGx5IGxpc3Qgb3V0IHNlbGYvY29tcGF0aWJsZSBhdHRyaWJ1dGVzLCBh
bmQgbWFuYWdlbWVudAo+IHRvb2xzIG9ubHkgbmVlZCB0byBjaGVjayBpZiBzZWxmIGF0dHJpYnV0
ZXMgaXMgY29udGFpbmVkIGNvbXBhdGlibGUKPiBhdHRyaWJ1dGVzLgo+IAo+IG9yIGRvIHlvdSBt
ZWFuIG9ubHkgY29tcGF0aWJsZSBsaXN0IGlzIGVub3VnaCwgYW5kIHRoZSBtYW5hZ2VtZW50IHRv
b2xzCj4gbmVlZCB0byBmaW5kIG91dCBzZWxmIGxpc3QgYnkgdGhlbXNlbHZlcz8KPiBCdXQgSSB0
aGluayBwcm92aWRlIGEgc2VsZiBsaXN0IGlzIGVhc2llciBmb3IgbWFuYWdlbWVudCB0b29scy4K
PiAKPiBUaGFua3MKPiBZYW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
