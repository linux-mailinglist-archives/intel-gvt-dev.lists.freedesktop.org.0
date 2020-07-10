Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5221B922
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jul 2020 17:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60816EC6E;
	Fri, 10 Jul 2020 15:12:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5D6E0CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 Jul 2020 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594393946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMGVZSRXo7baW8lGtzLkE8JQNic6/IT/q58/50/MWpA=;
 b=eyG92M6R1kj3SAtF9RZFhKOhKTTjtZQ8KYtbZQvOI8Ly6l+bXoXD7N1UZ6W/mhN2LcGC15
 eLdAY+RshXdilGBjXVDCcFt28W823iRxWB9aZnIFI1IkIrXt51ovU88YkfdD+QL4Bex8yu
 Cm1pr+GS3ADw6w/j4JC+8+5qtqVa5zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-KXqCn5DjOe6xAnO8huHGwQ-1; Fri, 10 Jul 2020 11:12:20 -0400
X-MC-Unique: KXqCn5DjOe6xAnO8huHGwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32B7A100AA2A;
 Fri, 10 Jul 2020 15:12:19 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD7415C662;
 Fri, 10 Jul 2020 15:12:18 +0000 (UTC)
Date: Fri, 10 Jul 2020 09:12:17 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 0/2] VFIO mdev aggregated resources handling
Message-ID: <20200710091217.7a62b4cc@x1.home>
In-Reply-To: <20200710062958.GB29271@joy-OptiPlex-7040>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200408055824.2378-1-zhenyuw@linux.intel.com>
 <MWHPR11MB1645CC388BF45FD2E6309C3C8C660@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200707190634.4d9055fe@x1.home>
 <MWHPR11MB16454BF5C1BF4D5D22F0B2B38C670@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200708124806.058e33d9@x1.home>
 <MWHPR11MB1645C5033CB813EBD72CE4FD8C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200709112810.6085b7f6@x1.home>
 <MWHPR11MB1645D3E53C055461AB5E8E3C8C650@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20200710062958.GB29271@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBKdWwgMjAyMCAxNDoyOTo1OSArMDgwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBGcmksIEp1bCAxMCwgMjAyMCBhdCAwMjowOTowNkFNICsw
MDAwLCBUaWFuLCBLZXZpbiB3cm90ZToKPiA8Li4uPgo+ID4gPiA+ID4gV2UgYWxzbyBjYW4ndCBl
dmVuIHNlZW0gdG8gYWdyZWUgdGhhdCB0eXBlIGlzIGEgbmVjZXNzYXJ5IHJlcXVpcmVtZW50Cj4g
PiA+ID4gPiBmb3IgY29tcGF0aWJpbGl0eS4gIFlvdXIgZGlzY3Vzc2lvbiBiZWxvdyBvZiBhIHR5
cGUtQSwgd2hpY2ggaXMKPiA+ID4gPiA+IGVxdWl2YWxlbnQgdG8gYSB0eXBlLUIgdy8gYWdncmVn
YXRpb24gc2V0IHRvIHNvbWUgdmFsdWUgaXMgYW4gZXhhbXBsZQo+ID4gPiA+ID4gb2YgdGhpcy4g
IFdlIG1pZ2h0IGFsc28gaGF2ZSBwaHlzaWNhbCBkZXZpY2VzIHdpdGggZXh0ZW5zaW9ucyB0bwo+
ID4gPiA+ID4gc3VwcG9ydCBtaWdyYXRpb24uICBUaGVzZSBjb3VsZCBwb3NzaWJseSBiZSBjb21w
YXRpYmxlIHdpdGggZnVsbCBtZGV2Cj4gPiA+ID4gPiBkZXZpY2VzLiAgV2UgaGF2ZSBubyBpZGVh
IGhvdyBhbiBhZG1pbmlzdHJhdGl2ZSB0b29sIHdvdWxkIGRpc2NvdmVyCj4gPiA+ID4gPiB0aGlz
IG90aGVyIHRoYW4gYW4gZXhoYXVzdGl2ZSBzZWFyY2ggYWNyb3NzIGV2ZXJ5IHBvc3NpYmxlIHRh
cmdldC4KPiA+ID4gPiA+IFRoYXQncyB1Z2x5IGJ1dCBmZWFzaWJsZSB3aGVuIGNvbnNpZGVyaW5n
IGEgc2luZ2xlIHRhcmdldCBob3N0LCBidXQKPiA+ID4gPiA+IGNvbXBsZXRlbHkgdW50ZW5hYmxl
IHdoZW4gY29uc2lkZXJpbmcgYSBkYXRhY2VudGVyLiAgCj4gPiA+ID4KPiA+ID4gPiBJZiBleGhh
dXN0aXZlIHNlYXJjaCBjYW4gYmUgZG9uZSBqdXN0IG9uZS1vZmYgdG8gYnVpbGQgdGhlIGNvbXBh
dGliaWxpdHkKPiA+ID4gPiBkYXRhYmFzZSBmb3IgYWxsIGFzc2lnbmFibGUgZGV2aWNlcyBvbiBl
YWNoIG5vZGUsIHRoZW4gaXQgbWlnaHQgYmUKPiA+ID4gPiBzdGlsbCB0ZW5hYmxlIGluIGRhdGFj
ZW50ZXI/ICAKPiA+ID4gCj4gPiA+IAo+ID4gPiBJJ20gbm90IHN1cmUgd2hhdCAib25lLW9mZiIg
bWVhbnMgcmVsYXRpdmUgdG8gdGhpcyBkaXNjdXNzaW9uLiAgSXMgdGhpcwo+ID4gPiB0cnlpbmcg
dG8gYXJndWUgdGhhdCBpZiBpdCdzIGEgZGlzdHVyYmluZ2x5IGhlYXZ5d2VpZ2h0IG9wZXJhdGlv
biwgYnV0Cj4gPiA+IGEgbWFuYWdlbWVudCB0b29sIG9ubHkgbmVlZHMgdG8gZG8gaXQgb25jZSwg
aXQncyBvaz8gIFdlIHNob3VsZCByZWFsbHkgIAo+ID4gCj4gPiB5ZXMKPiA+ICAgCj4gPiA+IGJl
IGluY2x1ZGluZyBvcGVuc3RhY2sgYW5kIG92aXJ0IGZvbGtzIGluIGFueSBkaXNjdXNzaW9uIGFi
b3V0IHdoYXQKPiA+ID4gbWlnaHQgYmUgYWNjZXB0YWJsZSBhY3Jvc3MgYSBkYXRhY2VudGVyLiAg
SSBjYW4gc29tZXRpbWVzIGdldCBhd2F5IHdpdGgKPiA+ID4gcmVwcmVzZW50aW5nIHdoYXQgbWln
aHQgYmUgZmVhc2libGUgZm9yIGxpYnZpcnQsIGJ1dCB0aGlzIGlzIHRoZSBzb3J0Cj4gPiA+IG9m
IGtub3dsZWRnZSBhbmQgcG9saWN5IGRlY2lzaW9uIHRoYXQgd291bGQgb2NjdXIgYWJvdmUgbGli
dmlydC4gIAo+ID4gCj4gPiBBZ3JlZS4gYW5kIHNpbmNlIHRoaXMgaXMgbW9yZSBhYm91dCBnZW5l
cmFsIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5LAo+ID4gbGV0J3Mgc3RhcnQgbmV3IHRocmVhZCBh
bmQgaW52b2x2ZSBvcGVuc3RhY2svb3ZpcnQgZ3V5cy4gWWFuLCBjYW4geW91Cj4gPiBpbml0aWF0
ZSB0aGlzPwo+ID4gIAo+IHN1cmUuCj4gaGkgQWxleCwKPiBJJ20gbm90IHN1cmUgaWYgYmVsb3cg
bWFpbGxpbmcgbGlzdHMgYXJlIGVub3VnaCBhbmQgYWNjdXJhdGUsCj4gZG8geW91IGtub3cgd2hh
dCBleHRyYSBwZW9wbGUgYW5kIGxpc3RzIEkgbmVlZCB0byBpbnZvbHZlIGluPwo+IAo+IGRldmVs
QG92aXJ0Lm9yZywgb3BlbnN0YWNrLWRpc2N1c3NAbGlzdHMub3BlbnN0YWNrLm9yZywKPiBsaWJ2
aXItbGlzdEByZWRoYXQuY29tCgpZb3UgY291bGQgYWxzbyBpbmNsdWRlCgpEYW5pZWwgUC4gQmVy
cmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPgpTZWFuIE1vb25leSA8c21vb25leUByZWRoYXQu
Y29tPgoKIAo+IEJUVywgSSBmb3VuZCBhIHBhZ2UgYWJvdXQgbGl2ZSBtaWdyYXRpb24gb2YgU1JJ
T1YgZGV2aWNlcyBpbiBvcGVuc3RhY2suCj4gaHR0cHM6Ly9zcGVjcy5vcGVuc3RhY2sub3JnL29w
ZW5zdGFjay9ub3ZhLXNwZWNzL3NwZWNzL3N0ZWluL2FwcHJvdmVkL2xpYnZpcnQtbmV1dHJvbi1z
cmlvdi1saXZlbWlncmF0aW9uLmh0bWwKClNlYW4sIGFib3ZlLCBpcyBpbnZvbHZlZCB3aXRoIHRo
YXQgc3BlY2lmaWNhdGlvbi4gIEFGQUlLIHRoZSBvbmx5CmN1cnJlbnQgbGl2ZSBtaWdyYXRpb24g
b2YgU1ItSU9WIGRldmljZXMgaW52b2x2ZSBmYWlsb3ZlciBhbmQgaG90cGx1Zwp0cmlja2VyeS4g
IFRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldgo=
