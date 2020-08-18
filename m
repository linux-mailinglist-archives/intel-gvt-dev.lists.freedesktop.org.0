Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDC2481DE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Aug 2020 11:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6588FD2;
	Tue, 18 Aug 2020 09:26:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49388FD2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Aug 2020 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597742800;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeB+hN1zCN47COQrIpjM7VIX4w9eY1mJ1G21fPz14lw=;
 b=GCQDjZniKEm4g06y5CfFvfgfPsfyAsDg1q0rC5i7rQespKBCyfwsxJxwuvz+fs4T0N8KBR
 UfRw/zCw9RJ4wInYnsYPpsn8TlQ5HjEC8gMzd+ReJb1nczJaCUzWH6ubc4ILNBMWBP1e1W
 44ed4tysbnFaIuit85y3z5NQPGdoUXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-jjuG8ppIN9-XvLxq3nqeZA-1; Tue, 18 Aug 2020 05:24:54 -0400
X-MC-Unique: jjuG8ppIN9-XvLxq3nqeZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76231014DEE;
 Tue, 18 Aug 2020 09:24:51 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5F82617B;
 Tue, 18 Aug 2020 09:24:35 +0000 (UTC)
Date: Tue, 18 Aug 2020 10:24:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
Message-ID: <20200818092433.GD20215@redhat.com>
References: <20200805075647.GB2177@nanopsycho>
 <eb1d01c2-fbad-36b6-10cf-9e03483a736b@redhat.com>
 <20200805093338.GC30485@joy-OptiPlex-7040>
 <20200805105319.GF2177@nanopsycho>
 <20200810074631.GA29059@joy-OptiPlex-7040>
 <e6e75807-0614-bd75-aeb6-64d643e029d3@redhat.com>
 <20200814051601.GD15344@joy-OptiPlex-7040>
 <a51209fe-a8c6-941f-ff54-7be06d73bc44@redhat.com>
 <20200818085527.GB20215@redhat.com>
 <20200818110617.05def37c.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818110617.05def37c.cohuck@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: kvm@vger.kernel.org, libvir-list@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, kwankhede@nvidia.com,
 eauger@redhat.com, xin-ran.wang@intel.com, corbet@lwn.net,
 openstack-discuss@lists.openstack.org, shaohe.feng@intel.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 Parav Pandit <parav@mellanox.com>, jian-feng.ding@intel.com,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, hejie.xu@intel.com,
 bao.yumeng@zte.com.cn, Alex Williamson <alex.williamson@redhat.com>,
 smooney@redhat.com, intel-gvt-dev@lists.freedesktop.org, eskultet@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, dinechin@redhat.com, devel@ovirt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMTE6MDY6MTdBTSArMDIwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiBPbiBUdWUsIDE4IEF1ZyAyMDIwIDA5OjU1OjI3ICswMTAwCj4gRGFuaWVsIFAuIEJl
cnJhbmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBUdWUsIEF1ZyAx
OCwgMjAyMCBhdCAxMToyNDozMEFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiBBbm90
aGVyIHBvaW50LCBhcyB3ZSBkaXNjdXNzZWQgaW4gYW5vdGhlciB0aHJlYWQsIGl0J3MgcmVhbGx5
IGhhcmQgdG8gbWFrZQo+ID4gPiBzdXJlIHRoZSBhYm92ZSBBUEkgd29yayBmb3IgYWxsIHR5cGVz
IG9mIGRldmljZXMgYW5kIGZyYW1ld29ya3MuIFNvIGhhdmluZyBhCj4gPiA+IHZlbmRvciBzcGVj
aWZpYyBBUEkgbG9va3MgbXVjaCBiZXR0ZXIuICAKPiA+IAo+ID4gRnJvbSB0aGUgUE9WIG9mIHVz
ZXJzcGFjZSBtZ210IGFwcHMgZG9pbmcgZGV2aWNlIGNvbXBhdCBjaGVja2luZyAvIG1pZ3JhdGlv
biwKPiA+IHdlIGNlcnRhaW5seSBkbyBOT1Qgd2FudCB0byB1c2UgZGlmZmVyZW50IHZlbmRvciBz
cGVjaWZpYyBBUElzLiBXZSB3YW50IHRvCj4gPiBoYXZlIGFuIEFQSSB0aGF0IGNhbiBiZSB1c2Vk
IC8gY29udHJvbGxlZCBpbiBhIHN0YW5kYXJkIG1hbm5lciBhY3Jvc3MgdmVuZG9ycy4KPiAKPiBB
cyB3ZSBjZXJ0YWlubHkgd2lsbCBuZWVkIHRvIGhhdmUgZGlmZmVyZW50IHRoaW5ncyB0byBjaGVj
ayBmb3IKPiBkaWZmZXJlbnQgZGV2aWNlIHR5cGVzIGFuZCB2ZW5kb3IgZHJpdmVycywgd291bGQg
aXQgc3RpbGwgYmUgZmluZSB0bwo+IGhhdmUgZGlmZmVyaW5nIChzYXkpIGF0dHJpYnV0ZXMsIGFz
IGxvbmcgYXMgdGhleSBhcmUgcHJlc2VudGVkIChhbmQgY2FuCj4gYmUgZGlzY292ZXJlZCkgaW4g
YSBzdGFuZGFyZGl6ZWQgd2F5PwoKWWVzLCB0aGUgY29udHJvbCBBUEkgYW5kIGFsZ29yaXRobSB0
byBkZWFsIHdpdGggdGhlIHByb2JsZW0gbmVlZHMgdG8KaGF2ZSBzdGFuZGFyZGl6YXRpb24sIGJ1
dCB0aGUgZGF0YSBwYXNzZWQgaW4vb3V0IG9mIHRoZSBBUElzIGNhbiB2YXJ5LgoKRXNzZW50aWFs
bHkgdGhlIGtleSBpcyB0aGF0IHZlbmRvcnMgc2hvdWxkIGJlIGFibGUgdG8gY3JlYXRlIGRldmlj
ZXMKYXQgdGhlIGtlcm5lbCwgYW5kIHRob3NlIGRldmljZXMgc2hvdWxkICJqdXN0IHdvcmsiIHdp
dGggdGhlIGV4aXN0aW5nCmdlbmVyaWMgdXNlcnNwYWNlIG1pZ3JhdGlvbiAvIGNvbXBhdCBjaGVj
a2luZyBjb2RlLCB3aXRob3V0IG5lZWRpbmcKZXh0cmEgdmVuZG9yIHNwZWNpZmljIGxvZ2ljIHRv
IGJlIGFkZGVkLgoKTm90ZSwgSSdtIG5vdCBzYXlpbmcgdGhhdCB0aGUgdXNlcnNwYWNlIGRlY2lz
aW9ucyB3b3VsZCBiZSBwZXJmZWN0bHkKb3B0aW1hbCBiYXNlZCBvbiBnZW5lcmljIGNvZGUuIFRo
ZXkgbWlnaHQgYmUgbWFraW5nIGEgc2ltcGxpZmllZApkZWNpc2lvbiB0aGF0IHdoaWxlIGZ1bmN0
aW9uYWxseSBzYWZlLCBpcyBub3QgdGhlIGlkZWFsIHNvbHV0aW9uLgpBZGRpbmcgdmVuZG9yIHNw
ZWNpZmljIGNvZGUgbWlnaHQgYmUgYWJsZSB0byBvcHRpbWl6ZSB0aGUgdXNlcnNwYWNlCmRlY2lz
aW9ucywgYnV0IHRoYXQgc2hvdWxkIGJlIGNvbnNpZGVyZWQganVzdCBvcHRpbWl6YXRpb24sIG5v
dCBhCmNvcmUgbXVzdCBoYXZlIGZvciBhbnkgb3BlcnRpb24uCgpSZWdhcmRzLApEYW5pZWwKLS0g
Cnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8vd3d3LmZsaWNrci5j
b20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZpcnQub3JnICAgICAgICAgLW8t
ICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5jb20gOnwKfDogaHR0cHM6Ly9l
bnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJl
cnJhbmdlIDp8CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXYK
