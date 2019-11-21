Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE6105530
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Nov 2019 16:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3246F388;
	Thu, 21 Nov 2019 15:19:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7B76F388
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 15:19:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-Q2zaXAXvMGeR6JD2hGzkzQ-1; Thu, 21 Nov 2019 10:19:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E96EDDB20;
 Thu, 21 Nov 2019 15:19:18 +0000 (UTC)
Received: from x1.home (ovpn-116-56.phx2.redhat.com [10.3.116.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9749101F6CE;
 Thu, 21 Nov 2019 15:19:18 +0000 (UTC)
Date: Thu, 21 Nov 2019 08:19:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: KVM/VFIO GVT-g broken on 5.4.0-rc8?
Message-ID: <20191121081918.6b521474@x1.home>
In-Reply-To: <20191121054525.GO4196@zhen-hp.sh.intel.com>
References: <20191120213544.307fc1c4@x1.home>
 <20191121054525.GO4196@zhen-hp.sh.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Q2zaXAXvMGeR6JD2hGzkzQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574349563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yzRyYN9aqsgqz4FK2gXUv2f/Rz/FR+c/F3w3+G5oBI=;
 b=eOUmtlk5uzs3ZpFGJurp94NTsAEDWSDtAQ51ty+Q/BkS0Ph0yMOjKFe6a6xz57I1g+Q7Kk
 BWPQ4WhIfgWPy3tvjaTA8DglFBPJgTgEtEPf818ai6OFm7apPpMZkYh9VuFm69UQxw3PC0
 JcJvXudoj6QM0oX6hgWRZtr+4ooEwVs=
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBOb3YgMjAxOSAxMzo0NToyNSArMDgwMApaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBPbiAyMDE5LjExLjIwIDIxOjM1OjQ0IC0wNzAwLCBB
bGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBJIHdhcyB0cnlpbmcgdG8gdGVzdCBKb2huIEh1YmJh
cmQncyBsYXRlc3QgZ3VwIHNlcmllc1sxXSB3aXRoIEdWVC1nLAo+ID4gYnV0IEknbSB1bmFibGUg
dG8gcnVuIGEgV2luZG93cyAxMCBWTSB3aXRoIGEgaTkxNS1HVlRnX1Y0XzIgb24KPiA+IGFmNDJk
MzQ2NmJkYyAoIkxpbnV4IDUuNC1yYzgiKS4gIFRoZSBob3N0IGtlcm5lbCBwcmludHM6Cj4gPiAK
PiA+IFsgICA2NC40MDI2NzFdIGd2dDogbGVuIGlzIG5vdCB2YWxpZDogIGxlbj0xMSAgdmFsaWRf
bGVuPTMKPiA+IFsgICA2NC40MDc5MzJdIGd2dDogdmdwdSAyOiBNSV9PUF8yRiBoYW5kbGVyIGVy
cm9yCj4gPiBbICAgNjQuNDEyNTAyXSBndnQ6IHZncHUgMjogY21kIHBhcnNlciBlcnJvcgo+ID4g
WyAgIDY0LjQxNjU5MV0gMHgwIAo+ID4gWyAgIDY0LjQxNjU5Ml0gMHgyZiAKPiA+IAo+ID4gWyAg
IDY0LjQyMTkzMF0gZ3Z0OiB2Z3B1IDI6IHNjYW4gd2EgY3R4IGVycm9yCj4gPiBbICAgNjQuNDI2
MDg4XSBHVlQgSW50ZXJuYWwgZXJyb3IgIGZvciB0aGUgZ3Vlc3QKPiA+IFsgICA2NC40MzA0ODZd
IE5vdyB2Z3B1IDIgd2lsbCBlbnRlciBmYWlsc2FmZSBtb2RlLgo+ID4gWyAgIDY0LjQzNTE3OV0g
Z3Z0OiB2Z3B1IDI6IGZhaWxlZCB0byBzdWJtaXQgZGVzYyAwCj4gPiBbICAgNjQuNDM5ODUzXSBn
dnQ6IHZncHUgMjogZmFpbCBzdWJtaXQgd29ya2xvYWQgb24gcmluZyAwCj4gPiBbICAgNjQuNDQ1
MTI1XSBndnQ6IHZncHUgMjogZmFpbCB0byBlbXVsYXRlIE1NSU8gd3JpdGUgMDAwMDIyMzAgbGVu
IDQKPiA+IFsgIDEwMy41MjIxMTddIGd2dDogbGVuIGlzIG5vdCB2YWxpZDogIGxlbj0xMSAgdmFs
aWRfbGVuPTMKPiA+IFsgIDEwMy41Mjc0MTldIGd2dDogdmdwdSAyOiBNSV9PUF8yRiBoYW5kbGVy
IGVycm9yCj4gPiBbICAxMDMuNTMyMDA0XSBndnQ6IHZncHUgMjogY21kIHBhcnNlciBlcnJvcgo+
ID4gWyAgMTAzLjUzNjA2Ml0gMHgwIAo+ID4gWyAgMTAzLjUzNjA2M10gMHgyZiAKPiA+IAo+ID4g
WyAgMTAzLjU0MTM0Ml0gZ3Z0OiB2Z3B1IDI6IHNjYW4gd2EgY3R4IGVycm9yCj4gPiBbICAxMDMu
NTQ1NDY2XSBHVlQgSW50ZXJuYWwgZXJyb3IgIGZvciB0aGUgZ3Vlc3QKPiA+IFsgIDEwMy41NDk4
NjNdIE5vdyB2Z3B1IDIgd2lsbCBlbnRlciBmYWlsc2FmZSBtb2RlLgo+ID4gWyAgMTAzLjU1NDUw
Ml0gZ3Z0OiB2Z3B1IDI6IGZhaWxlZCB0byBzdWJtaXQgZGVzYyAwCj4gPiBbICAxMDMuNTU5MTU2
XSBndnQ6IHZncHUgMjogZmFpbCBzdWJtaXQgd29ya2xvYWQgb24gcmluZyAwCj4gPiBbICAxMDMu
NTY0Mzg4XSBndnQ6IHZncHUgMjogZmFpbCB0byBlbXVsYXRlIE1NSU8gd3JpdGUgMDAwMDIyMzAg
bGVuIDQKPiA+IAo+ID4gQW5kIHRoZSBWTSByZWJvb3RzIGJlZm9yZSByZWFjaGluZyB0aGUgZGVz
a3RvcCwgcG9zc2libHkgd2l0aCBhIEJTT0QuCj4gPiBUaGUgc2FtZSBWTSBjb25maWd1cmF0aW9u
IHdvcmtzIG9uIGhvc3Qga2VybmVsIDUuMy4xMS0yMDAuZmMzMC54ODZfNjQuCj4gPiBEZXZpY2Ug
bWFuYWdlciByZXBvcnRzIEhEIEdyYXBoaWNzIDU1MDAgZHJpdmVyIHZlcnNpb24gMjAuMTkuMTUu
NDYyNCwKPiA+IHdoaWNoIHdhcyBpbnN0YWxsZWQgYnkgV2luZG93cyB1cGRhdGUuICBUaGFua3Ms
Cj4gPiAgIAo+IAo+IEhpLCBBbGV4LCBsb29rcyB0aGlzIHdpbmRvd3MgZHJpdmVyIGlzIG9sZCB3
aGljaCB1dGlsaXplZCBNSV9BVE9NSUMgY29tbWFuZAo+IHRoYXQgdHJpZ2dlciBidWcgaW4gZ3Z0
IGRyaXZlciwgd2hlbiB3ZSB2YWxpZGF0ZWQgbmV3ZXIgdmVyc2lvbiB3aGljaCBkb2Vzbid0Cj4g
dXNlIHRoYXQgY29tbWFuZCBhbnltb3JlIHNvIHdlIGRpZG4ndCBjYXRjaCB0aGF0Lgo+IAo+IENv
dWxkIHlvdSBoZWxwIHRvIHRyeSBiZWxvdyBvbmU/IFNvcnJ5IGZvciBpbmNvbnZlbmllbmNlLi4K
ClllcywgdGhpcyByZXNvbHZlcyBpdC4gIFRoYW5rcywKCkFsZXgKCj4gRnJvbSA5Y2M0NzY4Mzhk
ZWVjZjU0ZWVlOTJjYjAzYWIxMjgyMWNkMGI3YzM4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
IEZyb206IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPiBEYXRlOiBUaHUs
IDIxIE5vdiAyMDE5IDEzOjM3OjA5ICswODAwCj4gU3ViamVjdDogW1BBVENIXSBkcm0vaTkxNS9n
dnQ6IEZpeCBjbWQgbGVuZ3RoIGNoZWNrIGZvciBNSV9BVE9NSUMKPiAKPiBDb3JyZWN0IHZhbGlk
IGNvbW1hbmQgbGVuZ3RoIGNoZWNrIGZvciBNSV9BVE9NSUMsIG5lZWQgdG8gY2hlY2sgaW5saW5l
Cj4gZGF0YSBhdmFpbGFibGUgZmllbGQgaW5zdGVhZCBvZiBvcGVyYW5kIGRhdGEgbGVuZ3RoIGZv
ciB3aG9sZSBjb21tYW5kLgo+IAo+IEZpeGVzOiAwMGEzM2JlNDA2MzQgKCJkcm0vaTkxNS9ndnQ6
IEFkZCB2YWxpZCBsZW5ndGggY2hlY2sgZm9yIE1JIHZhcmlhYmxlIGNvbW1hbmRzIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVu
eXV3QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Nt
ZF9wYXJzZXIuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCj4g
aW5kZXggNmEzYWM4Y2RlOTVkLi4yMWExNzZjZDhhY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMKPiBAQCAtMTU5OSw5ICsxNTk5LDkgQEAgc3RhdGljIGludCBjbWRf
aGFuZGxlcl9taV9vcF8yZihzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCj4gIAlpZiAoIShj
bWRfdmFsKHMsIDApICYgKDEgPDwgMjIpKSkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCS8qIGNo
ZWNrIGlmIFFXT1JEICovCj4gLQlpZiAoRFdPUkRfRklFTEQoMCwgMjAsIDE5KSA9PSAxKQo+IC0J
CXZhbGlkX2xlbiArPSA4Owo+ICsJLyogY2hlY2sgaW5saW5lIGRhdGEgKi8KPiArCWlmIChjbWRf
dmFsKHMsIDApICYgQklUKDE4KSkKPiArCQl2YWxpZF9sZW4gPSBDTURfTEVOKDkpOwo+ICAJcmV0
ID0gZ3Z0X2NoZWNrX3ZhbGlkX2NtZF9sZW5ndGgoY21kX2xlbmd0aChzKSwKPiAgCQkJdmFsaWRf
bGVuKTsKPiAgCWlmIChyZXQpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
