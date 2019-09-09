Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DFAE11B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Sep 2019 00:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C52B88E07;
	Mon,  9 Sep 2019 22:34:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816CC88FC8;
 Mon,  9 Sep 2019 22:34:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 15:34:40 -0700
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="178488370"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 15:34:39 -0700
Date: Mon, 9 Sep 2019 15:35:10 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Vetter, Daniel" <daniel.vetter@intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20190909223510.GA19671@intel.com>
References: <20190906054255.GC3458@zhen-hp.sh.intel.com>
 <20190909172416.GB20172@intel.com>
 <f631f702240c0ecb99e94171f26e951f4e76911a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f631f702240c0ecb99e94171f26e951f4e76911a.camel@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDI6NTQ6NTlQTSAtMDcwMCwgVmV0dGVyLCBEYW5pZWwg
d3JvdGU6Cj4gT24gTW9uLCAyMDE5LTA5LTA5IGF0IDEwOjI0IC0wNzAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6Cj4gPiBIaSBndXlzLAo+ID4gCj4gPiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMTo0
Mjo1NVBNICswODAwLCBaaGVueXUgV2FuZyB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBI
ZXJlJ3MgZ3Z0LW5leHQtZml4ZXMgd2l0aCB0d28gcmVjZW50IGZpeGVzLCBvbmUgZm9yIHJlY2Vu
dAo+ID4gPiBndWVzdCBoYW5nIHJlZ3Jlc3Npb24gYW5kIGFub3RoZXIgZm9yIGd1ZXN0IHJlc2V0
IGZpeC4KPiA+ID4gCj4gPiA+IFRoYW5rcy4KPiA+ID4gLS0KPiA+ID4gVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdAo+ID4gPiBjMzZiZWJhNmIyOTZiM2MwNWEwZjI5NzUzYjA0Nzc1
ZTVhZTIzODg2Ogo+ID4gPiAKPiA+ID4gICBkcm0vaTkxNTogU2VhbCByYWNlcyBiZXR3ZWVuIGFz
eW5jIEdQVSBjYW5jZWxsYXRpb24sIHJldGlyZW1lbnQKPiA+ID4gYW5kIHNpZ25hbGluZyAoMjAx
OS0wNS0xMyAxMzo1MzozNSArMDMwMCkKPiA+ID4gCj4gPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+ID4gPiAKPiA+ID4gICBodHRwczovL2dpdGh1Yi5jb20vaW50
ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1uZXh0LWZpeGVzLTIwMTktCj4gPiA+IDA5LTA2Cj4g
PiA+IAo+ID4gPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8KPiA+ID4gNGE1MzIyNTYw
YWEyMzVlZmE4NGMwYWEzNGMwMGU1NzQ5YTA3OTJmZDoKPiA+ID4gCj4gPiA+ICAgZHJtL2k5MTUv
Z3Z0OiB1cGRhdGUgUklOR19TVEFSVCByZWcgb2YgdkdQVSB3aGVuIHRoZSBjb250ZXh0IGlzCj4g
PiA+IHN1Ym1pdHRlZCB0byBpOTE1ICgyMDE5LTA5LTA2IDEzOjM5OjA5ICswODAwKQo+ID4gCj4g
PiAkIGRpbSBwdWxsLXJlcXVlc3QtbmV4dC1maXhlcwo+ID4gVXNpbmcgZHJtL2RybS1uZXh0IGFz
IHRoZSB1cHN0cmVhbQo+ID4gZGltOiA0YTUzMjI1NjBhYTIgKCJkcm0vaTkxNS9ndnQ6IHVwZGF0
ZSBSSU5HX1NUQVJUIHJlZyBvZiB2R1BVIHdoZW4KPiA+IHRoZSBjb250ZXh0IGlzIHN1Ym1pdHRl
ZCB0byBpOTE1Iik6IExpbmsgdGFnIG1pc3NpbmcuCj4gPiBkaW06IDBhMzI0MmJkYjQ3NyAoImRy
bS9pOTE1L2d2dDogdXBkYXRlIHZncHUgd29ya2xvYWQgaGVhZCBwb2ludGVyCj4gPiBjb3JyZWN0
bHkiKTogTGluayB0YWcgbWlzc2luZy4KPiA+IGRpbTogRVJST1I6IGlzc3VlcyBpbiBjb21taXRz
IGRldGVjdGVkLCBhYm9ydGluZwo+ID4gCj4gPiBJIHdvbmRlciBob3cgSSBzaG91bGQgcHJvY2Vl
ZCBoZXJlLiBJbiB0aGUgcGFzdCBJIHdhcyBhbHdheXMKPiA+IGJ5cGFzc3NpbmcgZGltLAo+ID4g
YnV0IG5vdyB0aGF0IGRybSBtYWludGFpbmVycyBhbHNvIHVzZSBkaW0gSSdtIHN1cmUgdGhpcyB3
aWxsIGJsb3cgdXAKPiA+IHRoZXJlIGFueXdheXMuCj4gPiAKPiA+IEJ1dCBndnQgcGF0Y2hlcyBh
cmUgbm90IHRyYWNrZWQgb24gb3VyIENJIGluZGl2aWR1YWxseSBoZW5jZSB0aGV5Cj4gPiBkb24n
dAo+ID4gaGF2ZSBMaW5rcy4KPiA+IAo+ID4gSmFuaSwgSm9vbmFzLCBob3cgYXJlIHlvdSBndXlz
IGhhbmRsaW5nIHRoaXM/Cj4gPiAKPiA+IERhbmllbCwgRGF2ZSwgaWRlYXM/Cj4gCj4gZGltIGRv
ZXNuJ3QgcmVxdWlyZSBMaW5rOiB0YWdzIHlldCBmb3IgcHVsbCByZXF1ZXN0cyAoYmVjYXVzZSBt
b3N0IGRybQo+IHRyZWVzIGFyZW4ndCBtYW5hZ2VkIGJ5IGRpbSBhbmQgc28gbGFjayB0aGVtKS4K
CkknbSBjb25mdXNlZCBub3cuCgpmdW5jdGlvbiBkaW1fcHVsbF9yZXF1ZXN0CmNhbGxzCmNoZWNr
cGF0Y2hfY29tbWl0X3B1c2hfcmFuZ2UgMSAiJHVwc3RyZWFtLi4kYnJhbmNoIgooZXhjZXB0IGZv
ciBkcm0taW50ZWwtbmV4dCkKCmFuZCBjaGVja3BhdGNoX2NvbW1pdF9wdXNoIGNoZWNrcyBmb3Ig
dGhlIGxpbmsuCgpTbyBpZiB5b3UgYWxzbyB1c2UgZGltIGZvciB5b3VyIHB1bGwgcmVxdWVzdCBJ
J20gd29uZGVyaW5nIGhvdyB5b3UKYXJlIG5vdCBnZXR0aW5nIHRoYXQuLi4uCgpJbiB0aGUgcGFz
dCB3aGVuZXZlciBJIGhhZCB0aGlzIHByb2JsZW0gb24gZGluZiBJIGNvbW1lbnRlZCBvdXQgdGhl
CmxpbmsgY2hlY2sgYnV0IGVuZCB1cCBuZXZlciBjb21pbmcgYmFjayB0byBzb2x2ZSB0aGUgcHJv
YmxlbSBwcm9wZXJseS4KSSBqdXN0IHdvbmRlcmluZyB0aGF0IG5vdyB0aGF0IGRpbSBpcyBpbiB1
c2Ugb24gZHJtIGxldmVsIGlmIEkgYnlwYXNzCmhlcmUgaXQgYmVjb21lcyBhIHByb2JsZW0gZm9y
IHlvdS4KCnRob3VnaHRzPwoKPiBVbnRpbCB3ZSBjaGFuZ2UgdGhhdCwKPiB3aXRoIHNvbWUgZG9j
IHBhdGNoZXMgYW5kIHByb3BlciBiaWtlc2hlZCBvbiBkcmktZGV2ZWwgSSB0aGluayBpdCdzCj4g
ZmluZSBpZiBndnQgaXMgbWlzc2luZyB0aGVtLiBBdCBsZWFzdCBmcm9tIGEgZHJtLmdpdCBwb3Yu
Cj4gCj4gV2hhdCB5b3UgZ3V5cyB3YW50IHRvIGRvIGZvciBkcm0taW50ZWwuZ2l0IGlzIGVudGly
ZWx5IHVwIHRvIHlvdS4KPiAtRGFuaWVsCj4gPiAKPiA+IFRoYW5rcywKPiA+IFJvZHJpZ28uCj4g
PiAKPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gPiBndnQtbmV4dC1maXhlcy0yMDE5LTA5LTA2Cj4gPiA+IAo+
ID4gPiAtIEZpeCBndWVzdCBjb250ZXh0IGhlYWQgcG9pbnRlciB1cGRhdGUgZm9yIGhhbmcgKFhp
YW9saW4pCj4gPiA+IC0gRml4IGd1ZXN0IGNvbnRleHQgcmluZyBzdGF0ZSBmb3IgcmVzZXQgKFdl
aW5hbikKPiA+ID4gCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gV2VpbmFuIExpICgxKToKPiA+ID4gICAg
ICAgZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgUklOR19TVEFSVCByZWcgb2YgdkdQVSB3aGVuIHRoZSBj
b250ZXh0Cj4gPiA+IGlzIHN1Ym1pdHRlZCB0byBpOTE1Cj4gPiA+IAo+ID4gPiBYaWFvbGluIFpo
YW5nICgxKToKPiA+ID4gICAgICAgZHJtL2k5MTUvZ3Z0OiB1cGRhdGUgdmdwdSB3b3JrbG9hZCBo
ZWFkIHBvaW50ZXIgY29ycmVjdGx5Cj4gPiA+IAo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L3NjaGVkdWxlci5jIHwgNDUKPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCj4gPiA+IAo+ID4gPiAKPiA+ID4gLS0gCj4gPiA+IE9wZW4gU291cmNlIFRlY2hub2xv
Z3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gPiA+IAo+ID4gPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tl
eXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwo+ID4gCj4gPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
