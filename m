Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8422481BA
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FC089D86;
	Tue, 18 Aug 2020 09:16:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE11689D86
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597742212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVFj7FoFlCmRwOr98i1isDMUsMu/x19B/RyjX8oAjpw=;
 b=FOBDaVOkaJoVHuBc9FFlVFwWgLFhqCfetCXvPeYtY0tN+hcrXoiy67ol4nKQpHbxS7fgrj
 0WW/3GcJhjQWVaJl7+VBm8sv1SV+U8Ze750L6GuOfijAfoZm/6YzO/JDu0LhamcdkLSx9h
 dvZRY45bsIK97J55l+pqRS2+WBY0sh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-hPDVDA2kNsyMqa_cPBHKPg-1; Tue, 18 Aug 2020 05:16:50 -0400
X-MC-Unique: hPDVDA2kNsyMqa_cPBHKPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48C781006701;
 Tue, 18 Aug 2020 09:16:48 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F0D5D757;
 Tue, 18 Aug 2020 09:16:31 +0000 (UTC)
Date: Tue, 18 Aug 2020 10:16:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818091628.GC20215@redhat.com>
References: <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a073222-dcfe-c02d-198b-29f6a507b2e1@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, xin-ran.wang@intel.com,
 corbet@lwn.net, openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 eskultet@redhat.com, smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 Cornelia Huck <cohuck@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

WW91ciBtYWlsIGNhbWUgdGhyb3VnaCBhcyBIVE1MLW9ubHkgc28gYWxsIHRoZSBxdW90aW5nIGFu
ZCBhdHRyaWJ1dGlvbgppcyBtYW5nbGVkIC8gbG9zdCBub3cgOi0oCgpPbiBUdWUsIEF1ZyAxOCwg
MjAyMCBhdCAwNTowMTo1MVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ICAgIE9uIDIwMjAv
OC8xOCDkuIvljYg0OjU1LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOgo+IAo+ICBPbiBUdWUs
IEF1ZyAxOCwgMjAyMCBhdCAxMToyNDozMEFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IAo+
ICBPbiAyMDIwLzgvMTQg5LiL5Y2IMToxNiwgWWFuIFpoYW8gd3JvdGU6Cj4gCj4gIE9uIFRodSwg
QXVnIDEzLCAyMDIwIGF0IDEyOjI0OjUwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4gCj4g
IE9uIDIwMjAvOC8xMCDkuIvljYgzOjQ2LCBZYW4gWmhhbyB3cm90ZToKCj4gIHdlIGFjdHVhbGx5
IGNhbiBhbHNvIHJldHJpZXZlIHRoZSBzYW1lIGluZm9ybWF0aW9uIHRocm91Z2ggc3lzZnMsIC5l
LmcKPiAKPiAgfC0gW3BhdGggdG8gZGV2aWNlXQo+ICAgICB8LS0tIG1pZ3JhdGlvbgo+ICAgICB8
ICAgICB8LS0tIHNlbGYKPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBpCj4gICAgIHwgICAg
fCAgIHwtLS1tZGV2X3R5cGUKPiAgICAgfCAgICB8ICAgfC0tLXNvZnR3YXJlX3ZlcnNpb24KPiAg
ICAgfCAgICB8ICAgfC0tLWRldmljZV9pZAo+ICAgICB8ICAgIHwgICB8LS0tYWdncmVnYXRvcgo+
ICAgICB8ICAgICB8LS0tIGNvbXBhdGlibGUKPiAgICAgfCAgICAgfCAgIHwtLS1kZXZpY2VfYXBp
Cj4gICAgIHwgICAgfCAgIHwtLS1tZGV2X3R5cGUKPiAgICAgfCAgICB8ICAgfC0tLXNvZnR3YXJl
X3ZlcnNpb24KPiAgICAgfCAgICB8ICAgfC0tLWRldmljZV9pZAo+ICAgICB8ICAgIHwgICB8LS0t
YWdncmVnYXRvcgo+IAo+IAo+ICBZZXMgYnV0Ogo+IAo+ICAtIFlvdSBuZWVkIG9uZSBmaWxlIHBl
ciBhdHRyaWJ1dGUgKG9uZSBzeXNjYWxsIGZvciBvbmUgYXR0cmlidXRlKQo+ICAtIEF0dHJpYnV0
ZSBpcyBjb3VwbGVkIHdpdGgga29iamVjdAo+IAo+ICBBbGwgb2YgYWJvdmUgc2VlbXMgdW5uZWNl
c3NhcnkuCj4gCj4gIEFub3RoZXIgcG9pbnQsIGFzIHdlIGRpc2N1c3NlZCBpbiBhbm90aGVyIHRo
cmVhZCwgaXQncyByZWFsbHkgaGFyZCB0byBtYWtlCj4gIHN1cmUgdGhlIGFib3ZlIEFQSSB3b3Jr
IGZvciBhbGwgdHlwZXMgb2YgZGV2aWNlcyBhbmQgZnJhbWV3b3Jrcy4gU28gaGF2aW5nIGEKPiAg
dmVuZG9yIHNwZWNpZmljIEFQSSBsb29rcyBtdWNoIGJldHRlci4KPiAKPiAgRnJvbSB0aGUgUE9W
IG9mIHVzZXJzcGFjZSBtZ210IGFwcHMgZG9pbmcgZGV2aWNlIGNvbXBhdCBjaGVja2luZyAvIG1p
Z3JhdGlvbiwKPiAgd2UgY2VydGFpbmx5IGRvIE5PVCB3YW50IHRvIHVzZSBkaWZmZXJlbnQgdmVu
ZG9yIHNwZWNpZmljIEFQSXMuIFdlIHdhbnQgdG8KPiAgaGF2ZSBhbiBBUEkgdGhhdCBjYW4gYmUg
dXNlZCAvIGNvbnRyb2xsZWQgaW4gYSBzdGFuZGFyZCBtYW5uZXIgYWNyb3NzIHZlbmRvcnMuCj4g
Cj4gICAgWWVzLCBidXQgaXQgY291bGQgYmUgaGFyZC4gRS5nIHZEUEEgd2lsbCBjaG9zZSB0byB1
c2UgZGV2bGluayAodGhlcmUncyBhCj4gICAgbG9uZyBkZWJhdGUgb24gc3lzZnMgdnMgZGV2bGlu
aykuIFNvIGlmIHdlIGdvIHdpdGggc3lzZnMsIGF0IGxlYXN0IHR3bwo+ICAgIEFQSXMgbmVlZHMg
dG8gYmUgc3VwcG9ydGVkIC4uLgoKTkIsIEkgd2FzIG5vdCBxdWVzdGlvbmluZyBkZXZsaW5rIHZz
IHN5c2ZzIGRpcmVjdGx5LiBJZiBkZXZsaW5rIGlzIHJlbGF0ZWQKdG8gbmV0bGluaywgSSBjYW4n
dCBzYXkgSSdtIGVudGh1c2lhc3RpYyBhcyBJTUtFIHN5c2ZzIGlzIGVhc2llciB0byBkZWFsCndp
dGguIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgZGV2bGluayB0byBoYXZlIG11Y2ggb2YgYW4g
b3BpbmlvbiB0aG91Z2guClRoZSBrZXkgcG9pbnQgd2FzIHRoYXQgSSBkb24ndCB3YW50IHRoZSB1
c2Vyc3BhY2UgQVBJcyB3ZSBuZWVkIHRvIGRlYWwgd2l0aAp0byBiZSB2ZW5kb3Igc3BlY2lmaWMu
CgpXaGF0IEkgY2FyZSBhYm91dCBpcyB0aGF0IHdlIGhhdmUgYSAqc3RhbmRhcmQqIHVzZXJzcGFj
ZSBBUEkgZm9yIHBlcmZvcm1pbmcKZGV2aWNlIGNvbXBhdGliaWxpdHkgY2hlY2tpbmcgLyBzdGF0
ZSBtaWdyYXRpb24sIGZvciB1c2UgYnkgUUVNVS9saWJ2aXJ0LwpPcGVuU3RhY2ssIHN1Y2ggdGhh
dCB3ZSBjYW4gd3JpdGUgY29kZSB3aXRob3V0IGNvdW50bGVzcyB2ZW5kb3Igc3BlY2lmaWMKY29k
ZSBwYXRocy4KCklmIHRoZXJlIGlzIHZlbmRvciBzcGVjaWZpYyBzdHVmZiBvbiB0aGUgc2lkZSwg
dGhhdCdzIGZpbmUgYXMgd2UgY2FuIGlnbm9yZQp0aGF0LCBidXQgdGhlIGNvcmUgZnVuY3Rpb25h
bGl0eSBmb3IgZGV2aWNlIGNvbXBhdCAvIG1pZ3JhdGlvbiBuZWVkcyB0byBiZQpzdGFuZGFyZGl6
ZWQuCgpSZWdhcmRzLApEYW5pZWwKLS0gCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8t
ICAgIGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczov
L2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJy
YW5nZS5jb20gOnwKfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBz
Oi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
