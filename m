Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E3225634
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Jul 2020 05:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888089FCC;
	Mon, 20 Jul 2020 03:42:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4771989FCC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Jul 2020 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595216532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZ6v8Qo3QLXwwkVnkRqwS4KPkViLK16pSV3DgXs46os=;
 b=CXp3F46fch5Tsfm+hvXsh9YI3RMkiCR+MpnbvWdCtSh80/3huTMp2CyxLixpVdqw3/8hCQ
 lsAXbrTfrBoMfUwXFXkozamDEJKoltFWPpi5DyU3pPk/xIzxbPTCdr4n8WUE8pXEfSbDnh
 FYU56GOrktxttGeZG6/mEq6AHb7vEjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-fHIGCciNPr2PUyvRCJqAxA-1; Sun, 19 Jul 2020 23:42:11 -0400
X-MC-Unique: fHIGCciNPr2PUyvRCJqAxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A08B81080;
 Mon, 20 Jul 2020 03:42:08 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E58B66842F;
 Mon, 20 Jul 2020 03:41:48 +0000 (UTC)
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Alex Williamson <alex.williamson@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <9bfa8700-91f5-ebb4-3977-6321f0487a63@redhat.com>
 <20200716083230.GA25316@joy-OptiPlex-7040> <20200717101258.65555978@x1.home>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <95c13c9b-daab-469b-f244-a0f741f1b41d@redhat.com>
