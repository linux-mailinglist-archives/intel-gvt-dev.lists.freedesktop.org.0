Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D673027B0E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 12:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E50789D99;
	Thu, 23 May 2019 10:49:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1E889DA2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 10:49:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E757E307D976;
 Thu, 23 May 2019 10:49:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
 [10.36.116.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 617EB65F42;
 Thu, 23 May 2019 10:49:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E29C16E08; Thu, 23 May 2019 12:49:48 +0200 (CEST)
Date: Thu, 23 May 2019 12:49:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190523104948.i6kzvmpiziopsng2@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 23 May 2019 10:49:56 +0000 (UTC)
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBTbywgZG1hYnVmIG9iamVjdCB5b3UnbGwgZ2V0IGlzIHRoZSBzYW1lIHRoaW5n
IG5vIG1hdHRlciB3aGVuZXZlciB0aGUKPiA+IHN3aXRjaCBpcyBvbiBvciBvZmY/ICBCdXQgd2hl
biBpbXBvcnRpbmcgdGhlIGRtYWJ1ZiBhbmQgY3JlYXRpbmcgYQo+ID4gZHJtX2ZyYW1lYnVmZmVy
IGZyb20gaXQgeW91IGdldCB0cmFkaXRpb25hbCBmcmFtZWJ1ZmZlciB3aXRoIHRoZSBzd2l0Y2gK
PiA+IGJlaW5nIG9mZiBhbmQgYSBmcmFtZWJ1ZmZlciB3aXRoIGluLWtlcm5lbCBwYWdlLWZsaXAg
c3VwcG9ydCBpbiBjYXNlIHRoZQo+ID4gc3dpdGNoIGlzIG9uPwoKPiBUaGUgdXNlciBzcGFjZSBj
YW4gdXNlIGRtYWJ1ZiBpbiB0aGUgdHJhZGl0aW9uYWwgd2F5LCBubyBtYXR0ZXIgdGhlCj4gc3dp
dGNoIGlzIG9uIG9yIG9mZi4gVGhlIGZyYW1lYnVmZmVyIGZyb20gdGhlIGRybWJ1ZiBpcyBkaWZm
ZXJlbnQgd2l0aAo+IHRoZSBvbmUgaW4gZ3Z0LWcgZm9yICJpbi1rZXJuZWwiIGRpcmVjdCBmbGlw
LgoKT0suCgo+IElmIHN3aXRjaCBpcyBvZmYsIGRtYWJ1ZiB0aHJlYWQgbWlnaHQgYmUgdGhlIG9u
bHkgdGhyZWFkIHdoaWNoIGNhbgo+IHRyaWdnZXIgdGhlIHBhZ2UgZmlscCBpbiB1c2VyIHNwYWNl
LiBJZiB0aGUgc3dpdGNoIGlzIG9uLCBib3RoIGRtYWJ1Zgo+IHRocmVhZCBpbiB1c2VyIHNwYWNl
IGFuZCBndnQtZyBpbiBrZXJuZWwgc3BhY2UgY2FuIHRyaWdnZXIgdGhlIHBhZ2UKPiBmbGlwLiBI
b3dldmVyLCBpbiBjYXNlIG9mIHN3aXRjaD1vbiwgZG1hYnVmIHRocmVhZCBpbiB1c2VyIHNwYWNl
IGlzCj4gZXhwZWN0ZWQgdG8gc3RvcCBmbGlwcGluZywgYXMgZ3Z0LWcgaXMgZG9pbmcgaXQgZmFz
dGVyIGluIGtlcm5lbC4KCkhhdmluZyB0aGUgc3dpdGNoIGluIHN5c2ZzIGlzIG9rIGZvciB0aGUg
cHJvb2Ytb2YtY29uY2VwdCwgYnV0IGxvbmctdGVybQp3ZSBuZWVkIHNvbWV0aGluZyBiZXR0ZXIu
ICBGaXJzdCwgc29tZSB3YXkgdG8gZGV0ZWN0IHdoZW5ldmVyIHRoZQppbi1rZXJuZWwgcGFnZS1m
bGlwIGlzIHN1cHBvcnRlZCBvciBub3Qgd291bGQgYmUgZ29vZC4gIEFsc28gSSB0aGluawp1c2Vy
c3BhY2Ugc2hvdWxkIGJlIGFibGUgdG8gcmVxdWVzdCB0aGUgZGVzaXJlZCBiZWhhdmlvciB3aGVu
IGNyZWF0aW5nCnRoZSBmcmFtZWJ1ZmZlci4gIE1heWJlIGFkZCBhIGZsYWcgZm9yIGRybU1vZGVB
ZGRGQjJXaXRoTW9kaWZpZXJzKCk/Ck9yIHVzZSBhIHNwZWNpYWwgbW9kaWZpZXI/Cgo+ID4gWWVz
LiAgZHJtIG91dHB1dCBzaG91bGRuJ3QgYmUgaGFyZCB0byB3aXJlIHVwLiAgSGFuZGxpbmcgaW5w
dXQgd2lsbCBiZSBhIGJpdAo+ID4gbW9yZSB0cmlja3kgdGhvdWdoLgo+IEhvdyBhYm91dCBwYXNz
aW5nIHRocm91Z2ggdGhlIGlucHV0IGRldmljZXMgdG8gZ3Vlc3RzPyBJdCBzZWVtcyBlYXNpZXIu
Cgpkcm0gVUkgdXNlcyBsaWJpbnB1dC4KCldoZW4gc3RhcnRlZCBkaXJlY3RseSBmcm9tIHRoZSBj
b25zb2xlIGFuZCBvcGVyYXRpbmcgaW4gZHJtLW1hc3RlciBtb2RlCnFlbXUgY2FuIHNpbXBseSBn
cmFiIGFsbCBpbnB1dCBkZXZpY2VzIHdoaWNoIGJlbG9uZyB0byB0aGUgc2VhdC4KCldoZW4gcnVu
bmluZyBvbiBhIGRybS1sZWFzZSB0aGF0IHdvdWxkIGJlIGEgYml0IHJ1ZGUuICBBbHNvIEkgZG9u
J3QKdGhpbmsgbG9naW5kIHdpbGwgaGFuZCBvdXQgaW5wdXQgZmlsZSBoYW5kbGVzIGluIHRoYXQg
Y2FzZS4gIEluIGNhc2UKdGhlcmUgYXJlIGRlZGljYXRlZCBpbnB1dCBkZXZpY2VzIGZvciB0aGUg
Z3Vlc3QgeW91IGNhbiB1c2UgaW5wdXQtbGludXgKb3IgdXNiIHBhc3MtdGhyb3VnaC4gIElmIG5v
dCwgdGhlbiwgaG1tLCBubyBpZGVhLgoKPiBBbmQgdGhlICJ0b3BpYy9kcm0tdWktZGlyZWN0LWZs
aXAiIGJyYW5jaCBpcyB0cmFja2luZyBkcm0gdWkgYnJhbmNoLgoKQ29vbCwgdGhhbmtzLCBJJ2xs
IHBsYXkgd2l0aCB0aGF0LgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
