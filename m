Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D634522756B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jul 2020 04:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864FF6E175;
	Tue, 21 Jul 2020 02:11:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7946E175
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Jul 2020 02:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595297509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MGkYyLolwmpjGs18XHJUdlW5jQj9rWopB2tBLoYWfM=;
 b=MeYshFeYerNl1LiFKQCHbop/kDflHNmd52CKWYc/zzBdOXWXZsJ9ahNBnPrB5KILCUPK15
 oLsmVBE2au8SYUThS5tvenfmj5Fmt55u3ru8ZRed2wBHsRpVabv5+sPeiXaPfa/HwbEX04
 PcNzy6iQrb2pRngzD6XRJgTkh5acslE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-LsNWMkKxO_auNxJgu-F5Ig-1; Mon, 20 Jul 2020 22:11:47 -0400
X-MC-Unique: LsNWMkKxO_auNxJgu-F5Ig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E46D580046C;
 Tue, 21 Jul 2020 02:11:44 +0000 (UTC)
Received: from [10.72.13.146] (ovpn-13-146.pek2.redhat.com [10.72.13.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41A436FEE9;
 Tue, 21 Jul 2020 02:11:25 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Sean Mooney <smooney@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040> <20200717101258.65555978@x1.home>
 <95c13c9b-daab-469b-f244-a0f741f1b41d@redhat.com>
 <60d5c1609aaef72f2877aaacff04dc7187e4b3a5.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <22599bc3-cb22-7a62-d463-9a53714def57@redhat.com>
Date: Tue, 21 Jul 2020 10:11:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <60d5c1609aaef72f2877aaacff04dc7187e4b3a5.camel@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: shaohe.feng@intel.com, corbet@lwn.net, kevin.tian@intel.com,
 cohuck@redhat.com, berrange@redhat.com, kvm@vger.kernel.org, devel@ovirt.org,
 libvir-list@redhat.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 qemu-devel@nongnu.org, zhenyuw@linux.intel.com, dgilbert@redhat.com,
 bao.yumeng@zte.com.cn, kwankhede@nvidia.com,
 openstack-discuss@lists.openstack.org, xin-ran.wang@intel.com,
 dinechin@redhat.com, hejie.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 eauger@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvNy8yMCDkuIvljYg2OjM5LCBTZWFuIE1vb25leSB3cm90ZToKPiBPbiBNb24sIDIw
MjAtMDctMjAgYXQgMTE6NDEgKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjAvNy8x
OCDkuIrljYgxMjoxMiwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+Pj4gT24gVGh1LCAxNiBKdWwg
MjAyMCAxNjozMjozMCArMDgwMAo+Pj4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3
cm90ZToKPj4+Cj4+Pj4gT24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMTI6MTY6MjZQTSArMDgwMCwg
SmFzb24gV2FuZyB3cm90ZToKPj4+Pj4gT24gMjAyMC83LzE0IOS4iuWNiDc6MjksIFlhbiBaaGFv
IHdyb3RlOgo+Pj4+Pj4gaGkgZm9sa3MsCj4+Pj4+PiB3ZSBhcmUgZGVmaW5pbmcgYSBkZXZpY2Ug
bWlncmF0aW9uIGNvbXBhdGliaWxpdHkgaW50ZXJmYWNlIHRoYXQgaGVscHMgdXBwZXIKPj4+Pj4+
IGxheWVyIHN0YWNrIGxpa2Ugb3BlbnN0YWNrL292aXJ0L2xpYnZpcnQgdG8gY2hlY2sgaWYgdHdv
IGRldmljZXMgYXJlCj4+Pj4+PiBsaXZlIG1pZ3JhdGlvbiBjb21wYXRpYmxlLgo+Pj4+Pj4gVGhl
ICJkZXZpY2VzIiBoZXJlIGNvdWxkIGJlIE1ERVZzLCBwaHlzaWNhbCBkZXZpY2VzLCBvciBoeWJy
aWQgb2YgdGhlIHR3by4KPj4+Pj4+IGUuZy4gd2UgY291bGQgdXNlIGl0IHRvIGNoZWNrIHdoZXRo
ZXIKPj4+Pj4+IC0gYSBzcmMgTURFViBjYW4gbWlncmF0ZSB0byBhIHRhcmdldCBNREVWLAo+Pj4+
Pj4gLSBhIHNyYyBWRiBpbiBTUklPViBjYW4gbWlncmF0ZSB0byBhIHRhcmdldCBWRiBpbiBTUklP
ViwKPj4+Pj4+IC0gYSBzcmMgTURFViBjYW4gbWlncmF0aW9uIHRvIGEgdGFyZ2V0IFZGIGluIFNS
SU9WLgo+Pj4+Pj4gICAgICAoZS5nLiBTSU9WL1NSSU9WIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
Y2FzZSkKPj4+Pj4+Cj4+Pj4+PiBUaGUgdXBwZXIgbGF5ZXIgc3RhY2sgY291bGQgdXNlIHRoaXMg
aW50ZXJmYWNlIGFzIHRoZSBsYXN0IHN0ZXAgdG8gY2hlY2sKPj4+Pj4+IGlmIG9uZSBkZXZpY2Ug
aXMgYWJsZSB0byBtaWdyYXRlIHRvIGFub3RoZXIgZGV2aWNlIGJlZm9yZSB0cmlnZ2VyaW5nIGEg
cmVhbAo+Pj4+Pj4gbGl2ZSBtaWdyYXRpb24gcHJvY2VkdXJlLgo+Pj4+Pj4gd2UgYXJlIG5vdCBz
dXJlIGlmIHRoaXMgaW50ZXJmYWNlIGlzIG9mIHZhbHVlIG9yIGhlbHAgdG8geW91LiBwbGVhc2Ug
ZG9uJ3QKPj4+Pj4+IGhlc2l0YXRlIHRvIGRyb3AgeW91ciB2YWx1YWJsZSBjb21tZW50cy4KPj4+
Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gKDEpIGludGVyZmFjZSBkZWZpbml0aW9uCj4+Pj4+PiBUaGUgaW50
ZXJmYWNlIGlzIGRlZmluZWQgaW4gYmVsb3cgd2F5Ogo+Pj4+Pj4KPj4+Pj4+ICAgICAgICAgICAg
ICAgICBfXyAgICB1c2Vyc3BhY2UKPj4+Pj4+ICAgICAgICAgICAgICAgICAgL1wgICAgICAgICAg
ICAgIFwKPj4+Pj4+ICAgICAgICAgICAgICAgICAvICAgICAgICAgICAgICAgICBcd3JpdGUKPj4+
Pj4+ICAgICAgICAgICAgICAgIC8gcmVhZCAgICAgICAgICAgICAgXAo+Pj4+Pj4gICAgICAgX19f
X19fX18vX19fX19fX19fXyAgICAgICBfX19cfC9fX19fX19fX19fX19fCj4+Pj4+PiAgICAgIHwg
bWlncmF0aW9uX3ZlcnNpb24gfCAgICAgfCBtaWdyYXRpb25fdmVyc2lvbiB8LS0+Y2hlY2sgbWln
cmF0aW9uCj4+Pj4+PiAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tICAgY29tcGF0aWJpbGl0eQo+Pj4+Pj4gICAgICAgICBkZXZpY2UgQSAgICAgICAg
ICAgICAgICAgICAgZGV2aWNlIEIKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gYSBkZXZpY2UgYXR0cmli
dXRlIG5hbWVkIG1pZ3JhdGlvbl92ZXJzaW9uIGlzIGRlZmluZWQgdW5kZXIgZWFjaCBkZXZpY2Un
cwo+Pj4+Pj4gc3lzZnMgbm9kZS4gZS5nLiAoL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDBc
OjAyLjAvJG1kZXZfVVVJRC9taWdyYXRpb25fdmVyc2lvbikuCj4+Pj4+IEFyZSB5b3UgYXdhcmUg
b2YgdGhlIGRldmxpbmsgYmFzZWQgZGV2aWNlIG1hbmFnZW1lbnQgaW50ZXJmYWNlIHRoYXQgaXMK
Pj4+Pj4gcHJvcG9zZWQgdXBzdHJlYW0/IEkgdGhpbmsgaXQgaGFzIG1hbnkgYWR2YW50YWdlcyBv
dmVyIHN5c2ZzLCBkbyB5b3UKPj4+Pj4gY29uc2lkZXIgdG8gc3dpdGNoIHRvIHRoYXQ/Cj4+PiBB
ZHZhbnRhZ2VzLCBzdWNoIGFzPwo+Pgo+PiBNeSB1bmRlcnN0YW5kaW5nIGZvciBkZXZsaW5rKG5l
dGxpbmspIG92ZXIgc3lzZnMgKHNvbWUgYXJlIG1lbnRpb25lZCBhdAo+PiB0aGUgdGltZSBvZiB2
RFBBIHN5c2ZzIG1nbXQgQVBJIGRpc2N1c3Npb24pIGFyZToKPiBpIHRvdWdodCBuZXRsaW5rIHdh
cyB1c2VkIG1vcmUgYSBhcyBhIGNvbmZpZ3VyYXRpb24gcHJvdG9jb2FsIHRvIHF1cnJ5IGFuZCBj
b25maXJlIG5pYyBhbmQgaSBndWVzcwo+IG90aGVyIGRldmljZXMgaW4gaXRzIGRldmxpbmsgZm9y
bSByZXF1aXJlaW50IGEgdG9vbCB0byBiZSB3aXR0ZW4gdGhhdCBjYW4gc3BlYWsgdGhlIHByb3Rv
Y2FsIHRvIGludGVyYWN0IHdpdGguCj4gdGhlIHByaW1hcnkgYWR2YW50YXRlIG9mIHN5c2ZzIGlz
IHRoYXQgZXZlcnl0aGluZyBpcyBqdXN0IGEgZmlsZS4gdGhlcmUgYXJlIG5vIGFkZHRpb25hbCBk
ZXBsZWVuY2Vpcwo+IG5lZWRlZAoKCldlbGwsIGlmIHlvdSB0cnkgdG8gYnVpbGQgbG9naWMgbGlr
ZSBpbnRyb3NwZWN0aW9uIG9uIHRvcCBmb3IgYSAKc29waGlzdGljYXRlZCBoYXJkd2FyZSwgeW91
IHByb2JhYmx5IG5lZWQgdG8gaGF2ZSBsaWJyYXJ5IG9uIHRvcC4gQW5kIAppdCdzIGF0dHJpYnV0
ZSBwZXIgZmlsZSBpcyBwcmV0dHkgaW5lZmZpY2llbnQuCgoKPiAgIGFuZCB1bmxpa2UgbmV0bGlu
ayB0aGVyZSBhcmUgbm90IGludGVyb3BlcmF0YmxpdHkgaXNzdWVzIGluIGEgY29hbml0bmVyaXNl
ZCBlbnYuIGlmIHlvdSBhcmUgdXNpbmcgZGlmZnJlbmV0Cj4gdmVyc2lvbiBvZiBsaWJjIGFuZCBn
Y2MgaW4gdGhlIGNvbnRhaWVuciB2cyB0aGUgaG9zdCBteSB1bmRlcnN0YW5kaW5nIGlzIHRvb2xz
IGxpa2UgZXRodG9vbCBmcm9tIHVidW50dSBkZXBsb3llZAo+IGluIGEgY29udGFpbmVyIG9uIGEg
Y2VudG9zIGhvc3QgY2FuIGhhdmUgaXNzdWUgY29tbXVuaWNhdGluZyB3aXRoIHRoZSBob3N0IGtl
cm5lbC4KCgpLZXJuZWwgcHJvdmlkZXMgc3RhYmxlIEFCSSBmb3IgdXNlcnNwYWNlLCBzbyBpdCdz
IG5vdCBzb21ldGhpbmcgdGhhdCB3ZSAKY2FuJ3QgZml4LgoKCj4gaWYgaXRzIGpzdXQgYSBmaWxl
IHVubGVzcwo+IHRoZSBmb3JtYXQgdGhlIGRhdGEgaXMgcmV0dXJuaW4gaW4gY2hhZ25lcyBvciB0
aGUgbGF5b3V0IG9mIHN5c2ZzIGNoYW5nZXMgaXRzIGNvbXBhdGlhYmxlIHJlZ2FyZGxlc3Mgb2Yg
d2hhdCB5b3UKPiB1c2UgdG8gcmVhZCBpdC4KCgpJIGJlbGlldmUgeW91IGNhbid0IGNoYW5nZSBz
eXNmcyBsYXlvdXQgd2hpY2ggaXMgcGFydCBvZiB1QUJJLiBCdXQgYXMgSSAKbWVudGlvbmVkIGJl
bG93LCBzeXNmcyBoYXMgc2V2ZXJhbCBkcmF3YmFja3MuIEl0J3Mgbm90IGhhcm0gdG8gY29tcGFy
ZSAKYmV0d2VlbiBkaWZmZXJlbnQgYXBwcm9hY2ggd2hlbiB5b3Ugc3RhcnQgYSBuZXcgZGV2aWNl
IG1hbmFnZW1lbnQgQVBJLgoKVGhhbmtzCgoKPj4gLSBleGlzdGluZyB1c2VycyAoTklDLCBjcnlw
dG8sIFNDU0ksIGliKSwgbWF0dXJlIGFuZCBzdGFibGUKPj4gLSBtdWNoIGJldHRlciBlcnJvciBy
ZXBvcnRpbmcgKGV4dF9hY2sgb3RoZXIgdGhhbiBzdHJpbmcgb3IgZXJybm8pCj4+IC0gbmFtZXNw
YWNlIGF3YXJlCj4+IC0gZG8gbm90IGNvdXBsZSB3aXRoIGtvYmplY3QKPj4KPj4gVGhhbmtzCj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXYK
