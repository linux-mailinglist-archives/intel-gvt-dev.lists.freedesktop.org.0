Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F395413D2F4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Jan 2020 04:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335336EBC9;
	Thu, 16 Jan 2020 03:58:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484006EBC9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Jan 2020 03:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579147114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fnpkRDpghqTM1NwZ+1iPPc1hcGS89vCuP7+AdZ3c4v4=;
 b=B+Io7wLk17XmFBjzyLs2ttaUbDnHs1BY4+ANJpl4VpuFQoXYHFP4a3LMiFHoudMHyBtwEw
 2NlIW3QGz3Kn3xSjV2zuHTbvNRczw04hAFnWp6edpg4+MKAeAc6d/DHPUvtpxEH9dSij/Y
 i6ZfiMCGBoBvrH8Nr4coHOqYFrhQ6vY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-JWNlj9uUPTWbRf_tHKI_-g-1; Wed, 15 Jan 2020 22:58:32 -0500
X-MC-Unique: JWNlj9uUPTWbRf_tHKI_-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18125183B532;
 Thu, 16 Jan 2020 03:58:31 +0000 (UTC)
Received: from x1.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEA25C28C;
 Thu, 16 Jan 2020 03:58:27 +0000 (UTC)
Date: Wed, 15 Jan 2020 20:58:27 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Mika =?UTF-8?B?UGVudHRpbMOk?= <mika.penttila@nextfour.com>
Subject: Re: [PATCH v2 1/2] vfio: introduce vfio_dma_rw to read/write a
 range of IOVAs
Message-ID: <20200115205827.2249201c@x1.home>
In-Reply-To: <7528cfff-2512-538e-4e44-85f0a0b0130a@nextfour.com>
References: <20200115034132.2753-1-yan.y.zhao@intel.com>
 <20200115035303.12362-1-yan.y.zhao@intel.com>
 <20200115130638.6926dd08@w520.home>
 <80cf3888-2e51-3fd7-a064-213e7ded188e@nextfour.com>
 <20200115195959.28f33078@x1.home>
 <7528cfff-2512-538e-4e44-85f0a0b0130a@nextfour.com>
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 Yan Zhao <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAxNiBKYW4gMjAyMCAwMzoxNTo1OCArMDAwMApNaWthIFBlbnR0aWzDpCA8bWlrYS5w
ZW50dGlsYUBuZXh0Zm91ci5jb20+IHdyb3RlOgoKPiBPbiAxNi4xLjIwMjAgNC41OSwgQWxleCBX
aWxsaWFtc29uIHdyb3RlOgo+ID4gT24gVGh1LCAxNiBKYW4gMjAyMCAwMjozMDo1MiArMDAwMAo+
ID4gTWlrYSBQZW50dGlsw6QgPG1pa2EucGVudHRpbGFAbmV4dGZvdXIuY29tPiB3cm90ZToKPiA+
ICAKPiA+PiBPbiAxNS4xLjIwMjAgMjIuMDYsIEFsZXggV2lsbGlhbXNvbiB3cm90ZTogIAo+ID4+
PiBPbiBUdWUsIDE0IEphbiAyMDIwIDIyOjUzOjAzIC0wNTAwCj4gPj4+IFlhbiBaaGFvIDx5YW4u
eS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPj4+ICAgICAKPiA+Pj4+IHZmaW9fZG1hX3J3IHdp
bGwgcmVhZC93cml0ZSBhIHJhbmdlIG9mIHVzZXIgc3BhY2UgbWVtb3J5IHBvaW50ZWQgdG8gYnkK
PiA+Pj4+IElPVkEgaW50by9mcm9tIGEga2VybmVsIGJ1ZmZlciB3aXRob3V0IHBpbm5pbmcgdGhl
IHVzZXIgc3BhY2UgbWVtb3J5Lgo+ID4+Pj4KPiA+Pj4+IFRPRE86IG1hcmsgdGhlIElPVkFzIHRv
IHVzZXIgc3BhY2UgbWVtb3J5IGRpcnR5IGlmIHRoZXkgYXJlIHdyaXR0ZW4gaW4KPiA+Pj4+IHZm
aW9fZG1hX3J3KCkuCj4gPj4+Pgo+ID4+Pj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwu
Y29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgICBkcml2ZXJzL3ZmaW8vdmZpby5jICAgICAgICAgICAg
IHwgNDUgKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4gICAgZHJpdmVycy92ZmlvL3ZmaW9faW9t
bXVfdHlwZTEuYyB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4g
ICAgaW5jbHVkZS9saW51eC92ZmlvLmggICAgICAgICAgICB8ICA1ICsrKwo+ID4+Pj4gICAgMyBm
aWxlcyBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZmaW8vdmZpby5jIGIvZHJpdmVycy92ZmlvL3ZmaW8uYwo+ID4+Pj4gaW5kZXgg
Yzg0ODI2MjRjYTM0Li44YmQ1MmJjODQxY2YgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9kcml2ZXJzL3Zm
aW8vdmZpby5jCj4gPj4+PiArKysgYi9kcml2ZXJzL3ZmaW8vdmZpby5jCj4gPj4+PiBAQCAtMTk2
MSw2ICsxOTYxLDUxIEBAIGludCB2ZmlvX3VucGluX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwg
dW5zaWduZWQgbG9uZyAqdXNlcl9wZm4sIGludCBucGFnZSkKPiA+Pj4+ICAgIH0KPiA+Pj4+ICAg
IEVYUE9SVF9TWU1CT0wodmZpb191bnBpbl9wYWdlcyk7Cj4gPj4+PiAgICAKPiA+Pj4+ICsvKgo+
ID4+Pj4gKyAqIFJlYWQvV3JpdGUgYSByYW5nZSBvZiBJT1ZBcyBwb2ludGluZyB0byB1c2VyIHNw
YWNlIG1lbW9yeSBpbnRvL2Zyb20gYSBrZXJuZWwKPiA+Pj4+ICsgKiBidWZmZXIgd2l0aG91dCBw
aW5uaW5nIHRoZSB1c2VyIHNwYWNlIG1lbW9yeQo+ID4+Pj4gKyAqIEBkZXYgW2luXSAgOiBkZXZp
Y2UKPiA+Pj4+ICsgKiBAaW92YSBbaW5dIDogYmFzZSBJT1ZBIG9mIGEgdXNlciBzcGFjZSBidWZm
ZXIKPiA+Pj4+ICsgKiBAZGF0YSBbaW5dIDogcG9pbnRlciB0byBrZXJuZWwgYnVmZmVyCj4gPj4+
PiArICogQGxlbiBbaW5dICA6IGtlcm5lbCBidWZmZXIgbGVuZ3RoCj4gPj4+PiArICogQHdyaXRl
ICAgICA6IGluZGljYXRlIHJlYWQgb3Igd3JpdGUKPiA+Pj4+ICsgKiBSZXR1cm4gZXJyb3IgY29k
ZSBvbiBmYWlsdXJlIG9yIDAgb24gc3VjY2Vzcy4KPiA+Pj4+ICsgKi8KPiA+Pj4+ICtpbnQgdmZp
b19kbWFfcncoc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGlvdmEsIHZvaWQgKmRhdGEs
Cj4gPj4+PiArCQkgICBzaXplX3QgbGVuLCBib29sIHdyaXRlKQo+ID4+Pj4gK3sKPiA+Pj4+ICsJ
c3RydWN0IHZmaW9fY29udGFpbmVyICpjb250YWluZXI7Cj4gPj4+PiArCXN0cnVjdCB2ZmlvX2dy
b3VwICpncm91cDsKPiA+Pj4+ICsJc3RydWN0IHZmaW9faW9tbXVfZHJpdmVyICpkcml2ZXI7Cj4g
Pj4+PiArCWludCByZXQgPSAwOyAgCj4gPj4gRG8geW91IGtub3cgdGhlIGlvdmEgZ2l2ZW4gdG8g
dmZpb19kbWFfcncoKSBpcyBpbmRlZWQgYSBncGEgYW5kIG5vdCBpb3ZhCj4gPj4gZnJvbSBhIGlv
bW11IG1hcHBpbmc/IFNvIGlzbid0IGl0IHlvdSBhY3R1YWxseSBhc3N1bWUgYWxsIHRoZSBndWVz
dCBpcwo+ID4+IHBpbm5lZCwKPiA+PiBsaWtlIGZyb20gZGV2aWNlIGFzc2lnbm1lbnQ/Cj4gPj4K
PiA+PiBPciB3aG8gYW5kIGhvdyBpcyB0aGUgdmZpbyBtYXBwaW5nIGFkZGVkIGJlZm9yZSB0aGUg
dmZpb19kbWFfcncoKSA/ICAKPiA+IHZmaW8gb25seSBrbm93cyBhYm91dCBJT1ZBcywgbm90IEdQ
QXMuICBJdCdzIHBvc3NpYmxlIHRoYXQgSU9WQXMgYXJlCj4gPiBpZGVudGl0eSBtYXBwZWQgdG8g
dGhlIEdQQSBzcGFjZSwgYnV0IGEgVk0gd2l0aCBhIHZJT01NVSB3b3VsZCBxdWlja2x5Cj4gPiBi
cmVhayBhbnkgc3VjaCBhc3N1bXB0aW9uLiAgUGlubmluZyBpcyBhbHNvIG5vdCByZXF1aXJlZC4g
IFRoaXMgYWNjZXNzCj4gPiBpcyB2aWEgdGhlIENQVSwgbm90IHRoZSBJL08gZGV2aWNlLCBzbyB3
ZSBkb24ndCByZXF1aXJlIHRoZSBtZW1vcnkgdG8KPiA+IGJlIHBpbm5pbmcgYW5kIGl0IHBvdGVu
dGlhbGx5IHdvbid0IGJlIGZvciBhIG5vbi1JT01NVSBiYWNrZWQgbWVkaWF0ZWQKPiA+IGRldmlj
ZS4gIFRoZSBpbnRlbnRpb24gaGVyZSBpcyB0aGF0IHZpYSB0aGUgbWVkaWF0aW9uIG9mIGFuIG1k
ZXYKPiA+IGRldmljZSwgYSB2ZW5kb3IgZHJpdmVyIHdvdWxkIGFscmVhZHkga25vdyBJT1ZBIHJh
bmdlcyBmb3IgdGhlIGRldmljZQo+ID4gdG8gYWNjZXNzIHZpYSB0aGUgZ3Vlc3QgZHJpdmVyIHBy
b2dyYW1taW5nIG9mIHRoZSBkZXZpY2UuICBUaGFua3MsCj4gPgo+ID4gQWxleCAgCj4gCj4gVGhh
bmtzIEFsZXguLi4geW91IG1lYW4gSU9WQSBpcyBpbiB0aGUgY2FzZSBvZiBpb21tdSBhbHJlYWR5
IGEgCj4gaW9tbXUtdHJhbnNsYXRlZCBhZGRyZXNzIHRvIGEgdXNlciBzcGFjZSBWQSBpbiBWTSBo
b3N0IHNwYWNlPwoKVGhlIHVzZXIgKFFFTVUgaW4gdGhlIGNhc2Ugb2YgZGV2aWNlIGFzc2lnbm1l
bnQpIHBlcmZvcm1zIGlvY3RscyB0byBtYXAKdXNlciBWQXMgdG8gSU9WQXMgZm9yIHRoZSBkZXZp
Y2UuICBXaXRoIElPTU1VIGJhY2tpbmcgdGhlIFZBcyBhcmUKcGlubmVkIHRvIGdldCBIUEEgYW5k
IHRoZSBJT1ZBIHRvIEhQQSBtYXBwaW5ncyBhcmUgcHJvZ3JhbW1lZCBpbnRvIHRoZQpJT01NVS4g
IFRodXMgdGhlIGRldmljZSBhY2Nlc3NlcyB0aGUgSU9WQSB0byBnZXQgdG8gdGhlIEhQQSwgd2hp
Y2ggaXMKdGhlIGJhY2tpbmcgZm9yIHRoZSBWQS4gIEluIHRoaXMgY2FzZSB3ZSdyZSBzaW1wbHkg
dXNpbmcgdGhlIElPVkEgdG8KbG9va3VwIHRoZSBWQSBhbmQgYWNjZXNzIGl0IHdpdGggdGhlIENQ
VSBkaXJlY3RseS4gIFRoZSBJT01NVSBpc24ndAppbnZvbHZlZCwgYnV0IHdlJ3JlIHN0aWxsIHBl
cmZvcm1pbmcgYW4gYWNjZXNzIGFzIGlmIHdlIHdlcmUgdGhlIGRldmljZQpkb2luZyBhIERNQS4g
TGV0IG1lIGtub3cgaWYgdGhhdCBkb2Vzbid0IGFuc3dlciB5b3VyIHF1ZXN0aW9uLgoKPiBIb3cg
ZG9lcyBpdCBnZXQgdG8gaG9sZCBvbiB0aGF0PyBXaGF0IHBpZWNlIG9mIG1lZGl0YXRpb24gaXMg
cmVzcG9uc2libGUgCj4gZm9yIHRoaXM/CgpJdCdzIGRldmljZSBzcGVjaWZpYy4gIFRoZSBtZGV2
IHZlbmRvciBkcml2ZXIgaXMgbWVkaWF0aW5nIGEgc3BlY2lmaWMKaGFyZHdhcmUgZGV2aWNlIHdo
ZXJlIHVzZXIgYWNjZXNzZXMgdG8gTU1JTyBvbiB0aGUgZGV2aWNlIGNvbmZpZ3VyZXMKRE1BIHRh
cmdldHMuICBUaGUgbWVkaWF0aW9uIG5lZWRzIHRvIHRyYXAgdGhvc2UgYWNjZXNzZXMgaW4gb3Jk
ZXIgdG8KcGluIHBhZ2UgYW5kIHByb2dyYW0gdGhlIHJlYWwgaGFyZHdhcmUgd2l0aCByZWFsIHBo
eXNpY2FsIGFkZHJlc3NlcyAoYmUKdGhleSBIUEEgb3IgaG9zdC1JT1ZBcyBkZXBlbmRpbmcgb24g
dGhlIGhvc3QgSU9NTVUgY29uZmlnKSB0byBwZXJmb3JtCnRob3NlIERNQXMuICBGb3IgY2FzZXMg
d2hlcmUgdGhlIENQVSBtaWdodCBjaG9vc2UgdG8gcGVyZm9ybSBzb21lIHNvcnQKb2YgdmlydHVh
bCBETUEgb24gYmVoYWxmIG9mIHRoZSBkZXZpY2UgaXRzZWxmLCB0aGlzIGludGVyZmFjZSB3b3Vs
ZCBiZQp1c2VkLiAgVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