Date: Mon, 20 Jul 2020 11:41:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717101258.65555978@x1.home>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 kevin.tian@intel.com, eskultet@redhat.com, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 berrange@redhat.com, cohuck@redhat.com, dinechin@redhat.com, devel@ovirt.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAvNy8xOCDkuIrljYgxMjoxMiwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+IE9uIFRo
dSwgMTYgSnVsIDIwMjAgMTY6MzI6MzAgKzA4MDAKPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRl
bC5jb20+IHdyb3RlOgo+Cj4+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDEyOjE2OjI2UE0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+PiBPbiAyMDIwLzcvMTQg5LiK5Y2INzoyOSwgWWFuIFpo
YW8gd3JvdGU6Cj4+Pj4gaGkgZm9sa3MsCj4+Pj4gd2UgYXJlIGRlZmluaW5nIGEgZGV2aWNlIG1p
Z3JhdGlvbiBjb21wYXRpYmlsaXR5IGludGVyZmFjZSB0aGF0IGhlbHBzIHVwcGVyCj4+Pj4gbGF5
ZXIgc3RhY2sgbGlrZSBvcGVuc3RhY2svb3ZpcnQvbGlidmlydCB0byBjaGVjayBpZiB0d28gZGV2
aWNlcyBhcmUKPj4+PiBsaXZlIG1pZ3JhdGlvbiBjb21wYXRpYmxlLgo+Pj4+IFRoZSAiZGV2aWNl
cyIgaGVyZSBjb3VsZCBiZSBNREVWcywgcGh5c2ljYWwgZGV2aWNlcywgb3IgaHlicmlkIG9mIHRo
ZSB0d28uCj4+Pj4gZS5nLiB3ZSBjb3VsZCB1c2UgaXQgdG8gY2hlY2sgd2hldGhlcgo+Pj4+IC0g
YSBzcmMgTURFViBjYW4gbWlncmF0ZSB0byBhIHRhcmdldCBNREVWLAo+Pj4+IC0gYSBzcmMgVkYg
aW4gU1JJT1YgY2FuIG1pZ3JhdGUgdG8gYSB0YXJnZXQgVkYgaW4gU1JJT1YsCj4+Pj4gLSBhIHNy
YyBNREVWIGNhbiBtaWdyYXRpb24gdG8gYSB0YXJnZXQgVkYgaW4gU1JJT1YuCj4+Pj4gICAgIChl
LmcuIFNJT1YvU1JJT1YgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBjYXNlKQo+Pj4+Cj4+Pj4gVGhl
IHVwcGVyIGxheWVyIHN0YWNrIGNvdWxkIHVzZSB0aGlzIGludGVyZmFjZSBhcyB0aGUgbGFzdCBz
dGVwIHRvIGNoZWNrCj4+Pj4gaWYgb25lIGRldmljZSBpcyBhYmxlIHRvIG1pZ3JhdGUgdG8gYW5v
dGhlciBkZXZpY2UgYmVmb3JlIHRyaWdnZXJpbmcgYSByZWFsCj4+Pj4gbGl2ZSBtaWdyYXRpb24g
cHJvY2VkdXJlLgo+Pj4+IHdlIGFyZSBub3Qgc3VyZSBpZiB0aGlzIGludGVyZmFjZSBpcyBvZiB2
YWx1ZSBvciBoZWxwIHRvIHlvdS4gcGxlYXNlIGRvbid0Cj4+Pj4gaGVzaXRhdGUgdG8gZHJvcCB5
b3VyIHZhbHVhYmxlIGNvbW1lbnRzLgo+Pj4+Cj4+Pj4KPj4+PiAoMSkgaW50ZXJmYWNlIGRlZmlu
aXRpb24KPj4+PiBUaGUgaW50ZXJmYWNlIGlzIGRlZmluZWQgaW4gYmVsb3cgd2F5Ogo+Pj4+Cj4+
Pj4gICAgICAgICAgICAgICAgX18gICAgdXNlcnNwYWNlCj4+Pj4gICAgICAgICAgICAgICAgIC9c
ICAgICAgICAgICAgICBcCj4+Pj4gICAgICAgICAgICAgICAgLyAgICAgICAgICAgICAgICAgXHdy
aXRlCj4+Pj4gICAgICAgICAgICAgICAvIHJlYWQgICAgICAgICAgICAgIFwKPj4+PiAgICAgIF9f
X19fX19fL19fX19fX19fX18gICAgICAgX19fXHwvX19fX19fX19fX19fXwo+Pj4+ICAgICB8IG1p
Z3JhdGlvbl92ZXJzaW9uIHwgICAgIHwgbWlncmF0aW9uX3ZlcnNpb24gfC0tPmNoZWNrIG1pZ3Jh
dGlvbgo+Pj4+ICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gICAgIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLSAgIGNvbXBhdGliaWxpdHkKPj4+PiAgICAgICAgZGV2aWNlIEEgICAgICAgICAgICAgICAg
ICAgIGRldmljZSBCCj4+Pj4KPj4+Pgo+Pj4+IGEgZGV2aWNlIGF0dHJpYnV0ZSBuYW1lZCBtaWdy
YXRpb25fdmVyc2lvbiBpcyBkZWZpbmVkIHVuZGVyIGVhY2ggZGV2aWNlJ3MKPj4+PiBzeXNmcyBu
b2RlLiBlLmcuICgvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIuMC8kbWRldl9VVUlE
L21pZ3JhdGlvbl92ZXJzaW9uKS4KPj4+Cj4+PiBBcmUgeW91IGF3YXJlIG9mIHRoZSBkZXZsaW5r
IGJhc2VkIGRldmljZSBtYW5hZ2VtZW50IGludGVyZmFjZSB0aGF0IGlzCj4+PiBwcm9wb3NlZCB1
cHN0cmVhbT8gSSB0aGluayBpdCBoYXMgbWFueSBhZHZhbnRhZ2VzIG92ZXIgc3lzZnMsIGRvIHlv
dQo+Pj4gY29uc2lkZXIgdG8gc3dpdGNoIHRvIHRoYXQ/Cj4KPiBBZHZhbnRhZ2VzLCBzdWNoIGFz
PwoKCk15IHVuZGVyc3RhbmRpbmcgZm9yIGRldmxpbmsobmV0bGluaykgb3ZlciBzeXNmcyAoc29t
ZSBhcmUgbWVudGlvbmVkIGF0IAp0aGUgdGltZSBvZiB2RFBBIHN5c2ZzIG1nbXQgQVBJIGRpc2N1
c3Npb24pIGFyZToKCi0gZXhpc3RpbmcgdXNlcnMgKE5JQywgY3J5cHRvLCBTQ1NJLCBpYiksIG1h
dHVyZSBhbmQgc3RhYmxlCi0gbXVjaCBiZXR0ZXIgZXJyb3IgcmVwb3J0aW5nIChleHRfYWNrIG90
aGVyIHRoYW4gc3RyaW5nIG9yIGVycm5vKQotIG5hbWVzcGFjZSBhd2FyZQotIGRvIG5vdCBjb3Vw
bGUgd2l0aCBrb2JqZWN0CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
