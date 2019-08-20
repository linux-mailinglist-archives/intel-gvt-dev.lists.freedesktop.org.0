Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434B95828
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Aug 2019 09:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AF6E5EF;
	Tue, 20 Aug 2019 07:20:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CF16E5EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Aug 2019 07:20:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD731300BEAD;
 Tue, 20 Aug 2019 07:20:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2783C608A7;
 Tue, 20 Aug 2019 07:20:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6338716E2D; Tue, 20 Aug 2019 09:20:30 +0200 (CEST)
Date: Tue, 20 Aug 2019 09:20:30 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH v5 2/6] vfio: Introduce vGPU display irq type
Message-ID: <20190820072030.kgjjiysxgs3yj25j@sirius.home.kraxel.org>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-3-tina.zhang@intel.com>
 <20190816145148.307408dc@x1.home>
 <237F54289DF84E4997F34151298ABEBC876F9AD3@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC876F9AD3@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 20 Aug 2019 07:20:33 +0000 (UTC)
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, Alex Williamson <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiA+ID4gKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQkJKDEpCj4gPiA+ICsvKgo+ID4gPiAr
ICogdkdQVSB2ZW5kb3Igc3ViLXR5cGUKPiA+ID4gKyAqIHZHUFUgZGV2aWNlIGRpc3BsYXkgcmVs
YXRlZCBpbnRlcnJ1cHRzIGUuZy4gdmJsYW5rL3BhZ2VmbGlwICAqLwo+ID4gPiArI2RlZmluZSBW
RklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUQkJKDEpCj4gPiAKPiA+IElmIHRoaXMgaXMg
YSBHRlgvRElTUExBWSBJUlEsIHdoeSBhcmUgd2UgdGFsa2luZyBhYm91dCBhICJ2R1BVIiBpbiB0
aGUKPiA+IGRlc2NyaXB0aW9uPyAgSXQncyBub3Qgc3BlY2lmaWMgdG8gYSB2R1BVIGltcGxlbWVu
dGF0aW9uLCByaWdodD8gIElzIHRoaXMKPiA+IHJlbGF0ZWQgdG8gYSBwaHlzaWNhbCBkaXNwbGF5
IG9yIGEgdmlydHVhbCBkaXNwbGF5PyAgSWYgaXQncyByZWxhdGVkIHRvIHRoZSBHRlgKPiA+IFBM
QU5FIGlvY3RscywgaXQgc2hvdWxkIHN0YXRlIHRoYXQuICBJdCdzIG5vdCB3ZWxsIHNwZWNpZmll
ZCB3aGF0IHRoaXMgaW50ZXJydXB0Cj4gPiBzaWduYWxzLiAgSXMgaXQgdmJsYW5rPyAgSXMgaXQg
cGFnZWZsaXA/Cj4gPiBJcyBpdCBib3RoPyAgTmVpdGhlcj8gIFNvbWV0aGluZyBlbHNlPwo+IAo+
IFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uIGNhdXNlZCBoZXJlLiAKPiAKPiBUaGUgb3JpZ2luYWwg
aWRlYSBoZXJlIHdhcyB0byB1c2UgVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9JUlEgdG8K
PiBub3RpZnkgdXNlciBzcGFjZSB3aXRoIHRoZSBkaXNwbGF5IHJlZnJlc2ggZXZlbnQuIFRoZSBk
aXNwbGF5IHJlZnJlc2gKPiBldmVudCBpcyBnZW5lcmFsLiBXaGVuIG5vdGlmaWVkLCB1c2VyIHNw
YWNlIGNhbiB1c2UKPiBWRklPX0RFVklDRV9RVUVSWV9HRlhfUExBTkUgYW5kIFZGSU9fREVWSUNF
X0dFVF9HRlhfRE1BQlVGIHRvIGdldCB0aGUKPiB1cGRhdGVkIGZyYW1lYnVmZmVyLCBpbnN0ZWFk
IG9mIHBvbGxpbmcgdGhlbSBhbGwgdGhlIHRpbWUuCj4gCj4gSW4gb3JkZXIgdG8gZ2l2ZSB1c2Vy
IHNwYWNlIG1vcmUgY2hvaWNlIHRvIGRvIHRoZSBvcHRpbWl6YXRpb24sCj4gdmZpb19pcnFfaW5m
b19jYXBfZGlzcGxheV9wbGFuZV9ldmVudHMgaXMgcHJvcG9zZWQgdG8gdGVsbCB1c2VyIHNwYWNl
Cj4gdGhlIGRpZmZlcmVudCBwbGFuZSByZWZyZXNoIGV2ZW50IHZhbHVlcy4gU28gd2hlbiBub3Rp
ZmllZCBieQo+IFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRLCB1c2VyIHNwYWNlIGNh
biBnZXQgdGhlIHZhbHVlIG9mIHRoZQo+IGV2ZW50ZmQgY291bnRlciBhbmQgdW5kZXJzdGFuZCB3
aGljaCBwbGFuZSB0aGUgZXZlbnQgcmVmcmVzaCBldmVudAo+IGNvbWVzIGZyb20gYW5kIGNob29z
ZSB0byBnZXQgdGhlIGZyYW1lYnVmZmVyIG9uIHRoYXQgcGxhbmUgaW5zdGVhZCBvZgo+IGFsbCB0
aGUgcGxhbmVzLgo+IAo+IFNvLCBmcm9tIHRoZSBWRklPIHVzZXIgcG9pbnQgb2YgdmlldywgdGhl
cmUgaXMgb25seSB0aGUgZGlzcGxheQo+IHJlZnJlc2ggZXZlbnQgKGkuZS4gbm8gb3RoZXIgZXZl
bnRzIGxpa2UgdmJsYW5rLCBwYWdlZmxpcCAuLi4pLiBGb3IKPiBHVFYtZywgdGhpcyBkaXNwbGF5
IHJlZnJlc2ggZXZlbnQgaXMgaW1wbGVtZW50ZWQgYnkgYm90aCB2YmxhbmsgYW5kCj4gcGFnZWZs
aXAsIHdoaWNoIGlzIG9ubHkgdGhlIGltcGxlbWVudGF0aW9uIHRoaW5nIGFuZCBjYW4gYmUKPiB0
cmFuc3BhcmVudCB0byB0aGUgdXNlciBzcGFjZS4gQWdhaW4gc29ycnkgYWJvdXQgdGhlIGNvbmZ1
c2lvbiBjYXNlZAo+IGhlcmUsIEknbGwgY29ycmVjdCB0aGUgY29tbWVudHMgaW4gdGhlIG5leHQg
dmVyc2lvbi4KCkFsbCB0aGlzIHNob3VsZCBiZSBleHBsYWluZWQgaW4gYSBjb21tZW50IGZvciB0
aGUgSVJRIGluIHRoZSBoZWFkZXIgZmlsZS4KCktleSBwb2ludCBmb3IgdGhlIEFQSSBpcyB0aGF0
IChhKSB0aGlzIGlzIGEgInRoZSBkaXNwbGF5IHNob3VsZCBiZQp1cGRhdGVkIiBldmVudCBhbmQg
KGIpIHRoaXMgY292ZXJzIGFsbCBkaXNwbGF5IHVwZGF0ZXMsIGkuZS4gdXNlciBzcGFjZQpjYW4g
c3RvcCB0aGUgZGlzcGxheSB1cGRhdGUgdGltZXIgYW5kIGZ1bGx5IGRlcGVuZCBvbiBnZXR0aW5n
Cm5vdGlmaWNhdGlvbnMgaWYgYW4gdXBkYXRlIGlzIG5lZWRlZC4KClRoYXQgR1RWLWcgd2F0Y2hl
cyBndWVzdCBwYWdlZmxpcHMgaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsLiAgU2hvdWxkCm52
aWRpYSBzdXBwb3J0IHRoaXMgdGhleSB3aWxsIHByb2JhYmx5IGRvIHNvbWV0aGluZyBjb21wbGV0
ZWx5CmRpZmZlcmVudC4gIEFzIGZhciBJIGtub3cgdGhleSByZW5kZXIgdGhlIGd1ZXN0IGRpc3Bs
YXkgdG8gc29tZQpmcmFtZWJ1ZmZlciBhdCBzb21ldGhpbmcgbGlrZSAxMGZwcywgc28gaXQgd291
bGQgbWFrZSBzZW5zZSBmb3IgdGhlbSB0bwpzZW5kIGFuIGV2ZW50IGVhY2ggdGltZSB0aGV5IHJl
ZnJlc2hlZCB0aGUgZnJhbWVidWZmZXIuCgpBbHNvIG5vdGUgdGhlIHJlbGF0aW9uc2hpcHMgKGN1
cl9ldmVudF92YWwgaXMgZm9yIERSTV9QTEFORV9UWVBFX0NVUlNPUgp1cGRhdGVzIGFuZCBwcmlf
ZXZlbnRfdmFsIGZvciBEUk1fUExBTkVfVFlQRV9QUklNQVJZKS4KCmNoZWVycywKICBHZXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
