Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459922B737
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 16:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C846E221;
	Mon, 27 May 2019 14:04:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32EF6E221
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 14:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4A91430833B5;
 Mon, 27 May 2019 14:04:37 +0000 (UTC)
Received: from x1.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2777410027C5;
 Mon, 27 May 2019 14:04:31 +0000 (UTC)
Date: Mon, 27 May 2019 08:04:30 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH 1/2] vfio: ABI for setting mdev display flip eventfd
Message-ID: <20190527080430.28f40888@x1.home>
In-Reply-To: <20190527084312.8872-2-tina.zhang@intel.com>
References: <20190527084312.8872-1-tina.zhang@intel.com>
 <20190527084312.8872-2-tina.zhang@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 27 May 2019 14:04:42 +0000 (UTC)
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 hang.yuan@intel.com, kraxel@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSAxNjo0MzoxMSArMDgwMApUaW5hIFpoYW5nIDx0aW5hLnpoYW5n
QGludGVsLmNvbT4gd3JvdGU6Cgo+IEFkZCBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRG
RCBpb2N0bCBjb21tYW5kIHRvIHNldCBldmVudGZkCj4gYmFzZWQgc2lnbmFsaW5nIG1lY2hhbmlz
bSB0byBkZWxpdmVyIHZHUFUgZnJhbWVidWZmZXIgcGFnZSBmbGlwCj4gZXZlbnQgdG8gdXNlcnNw
YWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29t
Pgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMTIgKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gaW5kZXgg
MDJiYjdhZDZlOTg2Li4yNzMwMDU5NzcxN2YgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L3ZmaW8uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiBAQCAtNjk2LDYg
KzY5NiwxOCBAQCBzdHJ1Y3QgdmZpb19kZXZpY2VfaW9ldmVudGZkIHsKPiAgCj4gICNkZWZpbmUg
VkZJT19ERVZJQ0VfSU9FVkVOVEZECQlfSU8oVkZJT19UWVBFLCBWRklPX0JBU0UgKyAxNikKPiAg
Cj4gKy8qKgo+ICsgKiBWRklPX0RFVklDRV9TRVRfR0ZYX0ZMSVBfRVZFTlRGRCAtIF9JT1coVkZJ
T19UWVBFLCBWRklPX0JBU0UgKyAxNywgX19zMzIpCj4gKyAqCj4gKyAqIFNldCBldmVudGZkIGJh
c2VkIHNpZ25hbGluZyBtZWNoYW5pc20gdG8gZGVsaXZlciB2R1BVIGZyYW1lYnVmZmVyIHBhZ2UK
PiArICogZmxpcCBldmVudCB0byB1c2Vyc3BhY2UuIEEgdmFsdWUgb2YgLTEgaXMgdXNlZCB0byBz
dG9wIHRoZSBwYWdlIGZsaXAKPiArICogZGVsaXZlcmluZy4KPiArICoKPiArICogUmV0dXJuOiAw
IG9uIHN1Y2Nlc3MsIC1lcnJubyBvbiBmYWlsdXJlLgo+ICsgKi8KPiArCj4gKyNkZWZpbmUgVkZJ
T19ERVZJQ0VfU0VUX0dGWF9GTElQX0VWRU5URkQgX0lPKFZGSU9fVFlQRSwgVkZJT19CQVNFICsg
MTcpCj4gKwo+ICAvKiAtLS0tLS0tLSBBUEkgZm9yIFR5cGUxIFZGSU8gSU9NTVUgLS0tLS0tLS0g
Ki8KPiAgCj4gIC8qKgoKV2h5IGNhbid0IHdlIHVzZSBWRklPX0RFVklDRV9TRVRfSVJRUyBmb3Ig
dGhpcz8gIFdlIGNhbiBhZGQgYQpjYXBhYmlsaXR5IHRvIHZmaW9faXJxX2luZm8gaW4gdGhlIHNh
bWUgd2F5IHRoYXQgd2UgZGlkIGZvciByZWdpb25zIHRvCmRlc2NyaWJlIGRldmljZSBzcGVjaWZp
YyBJUlEgc3VwcG9ydC4gIFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
